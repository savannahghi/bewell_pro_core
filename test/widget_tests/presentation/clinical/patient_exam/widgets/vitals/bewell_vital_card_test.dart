// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:bewell_pro_core/domain/clinical/entities/patient_vital.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/asset_strings.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/vitals/bewell_vital_card.dart';
import '../../../../../../mocks/mocks.dart';
import '../../../../../../mocks/test_helpers.dart';

void main() {
  group('BeWellVitalCard', () {
    final PatientVital patientVital = PatientVital(
      vitalText: 'Respiratory rate',
      vitalValue: '90',
      interpretation: 'NORMAL',
      issueDate: '2020-12-22T18:32:07.052015Z',
      unit: 'BPM',
    );

    testWidgets('renders correctly on small screen',
        (WidgetTester tester) async {
      final ExamChangeObject examChangeObject = ExamChangeObject();
      await buildTestWidget(
        tester: tester,
        widget: BeWellVitalCard(
          vitalText: 'Respiratory rate',
          imgPath: respiratoryRateIcon,
          patientVital: patientVital,
          unit: 'BPM',
        ),
      );

      expect(find.text('Respiratory rate'), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);

      examChangeObject.onAddVitalListener.add(true);
      await tester.pump();

      expect(find.text('Respiratory rate'), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('renders correctly on Large screen',
        (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = tabletLandscape;

      await buildTestWidget(
        tester: tester,
        widget: BeWellVitalCard(
          imgPath: respiratoryRateIcon,
          vitalText: 'Respiratory rate',
          patientVital: patientVital,
          unit: 'BPM',
        ),
      );

      expect(find.text('Respiratory rate'), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });
  });
}
