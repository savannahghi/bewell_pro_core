// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'human_name.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HumanName _$$_HumanNameFromJson(Map<String, dynamic> json) => _$_HumanName(
      id: json['ID'] as String?,
      use: $enumDecodeNullable(_$HumanNameUseEnumEnumMap, json['Use'],
          unknownValue: HumanNameUseEnum.official),
      text: json['Text'] as String?,
      family: json['Family'] as String?,
      given:
          (json['Given'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      prefix:
          (json['Prefix'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      suffix:
          (json['Suffix'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      period: json['Period'] == null
          ? null
          : Period.fromJson(json['Period'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_HumanNameToJson(_$_HumanName instance) =>
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

const _$HumanNameUseEnumEnumMap = {
  HumanNameUseEnum.usual: 'usual',
  HumanNameUseEnum.official: 'official',
  HumanNameUseEnum.temp: 'temp',
  HumanNameUseEnum.nickname: 'nickname',
  HumanNameUseEnum.anonymous: 'anonymous',
  HumanNameUseEnum.old: 'old',
  HumanNameUseEnum.maiden: 'maiden',
};
