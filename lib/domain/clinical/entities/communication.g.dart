// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'communication.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Communication _$_$_CommunicationFromJson(Map<String, dynamic> json) {
  return _$_Communication(
    id: json['ID'] as String?,
    language: json['language'] == null
        ? null
        : CodeableConcept.fromJson(json['language'] as Map<String, dynamic>),
    preferred: json['preferred'] as bool?,
  );
}

Map<String, dynamic> _$_$_CommunicationToJson(_$_Communication instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'language': instance.language?.toJson(),
      'preferred': instance.preferred,
    };
