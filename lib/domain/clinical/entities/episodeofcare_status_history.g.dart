// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episodeofcare_status_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EpisodeofcareStatusHistory _$$_EpisodeofcareStatusHistoryFromJson(
        Map<String, dynamic> json) =>
    _$_EpisodeofcareStatusHistory(
      id: json['ID'] as String?,
      status: $enumDecodeNullable(
          _$EpisodeOfCareStatusEnumEnumMap, json['Status'],
          unknownValue: EpisodeOfCareStatusEnum.waitlist),
      period: json['Period'] == null
          ? null
          : Period.fromJson(json['Period'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_EpisodeofcareStatusHistoryToJson(
        _$_EpisodeofcareStatusHistory instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Status': _$EpisodeOfCareStatusEnumEnumMap[instance.status],
      'Period': instance.period?.toJson(),
    };

const _$EpisodeOfCareStatusEnumEnumMap = {
  EpisodeOfCareStatusEnum.planned: 'planned',
  EpisodeOfCareStatusEnum.waitlist: 'waitlist',
  EpisodeOfCareStatusEnum.active: 'active',
  EpisodeOfCareStatusEnum.onhold: 'onhold',
  EpisodeOfCareStatusEnum.finished: 'finished',
  EpisodeOfCareStatusEnum.cancelled: 'cancelled',
  EpisodeOfCareStatusEnum.entered_in_error: 'entered_in_error',
};
