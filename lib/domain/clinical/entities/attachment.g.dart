// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attachment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Attachment _$$_AttachmentFromJson(Map<String, dynamic> json) =>
    _$_Attachment(
      id: json['ID'] as String?,
      contentType: json['ContentType'] as String?,
      language: json['Language'] as String?,
      data: json['Data'] as String?,
      url: json['Url'] as String?,
      size: json['Size'] as int?,
      hash: json['Hash'] as String?,
      title: json['Title'] as String?,
      creation: json['Creation'] as String?,
    );

Map<String, dynamic> _$$_AttachmentToJson(_$_Attachment instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'ContentType': instance.contentType,
      'Language': instance.language,
      'Data': instance.data,
      'Url': instance.url,
      'Size': instance.size,
      'Hash': instance.hash,
      'Title': instance.title,
      'Creation': instance.creation,
    };
