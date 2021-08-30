import 'dart:convert';

import 'package:app_wrapper/app_wrapper.dart';
import 'package:app_wrapper/src/base_context.dart';
import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_contexts.dart';
import 'package:bewell_pro_core/domain/core/value_objects/domain_constants.dart';
import 'package:bewell_pro_core/presentation/router/router_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/redux/actions/misc_state_actions/batch_update_misc_state_action.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/onboarding/signup/enter_signup_phone_number.dart';
import 'package:bewell_pro_core/presentation/onboarding/signup/phone_signup.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:http/http.dart';
import 'package:shared_ui_components/inputs.dart';
import 'package:shared_ui_components/verify_phone_otp.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('phone sign up page', () {
    final Store<CoreState> store =
        Store<CoreState>(initialState: CoreState.initial());

    testWidgets('renders correctly and otp is null',
        (WidgetTester tester) async {
      await buildTestWidget(
        store: store,
        tester: tester,
        widget: const PhoneSignUp(),
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
        widget: const PhoneSignUp(),
      );

      // assert that VerifyPhoneOtp renders correctly
      expect(find.byType(VerifyPhoneOtp), findsOneWidget);
      expect(find.byType(SILPinCodeTextField), findsOneWidget);
      expect(find.text(changeNumberText), findsOneWidget);

      await tester.tap(find.text(changeNumberText));
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
        widget: const PhoneSignUp(),
      );

      // assert that VerifyPhoneOtp renders correctly
      expect(find.byType(VerifyPhoneOtp), findsOneWidget);
      expect(find.byType(SILPinCodeTextField), findsOneWidget);
      expect(find.text(changeNumberText), findsOneWidget);

      // enter otp code
      await tester.enterText(find.byType(SILPinCodeTextField), '123456');
      await tester.pump(const Duration(seconds: 5));

      // check if most current otp was set to state by the action
      expect(store.state.miscState!.otpCode, '123456');
      expect(store.state.miscState!.phoneNumber, '0712345678');

      // check if page title and description is set
      expect(store.state.miscState!.title, createPin);
      expect(store.state.miscState!.message, secureAccount);
    });

    testWidgets('should resend otp with customContext',
        (WidgetTester tester) async {
      store.dispatch(
        BatchUpdateMiscStateAction(
            otpCode: '123456', phoneNumber: '0712345678'),
      );

      final MockHttpClient mockClient = MockHttpClient(
          Response(json.encode(<String, String>{'otp': '123456'}), 200));

      await tester.runAsync(() async {
        await tester.pumpWidget(
          AppWrapperBase(
            graphQLClient: mockGraphQlClient,
            appName: AppBrand().appName.value,
            appContexts: testAppContexts,
            deviceCapabilities: deviceCapabilities,
            customContext: const BaseContext(
              graphqlEndpoint: 'graphqlEndpoint',
              loginByPhoneEndpoint: 'loginByPhoneEndpoint',
              uploadFileEndPoint: 'uploadFileEndPoint',
              pinResetEndpoint: 'pinResetEndpoint',
              updateUserPinEndpoint: 'updateUserPinEndpoint',
              verifyPhoneEndpoint: 'verifyPhoneEndpoint',
              createUserByPhoneEndpoint: 'createUserByPhoneEndpoint',
              retryResendOtpEndpoint:
                  'https://profile-testing.healthcloud.co.ke/send_retry_otp',
              refreshTokenEndpoint: 'refreshTokenEndpoint',
              anonymousLoginEndpoint: 'anonymousLoginEndpoint',
              userRecoveryPhoneNumbersEndpoint:
                  'userRecoveryPhoneNumbersEndpoint',
              sendRecoverAccountOtpEndpoint: 'sendRecoverAccountOtpEndpoint',
              setPrimaryPhoneNumberEndpoint: 'setPrimaryPhoneNumberEndpoint',
              sendContactVerificationOTPEndpoint:
                  'sendContactVerificationOTPEndpoint',
              verifyContactOTPEndpoint: 'verifyContactOTPEndpoint',
            ),
            child: StoreProvider<CoreState>(
              store: store,
              child: MaterialApp(
                onGenerateRoute: RouteGenerator.generateRoute,
                navigatorKey: globalAppNavigatorKey,
                home: Scaffold(
                  body: PhoneSignUp(
                    httpClient: mockClient,
                  ),
                ),
              ),
            ),
          ),
        );

        expect(find.byType(SILPinCodeTextField), findsOneWidget);
        await tester.tap(find.byType(SILPinCodeTextField));

        await tester.pumpAndSettle();

        final Finder resendOtpFinder = find.text(' Send the code again ');
        expect(resendOtpFinder, findsOneWidget);
        await tester.tap(resendOtpFinder);
        await tester.pumpAndSettle();

        final Finder resendRadioFinder =
            find.byKey(const Key('send_via_text_msg'));
        expect(resendRadioFinder, findsOneWidget);
        await tester.tap(resendRadioFinder);
        await tester.pumpAndSettle();

        expect(resendRadioFinder, findsNothing);
      });
    });
  });
}
