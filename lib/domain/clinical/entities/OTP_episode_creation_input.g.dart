// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OTP_episode_creation_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OTPEpisodeCreationInput _$_$_OTPEpisodeCreationInputFromJson(
    Map<String, dynamic> json) {
  return _$_OTPEpisodeCreationInput(
    patientID: json['patientID'] as String?,
    providerCode: json['providerCode'] as String?,
    msisdn: json['msisdn'] as String?,
    otp: json['otp'] as String?,
    fullAccess: json['fullAccess'] as bool,
  );
}

Map<String, dynamic> _$_$_OTPEpisodeCreationInputToJson(
        _$_OTPEpisodeCreationInput instance) =>
    <String, dynamic>{
      'patientID': instance.patientID,
      'providerCode': instance.providerCode,
      'msisdn': instance.msisdn,
      'otp': instance.otp,
      'fullAccess': instance.fullAccess,
    };
