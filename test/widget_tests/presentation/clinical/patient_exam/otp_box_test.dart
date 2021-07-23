import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/redux/actions/user_state_actions/batch_update_user_state_action.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/summary/widgets/otp_box.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/resend_otp.dart';
import 'package:quiver/async.dart';
import 'package:quiver/testing/time.dart';
import 'package:shared_ui_components/inputs.dart';
import 'package:shared_ui_components/platform_loader.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('OTP Box', () {
    const String phoneNumberString = '0712345678';

    late Store<CoreState> store;
    late int now;

    setUp(() {
      store = Store<CoreState>(initialState: CoreState.initial());
      now = DateTime.now().microsecondsSinceEpoch;
      startMockVisitAndExam();
    });

    testWidgets('entering pin ends a visit', (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = tabletLandscape;

      store.dispatch(
        BatchUpdateUserStateAction(
            userProfile: UserProfile(
          primaryEmailAddress: testEmailAddress,
          primaryPhoneNumber: testPhoneNumber,
        )),
      );

      int endVisitCount = 0;

      await buildTestWidget(
        tester: tester,
        store: store,
        widget: OtpBox(
          resendOtp: (BuildContext context, int step) {},
          endVisit: (BuildContext context, String otp) => endVisitCount++,
          phoneNumber: phoneNumberString,
          endingExam: false,
          showError: false,
        ),
      );

      expect(find.text(signOffText), findsOneWidget);

      await tester.tap(find.byType(SILPinCodeTextField));
      await tester.enterText(find.byType(SILPinCodeTextField), '123456');
      await tester.pumpAndSettle();

      expect(endVisitCount, 1);

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });

    testWidgets('if endingExam is true, should show loading indicator',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: OtpBox(
          resendOtp: (BuildContext context, int step) {},
          endVisit: (BuildContext context, String otp) {},
          phoneNumber: phoneNumberString,
          endingExam: false,
          showError: false,
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byType(SILPlatformLoader), findsNothing);

      await buildTestWidget(
        tester: tester,
        store: store,
        widget: OtpBox(
          resendOtp: (BuildContext context, int step) {},
          endVisit: (BuildContext context, String otp) {},
          phoneNumber: phoneNumberString,
          endingExam: true,
          showError: false,
        ),
      );
      expect(find.byType(SILPlatformLoader), findsOneWidget);
    });

    testWidgets('if showError is true, should show error message',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: OtpBox(
          resendOtp: (BuildContext context, int step) {},
          endVisit: (BuildContext context, String otp) {},
          phoneNumber: phoneNumberString,
          endingExam: false,
          showError: false,
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text(enterValidCodeText), findsNothing);

      await buildTestWidget(
        tester: tester,
        store: store,
        widget: OtpBox(
          resendOtp: (BuildContext context, int step) {},
          endVisit: (BuildContext context, String otp) {},
          phoneNumber: phoneNumberString,
          endingExam: false,
          showError: true,
        ),
      );
      expect(find.text(enterValidCodeText), findsOneWidget);
    });

    testWidgets('should show timer if time has not elapsed',
        (WidgetTester tester) async {
      final FakeStopwatch fakeStopwatch = FakeStopwatch(
        () => now,
        const Duration(seconds: 1).inMicroseconds,
      );

      final CountdownTimer timer = CountdownTimer(
        const Duration(seconds: 30),
        const Duration(seconds: 1),
        stopwatch: fakeStopwatch,
      );

      final Widget widget = OtpBox(
        resendOtp: (BuildContext context, int step) {},
        endVisit: (BuildContext context, String otp) {},
        phoneNumber: phoneNumberString,
        endingExam: false,
        showError: false,
        countdownTimer: timer,
      );

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
        duration: const Duration(seconds: 5),
      );
      expect(find.text(remainingSecondsText(20)), findsOneWidget);
    });

    testWidgets(
        'resend otp buttons appear after countdown and work as expected',
        (WidgetTester tester) async {
      int resendCount = 0;

      final FakeStopwatch fakeStopwatch = FakeStopwatch(
        () => now,
        const Duration(seconds: 1).inMicroseconds,
      );

      final CountdownTimer timer = CountdownTimer(
        const Duration(seconds: 30),
        const Duration(seconds: 1),
        stopwatch: fakeStopwatch,
      );

      final Widget widget = OtpBox(
        resendOtp: (BuildContext context, int step) {
          resendCount++;
        },
        endVisit: (BuildContext context, String otp) {},
        phoneNumber: phoneNumberString,
        endingExam: false,
        showError: false,
        countdownTimer: timer,
      );

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
      expect(resendCount, 1);

      await tester.tap(resendWithText);
      expect(resendCount, 2);
    });
  });
}
