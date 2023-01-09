// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'range.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Range _$$_RangeFromJson(Map<String, dynamic> json) => _$_Range(
      id: json['ID'] as String?,
      low: json['Low'] == null
          ? null
          : Quantity.fromJson(json['Low'] as Map<String, dynamic>),
      high: json['High'] == null
          ? null
          : Quantity.fromJson(json['High'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_RangeToJson(_$_Range instance) => <String, dynamic>{
      'ID': instance.id,
      'Low': instance.low?.toJson(),
      'High': instance.high?.toJson(),
    };
