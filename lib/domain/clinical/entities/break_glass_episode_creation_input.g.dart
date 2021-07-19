// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'break_glass_episode_creation_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BreakGlassEpisodeCreationInput _$_$_BreakGlassEpisodeCreationInputFromJson(
    Map<String, dynamic> json) {
  return _$_BreakGlassEpisodeCreationInput(
    patientID: json['patientID'] as String?,
    providerCode: json['providerCode'] as String?,
    practitionerUID: json['practitionerUID'] as String?,
    providerPhone: json['providerPhone'] as String?,
    otp: json['otp'] as String?,
    fullAccess: json['fullAccess'] as bool?,
    patientPhone: json['patientPhone'] as String?,
  );
}

Map<String, dynamic> _$_$_BreakGlassEpisodeCreationInputToJson(
        _$_BreakGlassEpisodeCreationInput instance) =>
    <String, dynamic>{
      'patientID': instance.patientID,
      'providerCode': instance.providerCode,
      'practitionerUID': instance.practitionerUID,
      'providerPhone': instance.providerPhone,
      'otp': instance.otp,
      'fullAccess': instance.fullAccess,
      'patientPhone': instance.patientPhone,
    };
