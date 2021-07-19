// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PatientLink _$_$_PatientLinkFromJson(Map<String, dynamic> json) {
  return _$_PatientLink(
    id: json['ID'] as String?,
    other: json['Other'] == null
        ? null
        : Reference.fromJson(json['Other'] as Map<String, dynamic>),
    type: _$enumDecodeNullable(_$PatientLinkTypeEnumEnumMap, json['Type'],
        unknownValue: PatientLinkTypeEnum.refer),
  );
}

Map<String, dynamic> _$_$_PatientLinkToJson(_$_PatientLink instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Other': instance.other?.toJson(),
      'Type': _$PatientLinkTypeEnumEnumMap[instance.type],
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

const _$PatientLinkTypeEnumEnumMap = {
  PatientLinkTypeEnum.replaced_by: 'replaced_by',
  PatientLinkTypeEnum.replaces: 'replaces',
  PatientLinkTypeEnum.refer: 'refer',
  PatientLinkTypeEnum.seealso: 'seealso',
};
