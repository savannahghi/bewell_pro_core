import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/onboarding/common/landing_page.dart';
import 'package:bewell_pro_core/presentation/onboarding/common/widgets/landing_actions.dart';
import 'package:bewell_pro_core/presentation/onboarding/common/widgets/landing_page_image.dart';
import 'package:user_profile/term_and_conditions.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('Landing Page', () {
    testWidgets('terms and condition widget renders correctly',
        (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = tabletLandscape;

      await buildTestWidget(tester: tester, widget: LandingPage());

      expect(find.byType(LandingPageImage), findsOneWidget);
      expect(find.byType(LandingActions), findsOneWidget);

      expect(find.byKey(AppWidgetKeys.termsAndConditionsKey), findsOneWidget);
      await tester.tap(find.byKey(AppWidgetKeys.termsAndConditionsKey));
      await tester.pumpAndSettle();

      expect(find.byType(TermsAndConditionsPage), findsOneWidget);

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });

    testWidgets('willPopCallback works', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: LandingPage(),
      ));

      await tester.pump();

      expect(find.byType(LandingActions), findsOneWidget);

      final dynamic widgetsCoreState = tester.state(find.byType(WidgetsApp));
      expect(await widgetsCoreState.didPopRoute(), isTrue);
      await tester.pump();

      expect(find.byType(LandingActions), findsOneWidget);
    });
  });
}
