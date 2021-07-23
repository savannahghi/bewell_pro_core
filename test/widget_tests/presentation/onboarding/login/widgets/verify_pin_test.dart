import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/redux/actions/misc_state_actions/batch_update_misc_state_action.dart';
import 'package:bewell_pro_core/application/redux/actions/user_state_actions/batch_update_user_state_action.dart';
import 'package:bewell_pro_core/application/redux/flags/flags.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/domain/core/value_objects/enums.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/pages/set_user_names_page.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/pages/phone_login_page.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/pages/pin_verification_page.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/widgets/user_names_form.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/widgets/verify_pin.dart';
import 'package:bewell_pro_core/presentation/onboarding/profile/change_pin.dart';
import 'package:http/http.dart';
import 'package:domain_objects/entities.dart';

import 'package:shared_ui_components/platform_loader.dart';

import '../../../../../mocks/mocks.dart';
import '../../../../../mocks/test_helpers.dart';

void main() {
  late Store<CoreState> store;

  setUp(() {
    store = Store<CoreState>(initialState: CoreState.initial());
  });

  group('VerifyPin', () {
    testWidgets('displays SILPlatformLoader when processing',
        (WidgetTester tester) async {
      store.dispatch(
        WaitAction<CoreState>.add(verifyPinFlag, ref: '${verifyPinFlag}_ref'),
      );

      await buildTestWidget(
        store: store,
        tester: tester,
        widget: const VerifyPin(
            pinVerificationType: PinVerificationType.resumeWithPin),
      );

      expect(find.byType(VerifyPin), findsOneWidget);
      expect(find.byType(SILPlatformLoader), findsOneWidget);
    });

    testWidgets('should validate PIN input', (WidgetTester tester) async {
      await buildTestWidget(
        store: store,
        tester: tester,
        widget:
            const VerifyPin(pinVerificationType: PinVerificationType.pinChange),
      );

      expect(find.byType(VerifyPin), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.createPinFormFieldKey), findsOneWidget);

      await tester.tap(find.byKey(AppWidgetKeys.verifyPinKey));
      await tester.pump();

      expect(find.text('A 4 digit PIN is required'), findsOneWidget);

      await tester.enterText(
          find.byKey(AppWidgetKeys.createPinFormFieldKey), '123');
      await tester.pump();

      await tester.tap(find.byKey(AppWidgetKeys.verifyPinKey));
      await tester.pump();

      expect(find.text('Enter a four digit PIN'), findsOneWidget);
    });

    testWidgets(
        'should show error container when an invalid PIN ' 'from state is true',
        (WidgetTester tester) async {
      store.dispatch(BatchUpdateMiscStateAction(invalidPin: true));

      await buildTestWidget(
        store: store,
        tester: tester,
        widget: const VerifyPin(
            pinVerificationType: PinVerificationType.resumeWithPin),
      );

      expect(find.text('Please enter your current PIN'), findsOneWidget);
    });

    testWidgets(
        'should navigate to user names page if the correct PIN was entered',
        (WidgetTester tester) async {
      final MockShortGraphQlClient client = MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{'resumeWithPIN': true}
            }),
            200),
      );

      await buildTestWidget(
        store: store,
        tester: tester,
        graphQlClient: client,
        widget: Builder(
          builder: (BuildContext context) {
            store.dispatch(BatchUpdateMiscStateAction(invalidPin: true));
            return const VerifyPin(
                pinVerificationType: PinVerificationType.resumeWithPin);
          },
        ),
      );

      expect(find.byType(VerifyPin), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.createPinFormFieldKey), findsOneWidget);
      await tester.enterText(
          find.byKey(AppWidgetKeys.createPinFormFieldKey), '1234');
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(AppWidgetKeys.verifyPinKey));
      await tester.pumpAndSettle();

      expect(find.byType(SetUserNamesPage), findsOneWidget);
      expect(find.byType(UserNamesForm), findsOneWidget);
    });

    testWidgets(
        'should navigate to changePinRoute if the user is changing their PIN',
        (WidgetTester tester) async {
      final Map<String, dynamic> validPINResponseMap = <String, dynamic>{
        'data': <String, bool>{'resumeWithPIN': true}
      };

      final DateTime nextDay = DateTime.now().add(const Duration(hours: 24));
      final AuthCredentialResponse auth = AuthCredentialResponse.fromJson(
          <String, String>{'expires_in': nextDay.toIso8601String()});

      final MockShortGraphQlClient client = MockShortGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(json.encode(validPINResponseMap), 200));

      store.dispatch(BatchUpdateUserStateAction(auth: auth));
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: client,
        widget: Builder(
          builder: (BuildContext context) => const VerifyPin(
              pinVerificationType: PinVerificationType.pinChange),
        ),
      );

      expect(find.byKey(AppWidgetKeys.createPinFormFieldKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.verifyPinKey), findsOneWidget);

      await tester.enterText(
          find.byKey(AppWidgetKeys.createPinFormFieldKey), '0000');
      await tester.tap(find.byKey(AppWidgetKeys.verifyPinKey));
      await tester.pumpAndSettle();

      expect(find.byType(VerifyPin), findsNothing);
      expect(find.byType(ProfileChangePin), findsOneWidget);
    });

    testWidgets('should navigate to login page when logout button is tapped',
        (WidgetTester tester) async {
      await buildTestWidget(
        store: store,
        tester: tester,
        widget: const PinVerificationPage(
          pinVerificationType: PinVerificationType.pinChange,
        ),
      );

      expect(find.byType(PinVerificationPage), findsOneWidget);
      expect(find.byType(VerifyPin), findsOneWidget);

      final Finder logoutButton = find.byKey(AppWidgetKeys.logoutButton);

      expect(logoutButton, findsOneWidget);
      await tester.tap(logoutButton);
      await tester.pumpAndSettle();

      expect(find.byType(PhoneLoginPage), findsOneWidget);
    });
  });
}
