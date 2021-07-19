// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'allergy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AllergyIntolerance _$_$_AllergyIntoleranceFromJson(
    Map<String, dynamic> json) {
  return _$_AllergyIntolerance(
    id: json['ID'] as String?,
    identifier: (json['Identifier'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : Identifier.fromJson(e as Map<String, dynamic>))
        .toList(),
    clinicalStatus: json['ClinicalStatus'] == null
        ? null
        : CodeableConcept.fromJson(
            json['ClinicalStatus'] as Map<String, dynamic>),
    verificationStatus: json['VerificationStatus'] == null
        ? null
        : CodeableConcept.fromJson(
            json['VerificationStatus'] as Map<String, dynamic>),
    type: _$enumDecodeNullable(
        _$AllergyIntoleranceTypeEnumEnumMap, json['Type'],
        unknownValue: AllergyIntoleranceTypeEnum.allergy),
    category: (json['Category'] as List<dynamic>?)
        ?.map((e) => _$enumDecodeNullable(
            _$AllergyIntoleranceCategoryEnumEnumMap, e,
            unknownValue: AllergyIntoleranceCategoryEnum.environment))
        .toList(),
    criticality: _$enumDecodeNullable(
        _$AllergyIntoleranceCriticalityEnumEnumMap, json['Criticality'],
        unknownValue: AllergyIntoleranceCriticalityEnum.unable_to_assess),
    code: json['Code'] == null
        ? null
        : CodeableConcept.fromJson(json['Code'] as Map<String, dynamic>),
    patient: json['Patient'] == null
        ? null
        : Reference.fromJson(json['Patient'] as Map<String, dynamic>),
    encounter: json['Encounter'] == null
        ? null
        : Reference.fromJson(json['Encounter'] as Map<String, dynamic>),
    onsetDateTime: json['OnsetDateTime'] as String?,
    onsetAge: json['OnsetAge'] == null
        ? null
        : Age.fromJson(json['OnsetAge'] as Map<String, dynamic>),
    onsetPeriod: json['OnsetPeriod'] == null
        ? null
        : Period.fromJson(json['OnsetPeriod'] as Map<String, dynamic>),
    onsetRange: json['OnsetRange'] == null
        ? null
        : Range.fromJson(json['OnsetRange'] as Map<String, dynamic>),
    onsetString: json['OnsetString'] as String?,
    recordedDate: json['RecordedDate'] as String?,
    recorder: json['Recorder'] == null
        ? null
        : Reference.fromJson(json['Recorder'] as Map<String, dynamic>),
    asserter: json['Asserter'] == null
        ? null
        : Reference.fromJson(json['Asserter'] as Map<String, dynamic>),
    lastOccurrence: json['LastOccurrence'] as String?,
    note: (json['Note'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : Annotation.fromJson(e as Map<String, dynamic>))
        .toList(),
    reaction: (json['Reaction'] as List<dynamic>?)
        ?.map((e) => e == null
            ? null
            : AllergyIntoleranceReaction.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_AllergyIntoleranceToJson(
        _$_AllergyIntolerance instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Identifier': instance.identifier?.map((e) => e?.toJson()).toList(),
      'ClinicalStatus': instance.clinicalStatus?.toJson(),
      'VerificationStatus': instance.verificationStatus?.toJson(),
      'Type': _$AllergyIntoleranceTypeEnumEnumMap[instance.type],
      'Category': instance.category
          ?.map((e) => _$AllergyIntoleranceCategoryEnumEnumMap[e])
          .toList(),
      'Criticality':
          _$AllergyIntoleranceCriticalityEnumEnumMap[instance.criticality],
      'Code': instance.code?.toJson(),
      'Patient': instance.patient?.toJson(),
      'Encounter': instance.encounter?.toJson(),
      'OnsetDateTime': instance.onsetDateTime,
      'OnsetAge': instance.onsetAge?.toJson(),
      'OnsetPeriod': instance.onsetPeriod?.toJson(),
      'OnsetRange': instance.onsetRange?.toJson(),
      'OnsetString': instance.onsetString,
      'RecordedDate': instance.recordedDate,
      'Recorder': instance.recorder?.toJson(),
      'Asserter': instance.asserter?.toJson(),
      'LastOccurrence': instance.lastOccurrence,
      'Note': instance.note?.map((e) => e?.toJson()).toList(),
      'Reaction': instance.reaction?.map((e) => e?.toJson()).toList(),
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

const _$AllergyIntoleranceTypeEnumEnumMap = {
  AllergyIntoleranceTypeEnum.allergy: 'allergy',
  AllergyIntoleranceTypeEnum.intolerance: 'intolerance',
};

const _$AllergyIntoleranceCategoryEnumEnumMap = {
  AllergyIntoleranceCategoryEnum.food: 'food',
  AllergyIntoleranceCategoryEnum.medication: 'medication',
  AllergyIntoleranceCategoryEnum.environment: 'environment',
  AllergyIntoleranceCategoryEnum.biological: 'biological',
};

const _$AllergyIntoleranceCriticalityEnumEnumMap = {
  AllergyIntoleranceCriticalityEnum.low: 'low',
  AllergyIntoleranceCriticalityEnum.high: 'high',
  AllergyIntoleranceCriticalityEnum.unable_to_assess: 'unable_to_assess',
};
