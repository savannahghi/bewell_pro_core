// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserState _$UserStateFromJson(Map<String, dynamic> json) {
  return _UserState.fromJson(json);
}

/// @nodoc
mixin _$UserState {
// sourced from the response fo login
  UserProfile? get userProfile => throw _privateConstructorUsedError;
  Customer? get customerProfile => throw _privateConstructorUsedError;
  CommunicationSettings? get communicationSettings =>
      throw _privateConstructorUsedError;
  AuthCredentialResponse? get auth =>
      throw _privateConstructorUsedError; // generate from the app
  bool? get isSignedIn => throw _privateConstructorUsedError;
  String? get signedInTime => throw _privateConstructorUsedError;
  String? get inActivitySetInTime => throw _privateConstructorUsedError;
  String? get tokenExpiryTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserStateCopyWith<UserState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res, UserState>;
  @useResult
  $Res call(
      {UserProfile? userProfile,
      Customer? customerProfile,
      CommunicationSettings? communicationSettings,
      AuthCredentialResponse? auth,
      bool? isSignedIn,
      String? signedInTime,
      String? inActivitySetInTime,
      String? tokenExpiryTime});

  $UserProfileCopyWith<$Res>? get userProfile;
  $CustomerCopyWith<$Res>? get customerProfile;
  $CommunicationSettingsCopyWith<$Res>? get communicationSettings;
  $AuthCredentialResponseCopyWith<$Res>? get auth;
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res, $Val extends UserState>
    implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userProfile = freezed,
    Object? customerProfile = freezed,
    Object? communicationSettings = freezed,
    Object? auth = freezed,
    Object? isSignedIn = freezed,
    Object? signedInTime = freezed,
    Object? inActivitySetInTime = freezed,
    Object? tokenExpiryTime = freezed,
  }) {
    return _then(_value.copyWith(
      userProfile: freezed == userProfile
          ? _value.userProfile
          : userProfile // ignore: cast_nullable_to_non_nullable
              as UserProfile?,
      customerProfile: freezed == customerProfile
          ? _value.customerProfile
          : customerProfile // ignore: cast_nullable_to_non_nullable
              as Customer?,
      communicationSettings: freezed == communicationSettings
          ? _value.communicationSettings
          : communicationSettings // ignore: cast_nullable_to_non_nullable
              as CommunicationSettings?,
      auth: freezed == auth
          ? _value.auth
          : auth // ignore: cast_nullable_to_non_nullable
              as AuthCredentialResponse?,
      isSignedIn: freezed == isSignedIn
          ? _value.isSignedIn
          : isSignedIn // ignore: cast_nullable_to_non_nullable
              as bool?,
      signedInTime: freezed == signedInTime
          ? _value.signedInTime
          : signedInTime // ignore: cast_nullable_to_non_nullable
              as String?,
      inActivitySetInTime: freezed == inActivitySetInTime
          ? _value.inActivitySetInTime
          : inActivitySetInTime // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenExpiryTime: freezed == tokenExpiryTime
          ? _value.tokenExpiryTime
          : tokenExpiryTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserProfileCopyWith<$Res>? get userProfile {
    if (_value.userProfile == null) {
      return null;
    }

    return $UserProfileCopyWith<$Res>(_value.userProfile!, (value) {
      return _then(_value.copyWith(userProfile: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerCopyWith<$Res>? get customerProfile {
    if (_value.customerProfile == null) {
      return null;
    }

    return $CustomerCopyWith<$Res>(_value.customerProfile!, (value) {
      return _then(_value.copyWith(customerProfile: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CommunicationSettingsCopyWith<$Res>? get communicationSettings {
    if (_value.communicationSettings == null) {
      return null;
    }

    return $CommunicationSettingsCopyWith<$Res>(_value.communicationSettings!,
        (value) {
      return _then(_value.copyWith(communicationSettings: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AuthCredentialResponseCopyWith<$Res>? get auth {
    if (_value.auth == null) {
      return null;
    }

    return $AuthCredentialResponseCopyWith<$Res>(_value.auth!, (value) {
      return _then(_value.copyWith(auth: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserStateCopyWith<$Res> implements $UserStateCopyWith<$Res> {
  factory _$$_UserStateCopyWith(
          _$_UserState value, $Res Function(_$_UserState) then) =
      __$$_UserStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UserProfile? userProfile,
      Customer? customerProfile,
      CommunicationSettings? communicationSettings,
      AuthCredentialResponse? auth,
      bool? isSignedIn,
      String? signedInTime,
      String? inActivitySetInTime,
      String? tokenExpiryTime});

  @override
  $UserProfileCopyWith<$Res>? get userProfile;
  @override
  $CustomerCopyWith<$Res>? get customerProfile;
  @override
  $CommunicationSettingsCopyWith<$Res>? get communicationSettings;
  @override
  $AuthCredentialResponseCopyWith<$Res>? get auth;
}

/// @nodoc
class __$$_UserStateCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$_UserState>
    implements _$$_UserStateCopyWith<$Res> {
  __$$_UserStateCopyWithImpl(
      _$_UserState _value, $Res Function(_$_UserState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userProfile = freezed,
    Object? customerProfile = freezed,
    Object? communicationSettings = freezed,
    Object? auth = freezed,
    Object? isSignedIn = freezed,
    Object? signedInTime = freezed,
    Object? inActivitySetInTime = freezed,
    Object? tokenExpiryTime = freezed,
  }) {
    return _then(_$_UserState(
      userProfile: freezed == userProfile
          ? _value.userProfile
          : userProfile // ignore: cast_nullable_to_non_nullable
              as UserProfile?,
      customerProfile: freezed == customerProfile
          ? _value.customerProfile
          : customerProfile // ignore: cast_nullable_to_non_nullable
              as Customer?,
      communicationSettings: freezed == communicationSettings
          ? _value.communicationSettings
          : communicationSettings // ignore: cast_nullable_to_non_nullable
              as CommunicationSettings?,
      auth: freezed == auth
          ? _value.auth
          : auth // ignore: cast_nullable_to_non_nullable
              as AuthCredentialResponse?,
      isSignedIn: freezed == isSignedIn
          ? _value.isSignedIn
          : isSignedIn // ignore: cast_nullable_to_non_nullable
              as bool?,
      signedInTime: freezed == signedInTime
          ? _value.signedInTime
          : signedInTime // ignore: cast_nullable_to_non_nullable
              as String?,
      inActivitySetInTime: freezed == inActivitySetInTime
          ? _value.inActivitySetInTime
          : inActivitySetInTime // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenExpiryTime: freezed == tokenExpiryTime
          ? _value.tokenExpiryTime
          : tokenExpiryTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserState implements _UserState {
  _$_UserState(
      {this.userProfile,
      this.customerProfile,
      this.communicationSettings,
      this.auth,
      this.isSignedIn,
      this.signedInTime,
      this.inActivitySetInTime,
      this.tokenExpiryTime});

  factory _$_UserState.fromJson(Map<String, dynamic> json) =>
      _$$_UserStateFromJson(json);

// sourced from the response fo login
  @override
  final UserProfile? userProfile;
  @override
  final Customer? customerProfile;
  @override
  final CommunicationSettings? communicationSettings;
  @override
  final AuthCredentialResponse? auth;
// generate from the app
  @override
  final bool? isSignedIn;
  @override
  final String? signedInTime;
  @override
  final String? inActivitySetInTime;
  @override
  final String? tokenExpiryTime;

  @override
  String toString() {
    return 'UserState(userProfile: $userProfile, customerProfile: $customerProfile, communicationSettings: $communicationSettings, auth: $auth, isSignedIn: $isSignedIn, signedInTime: $signedInTime, inActivitySetInTime: $inActivitySetInTime, tokenExpiryTime: $tokenExpiryTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserState &&
            (identical(other.userProfile, userProfile) ||
                other.userProfile == userProfile) &&
            (identical(other.customerProfile, customerProfile) ||
                other.customerProfile == customerProfile) &&
            (identical(other.communicationSettings, communicationSettings) ||
                other.communicationSettings == communicationSettings) &&
            (identical(other.auth, auth) || other.auth == auth) &&
            (identical(other.isSignedIn, isSignedIn) ||
                other.isSignedIn == isSignedIn) &&
            (identical(other.signedInTime, signedInTime) ||
                other.signedInTime == signedInTime) &&
            (identical(other.inActivitySetInTime, inActivitySetInTime) ||
                other.inActivitySetInTime == inActivitySetInTime) &&
            (identical(other.tokenExpiryTime, tokenExpiryTime) ||
                other.tokenExpiryTime == tokenExpiryTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userProfile,
      customerProfile,
      communicationSettings,
      auth,
      isSignedIn,
      signedInTime,
      inActivitySetInTime,
      tokenExpiryTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserStateCopyWith<_$_UserState> get copyWith =>
      __$$_UserStateCopyWithImpl<_$_UserState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserStateToJson(
      this,
    );
  }
}

abstract class _UserState implements UserState {
  factory _UserState(
      {final UserProfile? userProfile,
      final Customer? customerProfile,
      final CommunicationSettings? communicationSettings,
      final AuthCredentialResponse? auth,
      final bool? isSignedIn,
      final String? signedInTime,
      final String? inActivitySetInTime,
      final String? tokenExpiryTime}) = _$_UserState;

  factory _UserState.fromJson(Map<String, dynamic> json) =
      _$_UserState.fromJson;

  @override // sourced from the response fo login
  UserProfile? get userProfile;
  @override
  Customer? get customerProfile;
  @override
  CommunicationSettings? get communicationSettings;
  @override
  AuthCredentialResponse? get auth;
  @override // generate from the app
  bool? get isSignedIn;
  @override
  String? get signedInTime;
  @override
  String? get inActivitySetInTime;
  @override
  String? get tokenExpiryTime;
  @override
  @JsonKey(ignore: true)
  _$$_UserStateCopyWith<_$_UserState> get copyWith =>
      throw _privateConstructorUsedError;
}
