import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/entities.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/application/redux/states/user_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/summary/widgets/otp_box_connector.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/visit/start_visit_page/resend_otp_action.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/resend_otp.dart';
import 'package:quiver/async.dart';
import 'package:quiver/testing/time.dart';

import '../../../../../../../mocks/mock_redux_actions.dart';
import '../../../../../../../mocks/mocks.dart';
import '../../../../../../../mocks/test_helpers.dart';

void main() {
  group('OtpBoxConnector', () {
    const String examplePhoneNumber = '+254798000000';

    late int now;

    setUp(() {
      startMockVisitAndExam();
      now = DateTime.now().microsecondsSinceEpoch;
    });

    testWidgets('resending otp triggers ResendOtpAction',
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

      final Widget widget = OtpBoxConnector(
        countdownTimer: timer,
      );

      final Store<CoreState> store = MockStore<CoreState>(
        initialState: CoreState.initial().copyWith(
          userState: UserState(
            userProfile: UserProfile(
              primaryPhoneNumber: PhoneNumber.withValue(examplePhoneNumber),
            ),
          ),
        ),
        mocks: <Type, dynamic>{ResendOtpAction: MockResendOtpAction()},
      );

      await advanceAndPump(
        widget: widget,
        tester: tester,
        updateTime: (Duration duration) => now = now + duration.inMicroseconds,
        store: store,
      );

      await advanceAndPump(
        widget: widget,
        tester: tester,
        store: store,
        updateTime: (Duration duration) => now = now + duration.inMicroseconds,
        duration: const Duration(seconds: 5),
      );
      expect(find.byKey(AppWidgetKeys.resendInTextKey), findsOneWidget);

      await advanceAndPump(
        widget: widget,
        tester: tester,
        store: store,
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
      expect(store.dispatchCount, 1);
    });
  });
}
