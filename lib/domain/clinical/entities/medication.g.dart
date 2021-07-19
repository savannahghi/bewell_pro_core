// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medication.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Medication _$_$_MedicationFromJson(Map<String, dynamic> json) {
  return _$_Medication(
    id: json['ID'] as String?,
    identifier: (json['Identifier'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : Identifier.fromJson(e as Map<String, dynamic>))
        .toList(),
    status: _$enumDecodeNullable(_$MedicationStatusEnumEnumMap, json['Status'],
        unknownValue: MedicationStatusEnum.inactive),
    statusReason: json['StatusReason'] == null
        ? null
        : CodeableConcept.fromJson(
            json['StatusReason'] as Map<String, dynamic>),
    intent: _$enumDecodeNullable(_$MedicationIntentEnumMap, json['Intent'],
        unknownValue: MedicationIntent.proposal),
    category: (json['Category'] as List<dynamic>?)
        ?.map((e) => e == null
            ? null
            : CodeableConcept.fromJson(e as Map<String, dynamic>))
        .toList(),
    priority: _$enumDecodeNullable(_$PriorityEnumMap, json['Priority'],
        unknownValue: Priority.routine),
    reportedBoolean: json['ReportedBoolean'] as bool?,
    reportedReference: json['ReportedReference'] == null
        ? null
        : Reference.fromJson(json['ReportedReference'] as Map<String, dynamic>),
    medicationCodeableConcept: json['MedicationCodeableConcept'] == null
        ? null
        : CodeableConcept.fromJson(
            json['MedicationCodeableConcept'] as Map<String, dynamic>),
    medicationReference: json['MedicationReference'] == null
        ? null
        : Reference.fromJson(
            json['MedicationReference'] as Map<String, dynamic>),
    subject: json['Subject'] == null
        ? null
        : Reference.fromJson(json['Subject'] as Map<String, dynamic>),
    encounter: json['Encounter'] == null
        ? null
        : Reference.fromJson(json['Encounter'] as Map<String, dynamic>),
    supportingInformation: (json['SupportingInformation'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : Reference.fromJson(e as Map<String, dynamic>))
        .toList(),
    authoredOn: json['AuthoredOn'] as String?,
    requester: json['Requester'] == null
        ? null
        : Reference.fromJson(json['Requester'] as Map<String, dynamic>),
    performer: json['Performer'] == null
        ? null
        : Reference.fromJson(json['Performer'] as Map<String, dynamic>),
    performerType: json['PerformerType'] == null
        ? null
        : CodeableConcept.fromJson(
            json['PerformerType'] as Map<String, dynamic>),
    recorder: json['Recorder'] == null
        ? null
        : Reference.fromJson(json['Recorder'] as Map<String, dynamic>),
    reasonReference: (json['ReasonReference'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : Reference.fromJson(e as Map<String, dynamic>))
        .toList(),
    basedOn: (json['BasedOn'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : Reference.fromJson(e as Map<String, dynamic>))
        .toList(),
    groupIdentifier: json['GroupIdentifier'] == null
        ? null
        : Identifier.fromJson(json['GroupIdentifier'] as Map<String, dynamic>),
    courseOfTherapyType: json['CourseOfTherapyType'] == null
        ? null
        : CodeableConcept.fromJson(
            json['CourseOfTherapyType'] as Map<String, dynamic>),
    insurance: (json['Insurance'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : Reference.fromJson(e as Map<String, dynamic>))
        .toList(),
    note: (json['Note'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : Annotation.fromJson(e as Map<String, dynamic>))
        .toList(),
    dosageInstruction: (json['DosageInstruction'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : Dosage.fromJson(e as Map<String, dynamic>))
        .toList(),
    dispenseRequest: json['DispenseRequest'] == null
        ? null
        : MedicationRequestDispense.fromJson(
            json['DispenseRequest'] as Map<String, dynamic>),
    substitution: json['Substitution'] == null
        ? null
        : MedicationRequestSubstitution.fromJson(
            json['Substitution'] as Map<String, dynamic>),
    priorPrescription: json['PriorPrescription'] == null
        ? null
        : Reference.fromJson(json['PriorPrescription'] as Map<String, dynamic>),
    detectedIssue: (json['DetectedIssue'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : Reference.fromJson(e as Map<String, dynamic>))
        .toList(),
    eventHistory: (json['EventHistory'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : Reference.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_MedicationToJson(_$_Medication instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Identifier': instance.identifier?.map((e) => e?.toJson()).toList(),
      'Status': _$MedicationStatusEnumEnumMap[instance.status],
      'StatusReason': instance.statusReason?.toJson(),
      'Intent': _$MedicationIntentEnumMap[instance.intent],
      'Category': instance.category?.map((e) => e?.toJson()).toList(),
      'Priority': _$PriorityEnumMap[instance.priority],
      'ReportedBoolean': instance.reportedBoolean,
      'ReportedReference': instance.reportedReference?.toJson(),
      'MedicationCodeableConcept': instance.medicationCodeableConcept?.toJson(),
      'MedicationReference': instance.medicationReference?.toJson(),
      'Subject': instance.subject?.toJson(),
      'Encounter': instance.encounter?.toJson(),
      'SupportingInformation':
          instance.supportingInformation?.map((e) => e?.toJson()).toList(),
      'AuthoredOn': instance.authoredOn,
      'Requester': instance.requester?.toJson(),
      'Performer': instance.performer?.toJson(),
      'PerformerType': instance.performerType?.toJson(),
      'Recorder': instance.recorder?.toJson(),
      'ReasonReference':
          instance.reasonReference?.map((e) => e?.toJson()).toList(),
      'BasedOn': instance.basedOn?.map((e) => e?.toJson()).toList(),
      'GroupIdentifier': instance.groupIdentifier?.toJson(),
      'CourseOfTherapyType': instance.courseOfTherapyType?.toJson(),
      'Insurance': instance.insurance?.map((e) => e?.toJson()).toList(),
      'Note': instance.note?.map((e) => e?.toJson()).toList(),
      'DosageInstruction':
          instance.dosageInstruction?.map((e) => e?.toJson()).toList(),
      'DispenseRequest': instance.dispenseRequest?.toJson(),
      'Substitution': instance.substitution?.toJson(),
      'PriorPrescription': instance.priorPrescription?.toJson(),
      'DetectedIssue': instance.detectedIssue?.map((e) => e?.toJson()).toList(),
      'EventHistory': instance.eventHistory?.map((e) => e?.toJson()).toList(),
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

const _$MedicationStatusEnumEnumMap = {
  MedicationStatusEnum.active: 'active',
  MedicationStatusEnum.completed: 'completed',
  MedicationStatusEnum.inactive: 'inactive',
};

const _$MedicationIntentEnumMap = {
  MedicationIntent.proposal: 'proposal',
  MedicationIntent.plan: 'plan',
  MedicationIntent.original_order: 'original_order',
};

const _$PriorityEnumMap = {
  Priority.routine: 'routine',
  Priority.urgent: 'urgent',
  Priority.asap: 'asap',
};
