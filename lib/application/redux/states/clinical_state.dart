import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bewell_pro_core/domain/clinical/entities/current_episode.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_connection.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_payload.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/start_visit_type_enum.dart';

part 'clinical_state.freezed.dart';
part 'clinical_state.g.dart';

/// holds the state of the clinical screens
@freezed
class ClinicalState with _$ClinicalState {
  factory ClinicalState({
    /// the current visit. The episode of care the doctor is currently attending to
    @JsonKey(name: 'currentEpisodeOfCare') EpisodeOfCare? currentEpisodeOfCare,

    /// the patient the doctor is currently attending to
    @JsonKey(name: 'patientPayload') PatientPayload? patientPayload,

    /// searched patient by phone number
    @JsonKey(name: 'patientSearchResult')
        List<PatientEdge?>? patientSearchResult,
    @JsonKey(name: 'patientSearchFound') bool? patientSearchFound,
    @JsonKey(name: 'patientSearchNumber') String? patientSearchNumber,
    @JsonKey(name: 'startVisitType') StartVisitType? startVisitType,
  }) = _ClinicalState;

  factory ClinicalState.fromJson(Map<String, dynamic> json) =>
      _$ClinicalStateFromJson(json);

  factory ClinicalState.initial() => ClinicalState(
        currentEpisodeOfCare: EpisodeOfCare(),
        patientPayload: PatientPayload(),
        patientSearchResult: <PatientEdge>[],
        patientSearchFound: false,
      );
}
