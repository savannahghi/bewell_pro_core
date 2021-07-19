import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bewell_pro_core/domain/clinical/entities/codeable_concept.dart';
import 'package:bewell_pro_core/domain/clinical/entities/fhir.dart';

part 'dosage.freezed.dart';
part 'dosage.g.dart';

@freezed
class Dosage with _$Dosage {
  factory Dosage({
    @JsonKey(name: 'ID') String? id,
    @JsonKey(name: 'Sequence') int? sequence,
    @JsonKey(name: 'Text') String? text,
    @JsonKey(name: 'AdditionalInstruction')
        CodeableConcept? additionalInstruction,
    @JsonKey(name: 'PatientInstruction') String? patientInstruction,
    @JsonKey(name: 'Timing') Timing? timing,
    @JsonKey(name: 'AsNeededBoolean') bool? asNeededBoolean,
    @JsonKey(name: 'Site') CodeableConcept? site,
    @JsonKey(name: 'Route') CodeableConcept? route,
    @JsonKey(name: 'Method') CodeableConcept? method,
    @JsonKey(name: 'DoseAndRate') DosageDoseAndRate? doseAndRate,
    @JsonKey(name: 'MaxDosePerPeriod') RateRatio? maxDosePerPeriod,
    @JsonKey(name: 'MaxDosePerAdministration')
        Quantity? maxDosePerAdministration,
    @JsonKey(name: 'MaxDosePerLifetime') Quantity? maxDosePerLifetime,
  }) = _Dosage;

  factory Dosage.fromJson(Map<String, dynamic> json) => _$DosageFromJson(json);
}
