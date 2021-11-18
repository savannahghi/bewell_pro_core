// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/resend_otp.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('PhoneCodeResend', () {
    bool firstFunction(int step) {
      return true;
    }

    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: ResendOTPOptions(resendOTPCallback: firstFunction),
      );

      expect(find.byKey(AppWidgetKeys.resendOtpButton), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.resendWithWhatsApp), findsNothing);
      expect(find.byKey(AppWidgetKeys.resendWithNormalText), findsNothing);

      await tester.tap(find.byKey(AppWidgetKeys.resendOtpButton));
      await tester.pumpAndSettle();

      expect(find.byKey(AppWidgetKeys.resendWithWhatsApp), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.resendWithNormalText), findsOneWidget);

      await tester.tap(find.byKey(AppWidgetKeys.resendWithWhatsApp));
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(AppWidgetKeys.resendWithNormalText));
      await tester.pumpAndSettle();

      expect(find.byKey(AppWidgetKeys.resendOtpButton), findsNothing);
    });
  });
}
