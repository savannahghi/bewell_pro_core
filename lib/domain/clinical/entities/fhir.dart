import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bewell_pro_core/domain/clinical/entities/codeable_concept.dart';
import 'package:bewell_pro_core/domain/clinical/entities/identifier.dart';
import 'package:bewell_pro_core/domain/clinical/entities/narrative.dart';
import 'package:bewell_pro_core/domain/clinical/entities/period.dart';
import 'package:bewell_pro_core/domain/clinical/entities/range.dart';
import 'package:bewell_pro_core/domain/clinical/entities/reference.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';

part 'fhir.freezed.dart';
part 'fhir.g.dart';

@freezed
class Attester with _$Attester {
  factory Attester({
    @JsonKey(name: 'ID') CodeableConcept? id,
    @JsonKey(name: 'Mode') CompositionAttesterModeEnum? mode,
  }) = _Attester;

  factory Attester.fromJson(Map<String, dynamic> json) =>
      _$AttesterFromJson(json);
}

@freezed
class RelatesTo with _$RelatesTo {
  factory RelatesTo({
    @JsonKey(name: 'ID') CodeableConcept? id,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'TargetIdentifier') Identifier? targetIdentifier,
    @JsonKey(name: 'TargetReference') Reference? targetReference,
  }) = _RelatesTo;

  factory RelatesTo.fromJson(Map<String, dynamic> json) =>
      _$RelatesToFromJson(json);
}

@freezed
class Event with _$Event {
  factory Event({
    @JsonKey(name: 'ID') CodeableConcept? id,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'Period') Period? targetIdentifier,
    @JsonKey(name: 'Detail') List<Reference?>? detail,
  }) = _Event;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
}

@freezed
class Section with _$Section {
  factory Section({
    @JsonKey(name: 'ID') String? id,
    @JsonKey(name: 'Title') String? title,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'Author') List<Reference?>? author,
    @JsonKey(name: 'Focus') Reference? focus,
    @JsonKey(name: 'Text') Narrative? text,
    @JsonKey(name: 'Mode') String? mode,
    @JsonKey(name: 'OrderedBy') CodeableConcept? orderedBy,
    @JsonKey(name: 'Entry') List<Reference?>? entry,
    @JsonKey(name: 'EmptyReason') Reference? emptyReason,
    @JsonKey(name: 'Section') List<Section?>? section,
  }) = _Section;

  factory Section.fromJson(Map<String, dynamic> json) =>
      _$SectionFromJson(json);
}

@freezed
class Age with _$Age {
  factory Age({
    @JsonKey(name: 'ID') CodeableConcept? id,
    @JsonKey(name: 'Value') double? value,
    @JsonKey(name: 'Comparator') ComparatorEnum? comparator,
    @JsonKey(name: 'Unit') String? unit,
    @JsonKey(name: 'System') String? system,
    @JsonKey(name: 'Code') String? code,
  }) = _Age;

  factory Age.fromJson(Map<String, dynamic> json) => _$AgeFromJson(json);
}

@freezed
class Quantity with _$Quantity {
  factory Quantity({
    @JsonKey(name: 'ID') String? id,
    @JsonKey(name: 'Value') double? value,
    @JsonKey(name: 'Comparator') ComparatorEnum? comparator,
    @JsonKey(name: 'Unit') String? unit,
    @JsonKey(name: 'System') String? system,
    @JsonKey(name: 'Code') String? code,
  }) = _Quantity;

  factory Quantity.fromJson(Map<String, dynamic> json) =>
      _$QuantityFromJson(json);
}

@freezed
class Stage with _$Stage {
  factory Stage({
    @JsonKey(name: 'ID') String? id,
    @JsonKey(name: 'Summary') CodeableConcept? summary,
    @JsonKey(name: 'Assessment') List<Reference?>? assessment,
    @JsonKey(name: 'Type') Reference? type,
  }) = _Stage;

  factory Stage.fromJson(Map<String, dynamic> json) => _$StageFromJson(json);
}

@freezed
class Evidence with _$Evidence {
  factory Evidence({
    @JsonKey(name: 'ID') String? id,
    @JsonKey(name: 'Code') CodeableConcept? code,
    @JsonKey(name: 'Detail') List<Reference?>? detail,
  }) = _Evidence;

  factory Evidence.fromJson(Map<String, dynamic> json) =>
      _$EvidenceFromJson(json);
}

@freezed
class Composition with _$Composition {
  factory Composition(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'Identifier') Identifier? identifier,
      @JsonKey(name: 'Status') CompositionStatusEnum? status,
      @JsonKey(name: 'Type') CodeableConcept? type,
      @JsonKey(name: 'Category') List<CodeableConcept?>? category,
      @JsonKey(name: 'Subject') Reference? subject,
      @JsonKey(name: 'Encounter') Reference? encounter,
      @JsonKey(name: 'Date') String? date,
      @JsonKey(name: 'Author') List<Reference?>? author,
      @JsonKey(name: 'Title') String? title,
      @JsonKey(name: 'Confidentiality') String? confidentiality,
      @JsonKey(name: 'Attester') List<Attester?>? attester,
      @JsonKey(name: 'Custodian') Reference? custodian,
      @JsonKey(name: 'RelatesTo') List<RelatesTo?>? relatesTo,
      @JsonKey(name: 'Event') List<Event?>? event,
      @JsonKey(name: 'Section') List<Section?>? section}) = _Composition;

  factory Composition.fromJson(Map<String, dynamic> json) =>
      _$CompositionFromJson(json);
}

@freezed
class TimingRepeat with _$TimingRepeat {
  factory TimingRepeat({
    @JsonKey(name: 'ID') String? id,
    @JsonKey(name: 'BoundsDuration') Duration? boundsDuration,
    @JsonKey(name: 'BoundsRange') Range? boundsRange,
    @JsonKey(name: 'BoundsPeriod') Period? boundsPeriod,
    @JsonKey(name: 'Count') int? count,
    @JsonKey(name: 'CountMax') int? countMax,
    @JsonKey(name: 'Duration') double? duration,
    @JsonKey(name: 'DurationMax') double? durationMax,
    @JsonKey(name: 'DurationUnit') TimingRepeatPeriodUnit? durationUnit,
    @JsonKey(name: 'Frequency') int? frequency,
    @JsonKey(name: 'FrequencyMax') int? frequencyMax,
    @JsonKey(name: 'Period') double? period,
    @JsonKey(name: 'PeriodMax') double? periodMax,
    @JsonKey(name: 'PeriodUnit') TimingRepeatPeriodUnit? periodUnit,
    @JsonKey(name: 'DayOfWeek') DayOfWeek? dayOfWeek,
    @JsonKey(name: 'When') TimingRepeatPeriodUnit? when,
    @JsonKey(name: 'Offset') int? offset,
  }) = _TimingRepeat;

  factory TimingRepeat.fromJson(Map<String, dynamic> json) =>
      _$TimingRepeatFromJson(json);
}

@freezed
class Timing with _$Timing {
  factory Timing({
    @JsonKey(name: 'ID') String? id,
    @JsonKey(name: 'Event') Duration? event,
    @JsonKey(name: 'Repeat') TimingRepeat? repeat,
    @JsonKey(name: 'Code') TimingCodes? code,
  }) = _Timing;

  factory Timing.fromJson(Map<String, dynamic> json) => _$TimingFromJson(json);
}

@freezed
class RateRatio with _$RateRatio {
  factory RateRatio({
    @JsonKey(name: 'ID') String? id,
    @JsonKey(name: 'Numerator') Quantity? numerator,
    @JsonKey(name: 'Denominator') Quantity? denominator,
  }) = _RateRatio;

  factory RateRatio.fromJson(Map<String, dynamic> json) =>
      _$RateRatioFromJson(json);
}

@freezed
class DosageDoseAndRate with _$DosageDoseAndRate {
  factory DosageDoseAndRate({
    @JsonKey(name: 'ID') String? id,
    @JsonKey(name: 'Type') CodeableConcept? type,
    @JsonKey(name: 'DoseRange') Range? doseRange,
    @JsonKey(name: 'DoseQuantity') Quantity? doseQuantity,
    @JsonKey(name: 'RateRatio') RateRatio? rateRatio,
    @JsonKey(name: 'RateRange') Range? rateRange,
    @JsonKey(name: 'RateQuantity') Quantity? rateQuantity,
  }) = _DosageDoseAndRate;

  factory DosageDoseAndRate.fromJson(Map<String, dynamic> json) =>
      _$DosageDoseAndRateFromJson(json);
}
