import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/widgets/onboarding_scaffold.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/widgets/set_and_confirm_pin_widget.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/pages/set_pin_page.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../../mocks/mocks.dart';
import '../../../../../mocks/test_helpers.dart';

void main() {
  testWidgets('SetPinPage renders correctly o large screen',
      (WidgetTester tester) async {
    tester.binding.window.devicePixelRatioTestValue = 1.0;
    tester.binding.window.physicalSizeTestValue = tabletLandscape;

    await buildTestWidget(tester: tester, widget: SetPinPage());

    expect(find.byType(OnboardingScaffold), findsOneWidget);
    expect(find.byType(SetAndConfirmPinWidget), findsOneWidget);
    expect(find.byIcon(MdiIcons.security), findsOneWidget);

    addTearDown(() {
      tester.binding.window.clearPhysicalSizeTestValue();
      tester.binding.window.clearDevicePixelRatioTestValue();
    });
  });
}
