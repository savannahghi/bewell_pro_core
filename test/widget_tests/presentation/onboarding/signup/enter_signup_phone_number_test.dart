// Flutter imports:
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sghi_core/ui_components/src/inputs.dart';
import 'package:sghi_core/ui_components/src/platform_loader.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/actions/misc_state_actions/batch_update_misc_state_action.dart';
import 'package:bewell_pro_core/application/redux/flags/flags.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/pages/phone_login_page.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/widgets/error_alert_box.dart';
import 'package:bewell_pro_core/presentation/onboarding/signup/enter_signup_phone_number.dart';
import '../../../../mocks/mock_utils.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  setupFirebaseAuthMocks();

  group('EnterSignUpPhoneNo', () {
    setUp(() async {
      await Firebase.initializeApp();
    });

    final Store<CoreState> store =
        Store<CoreState>(initialState: CoreState.initial());

    testWidgets('EnterSignUpPhoneNo renders correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        store: store,
        tester: tester,
        widget: EnterSignUpPhoneNo(),
      );

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

      expect(
          find.byWidgetPredicate(
            (Widget widget) =>
                widget is RichText && tapTextSpan(widget, 'Login'),
          ),
          findsOneWidget);

      await tester.pumpAndSettle();

      expect(find.byType(EnterSignUpPhoneNo), findsNothing);
      expect(find.byType(PhoneLoginPage), findsOneWidget);
    });

    testWidgets('Navigates to landingpage', (WidgetTester tester) async {
      await buildTestWidget(
        store: store,
        tester: tester,
        widget: EnterSignUpPhoneNo(),
      );

      expect(
          find.byKey(AppWidgetKeys.landingPageNavigationKey), findsOneWidget);
      await tester.tap(find.byKey(AppWidgetKeys.landingPageNavigationKey));
      await tester.pumpAndSettle();
      expect(find.byType(EnterSignUpPhoneNo), findsNothing);
      expect(find.byType(PhoneLoginPage), findsOneWidget);
    });

    testWidgets('error text renders when phoneNo is null',
        (WidgetTester tester) async {
      await buildTestWidget(
        store: store,
        tester: tester,
        widget: EnterSignUpPhoneNo(),
      );

      expect(find.byKey(AppWidgetKeys.silPrimaryButtonKey), findsOneWidget);
      await tester.tap(find.byKey(AppWidgetKeys.silPrimaryButtonKey));
      await tester.pump();

      expect(find.text(requiredPhoneNumber), findsOneWidget);
    });

    testWidgets('shows a loading indicator when processing',
        (WidgetTester tester) async {
      store.dispatch(WaitAction<CoreState>.add(
        checkUserExistsFlag,
        ref: '${checkUserExistsFlag}_ref',
      ));
      await buildTestWidget(
          store: store, tester: tester, widget: EnterSignUpPhoneNo());

      expect(find.byType(SILPlatformLoader), findsOneWidget);
    });

    testWidgets('renders ErrorAlertBox if account exists',
        (WidgetTester tester) async {
      store.dispatch(BatchUpdateMiscStateAction(accountExists: true));
      await buildTestWidget(
        store: store,
        tester: tester,
        widget: EnterSignUpPhoneNo(),
      );

      expect(find.byType(ErrorAlertBox), findsOneWidget);
    });

    testWidgets('hides ErrorAlertBox when number is typed in',
        (WidgetTester tester) async {
      store.dispatch(BatchUpdateMiscStateAction(accountExists: true));
      await buildTestWidget(
        store: store,
        tester: tester,
        widget: EnterSignUpPhoneNo(),
      );

      expect(find.byType(ErrorAlertBox), findsOneWidget);

      await tester.enterText(find.byType(SILPhoneInput), '712345678');
      await tester.pump();

      expect(find.byType(ErrorAlertBox), findsNothing);
    });

    testWidgets('tapping checkbox updates state', (WidgetTester tester) async {
      await buildTestWidget(
        store: store,
        tester: tester,
        widget: EnterSignUpPhoneNo(),
      );

      expect(store.state.miscState!.acceptedTerms, false);

      await tester
          .tap(find.byKey(AppWidgetKeys.signupCheckboxConsentToPhoneComms));
      await tester.pump();

      expect(store.state.miscState!.acceptedTerms, true);
    });
  });
}
