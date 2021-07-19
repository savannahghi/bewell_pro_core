// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episodeofcare_diagnosis.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EpisodeofcareDiagnosis _$_$_EpisodeofcareDiagnosisFromJson(
    Map<String, dynamic> json) {
  return _$_EpisodeofcareDiagnosis(
    id: json['ID'] as String?,
    condition: json['Condition'] == null
        ? null
        : Reference.fromJson(json['Condition'] as Map<String, dynamic>),
    role: json['Role'] == null
        ? null
        : CodeableConcept.fromJson(json['Role'] as Map<String, dynamic>),
    rank: json['Rank'] as int?,
  );
}

Map<String, dynamic> _$_$_EpisodeofcareDiagnosisToJson(
        _$_EpisodeofcareDiagnosis instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Condition': instance.condition?.toJson(),
      'Role': instance.role?.toJson(),
      'Rank': instance.rank,
    };
