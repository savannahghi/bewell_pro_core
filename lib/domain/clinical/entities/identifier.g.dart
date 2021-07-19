// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identifier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Identifier _$_$_IdentifierFromJson(Map<String, dynamic> json) {
  return _$_Identifier(
    id: json['ID'] as String?,
    use: _$enumDecodeNullable(_$IdentifierUseEnumEnumMap, json['Use'],
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
}

Map<String, dynamic> _$_$_IdentifierToJson(_$_Identifier instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Use': _$IdentifierUseEnumEnumMap[instance.use],
      'Type': instance.type?.toJson(),
      'System': instance.system,
      'Value': instance.value,
      'Period': instance.period?.toJson(),
      'Assigner': instance.assigner?.toJson(),
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

const _$IdentifierUseEnumEnumMap = {
  IdentifierUseEnum.usual: 'usual',
  IdentifierUseEnum.official: 'official',
  IdentifierUseEnum.temp: 'temp',
  IdentifierUseEnum.secondary: 'secondary',
  IdentifierUseEnum.old: 'old',
};
