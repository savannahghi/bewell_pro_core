// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_registration_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserRegistrationState _$UserRegistrationStateFromJson(
    Map<String, dynamic> json) {
  return _UserRegistrationState.fromJson(json);
}

/// @nodoc
mixin _$UserRegistrationState {
  String get userType => throw _privateConstructorUsedError;
  String get userRegistrationMutation => throw _privateConstructorUsedError;
  String get userResponse => throw _privateConstructorUsedError;
  String get primaryRouteName => throw _privateConstructorUsedError;
  String get secondaryRouteName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserRegistrationStateCopyWith<UserRegistrationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRegistrationStateCopyWith<$Res> {
  factory $UserRegistrationStateCopyWith(UserRegistrationState value,
          $Res Function(UserRegistrationState) then) =
      _$UserRegistrationStateCopyWithImpl<$Res, UserRegistrationState>;
  @useResult
  $Res call(
      {String userType,
      String userRegistrationMutation,
      String userResponse,
      String primaryRouteName,
      String secondaryRouteName});
}

/// @nodoc
class _$UserRegistrationStateCopyWithImpl<$Res,
        $Val extends UserRegistrationState>
    implements $UserRegistrationStateCopyWith<$Res> {
  _$UserRegistrationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userType = null,
    Object? userRegistrationMutation = null,
    Object? userResponse = null,
    Object? primaryRouteName = null,
    Object? secondaryRouteName = null,
  }) {
    return _then(_value.copyWith(
      userType: null == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as String,
      userRegistrationMutation: null == userRegistrationMutation
          ? _value.userRegistrationMutation
          : userRegistrationMutation // ignore: cast_nullable_to_non_nullable
              as String,
      userResponse: null == userResponse
          ? _value.userResponse
          : userResponse // ignore: cast_nullable_to_non_nullable
              as String,
      primaryRouteName: null == primaryRouteName
          ? _value.primaryRouteName
          : primaryRouteName // ignore: cast_nullable_to_non_nullable
              as String,
      secondaryRouteName: null == secondaryRouteName
          ? _value.secondaryRouteName
          : secondaryRouteName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserRegistrationStateCopyWith<$Res>
    implements $UserRegistrationStateCopyWith<$Res> {
  factory _$$_UserRegistrationStateCopyWith(_$_UserRegistrationState value,
          $Res Function(_$_UserRegistrationState) then) =
      __$$_UserRegistrationStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userType,
      String userRegistrationMutation,
      String userResponse,
      String primaryRouteName,
      String secondaryRouteName});
}

/// @nodoc
class __$$_UserRegistrationStateCopyWithImpl<$Res>
    extends _$UserRegistrationStateCopyWithImpl<$Res, _$_UserRegistrationState>
    implements _$$_UserRegistrationStateCopyWith<$Res> {
  __$$_UserRegistrationStateCopyWithImpl(_$_UserRegistrationState _value,
      $Res Function(_$_UserRegistrationState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userType = null,
    Object? userRegistrationMutation = null,
    Object? userResponse = null,
    Object? primaryRouteName = null,
    Object? secondaryRouteName = null,
  }) {
    return _then(_$_UserRegistrationState(
      userType: null == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as String,
      userRegistrationMutation: null == userRegistrationMutation
          ? _value.userRegistrationMutation
          : userRegistrationMutation // ignore: cast_nullable_to_non_nullable
              as String,
      userResponse: null == userResponse
          ? _value.userResponse
          : userResponse // ignore: cast_nullable_to_non_nullable
              as String,
      primaryRouteName: null == primaryRouteName
          ? _value.primaryRouteName
          : primaryRouteName // ignore: cast_nullable_to_non_nullable
              as String,
      secondaryRouteName: null == secondaryRouteName
          ? _value.secondaryRouteName
          : secondaryRouteName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserRegistrationState implements _UserRegistrationState {
  _$_UserRegistrationState(
      {required this.userType,
      required this.userRegistrationMutation,
      required this.userResponse,
      required this.primaryRouteName,
      required this.secondaryRouteName});

  factory _$_UserRegistrationState.fromJson(Map<String, dynamic> json) =>
      _$$_UserRegistrationStateFromJson(json);

  @override
  final String userType;
  @override
  final String userRegistrationMutation;
  @override
  final String userResponse;
  @override
  final String primaryRouteName;
  @override
  final String secondaryRouteName;

  @override
  String toString() {
    return 'UserRegistrationState(userType: $userType, userRegistrationMutation: $userRegistrationMutation, userResponse: $userResponse, primaryRouteName: $primaryRouteName, secondaryRouteName: $secondaryRouteName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserRegistrationState &&
            (identical(other.userType, userType) ||
                other.userType == userType) &&
            (identical(
                    other.userRegistrationMutation, userRegistrationMutation) ||
                other.userRegistrationMutation == userRegistrationMutation) &&
            (identical(other.userResponse, userResponse) ||
                other.userResponse == userResponse) &&
            (identical(other.primaryRouteName, primaryRouteName) ||
                other.primaryRouteName == primaryRouteName) &&
            (identical(other.secondaryRouteName, secondaryRouteName) ||
                other.secondaryRouteName == secondaryRouteName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userType,
      userRegistrationMutation,
      userResponse,
      primaryRouteName,
      secondaryRouteName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserRegistrationStateCopyWith<_$_UserRegistrationState> get copyWith =>
      __$$_UserRegistrationStateCopyWithImpl<_$_UserRegistrationState>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserRegistrationStateToJson(
      this,
    );
  }
}

abstract class _UserRegistrationState implements UserRegistrationState {
  factory _UserRegistrationState(
      {required final String userType,
      required final String userRegistrationMutation,
      required final String userResponse,
      required final String primaryRouteName,
      required final String secondaryRouteName}) = _$_UserRegistrationState;

  factory _UserRegistrationState.fromJson(Map<String, dynamic> json) =
      _$_UserRegistrationState.fromJson;

  @override
  String get userType;
  @override
  String get userRegistrationMutation;
  @override
  String get userResponse;
  @override
  String get primaryRouteName;
  @override
  String get secondaryRouteName;
  @override
  @JsonKey(ignore: true)
  _$$_UserRegistrationStateCopyWith<_$_UserRegistrationState> get copyWith =>
      throw _privateConstructorUsedError;
}
