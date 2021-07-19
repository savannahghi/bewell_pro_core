import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/patient_registration_helper.dart';

void main() {
  test('patient registration helper', () {
    const PatientRegistrationStep patientRegistrationStep =
        PatientRegistrationStep(
      stepNumber: 0,
      title: basicDetailsStepTitle,
    );

    expect(patientRegistrationStep.stepNumber, 0);
    expect(patientRegistrationStep.title, basicDetailsStepTitle);
  });
}
