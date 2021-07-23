import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/pages/patient_registration_container.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/patient_registration_helper.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/patient_registration_steps.dart';

import '../../../../mocks/test_helpers.dart';

void main() {
  group('Patient registration steps', () {
    late Store<CoreState> store;
    late TabController controller;

    setUp(() {
      store = Store<CoreState>(initialState: CoreState.initial());
      controller = TabController(length: 6, vsync: const TestVSync());
    });

    testWidgets('displays correct steps', (WidgetTester tester) async {
      final PatientRegistrationContainer container =
          PatientRegistrationContainer(
        tabController: controller,
        child: const PatientRegistrationSteps(),
      );

      await buildTestWidget(
        store: store,
        tester: tester,
        widget: container,
      );
      await tester.pump();

      final List<PatientRegistrationStep> steps = container.patientSteps;
      final int totalSteps = steps.length;
      expect(totalSteps, 4);

      expect(container.currentIndex,
          PatientRegistrationContainer.basicDetailsIndex);
      PatientRegistrationStep currentStep = steps[0];
      int stepNumber = currentStep.stepNumber;
      String stepTitle = currentStep.title;

      expect(stepNumber, 1);
      expect(stepTitle, basicDetailsStepTitle);
      expect(find.text(_getStepText(stepNumber, totalSteps)), findsOneWidget);
      expect(find.text(basicDetailsStepTitle), findsOneWidget);

      container.navigate(PatientRegistrationContainer.nextOfKinIndex);
      await tester.pumpAndSettle();

      expect(
          container.currentIndex, PatientRegistrationContainer.nextOfKinIndex);
      currentStep = steps[1];
      stepNumber = currentStep.stepNumber;
      stepTitle = currentStep.title;
      expect(stepNumber, 2);
      expect(stepTitle, nextOfKinStepTitle);
      expect(find.text(_getStepText(stepNumber, totalSteps)), findsOneWidget);

      container.navigate(PatientRegistrationContainer.addNextOfKinIndex);
      await tester.pumpAndSettle();

      expect(container.currentIndex,
          PatientRegistrationContainer.addNextOfKinIndex);
      expect(find.text(_getStepText(stepNumber, totalSteps)), findsOneWidget);

      container.navigate(PatientRegistrationContainer.nhifIndex);
      await tester.pumpAndSettle();

      currentStep = steps[2];
      stepNumber = currentStep.stepNumber;
      stepTitle = currentStep.title;
      expect(stepNumber, 3);
      expect(stepTitle, nhifStepTitle);
      expect(find.text(_getStepText(stepNumber, totalSteps)), findsOneWidget);

      container.navigate(PatientRegistrationContainer.extraInformationIndex);
      await tester.pumpAndSettle();

      currentStep = steps[3];
      stepNumber = currentStep.stepNumber;
      stepTitle = currentStep.title;
      expect(stepNumber, 4);
      expect(stepTitle, extraInfoStepTitle);
      expect(find.text(_getStepText(stepNumber, totalSteps)), findsOneWidget);

      container
          .navigate(PatientRegistrationContainer.completeRegistrationIndex);
      await tester.pumpAndSettle();

      expect(stepTitle, extraInfoStepTitle);
      expect(find.text(_getStepText(stepNumber, totalSteps)), findsOneWidget);
    });
  });
}

String _getStepText(int stepNumber, int totalSteps) =>
    'Step $stepNumber of $totalSteps';
