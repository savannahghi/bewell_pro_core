// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fhir.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Attester _$_$_AttesterFromJson(Map<String, dynamic> json) {
  return _$_Attester(
    id: json['ID'] == null
        ? null
        : CodeableConcept.fromJson(json['ID'] as Map<String, dynamic>),
    mode: _$enumDecodeNullable(
        _$CompositionAttesterModeEnumEnumMap, json['Mode']),
  );
}

Map<String, dynamic> _$_$_AttesterToJson(_$_Attester instance) =>
    <String, dynamic>{
      'ID': instance.id?.toJson(),
      'Mode': _$CompositionAttesterModeEnumEnumMap[instance.mode],
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

const _$CompositionAttesterModeEnumEnumMap = {
  CompositionAttesterModeEnum.personal: 'personal',
  CompositionAttesterModeEnum.professional: 'professional',
  CompositionAttesterModeEnum.legal: 'legal',
  CompositionAttesterModeEnum.official: 'official',
};

_$_RelatesTo _$_$_RelatesToFromJson(Map<String, dynamic> json) {
  return _$_RelatesTo(
    id: json['ID'] == null
        ? null
        : CodeableConcept.fromJson(json['ID'] as Map<String, dynamic>),
    code: json['Code'] as String?,
    targetIdentifier: json['TargetIdentifier'] == null
        ? null
        : Identifier.fromJson(json['TargetIdentifier'] as Map<String, dynamic>),
    targetReference: json['TargetReference'] == null
        ? null
        : Reference.fromJson(json['TargetReference'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_RelatesToToJson(_$_RelatesTo instance) =>
    <String, dynamic>{
      'ID': instance.id?.toJson(),
      'Code': instance.code,
      'TargetIdentifier': instance.targetIdentifier?.toJson(),
      'TargetReference': instance.targetReference?.toJson(),
    };

_$_Event _$_$_EventFromJson(Map<String, dynamic> json) {
  return _$_Event(
    id: json['ID'] == null
        ? null
        : CodeableConcept.fromJson(json['ID'] as Map<String, dynamic>),
    code: json['Code'] as String?,
    targetIdentifier: json['Period'] == null
        ? null
        : Period.fromJson(json['Period'] as Map<String, dynamic>),
    detail: (json['Detail'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : Reference.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_EventToJson(_$_Event instance) => <String, dynamic>{
      'ID': instance.id?.toJson(),
      'Code': instance.code,
      'Period': instance.targetIdentifier?.toJson(),
      'Detail': instance.detail?.map((e) => e?.toJson()).toList(),
    };

_$_Section _$_$_SectionFromJson(Map<String, dynamic> json) {
  return _$_Section(
    id: json['ID'] as String?,
    title: json['Title'] as String?,
    code: json['Code'] as String?,
    author: (json['Author'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : Reference.fromJson(e as Map<String, dynamic>))
        .toList(),
    focus: json['Focus'] == null
        ? null
        : Reference.fromJson(json['Focus'] as Map<String, dynamic>),
    text: json['Text'] == null
        ? null
        : Narrative.fromJson(json['Text'] as Map<String, dynamic>),
    mode: json['Mode'] as String?,
    orderedBy: json['OrderedBy'] == null
        ? null
        : CodeableConcept.fromJson(json['OrderedBy'] as Map<String, dynamic>),
    entry: (json['Entry'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : Reference.fromJson(e as Map<String, dynamic>))
        .toList(),
    emptyReason: json['EmptyReason'] == null
        ? null
        : Reference.fromJson(json['EmptyReason'] as Map<String, dynamic>),
    section: (json['Section'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : Section.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_SectionToJson(_$_Section instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Title': instance.title,
      'Code': instance.code,
      'Author': instance.author?.map((e) => e?.toJson()).toList(),
      'Focus': instance.focus?.toJson(),
      'Text': instance.text?.toJson(),
      'Mode': instance.mode,
      'OrderedBy': instance.orderedBy?.toJson(),
      'Entry': instance.entry?.map((e) => e?.toJson()).toList(),
      'EmptyReason': instance.emptyReason?.toJson(),
      'Section': instance.section?.map((e) => e?.toJson()).toList(),
    };

_$_Age _$_$_AgeFromJson(Map<String, dynamic> json) {
  return _$_Age(
    id: json['ID'] == null
        ? null
        : CodeableConcept.fromJson(json['ID'] as Map<String, dynamic>),
    value: (json['Value'] as num?)?.toDouble(),
    comparator:
        _$enumDecodeNullable(_$ComparatorEnumEnumMap, json['Comparator']),
    unit: json['Unit'] as String?,
    system: json['System'] as String?,
    code: json['Code'] as String?,
  );
}

Map<String, dynamic> _$_$_AgeToJson(_$_Age instance) => <String, dynamic>{
      'ID': instance.id?.toJson(),
      'Value': instance.value,
      'Comparator': _$ComparatorEnumEnumMap[instance.comparator],
      'Unit': instance.unit,
      'System': instance.system,
      'Code': instance.code,
    };

const _$ComparatorEnumEnumMap = {
  ComparatorEnum.less_than: 'less_than',
  ComparatorEnum.less_than_or_equal_to: 'less_than_or_equal_to',
  ComparatorEnum.greater_than_or_equal_to: 'greater_than_or_equal_to',
  ComparatorEnum.greater_than: 'greater_than',
};

_$_Quantity _$_$_QuantityFromJson(Map<String, dynamic> json) {
  return _$_Quantity(
    id: json['ID'] as String?,
    value: (json['Value'] as num?)?.toDouble(),
    comparator:
        _$enumDecodeNullable(_$ComparatorEnumEnumMap, json['Comparator']),
    unit: json['Unit'] as String?,
    system: json['System'] as String?,
    code: json['Code'] as String?,
  );
}

Map<String, dynamic> _$_$_QuantityToJson(_$_Quantity instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Value': instance.value,
      'Comparator': _$ComparatorEnumEnumMap[instance.comparator],
      'Unit': instance.unit,
      'System': instance.system,
      'Code': instance.code,
    };

_$_Stage _$_$_StageFromJson(Map<String, dynamic> json) {
  return _$_Stage(
    id: json['ID'] as String?,
    summary: json['Summary'] == null
        ? null
        : CodeableConcept.fromJson(json['Summary'] as Map<String, dynamic>),
    assessment: (json['Assessment'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : Reference.fromJson(e as Map<String, dynamic>))
        .toList(),
    type: json['Type'] == null
        ? null
        : Reference.fromJson(json['Type'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_StageToJson(_$_Stage instance) => <String, dynamic>{
      'ID': instance.id,
      'Summary': instance.summary?.toJson(),
      'Assessment': instance.assessment?.map((e) => e?.toJson()).toList(),
      'Type': instance.type?.toJson(),
    };

_$_Evidence _$_$_EvidenceFromJson(Map<String, dynamic> json) {
  return _$_Evidence(
    id: json['ID'] as String?,
    code: json['Code'] == null
        ? null
        : CodeableConcept.fromJson(json['Code'] as Map<String, dynamic>),
    detail: (json['Detail'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : Reference.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_EvidenceToJson(_$_Evidence instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Code': instance.code?.toJson(),
      'Detail': instance.detail?.map((e) => e?.toJson()).toList(),
    };

_$_Composition _$_$_CompositionFromJson(Map<String, dynamic> json) {
  return _$_Composition(
    id: json['ID'] as String?,
    identifier: json['Identifier'] == null
        ? null
        : Identifier.fromJson(json['Identifier'] as Map<String, dynamic>),
    status:
        _$enumDecodeNullable(_$CompositionStatusEnumEnumMap, json['Status']),
    type: json['Type'] == null
        ? null
        : CodeableConcept.fromJson(json['Type'] as Map<String, dynamic>),
    category: (json['Category'] as List<dynamic>?)
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
    date: json['Date'] as String?,
    author: (json['Author'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : Reference.fromJson(e as Map<String, dynamic>))
        .toList(),
    title: json['Title'] as String?,
    confidentiality: json['Confidentiality'] as String?,
    attester: (json['Attester'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : Attester.fromJson(e as Map<String, dynamic>))
        .toList(),
    custodian: json['Custodian'] == null
        ? null
        : Reference.fromJson(json['Custodian'] as Map<String, dynamic>),
    relatesTo: (json['RelatesTo'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : RelatesTo.fromJson(e as Map<String, dynamic>))
        .toList(),
    event: (json['Event'] as List<dynamic>?)
        ?.map(
            (e) => e == null ? null : Event.fromJson(e as Map<String, dynamic>))
        .toList(),
    section: (json['Section'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : Section.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_CompositionToJson(_$_Composition instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Identifier': instance.identifier?.toJson(),
      'Status': _$CompositionStatusEnumEnumMap[instance.status],
      'Type': instance.type?.toJson(),
      'Category': instance.category?.map((e) => e?.toJson()).toList(),
      'Subject': instance.subject?.toJson(),
      'Encounter': instance.encounter?.toJson(),
      'Date': instance.date,
      'Author': instance.author?.map((e) => e?.toJson()).toList(),
      'Title': instance.title,
      'Confidentiality': instance.confidentiality,
      'Attester': instance.attester?.map((e) => e?.toJson()).toList(),
      'Custodian': instance.custodian?.toJson(),
      'RelatesTo': instance.relatesTo?.map((e) => e?.toJson()).toList(),
      'Event': instance.event?.map((e) => e?.toJson()).toList(),
      'Section': instance.section?.map((e) => e?.toJson()).toList(),
    };

const _$CompositionStatusEnumEnumMap = {
  CompositionStatusEnum.preliminary: 'preliminary',
  CompositionStatusEnum.finall: 'finall',
  CompositionStatusEnum.amended: 'amended',
  CompositionStatusEnum.entered_in_error: 'entered_in_error',
};

_$_TimingRepeat _$_$_TimingRepeatFromJson(Map<String, dynamic> json) {
  return _$_TimingRepeat(
    id: json['ID'] as String?,
    boundsDuration: json['BoundsDuration'] == null
        ? null
        : Duration(microseconds: json['BoundsDuration'] as int),
    boundsRange: json['BoundsRange'] == null
        ? null
        : Range.fromJson(json['BoundsRange'] as Map<String, dynamic>),
    boundsPeriod: json['BoundsPeriod'] == null
        ? null
        : Period.fromJson(json['BoundsPeriod'] as Map<String, dynamic>),
    count: json['Count'] as int?,
    countMax: json['CountMax'] as int?,
    duration: (json['Duration'] as num?)?.toDouble(),
    durationMax: (json['DurationMax'] as num?)?.toDouble(),
    durationUnit: _$enumDecodeNullable(
        _$TimingRepeatPeriodUnitEnumMap, json['DurationUnit']),
    frequency: json['Frequency'] as int?,
    frequencyMax: json['FrequencyMax'] as int?,
    period: (json['Period'] as num?)?.toDouble(),
    periodMax: (json['PeriodMax'] as num?)?.toDouble(),
    periodUnit: _$enumDecodeNullable(
        _$TimingRepeatPeriodUnitEnumMap, json['PeriodUnit']),
    dayOfWeek: _$enumDecodeNullable(_$DayOfWeekEnumMap, json['DayOfWeek']),
    when: _$enumDecodeNullable(_$TimingRepeatPeriodUnitEnumMap, json['When']),
    offset: json['Offset'] as int?,
  );
}

Map<String, dynamic> _$_$_TimingRepeatToJson(_$_TimingRepeat instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'BoundsDuration': instance.boundsDuration?.inMicroseconds,
      'BoundsRange': instance.boundsRange?.toJson(),
      'BoundsPeriod': instance.boundsPeriod?.toJson(),
      'Count': instance.count,
      'CountMax': instance.countMax,
      'Duration': instance.duration,
      'DurationMax': instance.durationMax,
      'DurationUnit': _$TimingRepeatPeriodUnitEnumMap[instance.durationUnit],
      'Frequency': instance.frequency,
      'FrequencyMax': instance.frequencyMax,
      'Period': instance.period,
      'PeriodMax': instance.periodMax,
      'PeriodUnit': _$TimingRepeatPeriodUnitEnumMap[instance.periodUnit],
      'DayOfWeek': _$DayOfWeekEnumMap[instance.dayOfWeek],
      'When': _$TimingRepeatPeriodUnitEnumMap[instance.when],
      'Offset': instance.offset,
    };

const _$TimingRepeatPeriodUnitEnumMap = {
  TimingRepeatPeriodUnit.s: 's',
  TimingRepeatPeriodUnit.min: 'min',
  TimingRepeatPeriodUnit.h: 'h',
  TimingRepeatPeriodUnit.d: 'd',
  TimingRepeatPeriodUnit.wk: 'wk',
  TimingRepeatPeriodUnit.mo: 'mo',
  TimingRepeatPeriodUnit.a: 'a',
};

const _$DayOfWeekEnumMap = {
  DayOfWeek.MON: 'MON',
  DayOfWeek.TUE: 'TUE',
  DayOfWeek.WED: 'WED',
  DayOfWeek.THUR: 'THUR',
  DayOfWeek.FRI: 'FRI',
  DayOfWeek.SAT: 'SAT',
  DayOfWeek.SUN: 'SUN',
};

_$_Timing _$_$_TimingFromJson(Map<String, dynamic> json) {
  return _$_Timing(
    id: json['ID'] as String?,
    event: json['Event'] == null
        ? null
        : Duration(microseconds: json['Event'] as int),
    repeat: json['Repeat'] == null
        ? null
        : TimingRepeat.fromJson(json['Repeat'] as Map<String, dynamic>),
    code: _$enumDecodeNullable(_$TimingCodesEnumMap, json['Code']),
  );
}

Map<String, dynamic> _$_$_TimingToJson(_$_Timing instance) => <String, dynamic>{
      'ID': instance.id,
      'Event': instance.event?.inMicroseconds,
      'Repeat': instance.repeat?.toJson(),
      'Code': _$TimingCodesEnumMap[instance.code],
    };

const _$TimingCodesEnumMap = {
  TimingCodes.BID: 'BID',
  TimingCodes.TID: 'TID',
  TimingCodes.QID: 'QID',
  TimingCodes.AM: 'AM',
  TimingCodes.PM: 'PM',
  TimingCodes.QD: 'QD',
  TimingCodes.QOD: 'QOD',
};

_$_RateRatio _$_$_RateRatioFromJson(Map<String, dynamic> json) {
  return _$_RateRatio(
    id: json['ID'] as String?,
    numerator: json['Numerator'] == null
        ? null
        : Quantity.fromJson(json['Numerator'] as Map<String, dynamic>),
    denominator: json['Denominator'] == null
        ? null
        : Quantity.fromJson(json['Denominator'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_RateRatioToJson(_$_RateRatio instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Numerator': instance.numerator?.toJson(),
      'Denominator': instance.denominator?.toJson(),
    };

_$_DosageDoseAndRate _$_$_DosageDoseAndRateFromJson(Map<String, dynamic> json) {
  return _$_DosageDoseAndRate(
    id: json['ID'] as String?,
    type: json['Type'] == null
        ? null
        : CodeableConcept.fromJson(json['Type'] as Map<String, dynamic>),
    doseRange: json['DoseRange'] == null
        ? null
        : Range.fromJson(json['DoseRange'] as Map<String, dynamic>),
    doseQuantity: json['DoseQuantity'] == null
        ? null
        : Quantity.fromJson(json['DoseQuantity'] as Map<String, dynamic>),
    rateRatio: json['RateRatio'] == null
        ? null
        : RateRatio.fromJson(json['RateRatio'] as Map<String, dynamic>),
    rateRange: json['RateRange'] == null
        ? null
        : Range.fromJson(json['RateRange'] as Map<String, dynamic>),
    rateQuantity: json['RateQuantity'] == null
        ? null
        : Quantity.fromJson(json['RateQuantity'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_DosageDoseAndRateToJson(
        _$_DosageDoseAndRate instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Type': instance.type?.toJson(),
      'DoseRange': instance.doseRange?.toJson(),
      'DoseQuantity': instance.doseQuantity?.toJson(),
      'RateRatio': instance.rateRatio?.toJson(),
      'RateRange': instance.rateRange?.toJson(),
      'RateQuantity': instance.rateQuantity?.toJson(),
    };
