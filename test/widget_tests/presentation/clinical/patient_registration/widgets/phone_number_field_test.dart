// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:quiver/async.dart';
import 'package:quiver/testing/time.dart';

// Project imports:
import 'package:bewell_pro_core/application/clinical/patient_registration/phone_number_form_manager.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/resend_otp.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/verify_phone_dialog.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/widgets/phone_number_field.dart';
import '../../../../../mocks/mocks.dart';
import '../../../../../mocks/test_helpers.dart';

void main() {
  group('PhoneNumberFieldWidget', () {
    late int now;

    setUp(() {
      now = DateTime.now().microsecondsSinceEpoch;
    });

    testWidgets('tapping resend via text send otp request',
        (WidgetTester tester) async {
      final PhoneNumberFormManager formManager = PhoneNumberFormManager();

      const String testPhoneNumber = '+254798000000';
      formManager.inPhoneNumber.add(testPhoneNumber);

      final CountdownTimer countdownTimer = CountdownTimer(
        const Duration(seconds: 30),
        const Duration(seconds: 1),
        stopwatch: FakeStopwatch(
          () => now,
          const Duration(seconds: 1).inMicroseconds,
        ),
      );

      final PhoneNumberFieldWidget widget = PhoneNumberFieldWidget(
        formManager: formManager,
        countdownTimer: countdownTimer,
        preFilled: testPhoneNumber,
        otpReceiver: patientStr,
      );

      await advanceAndPump(
        widget: widget,
        tester: tester,
        updateTime: (Duration duration) => now = now + duration.inMicroseconds,
      );

      final Finder verifyPhoneBtn =
          find.byKey(AppWidgetKeys.verifyButtonKey, skipOffstage: false);
      expect(verifyPhoneBtn, findsOneWidget);
      await tester.ensureVisible(verifyPhoneBtn);
      await tester.pumpAndSettle();
      await tester.tap(verifyPhoneBtn);
      await tester.pumpAndSettle();

      await advanceAndPump(
        widget: widget,
        tester: tester,
        updateTime: (Duration duration) => now = now + duration.inMicroseconds,
        duration: const Duration(seconds: 5),
      );
      expect(find.byType(VerifyPhoneDialog), findsOneWidget);
      expect(find.text(remainingSecondsText(25)), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.resendInTextKey), findsOneWidget);

      await advanceAndPump(
        widget: widget,
        tester: tester,
        updateTime: (Duration duration) => now = now + duration.inMicroseconds,
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
      expect(formManager.verificationCodeValue, '123456');
    });

    testWidgets('tapping resend via text send otp request on large screen',
        (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = tabletLandscape;

      final PhoneNumberFormManager formManager = PhoneNumberFormManager();

      const String testPhoneNumber = '+254798000000';
      formManager.inPhoneNumber.add(testPhoneNumber);

      final CountdownTimer countdownTimer = CountdownTimer(
        const Duration(seconds: 30),
        const Duration(seconds: 1),
        stopwatch: FakeStopwatch(
          () => now,
          const Duration(seconds: 1).inMicroseconds,
        ),
      );

      final PhoneNumberFieldWidget widget = PhoneNumberFieldWidget(
        formManager: formManager,
        countdownTimer: countdownTimer,
        preFilled: testPhoneNumber,
        otpReceiver: patientStr,
      );

      await advanceAndPump(
        widget: widget,
        tester: tester,
        updateTime: (Duration duration) => now = now + duration.inMicroseconds,
      );

      final Finder verifyPhoneBtn =
          find.byKey(AppWidgetKeys.verifyButtonKey, skipOffstage: false);
      expect(verifyPhoneBtn, findsOneWidget);
      await tester.ensureVisible(verifyPhoneBtn);
      await tester.pumpAndSettle();
      await tester.tap(verifyPhoneBtn);
      await tester.pumpAndSettle();

      await advanceAndPump(
        widget: widget,
        tester: tester,
        updateTime: (Duration duration) => now = now + duration.inMicroseconds,
        duration: const Duration(seconds: 5),
      );
      expect(find.byType(VerifyPhoneDialog), findsOneWidget);
      expect(find.text(remainingSecondsText(25)), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.resendInTextKey), findsOneWidget);

      await advanceAndPump(
        widget: widget,
        tester: tester,
        updateTime: (Duration duration) => now = now + duration.inMicroseconds,
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
      expect(formManager.verificationCodeValue, '123456');

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });
  });
}
