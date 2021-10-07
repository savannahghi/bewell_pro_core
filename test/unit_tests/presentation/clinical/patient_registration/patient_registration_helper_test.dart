// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:bewell_pro_core/presentation/clinical/patient_registration/patient_registration_helper.dart';

void main() {
  test('Patient setup model should return the correct object', () {
    final List<PatientRegistrationStep> patientRegistrationStep =
        <PatientRegistrationStep>[
      const PatientRegistrationStep(
        stepNumber: 1,
        title: 'Basic details',
      )
    ];
    expect(patientRegistrationStep, isA<List<PatientRegistrationStep>>());
    expect(patientRegistrationStep.first, isA<PatientRegistrationStep>());
    expect(patientRegistrationStep.first.title, 'Basic details');
  });
}
