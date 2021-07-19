// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episodeofcare_status_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EpisodeofcareStatusHistory _$_$_EpisodeofcareStatusHistoryFromJson(
    Map<String, dynamic> json) {
  return _$_EpisodeofcareStatusHistory(
    id: json['ID'] as String?,
    status: _$enumDecodeNullable(
        _$EpisodeOfCareStatusEnumEnumMap, json['Status'],
        unknownValue: EpisodeOfCareStatusEnum.waitlist),
    period: json['Period'] == null
        ? null
        : Period.fromJson(json['Period'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_EpisodeofcareStatusHistoryToJson(
        _$_EpisodeofcareStatusHistory instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Status': _$EpisodeOfCareStatusEnumEnumMap[instance.status],
      'Period': instance.period?.toJson(),
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

const _$EpisodeOfCareStatusEnumEnumMap = {
  EpisodeOfCareStatusEnum.planned: 'planned',
  EpisodeOfCareStatusEnum.waitlist: 'waitlist',
  EpisodeOfCareStatusEnum.active: 'active',
  EpisodeOfCareStatusEnum.onhold: 'onhold',
  EpisodeOfCareStatusEnum.finished: 'finished',
  EpisodeOfCareStatusEnum.cancelled: 'cancelled',
  EpisodeOfCareStatusEnum.entered_in_error: 'entered_in_error',
};
