import 'package:bewell_pro_core/domain/clinical/entities/allergy.dart';
import 'package:bewell_pro_core/domain/clinical/entities/allergy_intolerance_category.dart';
import 'package:bewell_pro_core/domain/clinical/entities/allergy_intolerance_criticality.dart';
import 'package:bewell_pro_core/domain/clinical/entities/allergy_intolerance_reaction.dart';
import 'package:bewell_pro_core/domain/clinical/entities/allergy_intolerance_relay_connection.dart';
import 'package:bewell_pro_core/domain/clinical/entities/allergy_intolerance_relay_edge.dart';
import 'package:bewell_pro_core/domain/clinical/entities/allergy_intolerance_type.dart';
import 'package:bewell_pro_core/domain/clinical/entities/annotation.dart';
import 'package:bewell_pro_core/domain/clinical/entities/codeable_concept.dart';
import 'package:bewell_pro_core/domain/clinical/entities/coding.dart';
import 'package:bewell_pro_core/domain/clinical/entities/identifier.dart';
import 'package:bewell_pro_core/domain/clinical/entities/narrative.dart';
import 'package:bewell_pro_core/domain/clinical/entities/narrative_status.dart';
import 'package:bewell_pro_core/domain/clinical/entities/period.dart';
import 'package:bewell_pro_core/domain/clinical/entities/reference.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/allergy_intolerance_reaction_severity_enum.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/identifier_use_enum.dart';

/// Mock network API data for [AllergyIntoleranceRelayConnection]
class AllergyIntoleranceMockData {
  /// Patient data
  static final Reference patient = Reference(
    id: 'system_record_patient_id',
    reference: 'Patient/e8dc1f10-aece-4340-b1c3-aa778e0eff01',
    type: 'Patient',
    display: 'Orina, Abiud',
  );

  /// Clinical status
  static final CodeableConcept clinicalStatus = CodeableConcept(
    text: 'Active',
    coding: <Coding>[
      Coding(
        code: 'Active',
        display: 'Active',
        userSelected: true,
        system:
            'http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical',
      ),
    ],
  );

  /// Doctors assessment of potential risk of reaction to the identified substance.
  static final CodeableConcept verificationStatus = CodeableConcept(
    id: 'system_record_id_of_the_verification_status_record',
    text: 'Confirmed',
    coding: <Coding>[
      // refer to https://terminology.hl7.org/2.1.0/ValueSet-allergyintolerance-verification.html
      // for a list of all possible codes that can describe a verification status
      Coding(
        code: 'confirmed',
        display: 'Confirmed',
        userSelected: true,
        system:
            'http://terminology.hl7.org/CodeSystem/allergyintolerance-verification',
        version: '0.5.0',
      ),
    ],
  );

  /// allergy intolerance code
  /// refer to https://terminology.hl7.org/2.1.0/CodeSystem-allergyintolerance-clinical.html
  static final CodeableConcept allergyIntoleranceCode = CodeableConcept(
    text: 'Allergenic extract, mouse',
    coding: <Coding>[
      Coding(
        code: '70744',
        system: 'OCL:/orgs/CIEL/sources/CIEL/',
        display: 'Allergenic extract, mouse',
      ),
    ],
  );

  /// Encounter
  static final Reference encounter = Reference(
    id: 'fe9d2aa7-5b64-4c75-a145-d4a855a9a523',
    reference: 'Encounter/fe9d2aa7-5b64-4c75-a145-d4a855a9a523',
    type: 'URL',
    display: 'Encounter',
  );

  /// Asserter
  static final Reference asserter = Reference(
    display: 'Calvine Otieno',
  );

  /// Doctor's notes
  static final Annotation note = Annotation(
    authorString: 'Calvine Otieno',
    text: 'just for test',
  );

  static final AllergyIntoleranceReaction allergyintoleranceReaction =
      AllergyIntoleranceReaction(
    description: 'just for test',
    severity: AllergyIntoleranceReactionSeverityEnum.severe,
    substance:
        CodeableConcept(text: 'Allergenic extract, mouse', coding: <Coding>[
      Coding(
        system: 'OCL:/orgs/CIEL/sources/CIEL/',
        code: '70774',
        display: 'Allergenic extract, mouse',
        userSelected: true,
      ),
    ]),
  );

  static final Reference recorder = Reference(
    display: 'Calvine Otieno',
  );

  /// Text summary of an allergy intolerance condition
  static final Narrative narrative = Narrative(
    id: 'system_id_of_narrative_record',
    status: NarrativeStatusEnum.generated,
    div: 'HTML Content explaining the allergyIntolerance',
  );

  /// Allergy Intolerance Identifier
  static final Identifier allergyIntoleranceIdentify = Identifier(
    id: 'system_record_id_of_the_identifier',
    use: IdentifierUseEnum.official,
    type: CodeableConcept(
      id: 'id_of_the_concept',
      text: 'Dust Allergy',
      coding: <Coding>[
        Coding(
          id: 'id_of_code',
          system: 'uri',
          version: 'version',
          code: 'code',
          display: 'Dust Allergy',
          userSelected: false,
        ),
      ],
    ),
    system: 'allergyIntolerance_system_records',
    value: 'Dust_Allergy',
    period: Period(
      id: 'time_period',
      start: '1971-12-12',
      end: '',
    ),
  );

  static final AllergyIntolerance allergyIntolerance = AllergyIntolerance(
    id: 'f7e7bb9a-6285-46dc-adf8-4b538a7df669',
    identifier: <Identifier>[allergyIntoleranceIdentify],
    type: AllergyIntoleranceTypeEnum.allergy,
    recordedDate: '2021-04-16',
    category: <AllergyIntoleranceCategoryEnum>[
      AllergyIntoleranceCategoryEnum.medication
    ],
    criticality: AllergyIntoleranceCriticalityEnum.high,
    clinicalStatus: clinicalStatus,
    verificationStatus: verificationStatus,
    patient: patient,
    code: allergyIntoleranceCode,
    encounter: encounter,
    asserter: asserter,
    note: <Annotation>[
      note,
    ],
    reaction: <AllergyIntoleranceReaction>[
      allergyintoleranceReaction,
    ],
    recorder: recorder,
  );

  static final AllergyIntoleranceRelayConnection
      allergyIntoleranceRelayConnectionMock =
      AllergyIntoleranceRelayConnection(edges: <AllergyIntoleranceRelayEdge>[
    AllergyIntoleranceRelayEdge(
      node: allergyIntolerance,
    )
  ]);
}
