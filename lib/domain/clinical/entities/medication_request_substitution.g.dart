// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medication_request_substitution.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MedicationRequestSubstitution _$$_MedicationRequestSubstitutionFromJson(
        Map<String, dynamic> json) =>
    _$_MedicationRequestSubstitution(
      id: json['ID'] as String?,
      allowedBoolean: json['AllowedBoolean'] as bool?,
      allowedCodeableConcept: json['AllowedCodeableConcept'] == null
          ? null
          : CodeableConcept.fromJson(
              json['AllowedCodeableConcept'] as Map<String, dynamic>),
      reason: json['Reason'] == null
          ? null
          : CodeableConcept.fromJson(json['Reason'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_MedicationRequestSubstitutionToJson(
        _$_MedicationRequestSubstitution instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'AllowedBoolean': instance.allowedBoolean,
      'AllowedCodeableConcept': instance.allowedCodeableConcept?.toJson(),
      'Reason': instance.reason?.toJson(),
    };
