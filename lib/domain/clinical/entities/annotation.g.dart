// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'annotation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Annotation _$_$_AnnotationFromJson(Map<String, dynamic> json) {
  return _$_Annotation(
    id: json['ID'] as String?,
    authorReference: json['AuthorReference'] == null
        ? null
        : Reference.fromJson(json['AuthorReference'] as Map<String, dynamic>),
    authorString: json['AuthorString'] as String?,
    time: json['Time'] == null ? null : DateTime.parse(json['Time'] as String),
    text: json['Text'] as String?,
  );
}

Map<String, dynamic> _$_$_AnnotationToJson(_$_Annotation instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'AuthorReference': instance.authorReference?.toJson(),
      'AuthorString': instance.authorString,
      'Time': instance.time?.toIso8601String(),
      'Text': instance.text,
    };
