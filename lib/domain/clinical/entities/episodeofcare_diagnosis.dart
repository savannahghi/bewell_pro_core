// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:bewell_pro_core/domain/clinical/entities/codeable_concept.dart';
import 'package:bewell_pro_core/domain/clinical/entities/reference.dart';

part 'episodeofcare_diagnosis.freezed.dart';
part 'episodeofcare_diagnosis.g.dart';

/// Diagnosis during episode of care
@freezed
class EpisodeofcareDiagnosis with _$EpisodeofcareDiagnosis {
  factory EpisodeofcareDiagnosis({
    @Default('') @JsonKey(name: 'ID') String? id,

    /// Conditions/problems/diagnoses that this episode of care is intended to be providing care for.
    @JsonKey(name: 'Condition') Reference? condition,

    /// Role that this diagnosis has within the episode of care (e.g. admission, billing, discharge …).
    @JsonKey(name: 'Role') CodeableConcept? role,

    /// Ranking of the diagnosis (for each role type).
    @JsonKey(name: 'Rank') int? rank,
  }) = _EpisodeofcareDiagnosis;

  factory EpisodeofcareDiagnosis.fromJson(Map<String, dynamic> json) =>
      _$EpisodeofcareDiagnosisFromJson(json);
}
