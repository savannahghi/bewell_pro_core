// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_point.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ContactPoint _$$_ContactPointFromJson(Map<String, dynamic> json) =>
    _$_ContactPoint(
      id: json['ID'] as String?,
      system: $enumDecodeNullable(
          _$ContactPointSystemEnumEnumMap, json['System'],
          unknownValue: ContactPointSystemEnum.phone),
      value: json['Value'] as String?,
      use: $enumDecodeNullable(_$ContactPointUseEnumEnumMap, json['Use'],
          unknownValue: ContactPointUseEnum.mobile),
      rank: json['Rank'] as int?,
      period: json['Period'] == null
          ? null
          : Period.fromJson(json['Period'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ContactPointToJson(_$_ContactPoint instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'System': _$ContactPointSystemEnumEnumMap[instance.system],
      'Value': instance.value,
      'Use': _$ContactPointUseEnumEnumMap[instance.use],
      'Rank': instance.rank,
      'Period': instance.period?.toJson(),
    };

const _$ContactPointSystemEnumEnumMap = {
  ContactPointSystemEnum.phone: 'phone',
  ContactPointSystemEnum.fax: 'fax',
  ContactPointSystemEnum.email: 'email',
  ContactPointSystemEnum.pager: 'pager',
  ContactPointSystemEnum.url: 'url',
  ContactPointSystemEnum.sms: 'sms',
  ContactPointSystemEnum.other: 'other',
};

const _$ContactPointUseEnumEnumMap = {
  ContactPointUseEnum.home: 'home',
  ContactPointUseEnum.work: 'work',
  ContactPointUseEnum.temp: 'temp',
  ContactPointUseEnum.old: 'old',
  ContactPointUseEnum.mobile: 'mobile',
};
