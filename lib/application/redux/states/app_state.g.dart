// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppState _$_$_AppStateFromJson(Map<String, dynamic> json) {
  return _$_AppState(
    miscState: json['miscState'] == null
        ? null
        : MiscState.fromJson(json['miscState'] as Map<String, dynamic>),
    userFeedState: json['userFeedState'] == null
        ? null
        : UserFeedState.fromJson(json['userFeedState'] as Map<String, dynamic>),
    userState: json['userState'] == null
        ? null
        : UserState.fromJson(json['userState'] as Map<String, dynamic>),
    connectivityState: json['connectivityState'] == null
        ? null
        : ConnectivityState.fromJson(
            json['connectivityState'] as Map<String, dynamic>),
    clinicalState: json['clinicalState'] == null
        ? null
        : ClinicalState.fromJson(json['clinicalState'] as Map<String, dynamic>),
    navigationState: json['navigationState'] == null
        ? null
        : Navigation.fromJson(json['navigationState'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_AppStateToJson(_$_AppState instance) =>
    <String, dynamic>{
      'miscState': instance.miscState?.toJson(),
      'userFeedState': instance.userFeedState?.toJson(),
      'userState': instance.userState?.toJson(),
      'connectivityState': instance.connectivityState?.toJson(),
      'clinicalState': instance.clinicalState?.toJson(),
      'navigationState': instance.navigationState?.toJson(),
    };
