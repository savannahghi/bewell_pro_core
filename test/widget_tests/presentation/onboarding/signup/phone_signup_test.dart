import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/redux/actions/misc_state_actions/batch_update_misc_state_action.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';

import 'package:bewell_pro_core/presentation/onboarding/signup/enter_signup_phone_number.dart';

import 'package:bewell_pro_core/presentation/onboarding/signup/phone_signup.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:shared_ui_components/inputs.dart';
import 'package:shared_ui_components/verify_phone_otp.dart';

import '../../../../mocks/test_helpers.dart';

void main() {
  group('phone sign up page', () {
    final Store<AppState> store =
        Store<AppState>(initialState: AppState.initial());

    testWidgets('renders correctly and otp is null',
        (WidgetTester tester) async {
      await buildTestWidget(
        store: store,
        tester: tester,
        widget: PhoneSignUp(),
      );

      expect(find.byType(PhoneSignUp), findsOneWidget);
      expect(find.byType(EnterSignUpPhoneNo), findsOneWidget);
      expect(find.byType(VerifyPhoneOtp), findsNothing);

      await tester.showKeyboard(find.byType(SILPhoneInput));
      await tester.enterText(find.byType(SILPhoneInput), '0712345678');
      await tester.pump();

      expect(find.text('0712345678'), findsOneWidget);
      expect(find.byType(CheckboxListTile), findsOneWidget);
      final Finder checkBox =
          find.byKey(AppWidgetKeys.signupCheckboxConsentToPhoneComms);
      expect(checkBox, findsOneWidget);

      // Toggle the accepted terms checkbox
      await tester.tap(checkBox);
      await tester.pump();
      await tester.tap(checkBox);
      await tester.pump();

      expect(find.byKey(AppWidgetKeys.silPrimaryButtonKey), findsOneWidget);
      await tester.tap(find.byKey(AppWidgetKeys.silPrimaryButtonKey));

      await tester.pumpAndSettle();

      expect(store.state.miscState!.otpCode, 'UNKNOWN');
      expect(find.byType(SnackBar), findsOneWidget);
      expect(
          find.text('Please allow use of your phone number'), findsOneWidget);
    });

    testWidgets('state is updated correctly when change number is pressed',
        (WidgetTester tester) async {
      store.dispatch(
        BatchUpdateMiscStateAction(
            otpCode: '123456', phoneNumber: '0712345678'),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: PhoneSignUp(),
      );

      // assert that VerifyPhoneOtp renders correctly
      expect(find.byType(VerifyPhoneOtp), findsOneWidget);
      expect(find.byType(SILPinCodeTextField), findsOneWidget);
      expect(find.text(changeNo), findsOneWidget);

      await tester.tap(find.text(changeNo));
      await tester.pump();

      // assert that state has been updated to unknown
      expect(store.state.miscState!.otpCode, UNKNOWN);
      expect(store.state.miscState!.phoneNumber, UNKNOWN);
      expect(store.state.miscState!.acceptedTerms, false);
    });

    testWidgets('PhoneSignup accepts OTP and state is updated correctly',
        (WidgetTester tester) async {
      store.dispatch(
        BatchUpdateMiscStateAction(
            otpCode: '123456', phoneNumber: '0712345678'),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: PhoneSignUp(),
      );

      // assert that VerifyPhoneOtp renders correctly
      expect(find.byType(VerifyPhoneOtp), findsOneWidget);
      expect(find.byType(SILPinCodeTextField), findsOneWidget);
      expect(find.text(changeNo), findsOneWidget);

      // enter otp code
      await tester.enterText(find.byType(SILPinCodeTextField), '123456');
      await tester.pump();

      // check if most current otp was set to state by the action
      expect(store.state.miscState!.otpCode, '123456');
      expect(store.state.miscState!.phoneNumber, '0712345678');

      // check if page title and description is set
      expect(store.state.miscState!.title, createPin);
      expect(store.state.miscState!.message, secureAccount);
    });
  });
}
