// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medication_request_dispense.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MedicationRequestDispense _$$_MedicationRequestDispenseFromJson(
        Map<String, dynamic> json) =>
    _$_MedicationRequestDispense(
      id: json['ID'] as String?,
      initialFill: json['InitialFill'] == null
          ? null
          : MedicationRequestInitialFill.fromJson(
              json['InitialFill'] as Map<String, dynamic>),
      dispenseInterval: json['DispenseInterval'] == null
          ? null
          : Duration(microseconds: json['DispenseInterval'] as int),
      validityPeriod: json['ValidityPeriod'] == null
          ? null
          : Period.fromJson(json['ValidityPeriod'] as Map<String, dynamic>),
      numberOfRepeatsAllowed: json['NumberOfRepeatsAllowed'] as int?,
      quantity: json['Quantity'] == null
          ? null
          : Quantity.fromJson(json['Quantity'] as Map<String, dynamic>),
      expectedSupplyDuration: json['ExpectedSupplyDuration'] == null
          ? null
          : Duration(microseconds: json['ExpectedSupplyDuration'] as int),
      performer: json['Performer'] == null
          ? null
          : Reference.fromJson(json['Performer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_MedicationRequestDispenseToJson(
        _$_MedicationRequestDispense instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'InitialFill': instance.initialFill?.toJson(),
      'DispenseInterval': instance.dispenseInterval?.inMicroseconds,
      'ValidityPeriod': instance.validityPeriod?.toJson(),
      'NumberOfRepeatsAllowed': instance.numberOfRepeatsAllowed,
      'Quantity': instance.quantity?.toJson(),
      'ExpectedSupplyDuration': instance.expectedSupplyDuration?.inMicroseconds,
      'Performer': instance.performer?.toJson(),
    };
