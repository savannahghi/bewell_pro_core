import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bewell_pro_core/domain/clinical/entities/address.dart';
import 'package:bewell_pro_core/domain/clinical/entities/attachment.dart';
import 'package:bewell_pro_core/domain/clinical/entities/codeable_concept.dart';
import 'package:bewell_pro_core/domain/clinical/entities/communication.dart';
import 'package:bewell_pro_core/domain/clinical/entities/contact_point.dart';
import 'package:bewell_pro_core/domain/clinical/entities/human_name.dart';
import 'package:bewell_pro_core/domain/clinical/entities/identifier.dart';
import 'package:bewell_pro_core/domain/clinical/entities/narrative.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_contact.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_link.dart';
import 'package:bewell_pro_core/domain/clinical/entities/reference.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/patient_gender_enum.dart';

part 'patient.freezed.dart';
part 'patient.g.dart';

/// FHIRPatient definition:
/// demographics and other administrative information about an individual or
/// animal receiving care or other health-related services.
///
@freezed
class Patient with _$Patient {
  factory Patient({
    @JsonKey(name: 'ID') String? id,
    @JsonKey(name: 'Text') Narrative? text,

    /// An identifier for this patient.
    @JsonKey(name: 'Identifier') List<Identifier?>? identifier,
    @JsonKey(name: 'Active') bool? active,
    @JsonKey(name: 'Name') List<HumanName?>? name,

    /// A contact detail (e.g. a telephone number or an email address)
    /// by which the individual may be contacted.
    @JsonKey(name: 'Telecom') List<ContactPoint?>? telecom,
    @JsonKey(name: 'Gender', unknownEnumValue: PatientGenderEnum.unknown)
        PatientGenderEnum? gender,
    @JsonKey(name: 'BirthDate') String? birthDate,
    @JsonKey(name: 'DeceasedBoolean') bool? deceasedBool,
    @JsonKey(name: 'DeceasedDateTime') String? deceasedDateTime,

    /// Indicates whether the patient is part of a multiple (boolean) or
    ///  indicates the actual birth order (integer).
    @JsonKey(name: 'MultipleBirthBoolean') bool? multipleBirthBoolean,
    @JsonKey(name: 'MultipleBirthInteger') int? multipleBirthInteger,
    @JsonKey(name: 'Address') Address? address,

    /// This field contains a patient's most recent marital (civil) status.
    @JsonKey(name: 'MaritalStatus') CodeableConcept? maritalStatus,

    /// Image of the patient.
    @JsonKey(name: 'Photo') List<Attachment>? photo,

    /// A contact party (e.g. guardian, partner, friend) for the patient.
    @JsonKey(name: 'Contact') PatientContact? contact,

    /// A language which may be used to communicate with the patient about his
    ///  or her health.
    @JsonKey(name: 'Communication') List<Communication?>? communication,

    /// Patient's nominated care provider.
    @JsonKey(name: 'GeneralPractitioner') List<Reference?>? generalPractitioner,

    /// Organization that is the custodian of the patient record.
    @JsonKey(name: 'ManagingOrganization') Reference? managingOrganization,

    /// Link to another patient resource that concerns the same actual patient.
    @JsonKey(name: 'Link') List<PatientLink?>? link,
  }) = _Patient;

  factory Patient.fromJson(Map<String, dynamic> json) =>
      _$PatientFromJson(json);
}
