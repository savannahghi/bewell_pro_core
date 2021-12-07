// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:bewell_pro_core/domain/clinical/entities/human_name.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_connection.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/patient_gender_enum.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/search_card/patient_search_card_widget.dart';
import '../../../../../../mocks/test_helpers.dart';

void main() {
  group('patient search card widget test', () {
    const String name = 'user1';
    const String dateBirth = '2004-12-29';
    final PatientEdge patientEdge = PatientEdge(
      node: Patient(
        birthDate: dateBirth,
        gender: PatientGenderEnum.male,
        name: <HumanName>[
          HumanName(text: name),
        ],
      ),
    );

    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
          tester: tester,
          widget: PatientSearchCardWidget(patientEdge: patientEdge));

      expect(find.text('male'), findsOneWidget);
      expect(find.text('User1'), findsOneWidget);
      expect(find.text(dateBirth), findsOneWidget);
    });

    testWidgets('renders correctly on large screen',
        (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = const Size(1280, 720);

      await buildTestWidget(
        tester: tester,
        widget: PatientSearchCardWidget(patientEdge: patientEdge),
      );

      expect(find.text('male'), findsOneWidget);
      expect(find.text('User1'), findsOneWidget);
      expect(find.text(dateBirth), findsOneWidget);

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });
  });
}
