// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Address _$_$_AddressFromJson(Map<String, dynamic> json) {
  return _$_Address(
    id: json['id'] as String?,
    type: _$enumDecodeNullable(_$AddressTypeEnumEnumMap, json['type'],
        unknownValue: AddressTypeEnum.both),
    use: _$enumDecodeNullable(_$AddressUseEnumEnumMap, json['use'],
        unknownValue: AddressUseEnum.home),
    text: json['text'] as String?,
    line: (json['line'] as List<dynamic>?)?.map((e) => e as String?).toList(),
    city: json['city'] as String?,
    district: json['district'] as String?,
    state: json['state'] as String?,
    postalCode: json['postalCode'] as String?,
    country: json['country'] as String?,
    period: json['period'] == null
        ? null
        : Period.fromJson(json['period'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_AddressToJson(_$_Address instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$AddressTypeEnumEnumMap[instance.type],
      'use': _$AddressUseEnumEnumMap[instance.use],
      'text': instance.text,
      'line': instance.line,
      'city': instance.city,
      'district': instance.district,
      'state': instance.state,
      'postalCode': instance.postalCode,
      'country': instance.country,
      'period': instance.period?.toJson(),
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

const _$AddressTypeEnumEnumMap = {
  AddressTypeEnum.postal: 'postal',
  AddressTypeEnum.physical: 'physical',
  AddressTypeEnum.both: 'both',
};

const _$AddressUseEnumEnumMap = {
  AddressUseEnum.home: 'home',
  AddressUseEnum.work: 'work',
  AddressUseEnum.temp: 'temp',
  AddressUseEnum.old: 'old',
  AddressUseEnum.billing: 'billing',
};
