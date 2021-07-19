// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'human_name.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HumanName _$_$_HumanNameFromJson(Map<String, dynamic> json) {
  return _$_HumanName(
    id: json['ID'] as String?,
    use: _$enumDecodeNullable(_$HumanNameUseEnumEnumMap, json['Use'],
        unknownValue: HumanNameUseEnum.official),
    text: json['Text'] as String?,
    family: json['Family'] as String?,
    given: (json['Given'] as List<dynamic>?)?.map((e) => e as String?).toList(),
    prefix:
        (json['Prefix'] as List<dynamic>?)?.map((e) => e as String?).toList(),
    suffix:
        (json['Suffix'] as List<dynamic>?)?.map((e) => e as String?).toList(),
    period: json['Period'] == null
        ? null
        : Period.fromJson(json['Period'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_HumanNameToJson(_$_HumanName instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Use': _$HumanNameUseEnumEnumMap[instance.use],
      'Text': instance.text,
      'Family': instance.family,
      'Given': instance.given,
      'Prefix': instance.prefix,
      'Suffix': instance.suffix,
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

const _$HumanNameUseEnumEnumMap = {
  HumanNameUseEnum.usual: 'usual',
  HumanNameUseEnum.official: 'official',
  HumanNameUseEnum.temp: 'temp',
  HumanNameUseEnum.nickname: 'nickname',
  HumanNameUseEnum.anonymous: 'anonymous',
  HumanNameUseEnum.old: 'old',
  HumanNameUseEnum.maiden: 'maiden',
};
