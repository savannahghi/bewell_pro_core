import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/asset_strings.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/redux/actions/misc_state_actions/batch_update_misc_state_action.dart';
import 'package:bewell_pro_core/application/redux/flags/flags.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/core/home/pages/home_page.dart';
import 'package:bewell_pro_core/presentation/onboarding/common/landing_page.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/widgets/phone_login.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/pages/phone_login_page.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/widgets/error_alert_box.dart';
import 'package:bewell_pro_core/presentation/onboarding/profile/change_pin.dart';
import 'package:bewell_pro_core/presentation/onboarding/signup/phone_signup_page.dart';
import 'package:http/http.dart';
import 'package:domain_objects/entities.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:shared_ui_components/inputs.dart';
import 'package:shared_ui_components/platform_loader.dart';
import '../../../../../mocks/mock_utils.dart';
import '../../../../../mocks/mocks.dart';
import '../../../../../mocks/test_helpers.dart';

void main() {
  group('PhoneLogin', () {
    late Store<CoreState> store;

    setUp(() {
      AppBrand().appLogo.add(cameraIconUrl);
      store = Store<CoreState>(initialState: CoreState.initial());
    });

    bool findTextAndTap(InlineSpan visitor, String text) {
      if (visitor is TextSpan && visitor.text == text) {
        (visitor.recognizer! as TapGestureRecognizer).onTap!();

        return false;
      }

      return true;
    }

    bool tapTextSpan(RichText richText, String text) {
      final bool isTapped = !richText.text.visitChildren(
        (InlineSpan visitor) => findTextAndTap(visitor, text),
      );

      return isTapped;
    }

    testWidgets(
        'should log in the user, update the user state and navigate to '
        'the home page', (WidgetTester tester) async {
      await mockNetworkImages(() async {
        setupFirebaseAuthMocks();
        await Firebase.initializeApp();
        await buildTestWidget(
          tester: tester,
          store: store,
          graphQlClient: mockGraphQlClient,
          widget: PhoneLoginPage(),
        );

        // Enter phone number
        await tester.enterText(find.byType(SILPhoneInput), '0712345678');

        // Enter PIN
        await tester.enterText(
            find.byKey(AppWidgetKeys.phoneLoginPinInputKey), '1234');

        // Tap the login button
        await tester.tap(find.byKey(AppWidgetKeys.loginKey));
        await tester.pump();

        final UserResponse mockResponse =
            UserResponse.fromJson(mockAuthLoginResponse);

        expect(store.state.userState!.userProfile, mockResponse.profile);
        expect(store.state.userState!.communicationSettings,
            mockResponse.communicationSettings);
        // expect(store.state.userState!.auth, mockResponse.auth);

        await tester.pumpAndSettle();
        expect(find.byType(HomePage), findsOneWidget);
      });
    });

    testWidgets(
        'should navigate to profile change pin page '
        'if change pin is true', (WidgetTester tester) async {
      await mockNetworkImages(() async {
        setupFirebaseAuthMocks();
        await Firebase.initializeApp();
        final MockShortGraphQlClient mockShortGraphQlClient =
            MockShortGraphQlClient.withResponse(
                'idToken',
                'endpoint',
                Response(
                    json.encode(
                      mockChangePinAuthLoginResponse,
                    ),
                    200));
        await buildTestWidget(
          tester: tester,
          store: store,
          graphQlClient: mockShortGraphQlClient,
          widget: PhoneLoginPage(),
        );

        // Enter phone number
        await tester.enterText(find.byType(SILPhoneInput), '0712345678');

        // Enter PIN
        await tester.enterText(
            find.byKey(AppWidgetKeys.phoneLoginPinInputKey), '1234');

        // Tap the login button
        await tester.tap(find.byKey(AppWidgetKeys.loginKey));
        await tester.pumpAndSettle();

        final UserResponse mockResponse =
            UserResponse.fromJson(mockChangePinAuthLoginResponse);

        expect(store.state.userState!.userProfile, mockResponse.profile);
        expect(store.state.userState!.communicationSettings,
            mockResponse.communicationSettings);
        expect(store.state.userState!.auth, mockResponse.auth);

        await tester.pumpAndSettle();
        expect(find.byType(ProfileChangePin), findsOneWidget);
      });
    });

    testWidgets(
        'should show an error message if invalid credentials are entered',
        (WidgetTester tester) async {
      final MockShortGraphQlClient graphQlClient =
          MockShortGraphQlClient.withResponse('idToken', 'endpoint',
              Response(json.encode(<String, dynamic>{'code': 8}), 400));

      await buildTestWidget(
        store: store,
        tester: tester,
        widget: PhoneLogin(),
        graphQlClient: graphQlClient,
      );

      expect(find.byType(SILPhoneInput), findsOneWidget);

      // Enter phone number
      await tester.enterText(find.byType(SILPhoneInput), '0712345678');

      // Enter PIN
      await tester.enterText(
          find.byKey(AppWidgetKeys.phoneLoginPinInputKey), '1234');

      // Tap the login button
      await tester.tap(find.byKey(AppWidgetKeys.loginKey));
      await tester.pumpAndSettle();

      expect(store.state.miscState!.invalidCredentials, true);
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Wrong login details provided'), findsOneWidget);
    });

    testWidgets(
        'shows the error alert widget when invalid credentials are provided',
        (WidgetTester tester) async {
      await buildTestWidget(store: store, tester: tester, widget: PhoneLogin());
      await tester.pumpAndSettle();

      store.dispatch(BatchUpdateMiscStateAction(invalidCredentials: true));
      await tester.pumpAndSettle();

      expect(find.byType(ErrorAlertBox), findsOneWidget);

      // Enter PIN
      await tester.enterText(
          find.byKey(AppWidgetKeys.phoneLoginPinInputKey), '1234');

      expect(store.state.miscState!.invalidCredentials, false);
      expect(store.state.miscState!.unKnownPhoneNo, false);
    });

    testWidgets(
        'shows the error alert widget when an unknown phone number is added',
        (WidgetTester tester) async {
      await buildTestWidget(store: store, tester: tester, widget: PhoneLogin());
      await tester.pumpAndSettle();

      store.dispatch(BatchUpdateMiscStateAction(unKnownPhoneNo: true));
      await tester.pumpAndSettle();

      expect(find.byType(ErrorAlertBox), findsOneWidget);

      await tester.enterText(find.byType(SILPhoneInput), '0712345678');

      expect(store.state.miscState!.invalidCredentials, false);
      expect(store.state.miscState!.unKnownPhoneNo, false);
    });

    testWidgets('shows a loading indicator when processing',
        (WidgetTester tester) async {
      store.dispatch(WaitAction<CoreState>.add(phoneLoginStateFlag));
      await buildTestWidget(store: store, tester: tester, widget: PhoneLogin());
      expect(find.byType(SILPlatformLoader), findsOneWidget);
    });

    testWidgets('navigates to signup page when sign up button is tapped',
        (WidgetTester tester) async {
      await buildTestWidget(
          tester: tester, store: store, widget: PhoneLoginPage());

      expect(
          find.byWidgetPredicate(
            (Widget widget) =>
                widget is RichText && tapTextSpan(widget, loginSignUp),
          ),
          findsOneWidget);
      await tester.pumpAndSettle();

      expect(find.byType(PhoneSignUpPage), findsOneWidget);
      expect(find.byType(PhoneLoginPage), findsNothing);
    });

    testWidgets('navigates to LandingPage when back button is tapped',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: PhoneLoginPage(),
      );

      await tester.tap(find.byKey(AppWidgetKeys.backButton));
      await tester.pumpAndSettle();

      expect(find.byType(LandingPage), findsOneWidget);
      expect(find.byType(PhoneLoginPage), findsNothing);
    });
  });
}
