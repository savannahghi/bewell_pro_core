// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinical_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ClinicalState _$$_ClinicalStateFromJson(Map<String, dynamic> json) =>
    _$_ClinicalState(
      currentEpisodeOfCare: json['currentEpisodeOfCare'] == null
          ? null
          : EpisodeOfCare.fromJson(
              json['currentEpisodeOfCare'] as Map<String, dynamic>),
      patientPayload: json['patientPayload'] == null
          ? null
          : PatientPayload.fromJson(
              json['patientPayload'] as Map<String, dynamic>),
      patientSearchResult: (json['patientSearchResult'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : PatientEdge.fromJson(e as Map<String, dynamic>))
          .toList(),
      patientSearchFound: json['patientSearchFound'] as bool?,
      patientSearchNumber: json['patientSearchNumber'] as String?,
      startVisitType:
          $enumDecodeNullable(_$StartVisitTypeEnumMap, json['startVisitType']),
    );

Map<String, dynamic> _$$_ClinicalStateToJson(_$_ClinicalState instance) =>
    <String, dynamic>{
      'currentEpisodeOfCare': instance.currentEpisodeOfCare?.toJson(),
      'patientPayload': instance.patientPayload?.toJson(),
      'patientSearchResult':
          instance.patientSearchResult?.map((e) => e?.toJson()).toList(),
      'patientSearchFound': instance.patientSearchFound,
      'patientSearchNumber': instance.patientSearchNumber,
      'startVisitType': _$StartVisitTypeEnumMap[instance.startVisitType],
    };

const _$StartVisitTypeEnumMap = {
  StartVisitType.requestAccess: 'requestAccess',
  StartVisitType.emergencyOverride: 'emergencyOverride',
};
