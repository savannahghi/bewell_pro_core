// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:bewell_pro_core/domain/clinical/entities/page_info.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient.dart';

part 'patient_connection.freezed.dart';
part 'patient_connection.g.dart';

@freezed
class PatientEdge with _$PatientEdge {
  factory PatientEdge({
    @JsonKey(name: 'cursor') String? cursor,
    @JsonKey(name: 'node') Patient? node,
    @JsonKey(name: 'hasOpenEpisodes') bool? hasOpenEpisodes,
  }) = _PatientEdge;

  factory PatientEdge.fromJson(Map<String, dynamic> json) =>
      _$PatientEdgeFromJson(json);
}

@freezed
class PatientConnection with _$PatientConnection {
  factory PatientConnection({
    @JsonKey(name: 'edges') List<PatientEdge?>? edges,
    @JsonKey(name: 'pageInfo') PageInfo? pageInfo,
  }) = _PatientConnection;

  factory PatientConnection.fromJson(Map<String, dynamic> json) =>
      _$PatientConnectionFromJson(json);
}

/// Information about a patient.
///
/// Information used in providing medical service.
@freezed
class PatientInfo with _$PatientInfo {
  factory PatientInfo({
    String? patientId,
    String? patientReference,
    String? patientName,
    String? encounterId,
    String? encounterReference,
  }) = _PatientInfo;

  factory PatientInfo.fromJson(Map<String, dynamic> json) =>
      _$PatientInfoFromJson(json);
}

class PatientHistoryData {
  final String historyOfPresentingIllness;
  final String? familyAndSocialHistory;
  final String? medicalAndSurgicalHistory;

  PatientHistoryData({
    required this.historyOfPresentingIllness,
    required this.familyAndSocialHistory,
    required this.medicalAndSurgicalHistory,
  });

  static PatientHistoryData fromJson(Map<String, dynamic> data) {
    return PatientHistoryData(
      historyOfPresentingIllness: data['presenting'].toString(),
      familyAndSocialHistory: data['family']?.toString(),
      medicalAndSurgicalHistory: data['medical']?.toString(),
    );
  }
}
