// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reference.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Reference _$_$_ReferenceFromJson(Map<String, dynamic> json) {
  return _$_Reference(
    id: json['ID'] as String?,
    reference: json['Reference'] as String?,
    type: json['Type'] as String?,
    identifier: json['Identifier'] == null
        ? null
        : Identifier.fromJson(json['Identifier'] as Map<String, dynamic>),
    display: json['Display'] as String?,
  );
}

Map<String, dynamic> _$_$_ReferenceToJson(_$_Reference instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Reference': instance.reference,
      'Type': instance.type,
      'Identifier': instance.identifier?.toJson(),
      'Display': instance.display,
    };
