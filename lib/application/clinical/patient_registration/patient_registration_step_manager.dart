// Package imports:
import 'package:rxdart/rxdart.dart';

// Project imports:
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/pages/patient_registration_container.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/patient_registration_helper.dart';

class PatientRegistrationStepManager {
  final BehaviorSubject<int> _steps = BehaviorSubject<int>.seeded(1);

  final List<PatientRegistrationStep> patientSteps = <PatientRegistrationStep>[
    const PatientRegistrationStep(
      stepNumber: 1,
      title: basicDetailsStepTitle,
    ),
    const PatientRegistrationStep(
      stepNumber: 2,
      title: nextOfKinStepTitle,
    ),
    const PatientRegistrationStep(
      stepNumber: 3,
      title: nhifStepTitle,
    ),
    const PatientRegistrationStep(
      stepNumber: 4,
      title: extraInfoStepTitle,
    ),
  ];

  Stream<int> get steps => _steps.stream.distinct();

  void updateIndex(int index) {
    switch (index) {
      case PatientRegistrationContainer.basicDetailsIndex:
        _steps.add(1);
        break;
      case PatientRegistrationContainer.nextOfKinIndex:
      case PatientRegistrationContainer.addNextOfKinIndex:
        _steps.add(2);
        break;
      case PatientRegistrationContainer.nhifIndex:
        _steps.add(3);
        break;
      case PatientRegistrationContainer.extraInformationIndex:
      case PatientRegistrationContainer.completeRegistrationIndex:
        _steps.add(4);
        break;
    }
  }
}
