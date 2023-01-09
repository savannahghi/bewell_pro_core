// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'OTP_episode_creation_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OTPEpisodeCreationInput _$OTPEpisodeCreationInputFromJson(
    Map<String, dynamic> json) {
  return _OTPEpisodeCreationInput.fromJson(json);
}

/// @nodoc
mixin _$OTPEpisodeCreationInput {
  String? get patientID => throw _privateConstructorUsedError;
  String? get providerCode => throw _privateConstructorUsedError;
  String? get msisdn => throw _privateConstructorUsedError;
  String? get otp => throw _privateConstructorUsedError;
  bool get fullAccess => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OTPEpisodeCreationInputCopyWith<OTPEpisodeCreationInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OTPEpisodeCreationInputCopyWith<$Res> {
  factory $OTPEpisodeCreationInputCopyWith(OTPEpisodeCreationInput value,
          $Res Function(OTPEpisodeCreationInput) then) =
      _$OTPEpisodeCreationInputCopyWithImpl<$Res, OTPEpisodeCreationInput>;
  @useResult
  $Res call(
      {String? patientID,
      String? providerCode,
      String? msisdn,
      String? otp,
      bool fullAccess});
}

/// @nodoc
class _$OTPEpisodeCreationInputCopyWithImpl<$Res,
        $Val extends OTPEpisodeCreationInput>
    implements $OTPEpisodeCreationInputCopyWith<$Res> {
  _$OTPEpisodeCreationInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? patientID = freezed,
    Object? providerCode = freezed,
    Object? msisdn = freezed,
    Object? otp = freezed,
    Object? fullAccess = null,
  }) {
    return _then(_value.copyWith(
      patientID: freezed == patientID
          ? _value.patientID
          : patientID // ignore: cast_nullable_to_non_nullable
              as String?,
      providerCode: freezed == providerCode
          ? _value.providerCode
          : providerCode // ignore: cast_nullable_to_non_nullable
              as String?,
      msisdn: freezed == msisdn
          ? _value.msisdn
          : msisdn // ignore: cast_nullable_to_non_nullable
              as String?,
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
      fullAccess: null == fullAccess
          ? _value.fullAccess
          : fullAccess // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OTPEpisodeCreationInputCopyWith<$Res>
    implements $OTPEpisodeCreationInputCopyWith<$Res> {
  factory _$$_OTPEpisodeCreationInputCopyWith(_$_OTPEpisodeCreationInput value,
          $Res Function(_$_OTPEpisodeCreationInput) then) =
      __$$_OTPEpisodeCreationInputCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? patientID,
      String? providerCode,
      String? msisdn,
      String? otp,
      bool fullAccess});
}

/// @nodoc
class __$$_OTPEpisodeCreationInputCopyWithImpl<$Res>
    extends _$OTPEpisodeCreationInputCopyWithImpl<$Res,
        _$_OTPEpisodeCreationInput>
    implements _$$_OTPEpisodeCreationInputCopyWith<$Res> {
  __$$_OTPEpisodeCreationInputCopyWithImpl(_$_OTPEpisodeCreationInput _value,
      $Res Function(_$_OTPEpisodeCreationInput) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? patientID = freezed,
    Object? providerCode = freezed,
    Object? msisdn = freezed,
    Object? otp = freezed,
    Object? fullAccess = null,
  }) {
    return _then(_$_OTPEpisodeCreationInput(
      patientID: freezed == patientID
          ? _value.patientID
          : patientID // ignore: cast_nullable_to_non_nullable
              as String?,
      providerCode: freezed == providerCode
          ? _value.providerCode
          : providerCode // ignore: cast_nullable_to_non_nullable
              as String?,
      msisdn: freezed == msisdn
          ? _value.msisdn
          : msisdn // ignore: cast_nullable_to_non_nullable
              as String?,
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
      fullAccess: null == fullAccess
          ? _value.fullAccess
          : fullAccess // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OTPEpisodeCreationInput implements _OTPEpisodeCreationInput {
  _$_OTPEpisodeCreationInput(
      {required this.patientID,
      required this.providerCode,
      required this.msisdn,
      required this.otp,
      required this.fullAccess});

  factory _$_OTPEpisodeCreationInput.fromJson(Map<String, dynamic> json) =>
      _$$_OTPEpisodeCreationInputFromJson(json);

  @override
  final String? patientID;
  @override
  final String? providerCode;
  @override
  final String? msisdn;
  @override
  final String? otp;
  @override
  final bool fullAccess;

  @override
  String toString() {
    return 'OTPEpisodeCreationInput(patientID: $patientID, providerCode: $providerCode, msisdn: $msisdn, otp: $otp, fullAccess: $fullAccess)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OTPEpisodeCreationInput &&
            (identical(other.patientID, patientID) ||
                other.patientID == patientID) &&
            (identical(other.providerCode, providerCode) ||
                other.providerCode == providerCode) &&
            (identical(other.msisdn, msisdn) || other.msisdn == msisdn) &&
            (identical(other.otp, otp) || other.otp == otp) &&
            (identical(other.fullAccess, fullAccess) ||
                other.fullAccess == fullAccess));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, patientID, providerCode, msisdn, otp, fullAccess);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OTPEpisodeCreationInputCopyWith<_$_OTPEpisodeCreationInput>
      get copyWith =>
          __$$_OTPEpisodeCreationInputCopyWithImpl<_$_OTPEpisodeCreationInput>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OTPEpisodeCreationInputToJson(
      this,
    );
  }
}

abstract class _OTPEpisodeCreationInput implements OTPEpisodeCreationInput {
  factory _OTPEpisodeCreationInput(
      {required final String? patientID,
      required final String? providerCode,
      required final String? msisdn,
      required final String? otp,
      required final bool fullAccess}) = _$_OTPEpisodeCreationInput;

  factory _OTPEpisodeCreationInput.fromJson(Map<String, dynamic> json) =
      _$_OTPEpisodeCreationInput.fromJson;

  @override
  String? get patientID;
  @override
  String? get providerCode;
  @override
  String? get msisdn;
  @override
  String? get otp;
  @override
  bool get fullAccess;
  @override
  @JsonKey(ignore: true)
  _$$_OTPEpisodeCreationInputCopyWith<_$_OTPEpisodeCreationInput>
      get copyWith => throw _privateConstructorUsedError;
}
