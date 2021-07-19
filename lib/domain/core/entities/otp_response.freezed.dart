// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'otp_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OTPResponse _$OTPResponseFromJson(Map<String, dynamic> json) {
  return _OTPResponse.fromJson(json);
}

/// @nodoc
class _$OTPResponseTearOff {
  const _$OTPResponseTearOff();

  _OTPResponse call({@JsonKey(name: 'otp') String? otp}) {
    return _OTPResponse(
      otp: otp,
    );
  }

  OTPResponse fromJson(Map<String, Object> json) {
    return OTPResponse.fromJson(json);
  }
}

/// @nodoc
const $OTPResponse = _$OTPResponseTearOff();

/// @nodoc
mixin _$OTPResponse {
  @JsonKey(name: 'otp')
  String? get otp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OTPResponseCopyWith<OTPResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OTPResponseCopyWith<$Res> {
  factory $OTPResponseCopyWith(
          OTPResponse value, $Res Function(OTPResponse) then) =
      _$OTPResponseCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'otp') String? otp});
}

/// @nodoc
class _$OTPResponseCopyWithImpl<$Res> implements $OTPResponseCopyWith<$Res> {
  _$OTPResponseCopyWithImpl(this._value, this._then);

  final OTPResponse _value;
  // ignore: unused_field
  final $Res Function(OTPResponse) _then;

  @override
  $Res call({
    Object? otp = freezed,
  }) {
    return _then(_value.copyWith(
      otp: otp == freezed
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$OTPResponseCopyWith<$Res>
    implements $OTPResponseCopyWith<$Res> {
  factory _$OTPResponseCopyWith(
          _OTPResponse value, $Res Function(_OTPResponse) then) =
      __$OTPResponseCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'otp') String? otp});
}

/// @nodoc
class __$OTPResponseCopyWithImpl<$Res> extends _$OTPResponseCopyWithImpl<$Res>
    implements _$OTPResponseCopyWith<$Res> {
  __$OTPResponseCopyWithImpl(
      _OTPResponse _value, $Res Function(_OTPResponse) _then)
      : super(_value, (v) => _then(v as _OTPResponse));

  @override
  _OTPResponse get _value => super._value as _OTPResponse;

  @override
  $Res call({
    Object? otp = freezed,
  }) {
    return _then(_OTPResponse(
      otp: otp == freezed
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OTPResponse implements _OTPResponse {
  _$_OTPResponse({@JsonKey(name: 'otp') this.otp});

  factory _$_OTPResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_OTPResponseFromJson(json);

  @override
  @JsonKey(name: 'otp')
  final String? otp;

  @override
  String toString() {
    return 'OTPResponse(otp: $otp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OTPResponse &&
            (identical(other.otp, otp) ||
                const DeepCollectionEquality().equals(other.otp, otp)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(otp);

  @JsonKey(ignore: true)
  @override
  _$OTPResponseCopyWith<_OTPResponse> get copyWith =>
      __$OTPResponseCopyWithImpl<_OTPResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_OTPResponseToJson(this);
  }
}

abstract class _OTPResponse implements OTPResponse {
  factory _OTPResponse({@JsonKey(name: 'otp') String? otp}) = _$_OTPResponse;

  factory _OTPResponse.fromJson(Map<String, dynamic> json) =
      _$_OTPResponse.fromJson;

  @override
  @JsonKey(name: 'otp')
  String? get otp => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$OTPResponseCopyWith<_OTPResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
