// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'narrative.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Narrative _$$_NarrativeFromJson(Map<String, dynamic> json) => _$_Narrative(
      id: json['ID'] as String?,
      status: $enumDecodeNullable(_$NarrativeStatusEnumEnumMap, json['Status'],
          unknownValue: NarrativeStatusEnum.empty),
      div: json['Div'] as String?,
    );

Map<String, dynamic> _$$_NarrativeToJson(_$_Narrative instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Status': _$NarrativeStatusEnumEnumMap[instance.status],
      'Div': instance.div,
    };

const _$NarrativeStatusEnumEnumMap = {
  NarrativeStatusEnum.generated: 'generated',
  NarrativeStatusEnum.extensions: 'extensions',
  NarrativeStatusEnum.additional: 'additional',
  NarrativeStatusEnum.empty: 'empty',
};
