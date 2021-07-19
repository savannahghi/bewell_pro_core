// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'allergy_intolerance_reaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AllergyIntoleranceReaction _$_$_AllergyIntoleranceReactionFromJson(
    Map<String, dynamic> json) {
  return _$_AllergyIntoleranceReaction(
    id: json['ID'] as String?,
    substance: json['Substance'] == null
        ? null
        : CodeableConcept.fromJson(json['Substance'] as Map<String, dynamic>),
    manifestation: (json['Manifestation'] as List<dynamic>?)
        ?.map((e) => e == null
            ? null
            : CodeableConcept.fromJson(e as Map<String, dynamic>))
        .toList(),
    description: json['Description'] as String?,
    onset: json['Onset'] as String?,
    severity: _$enumDecodeNullable(
        _$AllergyIntoleranceReactionSeverityEnumEnumMap, json['Severity'],
        unknownValue: AllergyIntoleranceReactionSeverityEnum.moderate),
    exposureRoute: json['ExposureRoute'] == null
        ? null
        : CodeableConcept.fromJson(
            json['ExposureRoute'] as Map<String, dynamic>),
    note: (json['Note'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : Annotation.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_AllergyIntoleranceReactionToJson(
        _$_AllergyIntoleranceReaction instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Substance': instance.substance?.toJson(),
      'Manifestation': instance.manifestation?.map((e) => e?.toJson()).toList(),
      'Description': instance.description,
      'Onset': instance.onset,
      'Severity':
          _$AllergyIntoleranceReactionSeverityEnumEnumMap[instance.severity],
      'ExposureRoute': instance.exposureRoute?.toJson(),
      'Note': instance.note?.map((e) => e?.toJson()).toList(),
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

const _$AllergyIntoleranceReactionSeverityEnumEnumMap = {
  AllergyIntoleranceReactionSeverityEnum.mild: 'mild',
  AllergyIntoleranceReactionSeverityEnum.moderate: 'moderate',
  AllergyIntoleranceReactionSeverityEnum.severe: 'severe',
};
