// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:bewell_pro_core/domain/clinical/entities/address.dart';
import 'package:bewell_pro_core/domain/clinical/entities/codeable_concept.dart';
import 'package:bewell_pro_core/domain/clinical/entities/contact_point.dart';
import 'package:bewell_pro_core/domain/clinical/entities/human_name.dart';
import 'package:bewell_pro_core/domain/clinical/entities/period.dart';
import 'package:bewell_pro_core/domain/clinical/entities/reference.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/patient_gender_enum.dart';

part 'patient_contact.freezed.dart';
part 'patient_contact.g.dart';

/// Demographics and other administrative information about an individual or
///  animal receiving care or other health-related services.
@freezed
class PatientContact with _$PatientContact {
  factory PatientContact({
    @JsonKey(name: 'ID') String? id,

    /// The nature of the relationship between the patient and the contact person.
    @JsonKey(name: 'Relationship') List<CodeableConcept?>? relationship,

    /// A name associated with the contact person.
    @JsonKey(name: 'Name') HumanName? name,

    /// A contact detail for the person, e.g. a telephone number or an email address.
    @JsonKey(name: 'Telecom') List<ContactPoint?>? telecom,

    /// Address for the contact person.
    @JsonKey(name: 'Address') Address? address,

    /// Administrative Gender - the gender that the contact person is
    ///  considered to have for administration and record keeping purposes.
    @JsonKey(name: 'Gender', unknownEnumValue: PatientGenderEnum.unknown)
        PatientGenderEnum? gender,

    /// Organization on behalf of which the contact is acting or for which
    ///  the contact is working.
    @JsonKey(name: 'Organization') Reference? organization,

    /// The period during which this contact person or organization is valid
    ///  to be contacted relating to this patient.
    @JsonKey(name: 'period') Period? period,
  }) = _PatientContact;
  factory PatientContact.fromJson(Map<String, dynamic> json) =>
      _$PatientContactFromJson(json);
}
