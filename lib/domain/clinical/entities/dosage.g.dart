// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dosage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Dosage _$$_DosageFromJson(Map<String, dynamic> json) => _$_Dosage(
      id: json['ID'] as String?,
      sequence: json['Sequence'] as int?,
      text: json['Text'] as String?,
      additionalInstruction: json['AdditionalInstruction'] == null
          ? null
          : CodeableConcept.fromJson(
              json['AdditionalInstruction'] as Map<String, dynamic>),
      patientInstruction: json['PatientInstruction'] as String?,
      timing: json['Timing'] == null
          ? null
          : Timing.fromJson(json['Timing'] as Map<String, dynamic>),
      asNeededBoolean: json['AsNeededBoolean'] as bool?,
      site: json['Site'] == null
          ? null
          : CodeableConcept.fromJson(json['Site'] as Map<String, dynamic>),
      route: json['Route'] == null
          ? null
          : CodeableConcept.fromJson(json['Route'] as Map<String, dynamic>),
      method: json['Method'] == null
          ? null
          : CodeableConcept.fromJson(json['Method'] as Map<String, dynamic>),
      doseAndRate: json['DoseAndRate'] == null
          ? null
          : DosageDoseAndRate.fromJson(
              json['DoseAndRate'] as Map<String, dynamic>),
      maxDosePerPeriod: json['MaxDosePerPeriod'] == null
          ? null
          : RateRatio.fromJson(
              json['MaxDosePerPeriod'] as Map<String, dynamic>),
      maxDosePerAdministration: json['MaxDosePerAdministration'] == null
          ? null
          : Quantity.fromJson(
              json['MaxDosePerAdministration'] as Map<String, dynamic>),
      maxDosePerLifetime: json['MaxDosePerLifetime'] == null
          ? null
          : Quantity.fromJson(
              json['MaxDosePerLifetime'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_DosageToJson(_$_Dosage instance) => <String, dynamic>{
      'ID': instance.id,
      'Sequence': instance.sequence,
      'Text': instance.text,
      'AdditionalInstruction': instance.additionalInstruction?.toJson(),
      'PatientInstruction': instance.patientInstruction,
      'Timing': instance.timing?.toJson(),
      'AsNeededBoolean': instance.asNeededBoolean,
      'Site': instance.site?.toJson(),
      'Route': instance.route?.toJson(),
      'Method': instance.method?.toJson(),
      'DoseAndRate': instance.doseAndRate?.toJson(),
      'MaxDosePerPeriod': instance.maxDosePerPeriod?.toJson(),
      'MaxDosePerAdministration': instance.maxDosePerAdministration?.toJson(),
      'MaxDosePerLifetime': instance.maxDosePerLifetime?.toJson(),
    };
