// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:bewell_pro_core/domain/clinical/entities/annotation.dart';
import 'package:bewell_pro_core/domain/clinical/entities/codeable_concept.dart';
import 'package:bewell_pro_core/domain/clinical/entities/fhir.dart';
import 'package:bewell_pro_core/domain/clinical/entities/identifier.dart';
import 'package:bewell_pro_core/domain/clinical/entities/period.dart';
import 'package:bewell_pro_core/domain/clinical/entities/reference.dart';

part 'condition.freezed.dart';
part 'condition.g.dart';

/// A clinical condition, problem, diagnosis, or other event, situation, issue,
///  or clinical concept that has risen to a level of concern.
@freezed
class Condition with _$Condition {
  factory Condition({
    @JsonKey(name: 'ID') String? id,
    @JsonKey(name: 'Identifier') List<Identifier?>? identifier,
    @JsonKey(name: 'ClinicalStatus') CodeableConcept? clinicalStatus,
    @JsonKey(name: 'VerificationStatus') CodeableConcept? verificationStatus,
    @JsonKey(name: 'Category') List<CodeableConcept?>? category,
    @JsonKey(name: 'Severity') CodeableConcept? severity,
    @JsonKey(name: 'Code') CodeableConcept? code,
    @JsonKey(name: 'BodySite') List<CodeableConcept?>? bodySite,
    @JsonKey(name: 'Subject') Reference? subject,
    @JsonKey(name: 'Encounter') Reference? encounter,
    @JsonKey(name: 'OnsetDateTime') String? onsetDateTime,
    @JsonKey(name: 'OnsetAge') Age? onsetAge,
    @JsonKey(name: 'OnsetPeriod') Period? onsetPeriod,
    @JsonKey(name: 'OnsetRange') Quantity? onsetRange,
    @JsonKey(name: 'OnsetString') String? onsetString,
    @JsonKey(name: 'AbatementDateTime') String? abatementDateTime,
    @JsonKey(name: 'AbatementAge') Age? abatementAge,
    @JsonKey(name: 'AbatementPeriod') Period? abatementPeriod,
    @JsonKey(name: 'AbatementRange') Quantity? abatementRange,
    @JsonKey(name: 'AbatementString') String? abatementString,
    @JsonKey(name: 'RecordedDate') String? recordedDate,
    @JsonKey(name: 'Recorder') Reference? recorder,
    @JsonKey(name: 'Asserter') Reference? asserter,
    @JsonKey(name: 'Stage') Stage? stage,
    @JsonKey(name: 'Evidence') List<Evidence?>? evidence,
    @JsonKey(name: 'Note') List<Annotation?>? note,
  }) = _Condition;
  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);
}
