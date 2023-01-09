// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medication_request_initial_fill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MedicationRequestInitialFill _$$_MedicationRequestInitialFillFromJson(
        Map<String, dynamic> json) =>
    _$_MedicationRequestInitialFill(
      id: json['ID'] as String?,
      quantity: json['Quantity'] == null
          ? null
          : Quantity.fromJson(json['Quantity'] as Map<String, dynamic>),
      duration: json['Duration'] == null
          ? null
          : Duration(microseconds: json['Duration'] as int),
    );

Map<String, dynamic> _$$_MedicationRequestInitialFillToJson(
        _$_MedicationRequestInitialFill instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Quantity': instance.quantity?.toJson(),
      'Duration': instance.duration?.inMicroseconds,
    };
