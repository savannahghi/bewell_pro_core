// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/secondary_banner_zero_experience.dart';
import '../../../../../mocks/test_helpers.dart';

void main() {
  testWidgets('SecondaryBannerBlankExperience renders correctly',
      (WidgetTester tester) async {
    await buildTestWidget(
      tester: tester,
      widget:
          const SecondaryBannerZeroState(currentTabName: 'Patient Diagnosis'),
    );

    expect(find.byType(ListView), findsOneWidget);
    expect(find.text('The patient has no recorded Patient Diagnosis yet.'),
        findsOneWidget);
  });
}
