// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_registration_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserRegistrationState _$$_UserRegistrationStateFromJson(
        Map<String, dynamic> json) =>
    _$_UserRegistrationState(
      userType: json['userType'] as String,
      userRegistrationMutation: json['userRegistrationMutation'] as String,
      userResponse: json['userResponse'] as String,
      primaryRouteName: json['primaryRouteName'] as String,
      secondaryRouteName: json['secondaryRouteName'] as String,
    );

Map<String, dynamic> _$$_UserRegistrationStateToJson(
        _$_UserRegistrationState instance) =>
    <String, dynamic>{
      'userType': instance.userType,
      'userRegistrationMutation': instance.userRegistrationMutation,
      'userResponse': instance.userResponse,
      'primaryRouteName': instance.primaryRouteName,
      'secondaryRouteName': instance.secondaryRouteName,
    };
