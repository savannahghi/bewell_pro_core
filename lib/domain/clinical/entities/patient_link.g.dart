// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PatientLink _$$_PatientLinkFromJson(Map<String, dynamic> json) =>
    _$_PatientLink(
      id: json['ID'] as String?,
      other: json['Other'] == null
          ? null
          : Reference.fromJson(json['Other'] as Map<String, dynamic>),
      type: $enumDecodeNullable(_$PatientLinkTypeEnumEnumMap, json['Type'],
          unknownValue: PatientLinkTypeEnum.refer),
    );

Map<String, dynamic> _$$_PatientLinkToJson(_$_PatientLink instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Other': instance.other?.toJson(),
      'Type': _$PatientLinkTypeEnumEnumMap[instance.type],
    };

const _$PatientLinkTypeEnumEnumMap = {
  PatientLinkTypeEnum.replaced_by: 'replaced_by',
  PatientLinkTypeEnum.replaces: 'replaces',
  PatientLinkTypeEnum.refer: 'refer',
  PatientLinkTypeEnum.seealso: 'seealso',
};
