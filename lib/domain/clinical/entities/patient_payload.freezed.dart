// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'patient_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PatientPayload _$PatientPayloadFromJson(Map<String, dynamic> json) {
  return _PatientPayload.fromJson(json);
}

/// @nodoc
class _$PatientPayloadTearOff {
  const _$PatientPayloadTearOff();

  _PatientPayload call(
      {@JsonKey(name: 'patientRecord') Patient? patientRecord,
      @JsonKey(name: 'hasOpenEpisodes') bool? hasOpenEpisodes,
      @JsonKey(name: 'openEpisodes') List<EpisodeOfCare?>? openEpisodes}) {
    return _PatientPayload(
      patientRecord: patientRecord,
      hasOpenEpisodes: hasOpenEpisodes,
      openEpisodes: openEpisodes,
    );
  }

  PatientPayload fromJson(Map<String, Object> json) {
    return PatientPayload.fromJson(json);
  }
}

/// @nodoc
const $PatientPayload = _$PatientPayloadTearOff();

/// @nodoc
mixin _$PatientPayload {
  @JsonKey(name: 'patientRecord')
  Patient? get patientRecord => throw _privateConstructorUsedError;
  @JsonKey(name: 'hasOpenEpisodes')
  bool? get hasOpenEpisodes => throw _privateConstructorUsedError;
  @JsonKey(name: 'openEpisodes')
  List<EpisodeOfCare?>? get openEpisodes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PatientPayloadCopyWith<PatientPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientPayloadCopyWith<$Res> {
  factory $PatientPayloadCopyWith(
          PatientPayload value, $Res Function(PatientPayload) then) =
      _$PatientPayloadCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'patientRecord') Patient? patientRecord,
      @JsonKey(name: 'hasOpenEpisodes') bool? hasOpenEpisodes,
      @JsonKey(name: 'openEpisodes') List<EpisodeOfCare?>? openEpisodes});

  $PatientCopyWith<$Res>? get patientRecord;
}

/// @nodoc
class _$PatientPayloadCopyWithImpl<$Res>
    implements $PatientPayloadCopyWith<$Res> {
  _$PatientPayloadCopyWithImpl(this._value, this._then);

  final PatientPayload _value;
  // ignore: unused_field
  final $Res Function(PatientPayload) _then;

  @override
  $Res call({
    Object? patientRecord = freezed,
    Object? hasOpenEpisodes = freezed,
    Object? openEpisodes = freezed,
  }) {
    return _then(_value.copyWith(
      patientRecord: patientRecord == freezed
          ? _value.patientRecord
          : patientRecord // ignore: cast_nullable_to_non_nullable
              as Patient?,
      hasOpenEpisodes: hasOpenEpisodes == freezed
          ? _value.hasOpenEpisodes
          : hasOpenEpisodes // ignore: cast_nullable_to_non_nullable
              as bool?,
      openEpisodes: openEpisodes == freezed
          ? _value.openEpisodes
          : openEpisodes // ignore: cast_nullable_to_non_nullable
              as List<EpisodeOfCare?>?,
    ));
  }

  @override
  $PatientCopyWith<$Res>? get patientRecord {
    if (_value.patientRecord == null) {
      return null;
    }

    return $PatientCopyWith<$Res>(_value.patientRecord!, (value) {
      return _then(_value.copyWith(patientRecord: value));
    });
  }
}

/// @nodoc
abstract class _$PatientPayloadCopyWith<$Res>
    implements $PatientPayloadCopyWith<$Res> {
  factory _$PatientPayloadCopyWith(
          _PatientPayload value, $Res Function(_PatientPayload) then) =
      __$PatientPayloadCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'patientRecord') Patient? patientRecord,
      @JsonKey(name: 'hasOpenEpisodes') bool? hasOpenEpisodes,
      @JsonKey(name: 'openEpisodes') List<EpisodeOfCare?>? openEpisodes});

  @override
  $PatientCopyWith<$Res>? get patientRecord;
}

/// @nodoc
class __$PatientPayloadCopyWithImpl<$Res>
    extends _$PatientPayloadCopyWithImpl<$Res>
    implements _$PatientPayloadCopyWith<$Res> {
  __$PatientPayloadCopyWithImpl(
      _PatientPayload _value, $Res Function(_PatientPayload) _then)
      : super(_value, (v) => _then(v as _PatientPayload));

  @override
  _PatientPayload get _value => super._value as _PatientPayload;

  @override
  $Res call({
    Object? patientRecord = freezed,
    Object? hasOpenEpisodes = freezed,
    Object? openEpisodes = freezed,
  }) {
    return _then(_PatientPayload(
      patientRecord: patientRecord == freezed
          ? _value.patientRecord
          : patientRecord // ignore: cast_nullable_to_non_nullable
              as Patient?,
      hasOpenEpisodes: hasOpenEpisodes == freezed
          ? _value.hasOpenEpisodes
          : hasOpenEpisodes // ignore: cast_nullable_to_non_nullable
              as bool?,
      openEpisodes: openEpisodes == freezed
          ? _value.openEpisodes
          : openEpisodes // ignore: cast_nullable_to_non_nullable
              as List<EpisodeOfCare?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PatientPayload implements _PatientPayload {
  _$_PatientPayload(
      {@JsonKey(name: 'patientRecord') this.patientRecord,
      @JsonKey(name: 'hasOpenEpisodes') this.hasOpenEpisodes,
      @JsonKey(name: 'openEpisodes') this.openEpisodes});

  factory _$_PatientPayload.fromJson(Map<String, dynamic> json) =>
      _$_$_PatientPayloadFromJson(json);

  @override
  @JsonKey(name: 'patientRecord')
  final Patient? patientRecord;
  @override
  @JsonKey(name: 'hasOpenEpisodes')
  final bool? hasOpenEpisodes;
  @override
  @JsonKey(name: 'openEpisodes')
  final List<EpisodeOfCare?>? openEpisodes;

  @override
  String toString() {
    return 'PatientPayload(patientRecord: $patientRecord, hasOpenEpisodes: $hasOpenEpisodes, openEpisodes: $openEpisodes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PatientPayload &&
            (identical(other.patientRecord, patientRecord) ||
                const DeepCollectionEquality()
                    .equals(other.patientRecord, patientRecord)) &&
            (identical(other.hasOpenEpisodes, hasOpenEpisodes) ||
                const DeepCollectionEquality()
                    .equals(other.hasOpenEpisodes, hasOpenEpisodes)) &&
            (identical(other.openEpisodes, openEpisodes) ||
                const DeepCollectionEquality()
                    .equals(other.openEpisodes, openEpisodes)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(patientRecord) ^
      const DeepCollectionEquality().hash(hasOpenEpisodes) ^
      const DeepCollectionEquality().hash(openEpisodes);

  @JsonKey(ignore: true)
  @override
  _$PatientPayloadCopyWith<_PatientPayload> get copyWith =>
      __$PatientPayloadCopyWithImpl<_PatientPayload>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PatientPayloadToJson(this);
  }
}

abstract class _PatientPayload implements PatientPayload {
  factory _PatientPayload(
          {@JsonKey(name: 'patientRecord') Patient? patientRecord,
          @JsonKey(name: 'hasOpenEpisodes') bool? hasOpenEpisodes,
          @JsonKey(name: 'openEpisodes') List<EpisodeOfCare?>? openEpisodes}) =
      _$_PatientPayload;

  factory _PatientPayload.fromJson(Map<String, dynamic> json) =
      _$_PatientPayload.fromJson;

  @override
  @JsonKey(name: 'patientRecord')
  Patient? get patientRecord => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'hasOpenEpisodes')
  bool? get hasOpenEpisodes => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'openEpisodes')
  List<EpisodeOfCare?>? get openEpisodes => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PatientPayloadCopyWith<_PatientPayload> get copyWith =>
      throw _privateConstructorUsedError;
}
