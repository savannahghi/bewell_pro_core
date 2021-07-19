import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/domain/clinical/entities/codeable_concept.dart';
import 'package:bewell_pro_core/domain/clinical/entities/medication_request_substitution.dart';

void main() {
  test('MedicationRequestSubstitution should create a valid object', () {
    final MedicationRequestSubstitution _medicationRequestSubstitution =
        MedicationRequestSubstitution(
      id: 'Some id',
      allowedBoolean: true,
      allowedCodeableConcept: CodeableConcept(text: 'some text'),
      reason: CodeableConcept(text: 'Some reason'),
    );

    final Map<String, dynamic> _medicationSubstitutionObject =
        _medicationRequestSubstitution.toJson();

    expect(_medicationSubstitutionObject.containsKey('ID'), true);
    expect(_medicationSubstitutionObject.containsKey('AllowedBoolean'), true);
    expect(_medicationSubstitutionObject.containsKey('AllowedCodeableConcept'),
        true);
    expect(_medicationSubstitutionObject.containsKey('Reason'), true);

    final Map<String, dynamic> medicationRequestSubstitionData =
        <String, dynamic>{
      'ID': 'some id',
      'AllowedBoolean': true,
      'AllowedCodeableConcept': <String, dynamic>{'Text': 'Some text'},
      'Reason': <String, dynamic>{'Text': 'Some Reason'}
    };

    final MedicationRequestSubstitution
        _serializedMedicationRequestSubstitution =
        MedicationRequestSubstitution.fromJson(medicationRequestSubstitionData);

    expect(_serializedMedicationRequestSubstitution.id, 'some id');
    expect(_serializedMedicationRequestSubstitution.allowedBoolean, true);
  });
}
