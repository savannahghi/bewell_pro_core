// Project imports:
import 'package:bewell_pro_core/domain/clinical/entities/address.dart';
import 'package:bewell_pro_core/domain/clinical/entities/attachment.dart';
import 'package:bewell_pro_core/domain/clinical/entities/codeable_concept.dart';
import 'package:bewell_pro_core/domain/clinical/entities/coding.dart';
import 'package:bewell_pro_core/domain/clinical/entities/communication.dart';
import 'package:bewell_pro_core/domain/clinical/entities/contact_point.dart';
import 'package:bewell_pro_core/domain/clinical/entities/human_name.dart';
import 'package:bewell_pro_core/domain/clinical/entities/identifier.dart';
import 'package:bewell_pro_core/domain/clinical/entities/narrative.dart';
import 'package:bewell_pro_core/domain/clinical/entities/narrative_status.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_connection.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_contact.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_link.dart';
import 'package:bewell_pro_core/domain/clinical/entities/period.dart';
import 'package:bewell_pro_core/domain/clinical/entities/reference.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/address_type_enum.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/address_use_enum.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/contact_point_system_enum.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/contact_point_use_enum.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/human_name_use_enum.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/identifier_use_enum.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/patientLink_type_enum.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/patient_gender_enum.dart';

/// mock API data of [PatientConnection]
class PatientConnectionMockedData {
  /// describing the relationship a patientContact person has with the patient
  ///  can be their wife/husband, parent or an organization
  static final List<CodeableConcept> patientContactRelationship =
      <CodeableConcept>[
    CodeableConcept(
      id: 'id_of_the_relationship_record_in_the_system',
      text: 'wife',
      coding: <Coding>[
        Coding(
          id: '',
          system: '',
          version: '',
          code: '',
          display: '',
          userSelected: false,
        ),
      ],
    ),
  ];

  /// the address of the patientContact, can be the place they live
  static final Address patientContactAddress = Address(
    id: 'system_id_of_the_contactPoint_address_record',
    use: AddressUseEnum.home,
    type: AddressTypeEnum.both,
    text: 'Riverside, Kahawa Sukari',
    line: <String>[
      'House No: 114',
      'Street: Riverside',
      'P.O. Box: 00100-4187',
    ],
    city: 'Nairobi',
    district: 'Githurai Constituency',
    state: 'Nairobi County',
    postalCode: '00100-4187',
    country: 'Kenya',
    period: Period(
      id: 'id_of_the_period_in_the_system_records',
      start: '2015-11-01', // note: the format is year-month-day
      end: '', // still using the physical address
    ),
  );

  /// way to contact the patientContact, can be their phone number, email etc
  static final List<ContactPoint> patientContactTelecom = <ContactPoint>[
    ContactPoint(
      id: 'system_id_of_the_contactPoint_record',
      system: ContactPointSystemEnum.email,
      value: 'miriam_omar@treehouse.com',
      use: ContactPointUseEnum.home,
      rank: 0,
      period: Period(
        id: 'system_id_of_the_contact_point_period_record',
        start: '1999-12-20',
        end: '', // still in use
      ),
    ),
  ];

  /// Organization on behalf of which the contact is acting or for which the
  ///  contact is working.
  static final Reference patientContactOrganization = Reference(
    id: 'system_record_id_of_the_contact_point_organization',
    reference: 'PatientContact/some_id_of_the_record',
    type: '',
    display: 'Humans for Quick Recovery Organization, HQRO',
    identifier: Identifier(
      id: 'system_record_id_the_organization',
      use: IdentifierUseEnum.official,
      type: CodeableConcept(
        id: '',
        text: 'HQRO',
        coding: <Coding>[
          Coding(
            id: '',
            system: '',
            version: '',
            code: '',
            display: 'HQRO, Humans for Quick Recovery Organization',
            userSelected: false,
          ),
        ],
      ),
    ),
  );

  /// the name of the patientContact, can be a persons name or an
  ///  organizations name, depending on their relationship
  static final HumanName patientContactName = HumanName(
    id: 'id_of_the_patientContact_name_in_the_system',
    use: HumanNameUseEnum.official,
    text: 'Miriam Mwatela Omar',
    family: 'Kariuki',
    given: <String>['Miriam'],
    prefix: <String>['Mrs'],
    suffix: <String>[],
    period: Period(
      id: 'id_of_the_period_in_the_system',
      start: '1970-08-13',
      end: '',
    ),
  );

  /// person to be contacted when need arise for the patient,
  ///  can be their relative, wife or an organization that is in charge of
  ///  the patient e,g the police are in charge of the prisoners brought to
  ///  the hospital
  static final PatientContact patientContact = PatientContact(
    id: 'id_of_the_contact_point_in_the_system',
    relationship: patientContactRelationship,
    name: patientContactName,
    telecom: patientContactTelecom,
    address: patientContactAddress,
    gender: PatientGenderEnum.female,
    organization: patientContactOrganization,
    period: Period(
        id: 'system_id_of_the_period',
        start: '2005-10-1', // year-month-day
        end: '' // still in use, you can still contact the patientContact
        ),
  );

  /// image of a patient
  static final Attachment patientPhoto = Attachment(
    id: 'id_of_this_record_in_the_system',
    contentType: 'mime',
    language:
        'en', // TODO: refer to https://en.wikipedia.org/wiki/IETF_language_tag and use the right tags
    data: '', // TODO: add real data to an image
    url: '', // TODO: add a real url
    size: 0, // TODO: add size as per the image used
    hash: '',
    title: 'Image of patient Omar',
    creation: '2010-2-20',
  );

  /// record of a patients marital status
  static final CodeableConcept maritalStatus = CodeableConcept(
      id: 'id_of_this_marital_records_in_the_system',
      text: 'married',
      coding: <Coding>[
        Coding(
            id: '',
            system: 'uri',
            version: '',
            code: '',
            display: '',
            userSelected: false),
      ]);

  /// a physical address of a patient
  static final Address patientAddress = Address(
    id: 'id_of_the_address_in_the_system_records',
    use: AddressUseEnum.home,
    text: '00100-30197',
    line: <String>['100D Kijabe Street', 'Opposite Marlaw'],
    city: 'Ngara, Nairobi',
    district: 'Starehe Constituency',
    state: 'Nairobi County',
    postalCode: '30197',
    country: 'Kenya',
    period: Period(
      id: 'since_post_election_violence',
      start: '2007-08-26',
      end: '',
    ),
  );

  /// phone number contact that can be used to contact patient
  static final ContactPoint patientPhoneNumber = ContactPoint(
    id: 'the_id_of_the_contact_point',
    system: ContactPointSystemEnum.phone,
    value: '+2547123456789',
    use: ContactPointUseEnum.mobile,
    rank: 0,
    period: Period(
      id: 'since_internet_bubble',
      start: '1999-1-16',
      end: '',
    ),
  );

  /// period since when patient was born until his death
  static final Period patientPeriodSinceBirth = Period(
    id: 'the_millenials_hippies_time',
    start: '1950-06-27',
    end: '', // still alive
  );

  /// name of a patient
  static final HumanName patientName = HumanName(
    id: 'ID_NAME',
    use: HumanNameUseEnum.usual,
    text: 'Niko Jimmy Omar',
    family: 'Omar',
    given: <String>['Niko', 'Jimmy', 'Kababa'],
    prefix: <String>['Prof', 'Chief'],
    suffix: <String>[],
    period: patientPeriodSinceBirth,
  );

  /// patient record identifier
  static final Identifier patientIdentifier = Identifier(
    id: 'system_id_of_the_record',
    use: IdentifierUseEnum.official,
    type: CodeableConcept(),
    system: 'system',
    value: '',
    period: patientPeriodSinceBirth,
    assigner: nameAssigner,
  );

  /// the patient's preferred language of communication
  static final Communication patientCommunication = Communication(
    id: 'system_id_of_the_communication_record',
    language: CodeableConcept(
      id: 'concept_id',
      text: 'en-EN',
      coding: <Coding>[
        Coding(
          id: 'code_id',
          system: 'system',
          version: 'version',
          code: 'code',
          display: 'en-EN',
          userSelected: false,
        ),
      ],
    ),
    preferred: true,
  );

  // organizationn in charge of assigning names
  static final Reference nameAssigner = Reference(
    id: 'system_id_of_the_record',
    reference: 'Identifier/some_uuid_of_the_identifier',
    type: 'unque_uri',
    display: 'Kenya Names and Record Management Organization',
  );

  /// the medical practitioner that is taking care of a patient.
  static final Reference patientGeneralPractitioner = Reference(
    id: 'record_id_of_the_practitioner',
    reference: 'Patient/some_uuid_number_of_the_practioner_record',
    type: 'url',
    display: 'Dr, Rose Waema',
    identifier: Identifier(
      id: 'record_id_of_the_identifier',
      use: IdentifierUseEnum.official,
      type: CodeableConcept(
        id: 'record_id',
        coding: <Coding>[
          Coding(
            id: 'record_id_of_the_code',
            system: 'uri',
            version: 'version_of_naming',
            code: 'code',
            display: 'Dr, Rose Waema',
            userSelected: false,
          ),
        ],
      ),
      system: 'system',
      value: 'Dr, Rose Waema',
      period: Period(
        id: 'system_record_id_of_the_period',
        start: '1980-02-04', // year-month-day
        end: '', // still in use
      ),
      assigner: nameAssigner,
    ),
  );

  /// a record in the patient's record referring to an organization that is in charge of him/her
  static final Identifier patientManagingOrganizationIdentifier = Identifier(
    id: 'system_uuid_of_the_organization_record',
    use: IdentifierUseEnum.official,
    type: CodeableConcept(
      id: 'id',
      text: 'Humans for Quick Recovery Organization',
      coding: <Coding>[
        Coding(
          id: '',
          system: '',
          version: '',
          code: '',
          display: 'Humans for Quick Recovery Organization',
          userSelected: false,
        ),
      ],
    ),
    system: 'uri',
    value: 'Humans for Quick Recovery Organization',
    period: Period(
      id: 'system_id_of_the_period',
      start: '1990-07-14',
      end: '', // still in use
    ),
    assigner: nameAssigner,
  );

  /// An organization that is in charge of a patient e.g
  ///  An Orphanage home can bring kids for medication in hospital.
  static final Reference patientManagingOrganization = Reference(
    id: 'system_uuid_of_the_organization_record',
    reference: 'Patient/system_uuid_of_the_organization_record',
    type: 'uri',
    display: 'Humans for Quick Recovery Organization',
    identifier: patientManagingOrganizationIdentifier,
  );

  /// link to other records of the patient,
  ///  the records can related to the current one
  static final PatientLink patientLink = PatientLink(
    id: 'system_id_of_the_record',
    other: Reference(
      id: 'id_of_the_other_patient_record',
      reference: 'PatientLink/system_id_of_the_record',
      type: 'uri',
      display: 'patient\'s other record',
    ),
    type: PatientLinkTypeEnum.seealso,
  );

  /// patient narrative
  static final Narrative patientNarrative = Narrative(
    id: 'system_id_of_the_narrative_record',
    status: NarrativeStatusEnum.generated,
    div: '',
  );

  /// patient data mock
  static final Patient patient = Patient(
    id: '753a7d8a-d296-40a7-ba30-2789ab56cbb0',
    text: patientNarrative,
    identifier: <Identifier>[patientIdentifier],
    active: true,
    name: <HumanName>[patientName],
    telecom: <ContactPoint>[patientPhoneNumber],
    gender: PatientGenderEnum.male,
    birthDate: '1950-06-27',
    deceasedBool: false,
    deceasedDateTime: '',
    address: patientAddress,
    maritalStatus: maritalStatus,
    multipleBirthBoolean: false,
    multipleBirthInteger: 0,
    photo: <Attachment>[patientPhoto],
    contact: patientContact,
    communication: <Communication>[patientCommunication],
    generalPractitioner: <Reference>[patientGeneralPractitioner],
    managingOrganization: patientManagingOrganization,
    link: <PatientLink>[patientLink],
  );

  /// patient edge mock
  static final PatientEdge patientEdge = PatientEdge(
    cursor: '',
    hasOpenEpisodes: true,
    node: patient,
  );

  /// patient connection mock data
  static final PatientConnection patientConnection =
      PatientConnection(edges: <PatientEdge>[patientEdge]);
}
