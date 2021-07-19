import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/widgets/onboarding_scaffold.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/widgets/set_and_confirm_pin_widget.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/pages/reset_pin_page.dart';

import '../../../../../mocks/test_helpers.dart';

void main() {
  group('Reset Pin Page', () {
    testWidgets('should render correctly', (WidgetTester tester) async {
      await buildTestWidget(tester: tester, widget: ReSetPinPage());

      expect(find.byType(OnboardingScaffold), findsOneWidget);
      expect(find.byType(SetAndConfirmPinWidget), findsOneWidget);
    });
  });
}
