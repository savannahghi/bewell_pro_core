// Flutter imports:
import 'package:flutter/widgets.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:quiver/async.dart';
import 'package:quiver/testing/time.dart';
import 'package:shared_ui_components/inputs.dart';
import 'package:shared_ui_components/platform_loader.dart';

// Project imports:
import 'package:bewell_pro_core/domain/clinical/value_objects/start_visit_type_enum.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/visit/start_visit_page/start_visit_widget.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/resend_otp.dart';
import '../../../../../../mocks/mocks.dart';
import '../../../../../../mocks/test_helpers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Start visit widget', () {
    const String testPhoneNumber = '+254798363893';

    late int now;

    setUp(() {
      now = DateTime.now().microsecondsSinceEpoch;
    });

    testWidgets('displays correct phone number', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: StartVisitWidget(
          hasCompletedEnteringOTP: false,
          showError: false,
          phoneNumber: testPhoneNumber,
          isResendingOTP: false,
          resendOtp: (BuildContext context, int step) {},
          startVisit: (BuildContext context, String otp) {},
          startVisitType: StartVisitType.requestAccess,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text(testPhoneNumber), findsOneWidget);
    });

    testWidgets('displays countdown if time hasn\'t elapsed',
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

      final StartVisitWidget widget = StartVisitWidget(
        countdownTimer: timer,
        hasCompletedEnteringOTP: false,
        showError: false,
        phoneNumber: testPhoneNumber,
        isResendingOTP: false,
        resendOtp: (BuildContext context, int step) {},
        startVisit: (BuildContext context, String otp) {},
        startVisitType: StartVisitType.requestAccess,
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

      final StartVisitWidget widget = StartVisitWidget(
        countdownTimer: timer,
        hasCompletedEnteringOTP: false,
        showError: false,
        phoneNumber: testPhoneNumber,
        isResendingOTP: false,
        resendOtp: (BuildContext context, int step) => resendCount++,
        startVisit: (BuildContext context, String otp) {},
        startVisitType: StartVisitType.requestAccess,
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

    testWidgets('entering otp calls start visit method',
        (WidgetTester tester) async {
      int numberOfCalls = 0;

      await buildTestWidget(
        tester: tester,
        widget: StartVisitWidget(
          hasCompletedEnteringOTP: false,
          showError: false,
          phoneNumber: testPhoneNumber,
          isResendingOTP: false,
          resendOtp: (BuildContext context, int step) {},
          startVisit: (BuildContext context, String otp) => numberOfCalls++,
          startVisitType: StartVisitType.requestAccess,
        ),
      );
      await tester.pumpAndSettle();

      final Finder pinCodeTextField =
          find.byKey(AppWidgetKeys.silPinCodeTextFieldKey);
      expect(pinCodeTextField, findsOneWidget);

      await tester.enterText(pinCodeTextField, '123456');
      expect(numberOfCalls, 1);
    });

    testWidgets('should show error message if showError is true',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: StartVisitWidget(
          hasCompletedEnteringOTP: false,
          showError: false,
          phoneNumber: testPhoneNumber,
          isResendingOTP: false,
          resendOtp: (BuildContext context, int step) {},
          startVisit: (BuildContext context, String otp) {},
          startVisitType: StartVisitType.requestAccess,
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text(enterValidCodeText), findsNothing);

      await buildTestWidget(
        tester: tester,
        widget: StartVisitWidget(
          hasCompletedEnteringOTP: false,
          showError: true,
          phoneNumber: testPhoneNumber,
          isResendingOTP: false,
          resendOtp: (BuildContext context, int step) {},
          startVisit: (BuildContext context, String otp) {},
          startVisitType: StartVisitType.requestAccess,
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text(enterValidCodeText), findsOneWidget);
    });

    testWidgets(
        'should show verify phone text if hasCompletedEnteringOTP is true',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: StartVisitWidget(
          hasCompletedEnteringOTP: true,
          showError: false,
          phoneNumber: testPhoneNumber,
          isResendingOTP: false,
          resendOtp: (BuildContext context, int step) {},
          startVisit: (BuildContext context, String otp) {},
          startVisitType: StartVisitType.requestAccess,
        ),
      );

      expect(find.text(verifyPhoneNumberText), findsOneWidget);
      expect(find.byType(SILPlatformLoader), findsOneWidget);
    });

    testWidgets('is centered on large screen', (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = tabletLandscape;

      await buildTestWidget(
        tester: tester,
        widget: StartVisitWidget(
          hasCompletedEnteringOTP: false,
          showError: false,
          phoneNumber: testPhoneNumber,
          isResendingOTP: false,
          resendOtp: (BuildContext context, int step) {},
          startVisit: (BuildContext context, String otp) {},
          startVisitType: StartVisitType.emergencyOverride,
        ),
      );
      await tester.pumpAndSettle();

      final Finder finder = find.descendant(
        of: find.byType(Center),
        matching: find.byType(SILPinCodeTextField),
      );

      expect(finder, findsOneWidget);

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });

    testWidgets('tapping back button should navigate to previous page',
        (WidgetTester tester) async {
      int popped = 0;

      final TestNavigatorObserver observer = TestNavigatorObserver(
        onPop: (Route<dynamic>? route, Route<dynamic>? previousRoute) =>
            popped++,
      );

      await buildTestWidget(
        tester: tester,
        navigatorObservers: <NavigatorObserver>[observer],
        widget: StartVisitWidget(
          hasCompletedEnteringOTP: false,
          showError: false,
          phoneNumber: testPhoneNumber,
          isResendingOTP: false,
          resendOtp: (BuildContext context, int step) {},
          startVisit: (BuildContext context, String otp) {},
          startVisitType: StartVisitType.emergencyOverride,
        ),
      );
      await tester.pumpAndSettle();

      final Finder backButton = find.byKey(AppWidgetKeys.backButton);
      expect(backButton, findsOneWidget);

      await tester.tap(backButton);

      expect(popped, 1);
    });
  });
}
