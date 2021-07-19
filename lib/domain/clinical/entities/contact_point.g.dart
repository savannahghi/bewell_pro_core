// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_point.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ContactPoint _$_$_ContactPointFromJson(Map<String, dynamic> json) {
  return _$_ContactPoint(
    id: json['ID'] as String?,
    system: _$enumDecodeNullable(
        _$ContactPointSystemEnumEnumMap, json['System'],
        unknownValue: ContactPointSystemEnum.phone),
    value: json['Value'] as String?,
    use: _$enumDecodeNullable(_$ContactPointUseEnumEnumMap, json['Use'],
        unknownValue: ContactPointUseEnum.mobile),
    rank: json['Rank'] as int?,
    period: json['Period'] == null
        ? null
        : Period.fromJson(json['Period'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_ContactPointToJson(_$_ContactPoint instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'System': _$ContactPointSystemEnumEnumMap[instance.system],
      'Value': instance.value,
      'Use': _$ContactPointUseEnumEnumMap[instance.use],
      'Rank': instance.rank,
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
