// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'condition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Condition _$_$_ConditionFromJson(Map<String, dynamic> json) {
  return _$_Condition(
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
    category: (json['Category'] as List<dynamic>?)
        ?.map((e) => e == null
            ? null
            : CodeableConcept.fromJson(e as Map<String, dynamic>))
        .toList(),
    severity: json['Severity'] == null
        ? null
        : CodeableConcept.fromJson(json['Severity'] as Map<String, dynamic>),
    code: json['Code'] == null
        ? null
        : CodeableConcept.fromJson(json['Code'] as Map<String, dynamic>),
    bodySite: (json['BodySite'] as List<dynamic>?)
        ?.map((e) => e == null
            ? null
            : CodeableConcept.fromJson(e as Map<String, dynamic>))
        .toList(),
    subject: json['Subject'] == null
        ? null
        : Reference.fromJson(json['Subject'] as Map<String, dynamic>),
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
        : Quantity.fromJson(json['OnsetRange'] as Map<String, dynamic>),
    onsetString: json['OnsetString'] as String?,
    abatementDateTime: json['AbatementDateTime'] as String?,
    abatementAge: json['AbatementAge'] == null
        ? null
        : Age.fromJson(json['AbatementAge'] as Map<String, dynamic>),
    abatementPeriod: json['AbatementPeriod'] == null
        ? null
        : Period.fromJson(json['AbatementPeriod'] as Map<String, dynamic>),
    abatementRange: json['AbatementRange'] == null
        ? null
        : Quantity.fromJson(json['AbatementRange'] as Map<String, dynamic>),
    abatementString: json['AbatementString'] as String?,
    recordedDate: json['RecordedDate'] as String?,
    recorder: json['Recorder'] == null
        ? null
        : Reference.fromJson(json['Recorder'] as Map<String, dynamic>),
    asserter: json['Asserter'] == null
        ? null
        : Reference.fromJson(json['Asserter'] as Map<String, dynamic>),
    stage: json['Stage'] == null
        ? null
        : Stage.fromJson(json['Stage'] as Map<String, dynamic>),
    evidence: (json['Evidence'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : Evidence.fromJson(e as Map<String, dynamic>))
        .toList(),
    note: (json['Note'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : Annotation.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_ConditionToJson(_$_Condition instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Identifier': instance.identifier?.map((e) => e?.toJson()).toList(),
      'ClinicalStatus': instance.clinicalStatus?.toJson(),
      'VerificationStatus': instance.verificationStatus?.toJson(),
      'Category': instance.category?.map((e) => e?.toJson()).toList(),
      'Severity': instance.severity?.toJson(),
      'Code': instance.code?.toJson(),
      'BodySite': instance.bodySite?.map((e) => e?.toJson()).toList(),
      'Subject': instance.subject?.toJson(),
      'Encounter': instance.encounter?.toJson(),
      'OnsetDateTime': instance.onsetDateTime,
      'OnsetAge': instance.onsetAge?.toJson(),
      'OnsetPeriod': instance.onsetPeriod?.toJson(),
      'OnsetRange': instance.onsetRange?.toJson(),
      'OnsetString': instance.onsetString,
      'AbatementDateTime': instance.abatementDateTime,
      'AbatementAge': instance.abatementAge?.toJson(),
      'AbatementPeriod': instance.abatementPeriod?.toJson(),
      'AbatementRange': instance.abatementRange?.toJson(),
      'AbatementString': instance.abatementString,
      'RecordedDate': instance.recordedDate,
      'Recorder': instance.recorder?.toJson(),
      'Asserter': instance.asserter?.toJson(),
      'Stage': instance.stage?.toJson(),
      'Evidence': instance.evidence?.map((e) => e?.toJson()).toList(),
      'Note': instance.note?.map((e) => e?.toJson()).toList(),
    };
