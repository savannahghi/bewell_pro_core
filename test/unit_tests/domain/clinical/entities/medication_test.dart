// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:bewell_pro_core/domain/clinical/entities/annotation.dart';
import 'package:bewell_pro_core/domain/clinical/entities/codeable_concept.dart';
import 'package:bewell_pro_core/domain/clinical/entities/coding.dart';
import 'package:bewell_pro_core/domain/clinical/entities/dosage.dart';
import 'package:bewell_pro_core/domain/clinical/entities/medication.dart';
import 'package:bewell_pro_core/domain/clinical/entities/reference.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';

void main() {
  test('Medication object returns correct data after a new object is created',
      () {
    final Medication _medicationObject = Medication(
      status: MedicationStatusEnum.active, // Suspect: converting to string
      intent: MedicationIntent.proposal,
      priority: Priority.routine,
      subject: Reference(
        display: 'Orina, Abiud',
        type: 'Patient',
        reference: 'Patient/e8dc1f10-aece-4340-b1c3-aa778e0eff01',
      ),
      encounter: Reference(
          reference: 'Test reference', type: 'Encounter', display: 'Encounter'),
      supportingInformation: <Reference>[
        Reference(
          id: '8759ff29-1fc5-4eac-8418-8152b0391594',
          reference: 'Encounter/5cc13be5-3da3-456d-b522-7c1b65115364',
          display: 'Millers\' Cough',
        ),
      ],
      requester: Reference(display: 'Abiud Orina'),
      note: <Annotation>[
        Annotation(
          authorString: 'Abiud Orina',
          text: 'Test notes',
        )
      ],
      medicationCodeableConcept: CodeableConcept(
        text: 'Amoxicillin',
        coding: <Coding>[
          Coding(
            system: 'OCL:/orgs/CIEL/sources/CIEL/',
            code: '71160',
            display: 'Amoxicillin',
            userSelected: true,
          ),
        ],
      ),
      dosageInstruction: <Dosage>[
        Dosage(
          text: 'Take 2 Capsules every 2 Hours for 3 Hours.',
          patientInstruction: 'Take before meals',
        )
      ],
      authoredOn: '2021-05-20',
    );

    final Map<String, dynamic> medicationToJson = _medicationObject.toJson();
    expect(medicationToJson.containsKey('AuthoredOn'), true);
    expect(_medicationObject.dosageInstruction, isA<List<Dosage>>());
  });
}
