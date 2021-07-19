// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supporting_documents.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupportingDocument _$SupportingDocumentFromJson(Map<String, dynamic> json) {
  return SupportingDocument(
    supportingDocumentTitle: json['supportingDocumentTitle'] as String,
    supportingDocumentDescription:
        json['supportingDocumentDescription'] as String,
    supportingDocumentUpload: json['supportingDocumentUpload'] as String,
  );
}

Map<String, dynamic> _$SupportingDocumentToJson(SupportingDocument instance) =>
    <String, dynamic>{
      'supportingDocumentTitle': instance.supportingDocumentTitle,
      'supportingDocumentDescription': instance.supportingDocumentDescription,
      'supportingDocumentUpload': instance.supportingDocumentUpload,
    };
