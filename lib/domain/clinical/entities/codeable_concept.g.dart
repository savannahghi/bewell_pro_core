// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'codeable_concept.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CodeableConcept _$$_CodeableConceptFromJson(Map<String, dynamic> json) =>
    _$_CodeableConcept(
      id: json['ID'] as String?,
      coding: (json['Coding'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Coding.fromJson(e as Map<String, dynamic>))
          .toList(),
      text: json['Text'] as String?,
    );

Map<String, dynamic> _$$_CodeableConceptToJson(_$_CodeableConcept instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Coding': instance.coding?.map((e) => e?.toJson()).toList(),
      'Text': instance.text,
    };
