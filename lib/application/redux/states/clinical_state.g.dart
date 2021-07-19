// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinical_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ClinicalState _$_$_ClinicalStateFromJson(Map<String, dynamic> json) {
  return _$_ClinicalState(
    currentEpisodeOfCare: json['currentEpisodeOfCare'] == null
        ? null
        : EpisodeOfCare.fromJson(
            json['currentEpisodeOfCare'] as Map<String, dynamic>),
    patientPayload: json['patientPayload'] == null
        ? null
        : PatientPayload.fromJson(
            json['patientPayload'] as Map<String, dynamic>),
    patientSearchResult: (json['patientSearchResult'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : PatientEdge.fromJson(e as Map<String, dynamic>))
        .toList(),
    patientSearchFound: json['patientSearchFound'] as bool?,
    patientSearchNumber: json['patientSearchNumber'] as String?,
    startVisitType:
        _$enumDecodeNullable(_$StartVisitTypeEnumMap, json['startVisitType']),
  );
}

Map<String, dynamic> _$_$_ClinicalStateToJson(_$_ClinicalState instance) =>
    <String, dynamic>{
      'currentEpisodeOfCare': instance.currentEpisodeOfCare?.toJson(),
      'patientPayload': instance.patientPayload?.toJson(),
      'patientSearchResult':
          instance.patientSearchResult?.map((e) => e?.toJson()).toList(),
      'patientSearchFound': instance.patientSearchFound,
      'patientSearchNumber': instance.patientSearchNumber,
      'startVisitType': _$StartVisitTypeEnumMap[instance.startVisitType],
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$StartVisitTypeEnumMap = {
  StartVisitType.requestAccess: 'requestAccess',
  StartVisitType.emergencyOverride: 'emergencyOverride',
};
