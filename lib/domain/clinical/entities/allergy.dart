import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bewell_pro_core/domain/clinical/entities/allergy_intolerance_category.dart';
import 'package:bewell_pro_core/domain/clinical/entities/allergy_intolerance_criticality.dart';
import 'package:bewell_pro_core/domain/clinical/entities/allergy_intolerance_reaction.dart';
import 'package:bewell_pro_core/domain/clinical/entities/allergy_intolerance_type.dart';
import 'package:bewell_pro_core/domain/clinical/entities/annotation.dart';
import 'package:bewell_pro_core/domain/clinical/entities/codeable_concept.dart';
import 'package:bewell_pro_core/domain/clinical/entities/fhir.dart';
import 'package:bewell_pro_core/domain/clinical/entities/identifier.dart';
import 'package:bewell_pro_core/domain/clinical/entities/range.dart';
import 'package:bewell_pro_core/domain/clinical/entities/reference.dart';
import 'package:bewell_pro_core/domain/clinical/entities/period.dart';
part 'allergy.freezed.dart';
part 'allergy.g.dart';

/// Risk of harmful or undesirable, physiological response which is unique
///  to an individual and associated with exposure to a substance.
@freezed
class AllergyIntolerance with _$AllergyIntolerance {
  factory AllergyIntolerance({
    @JsonKey(name: 'ID') String? id,

    /// Business identifiers assigned to this AllergyIntolerance by
    ///  the performer or other systems which remain constant as the resource
    ///  is updated and propagates from server to server.
    @JsonKey(name: 'Identifier') List<Identifier?>? identifier,

    /// The clinical status of the allergy or intolerance.
    @JsonKey(name: 'ClinicalStatus') CodeableConcept? clinicalStatus,

    /// Assertion about certainty associated with the propensity, or
    ///  potential risk, of a reaction to the identified substance
    ///  (including pharmaceutical product).
    @JsonKey(name: 'VerificationStatus') CodeableConcept? verificationStatus,

    /// Identification of the underlying physiological mechanism for the reaction risk
    @JsonKey(name: 'Type', unknownEnumValue: AllergyIntoleranceTypeEnum.allergy)
        AllergyIntoleranceTypeEnum? type,

    /// Category of the identified substance.
    @JsonKey(name: 'Category', unknownEnumValue: AllergyIntoleranceCategoryEnum.environment)
        List<AllergyIntoleranceCategoryEnum?>? category,

    /// Estimate of the potential clinical harm, or seriousness, of the
    ///  reaction to the identified substance.
    @JsonKey(name: 'Criticality', unknownEnumValue: AllergyIntoleranceCriticalityEnum.unable_to_assess)
        AllergyIntoleranceCriticalityEnum? criticality,

    /// Code for an allergy or intolerance statement
    ///  (either a positive or a negated/excluded statement).
    ///
    /// This may be a code for a substance or pharmaceutical product that is considered to
    ///  be responsible for the adverse reaction risk (e.g., "Latex"), an
    ///  allergy or intolerance condition (e.g., "Latex allergy"), or a
    ///  negated/excluded code for a specific substance or class (e.g., "No
    ///  latex allergy") or a general or categorical negated statement (e.g.,
    ///  "No known allergy", "No known drug allergies"). Note: the substance
    ///  for a specific reaction may be different from the substance identified
    ///  as the cause of the risk, but it must be consistent with it. For
    ///  instance, it may be a more specific substance (e.g. a brand medication)
    ///  or a composite product that includes the identified substance. It must
    ///  be clinically safe to only process the 'code' and ignore the
    ///  'reaction.substance'. If a receiving system is unable to confirm that
    ///  AllergyIntolerance.reaction.substance falls within the semantic scope
    ///  of AllergyIntolerance.code, then the receiving system should ignore
    ///  AllergyIntolerance.reaction.substance
    @JsonKey(name: 'Code') CodeableConcept? code,

    /// The patient who has the allergy or intolerance.
    @JsonKey(name: 'Patient') Reference? patient,

    /// The encounter when the allergy or intolerance was asserted.
    @JsonKey(name: 'Encounter') Reference? encounter,

    /// Estimated or actual date, date-time, or age when allergy or intolerance
    ///  was identified.
    @JsonKey(name: 'OnsetDateTime') String? onsetDateTime,
    @JsonKey(name: 'OnsetAge') Age? onsetAge,
    @JsonKey(name: 'OnsetPeriod') Period? onsetPeriod,
    @JsonKey(name: 'OnsetRange') Range? onsetRange,
    @JsonKey(name: 'OnsetString') String? onsetString,

    /// The recordedDate represents when this particular AllergyIntolerance
    ///  record was created in the system, which is often a system-generated date.
    @JsonKey(name: 'RecordedDate') String? recordedDate,

    /// Individual who recorded the record and takes responsibility for its content.
    @JsonKey(name: 'Recorder') Reference? recorder,

    /// The source of the information about the allergy that is recorded
    @JsonKey(name: 'Asserter') Reference? asserter,

    /// Represents the date and/or time of the last known occurrence of a reaction event.
    @JsonKey(name: 'LastOccurrence') String? lastOccurrence,

    /// Additional narrative about the propensity for the Adverse Reaction, not captured in other fields.
    @JsonKey(name: 'Note') List<Annotation?>? note,

    /// Details about each adverse reaction event linked to exposure to the
    ///  identified substance.
    @JsonKey(name: 'Reaction') List<AllergyIntoleranceReaction?>? reaction,
  }) = _AllergyIntolerance;

  factory AllergyIntolerance.fromJson(Map<String, dynamic> json) =>
      _$AllergyIntoleranceFromJson(json);
}
