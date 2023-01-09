// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'otp_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OTPResponse _$OTPResponseFromJson(Map<String, dynamic> json) {
  return _OTPResponse.fromJson(json);
}

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
      _$OTPResponseCopyWithImpl<$Res, OTPResponse>;
  @useResult
  $Res call({@JsonKey(name: 'otp') String? otp});
}

/// @nodoc
class _$OTPResponseCopyWithImpl<$Res, $Val extends OTPResponse>
    implements $OTPResponseCopyWith<$Res> {
  _$OTPResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? otp = freezed,
  }) {
    return _then(_value.copyWith(
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OTPResponseCopyWith<$Res>
    implements $OTPResponseCopyWith<$Res> {
  factory _$$_OTPResponseCopyWith(
          _$_OTPResponse value, $Res Function(_$_OTPResponse) then) =
      __$$_OTPResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'otp') String? otp});
}

/// @nodoc
class __$$_OTPResponseCopyWithImpl<$Res>
    extends _$OTPResponseCopyWithImpl<$Res, _$_OTPResponse>
    implements _$$_OTPResponseCopyWith<$Res> {
  __$$_OTPResponseCopyWithImpl(
      _$_OTPResponse _value, $Res Function(_$_OTPResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? otp = freezed,
  }) {
    return _then(_$_OTPResponse(
      otp: freezed == otp
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
      _$$_OTPResponseFromJson(json);

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
        (other.runtimeType == runtimeType &&
            other is _$_OTPResponse &&
            (identical(other.otp, otp) || other.otp == otp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, otp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OTPResponseCopyWith<_$_OTPResponse> get copyWith =>
      __$$_OTPResponseCopyWithImpl<_$_OTPResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OTPResponseToJson(
      this,
    );
  }
}

abstract class _OTPResponse implements OTPResponse {
  factory _OTPResponse({@JsonKey(name: 'otp') final String? otp}) =
      _$_OTPResponse;

  factory _OTPResponse.fromJson(Map<String, dynamic> json) =
      _$_OTPResponse.fromJson;

  @override
  @JsonKey(name: 'otp')
  String? get otp;
  @override
  @JsonKey(ignore: true)
  _$$_OTPResponseCopyWith<_$_OTPResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
