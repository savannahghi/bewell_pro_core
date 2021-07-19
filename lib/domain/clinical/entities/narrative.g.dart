// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'narrative.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Narrative _$_$_NarrativeFromJson(Map<String, dynamic> json) {
  return _$_Narrative(
    id: json['ID'] as String?,
    status: _$enumDecodeNullable(_$NarrativeStatusEnumEnumMap, json['Status'],
        unknownValue: NarrativeStatusEnum.empty),
    div: json['Div'] as String?,
  );
}

Map<String, dynamic> _$_$_NarrativeToJson(_$_Narrative instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Status': _$NarrativeStatusEnumEnumMap[instance.status],
      'Div': instance.div,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$NarrativeStatusEnumEnumMap = {
  NarrativeStatusEnum.generated: 'generated',
  NarrativeStatusEnum.extensions: 'extensions',
  NarrativeStatusEnum.additional: 'additional',
  NarrativeStatusEnum.empty: 'empty',
};
