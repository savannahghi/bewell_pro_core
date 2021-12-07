// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:bewell_pro_core/domain/clinical/entities/codeable_concept.dart';
import 'package:bewell_pro_core/domain/clinical/entities/coding.dart';
import 'package:bewell_pro_core/domain/clinical/entities/human_name.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_contact.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/patient_gender_enum.dart';

void main() {
  test('PatientContact should create a PatientContact object', () {
    final PatientContact _patientContact = PatientContact(
      id: 'Some-id',
      relationship: <CodeableConcept>[
        CodeableConcept(
          text: 'Parent',
          coding: <Coding>[
            Coding(
              system: 'some system',
              display: 'some display',
            )
          ],
        )
      ],
      gender: PatientGenderEnum.male,
      name: HumanName(text: 'Bewell'),
    );

    final Map<String, dynamic> patientContactObject = _patientContact.toJson();

    expect(patientContactObject.containsKey('Relationship'), true);
    expect(patientContactObject.containsKey('Gender'), true);

    expect(patientContactObject['Gender'], 'male');

    final Map<String, dynamic> patientContactData = <String, dynamic>{
      'Relationship': <Map<String, dynamic>>[
        <String, dynamic>{
          'Text': 'Parent',
        }
      ],
      'Gender': 'male',
      'Name': <String, dynamic>{'Text': 'Be.Well'}
    };

    final PatientContact _serializedContact =
        PatientContact.fromJson(patientContactData);

    expect(_serializedContact.gender, PatientGenderEnum.male);
    expect(_serializedContact.name!.text, 'Be.Well');
  });
}
