// Dart imports:
import 'dart:async';
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:quiver/async.dart';
import 'package:quiver/testing/time.dart';

// Project imports:
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/resend_otp.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/verify_phone_dialog.dart';
import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('verify phone dialog', () {
    late int now;

    setUp(() {
      now = DateTime.now().microsecondsSinceEpoch;
    });

    final Finder silPinCodeTextField = find.byKey(AppWidgetKeys.otpVerifyInput);

    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: VerifyPhoneDialog(
          otpReceiver: patientStr,
          otpCode: '1234',
          phoneNumber: '0712345678',
          resendOtp: (BuildContext context, int step) async {
            return Future<String>.value('');
          },
        ),
      );

      expect(find.byType(VerifyPhoneDialog), findsOneWidget);
      expect(
          find.byKey(AppWidgetKeys.verifyPhoneDialogColumnKey), findsOneWidget);
      expect(find.byIcon(Icons.security), findsOneWidget);
      expect(find.text(enterVerificationCode), findsOneWidget);
      expect(find.text(enterVerificationCodeSent(patientStr)), findsOneWidget);
    });

    testWidgets('displays the correct phone number',
        (WidgetTester tester) async {
      await buildTestWidget(
          tester: tester,
          widget: VerifyPhoneDialog(
            otpReceiver: patientStr,
            otpCode: '1234',
            phoneNumber: '0712345678',
            resendOtp: (BuildContext context, int step) async {
              return Future<String>.value('');
            },
          ));

      expect(find.byType(VerifyPhoneDialog), findsOneWidget);
      expect(
          find.byKey(AppWidgetKeys.verifyPhoneDialogColumnKey), findsOneWidget);
      expect(find.text('0712345678'), findsOneWidget);
    });

    testWidgets('passes when correct OTP is put', (WidgetTester tester) async {
      await buildTestWidget(
          tester: tester,
          widget: VerifyPhoneDialog(
            otpReceiver: patientStr,
            otpCode: '123456',
            phoneNumber: '0712345678',
            resendOtp: (BuildContext context, int step) async {
              return Future<String>.value('');
            },
          ));

      expect(find.byType(VerifyPhoneDialog), findsOneWidget);
      expect(
          find.byKey(AppWidgetKeys.verifyPhoneDialogColumnKey), findsOneWidget);
      expect(silPinCodeTextField, findsOneWidget);
      expect(find.byKey(AppWidgetKeys.countDownTimerKey), findsOneWidget);

      await tester.showKeyboard(silPinCodeTextField);
      await tester.enterText(silPinCodeTextField, '123456');
      await tester.pump();

      expect(find.byKey(AppWidgetKeys.countDownTimerKey), findsNothing);
    });

    testWidgets('shows error message when wrong OTP is put',
        (WidgetTester tester) async {
      await buildTestWidget(
          tester: tester,
          widget: VerifyPhoneDialog(
            otpReceiver: patientStr,
            otpCode: '123456',
            phoneNumber: '0712345678',
            resendOtp: (BuildContext context, int step) async {
              return Future<String>.value('');
            },
          ));

      expect(find.byType(VerifyPhoneDialog), findsOneWidget);
      expect(
          find.byKey(AppWidgetKeys.verifyPhoneDialogColumnKey), findsOneWidget);
      expect(silPinCodeTextField, findsOneWidget);

      await tester.showKeyboard(silPinCodeTextField);
      await tester.enterText(silPinCodeTextField, '975341');
      await tester.pumpAndSettle();

      expect(find.text(enterValidCodeText), findsOneWidget);
    });

    testWidgets('should show timer if time has not elapsed',
        (WidgetTester tester) async {
      final CountdownTimer countDownTimer = CountdownTimer(
        const Duration(seconds: 30),
        const Duration(seconds: 1),
        stopwatch: FakeStopwatch(
          () => now,
          const Duration(seconds: 1).inMicroseconds,
        ),
      );

      final Widget widget = VerifyPhoneDialog(
        otpCode: '123456',
        phoneNumber: '0712345678',
        countdownTimer: countDownTimer,
        resendOtp: (BuildContext context, int step) async {
          return Future<String>.value('');
        },
        otpReceiver: patientStr,
      );

      // Build the Widget the first time and make sure it shows the right thing
      await advanceAndPump(
        widget: widget,
        tester: tester,
        updateTime: (Duration duration) => now = now + duration.inMicroseconds,
      );

      await advanceAndPump(
        widget: widget,
        tester: tester,
        updateTime: (Duration duration) => now = now + duration.inMicroseconds,
        duration: const Duration(seconds: 5),
      );
      expect(find.byKey(AppWidgetKeys.resendInTextKey), findsOneWidget);
      expect(find.text(remainingSecondsText(25)), findsOneWidget);

      await advanceAndPump(
        widget: widget,
        tester: tester,
        updateTime: (Duration duration) => now = now + duration.inMicroseconds,
        duration: const Duration(seconds: 31),
      );
      expect(find.byKey(AppWidgetKeys.resendInTextKey), findsNothing);

      countDownTimer.cancel();
    });

    testWidgets(
        'resend otp buttons appear after countdown and work as expected',
        (WidgetTester tester) async {
      int resendCount = 0;

      final CountdownTimer countDownTimer = CountdownTimer(
        const Duration(seconds: 30),
        const Duration(seconds: 1),
        stopwatch: FakeStopwatch(
          () => now,
          const Duration(seconds: 1).inMicroseconds,
        ),
      );

      final Widget widget = VerifyPhoneDialog(
        otpCode: '123456',
        phoneNumber: '0712345678',
        resendOtp: (BuildContext context, int step) async {
          resendCount++;
          return Future<String>.value('');
        },
        otpReceiver: patientStr,
        countdownTimer: countDownTimer,
      );

      final MockShortGraphQlClient graphQlClient =
          MockShortGraphQlClient.withResponse(
              'idToken',
              'endpoint',
              Response(
                  json.encode(
                    <String, dynamic>{
                      'data': <String, dynamic>{'generateRetryOTP': '123456'},
                    },
                  ),
                  200));

      // Build the Widget the first time and make sure it shows the right thing
      await advanceAndPump(
        widget: widget,
        tester: tester,
        updateTime: (Duration duration) => now = now + duration.inMicroseconds,
        graphQlClient: graphQlClient,
      );

      await advanceAndPump(
        widget: widget,
        tester: tester,
        updateTime: (Duration duration) => now = now + duration.inMicroseconds,
        graphQlClient: graphQlClient,
        duration: const Duration(seconds: 5),
      );
      expect(find.byKey(AppWidgetKeys.resendInTextKey), findsOneWidget);

      await advanceAndPump(
        widget: widget,
        tester: tester,
        updateTime: (Duration duration) => now = now + duration.inMicroseconds,
        graphQlClient: graphQlClient,
        duration: const Duration(seconds: 32),
      );
      expect(find.byType(ResendOTPOptions), findsOneWidget);
      final Finder resendButton = find.byKey(AppWidgetKeys.resendOtpButton);
      expect(resendButton, findsOneWidget);
      await tester.tap(resendButton);
      await tester.pumpAndSettle();

      final Finder resendWithText =
          find.byKey(AppWidgetKeys.resendWithNormalText);
      expect(resendWithText, findsOneWidget);

      await tester.tap(resendWithText);
      expect(resendCount, 1);

      countDownTimer.cancel();
    });
  });
}
