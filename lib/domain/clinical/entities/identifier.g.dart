// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identifier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Identifier _$$_IdentifierFromJson(Map<String, dynamic> json) =>
    _$_Identifier(
      id: json['ID'] as String?,
      use: $enumDecodeNullable(_$IdentifierUseEnumEnumMap, json['Use'],
          unknownValue: IdentifierUseEnum.official),
      type: json['Type'] == null
          ? null
          : CodeableConcept.fromJson(json['Type'] as Map<String, dynamic>),
      system: json['System'] as String?,
      value: json['Value'] as String?,
      period: json['Period'] == null
          ? null
          : Period.fromJson(json['Period'] as Map<String, dynamic>),
      assigner: json['Assigner'] == null
          ? null
          : Reference.fromJson(json['Assigner'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_IdentifierToJson(_$_Identifier instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Use': _$IdentifierUseEnumEnumMap[instance.use],
      'Type': instance.type?.toJson(),
      'System': instance.system,
      'Value': instance.value,
      'Period': instance.period?.toJson(),
      'Assigner': instance.assigner?.toJson(),
    };

const _$IdentifierUseEnumEnumMap = {
  IdentifierUseEnum.usual: 'usual',
  IdentifierUseEnum.official: 'official',
  IdentifierUseEnum.temp: 'temp',
  IdentifierUseEnum.secondary: 'secondary',
  IdentifierUseEnum.old: 'old',
};
