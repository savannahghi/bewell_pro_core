// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Identification _$IdentificationFromJson(Map<String, dynamic> json) {
  return Identification(
    identificationDocType: json['identificationDocType'] as String,
    identificationDocNumber: json['identificationDocNumber'] as String,
    identificationDocNumberUploadID:
        json['identificationDocNumberUploadID'] as String,
  );
}

Map<String, dynamic> _$IdentificationToJson(Identification instance) =>
    <String, dynamic>{
      'identificationDocType': instance.identificationDocType,
      'identificationDocNumber': instance.identificationDocNumber,
      'identificationDocNumberUploadID':
          instance.identificationDocNumberUploadID,
    };
