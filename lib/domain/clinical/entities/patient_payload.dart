// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:bewell_pro_core/domain/clinical/entities/current_episode.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient.dart';

part 'patient_payload.freezed.dart';
part 'patient_payload.g.dart';

@freezed
class PatientPayload with _$PatientPayload {
  factory PatientPayload({
    @JsonKey(name: 'patientRecord') Patient? patientRecord,
    @JsonKey(name: 'hasOpenEpisodes') bool? hasOpenEpisodes,
    @JsonKey(name: 'openEpisodes') List<EpisodeOfCare?>? openEpisodes,
  }) = _PatientPayload;

  factory PatientPayload.fromJson(Map<String, dynamic> json) =>
      _$PatientPayloadFromJson(json);
}
