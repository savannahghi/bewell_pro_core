// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:app_wrapper/src/base_context.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:shared_ui_components/inputs.dart';
import 'package:shared_ui_components/verify_phone_otp.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/actions/misc_state_actions/batch_update_misc_state_action.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_contexts.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/pages/verify_reset_pin_request_page.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/widgets/onboarding_scaffold.dart';
import 'package:bewell_pro_core/presentation/router/router_generator.dart';
import '../../../../../mocks/mocks.dart';
import '../../../../../mocks/test_helpers.dart';

void main() {
  late Store<CoreState> store;

  setUp(() {
    store = Store<CoreState>(initialState: CoreState.initial());
  });

  group('verify pin reset request page', () {
    final Finder otpBoxFinder = find.byType(VerifyPhoneOtp);
    testWidgets('renders correctly', (WidgetTester tester) async {
      store.dispatch(
        BatchUpdateMiscStateAction(
            phoneNumber: '0712345678', otpCode: '123456'),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        widget: const VerifyPinResetRequestPage(),
      );

      expect(find.byType(VerifyPinResetRequestPage), findsOneWidget);
      expect(find.byType(OnboardingScaffold), findsOneWidget);
      expect(find.text(verifyRequestMsg('0712345678')), findsOneWidget);
      expect(otpBoxFinder, findsOneWidget);

      // enter otp code
      await tester.enterText(otpBoxFinder, '123456');
      await tester.pump(const Duration(seconds: 5));

      // verify navigation
      expect(find.byType(OnboardingScaffold), findsOneWidget);
    });

    testWidgets('should resend otp with customContext',
        (WidgetTester tester) async {
      store.dispatch(
        BatchUpdateMiscStateAction(
            phoneNumber: '0712345678', otpCode: '123456'),
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
                home: Scaffold(
                  body: VerifyPinResetRequestPage(
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
