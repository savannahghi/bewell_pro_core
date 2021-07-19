// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'OTP_episode_creation_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OTPEpisodeCreationInput _$OTPEpisodeCreationInputFromJson(
    Map<String, dynamic> json) {
  return _OTPEpisodeCreationInput.fromJson(json);
}

/// @nodoc
class _$OTPEpisodeCreationInputTearOff {
  const _$OTPEpisodeCreationInputTearOff();

  _OTPEpisodeCreationInput call(
      {required String? patientID,
      required String? providerCode,
      required String? msisdn,
      required String? otp,
      required bool fullAccess}) {
    return _OTPEpisodeCreationInput(
      patientID: patientID,
      providerCode: providerCode,
      msisdn: msisdn,
      otp: otp,
      fullAccess: fullAccess,
    );
  }

  OTPEpisodeCreationInput fromJson(Map<String, Object> json) {
    return OTPEpisodeCreationInput.fromJson(json);
  }
}

/// @nodoc
const $OTPEpisodeCreationInput = _$OTPEpisodeCreationInputTearOff();

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
      _$OTPEpisodeCreationInputCopyWithImpl<$Res>;
  $Res call(
      {String? patientID,
      String? providerCode,
      String? msisdn,
      String? otp,
      bool fullAccess});
}

/// @nodoc
class _$OTPEpisodeCreationInputCopyWithImpl<$Res>
    implements $OTPEpisodeCreationInputCopyWith<$Res> {
  _$OTPEpisodeCreationInputCopyWithImpl(this._value, this._then);

  final OTPEpisodeCreationInput _value;
  // ignore: unused_field
  final $Res Function(OTPEpisodeCreationInput) _then;

  @override
  $Res call({
    Object? patientID = freezed,
    Object? providerCode = freezed,
    Object? msisdn = freezed,
    Object? otp = freezed,
    Object? fullAccess = freezed,
  }) {
    return _then(_value.copyWith(
      patientID: patientID == freezed
          ? _value.patientID
          : patientID // ignore: cast_nullable_to_non_nullable
              as String?,
      providerCode: providerCode == freezed
          ? _value.providerCode
          : providerCode // ignore: cast_nullable_to_non_nullable
              as String?,
      msisdn: msisdn == freezed
          ? _value.msisdn
          : msisdn // ignore: cast_nullable_to_non_nullable
              as String?,
      otp: otp == freezed
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
      fullAccess: fullAccess == freezed
          ? _value.fullAccess
          : fullAccess // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$OTPEpisodeCreationInputCopyWith<$Res>
    implements $OTPEpisodeCreationInputCopyWith<$Res> {
  factory _$OTPEpisodeCreationInputCopyWith(_OTPEpisodeCreationInput value,
          $Res Function(_OTPEpisodeCreationInput) then) =
      __$OTPEpisodeCreationInputCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? patientID,
      String? providerCode,
      String? msisdn,
      String? otp,
      bool fullAccess});
}

/// @nodoc
class __$OTPEpisodeCreationInputCopyWithImpl<$Res>
    extends _$OTPEpisodeCreationInputCopyWithImpl<$Res>
    implements _$OTPEpisodeCreationInputCopyWith<$Res> {
  __$OTPEpisodeCreationInputCopyWithImpl(_OTPEpisodeCreationInput _value,
      $Res Function(_OTPEpisodeCreationInput) _then)
      : super(_value, (v) => _then(v as _OTPEpisodeCreationInput));

  @override
  _OTPEpisodeCreationInput get _value =>
      super._value as _OTPEpisodeCreationInput;

  @override
  $Res call({
    Object? patientID = freezed,
    Object? providerCode = freezed,
    Object? msisdn = freezed,
    Object? otp = freezed,
    Object? fullAccess = freezed,
  }) {
    return _then(_OTPEpisodeCreationInput(
      patientID: patientID == freezed
          ? _value.patientID
          : patientID // ignore: cast_nullable_to_non_nullable
              as String?,
      providerCode: providerCode == freezed
          ? _value.providerCode
          : providerCode // ignore: cast_nullable_to_non_nullable
              as String?,
      msisdn: msisdn == freezed
          ? _value.msisdn
          : msisdn // ignore: cast_nullable_to_non_nullable
              as String?,
      otp: otp == freezed
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
      fullAccess: fullAccess == freezed
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
      _$_$_OTPEpisodeCreationInputFromJson(json);

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
        (other is _OTPEpisodeCreationInput &&
            (identical(other.patientID, patientID) ||
                const DeepCollectionEquality()
                    .equals(other.patientID, patientID)) &&
            (identical(other.providerCode, providerCode) ||
                const DeepCollectionEquality()
                    .equals(other.providerCode, providerCode)) &&
            (identical(other.msisdn, msisdn) ||
                const DeepCollectionEquality().equals(other.msisdn, msisdn)) &&
            (identical(other.otp, otp) ||
                const DeepCollectionEquality().equals(other.otp, otp)) &&
            (identical(other.fullAccess, fullAccess) ||
                const DeepCollectionEquality()
                    .equals(other.fullAccess, fullAccess)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(patientID) ^
      const DeepCollectionEquality().hash(providerCode) ^
      const DeepCollectionEquality().hash(msisdn) ^
      const DeepCollectionEquality().hash(otp) ^
      const DeepCollectionEquality().hash(fullAccess);

  @JsonKey(ignore: true)
  @override
  _$OTPEpisodeCreationInputCopyWith<_OTPEpisodeCreationInput> get copyWith =>
      __$OTPEpisodeCreationInputCopyWithImpl<_OTPEpisodeCreationInput>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_OTPEpisodeCreationInputToJson(this);
  }
}

abstract class _OTPEpisodeCreationInput implements OTPEpisodeCreationInput {
  factory _OTPEpisodeCreationInput(
      {required String? patientID,
      required String? providerCode,
      required String? msisdn,
      required String? otp,
      required bool fullAccess}) = _$_OTPEpisodeCreationInput;

  factory _OTPEpisodeCreationInput.fromJson(Map<String, dynamic> json) =
      _$_OTPEpisodeCreationInput.fromJson;

  @override
  String? get patientID => throw _privateConstructorUsedError;
  @override
  String? get providerCode => throw _privateConstructorUsedError;
  @override
  String? get msisdn => throw _privateConstructorUsedError;
  @override
  String? get otp => throw _privateConstructorUsedError;
  @override
  bool get fullAccess => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$OTPEpisodeCreationInputCopyWith<_OTPEpisodeCreationInput> get copyWith =>
      throw _privateConstructorUsedError;
}
