// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PatientContact _$_$_PatientContactFromJson(Map<String, dynamic> json) {
  return _$_PatientContact(
    id: json['ID'] as String?,
    relationship: (json['Relationship'] as List<dynamic>?)
        ?.map((e) => e == null
            ? null
            : CodeableConcept.fromJson(e as Map<String, dynamic>))
        .toList(),
    name: json['Name'] == null
        ? null
        : HumanName.fromJson(json['Name'] as Map<String, dynamic>),
    telecom: (json['Telecom'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : ContactPoint.fromJson(e as Map<String, dynamic>))
        .toList(),
    address: json['Address'] == null
        ? null
        : Address.fromJson(json['Address'] as Map<String, dynamic>),
    gender: _$enumDecodeNullable(_$PatientGenderEnumEnumMap, json['Gender'],
        unknownValue: PatientGenderEnum.unknown),
    organization: json['Organization'] == null
        ? null
        : Reference.fromJson(json['Organization'] as Map<String, dynamic>),
    period: json['period'] == null
        ? null
        : Period.fromJson(json['period'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_PatientContactToJson(_$_PatientContact instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Relationship': instance.relationship?.map((e) => e?.toJson()).toList(),
      'Name': instance.name?.toJson(),
      'Telecom': instance.telecom?.map((e) => e?.toJson()).toList(),
      'Address': instance.address?.toJson(),
      'Gender': _$PatientGenderEnumEnumMap[instance.gender],
      'Organization': instance.organization?.toJson(),
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

const _$PatientGenderEnumEnumMap = {
  PatientGenderEnum.male: 'male',
  PatientGenderEnum.female: 'female',
  PatientGenderEnum.other: null,
  PatientGenderEnum.unknown: 'unknown',
};
