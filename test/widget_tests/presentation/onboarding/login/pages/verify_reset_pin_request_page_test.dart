import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/redux/actions/misc_state_actions/batch_update_misc_state_action.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/widgets/onboarding_scaffold.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/pages/verify_reset_pin_request_page.dart';

import 'package:shared_ui_components/verify_phone_otp.dart';

import '../../../../../mocks/test_helpers.dart';

void main() {
  final Store<CoreState> store =
      Store<CoreState>(initialState: CoreState.initial());

  group('verify pin reset request page', () {
    final Finder otpBoxFinder = find.byType(VerifyPhoneOtp);
    testWidgets('renders correctly', (WidgetTester tester) async {
      store.dispatch(
        BatchUpdateMiscStateAction(
            phoneNumber: '0712345678', otpCode: '123456'),
      );

      await buildTestWidget(
          tester: tester, store: store, widget: VerifyPinResetRequestPage());

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
  });
}
