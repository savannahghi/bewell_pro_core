// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:bewell_pro_core/domain/clinical/entities/contact_point.dart';
import 'package:bewell_pro_core/domain/clinical/entities/human_name.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/pages/patient_registration_container.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/widgets/next_of_kin_result_card.dart';
import '../../../../../mocks/mocks.dart';
import '../../../../../mocks/test_helpers.dart';

void main() {
  group('NextOfKinResultCard', () {
    late TabController tabController;

    setUp(() {
      tabController = TabController(length: 4, vsync: const TestVSync());
    });

    testWidgets(
        'should navigate to AddNextOfKin when add next of kin button is tapped',
        (WidgetTester tester) async {
      final Patient patient = Patient(
        telecom: <ContactPoint>[ContactPoint(value: '+254798000000')],
        name: <HumanName>[
          HumanName(given: <String>['John'])
        ],
      );

      final PatientRegistrationContainer container =
          PatientRegistrationContainer(
        tabController: tabController,
        child: NextOfKinResultCard(
          patient: patient,
        ),
      );

      await buildTestWidget(
        tester: tester,
        widget: container,
      );

      final Finder addBtn =
          find.byKey(AppWidgetKeys.addNextOfKinSmallDeviceKey);
      expect(addBtn, findsOneWidget);
      await tester.tap(addBtn);
      await tester.pumpAndSettle();

      expect(container.currentIndex,
          PatientRegistrationContainer.addNextOfKinIndex);
    });

    testWidgets(
        'should navigate to AddNextOfKin when add next of kin button is tapped '
        'on large screen', (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = tabletLandscape;

      final Patient patient = Patient(
        telecom: <ContactPoint>[ContactPoint(value: '+254798000000')],
      );

      final PatientRegistrationContainer container =
          PatientRegistrationContainer(
        tabController: tabController,
        child: NextOfKinResultCard(
          patient: patient,
        ),
      );

      await buildTestWidget(
        tester: tester,
        widget: container,
      );

      final Finder addBtn =
          find.byKey(AppWidgetKeys.addNextOfKinSmallDeviceKey);
      expect(addBtn, findsOneWidget);
      await tester.tap(addBtn);
      await tester.pumpAndSettle();

      expect(container.currentIndex,
          PatientRegistrationContainer.addNextOfKinIndex);

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });
  });
}
