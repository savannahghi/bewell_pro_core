import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/widgets/verity_phone_number.dart';
import 'package:shared_ui_components/buttons.dart';

import '../../../../mocks/test_helpers.dart';

void main() {
  group('VerifyPhoneNumber widget', () {
    testWidgets('Verify phone widget renders correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
          widget: VerifiedPhoneNumber(
            sendingOtp: true,
            verifyOTP: () {},
            otpReceiver: patientStr,
          ),
          tester: tester);

      expect(find.byType(SILPrimaryButton), findsOneWidget);

      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();

      expect(find.text(sendingOTP), findsOneWidget);
    });

    testWidgets(
        'Verify phone widget renders incorrectly when invalid phone number is entered',
        (WidgetTester tester) async {
      await buildTestWidget(
          widget: VerifiedPhoneNumber(
            sendingOtp: false,
            verifyOTP: () {},
            otpReceiver: patientStr,
          ),
          tester: tester);

      expect(find.byType(SILPrimaryButton), findsOneWidget);

      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();

      expect(find.text(verifyPhoneBtnText), findsOneWidget);
    });
  });
}
