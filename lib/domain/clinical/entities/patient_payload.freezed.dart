// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'patient_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PatientPayload _$PatientPayloadFromJson(Map<String, dynamic> json) {
  return _PatientPayload.fromJson(json);
}

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
      _$PatientPayloadCopyWithImpl<$Res, PatientPayload>;
  @useResult
  $Res call(
      {@JsonKey(name: 'patientRecord') Patient? patientRecord,
      @JsonKey(name: 'hasOpenEpisodes') bool? hasOpenEpisodes,
      @JsonKey(name: 'openEpisodes') List<EpisodeOfCare?>? openEpisodes});

  $PatientCopyWith<$Res>? get patientRecord;
}

/// @nodoc
class _$PatientPayloadCopyWithImpl<$Res, $Val extends PatientPayload>
    implements $PatientPayloadCopyWith<$Res> {
  _$PatientPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? patientRecord = freezed,
    Object? hasOpenEpisodes = freezed,
    Object? openEpisodes = freezed,
  }) {
    return _then(_value.copyWith(
      patientRecord: freezed == patientRecord
          ? _value.patientRecord
          : patientRecord // ignore: cast_nullable_to_non_nullable
              as Patient?,
      hasOpenEpisodes: freezed == hasOpenEpisodes
          ? _value.hasOpenEpisodes
          : hasOpenEpisodes // ignore: cast_nullable_to_non_nullable
              as bool?,
      openEpisodes: freezed == openEpisodes
          ? _value.openEpisodes
          : openEpisodes // ignore: cast_nullable_to_non_nullable
              as List<EpisodeOfCare?>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PatientCopyWith<$Res>? get patientRecord {
    if (_value.patientRecord == null) {
      return null;
    }

    return $PatientCopyWith<$Res>(_value.patientRecord!, (value) {
      return _then(_value.copyWith(patientRecord: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PatientPayloadCopyWith<$Res>
    implements $PatientPayloadCopyWith<$Res> {
  factory _$$_PatientPayloadCopyWith(
          _$_PatientPayload value, $Res Function(_$_PatientPayload) then) =
      __$$_PatientPayloadCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'patientRecord') Patient? patientRecord,
      @JsonKey(name: 'hasOpenEpisodes') bool? hasOpenEpisodes,
      @JsonKey(name: 'openEpisodes') List<EpisodeOfCare?>? openEpisodes});

  @override
  $PatientCopyWith<$Res>? get patientRecord;
}

/// @nodoc
class __$$_PatientPayloadCopyWithImpl<$Res>
    extends _$PatientPayloadCopyWithImpl<$Res, _$_PatientPayload>
    implements _$$_PatientPayloadCopyWith<$Res> {
  __$$_PatientPayloadCopyWithImpl(
      _$_PatientPayload _value, $Res Function(_$_PatientPayload) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? patientRecord = freezed,
    Object? hasOpenEpisodes = freezed,
    Object? openEpisodes = freezed,
  }) {
    return _then(_$_PatientPayload(
      patientRecord: freezed == patientRecord
          ? _value.patientRecord
          : patientRecord // ignore: cast_nullable_to_non_nullable
              as Patient?,
      hasOpenEpisodes: freezed == hasOpenEpisodes
          ? _value.hasOpenEpisodes
          : hasOpenEpisodes // ignore: cast_nullable_to_non_nullable
              as bool?,
      openEpisodes: freezed == openEpisodes
          ? _value._openEpisodes
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
      @JsonKey(name: 'openEpisodes') final List<EpisodeOfCare?>? openEpisodes})
      : _openEpisodes = openEpisodes;

  factory _$_PatientPayload.fromJson(Map<String, dynamic> json) =>
      _$$_PatientPayloadFromJson(json);

  @override
  @JsonKey(name: 'patientRecord')
  final Patient? patientRecord;
  @override
  @JsonKey(name: 'hasOpenEpisodes')
  final bool? hasOpenEpisodes;
  final List<EpisodeOfCare?>? _openEpisodes;
  @override
  @JsonKey(name: 'openEpisodes')
  List<EpisodeOfCare?>? get openEpisodes {
    final value = _openEpisodes;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PatientPayload(patientRecord: $patientRecord, hasOpenEpisodes: $hasOpenEpisodes, openEpisodes: $openEpisodes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PatientPayload &&
            (identical(other.patientRecord, patientRecord) ||
                other.patientRecord == patientRecord) &&
            (identical(other.hasOpenEpisodes, hasOpenEpisodes) ||
                other.hasOpenEpisodes == hasOpenEpisodes) &&
            const DeepCollectionEquality()
                .equals(other._openEpisodes, _openEpisodes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, patientRecord, hasOpenEpisodes,
      const DeepCollectionEquality().hash(_openEpisodes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PatientPayloadCopyWith<_$_PatientPayload> get copyWith =>
      __$$_PatientPayloadCopyWithImpl<_$_PatientPayload>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PatientPayloadToJson(
      this,
    );
  }
}

abstract class _PatientPayload implements PatientPayload {
  factory _PatientPayload(
      {@JsonKey(name: 'patientRecord')
          final Patient? patientRecord,
      @JsonKey(name: 'hasOpenEpisodes')
          final bool? hasOpenEpisodes,
      @JsonKey(name: 'openEpisodes')
          final List<EpisodeOfCare?>? openEpisodes}) = _$_PatientPayload;

  factory _PatientPayload.fromJson(Map<String, dynamic> json) =
      _$_PatientPayload.fromJson;

  @override
  @JsonKey(name: 'patientRecord')
  Patient? get patientRecord;
  @override
  @JsonKey(name: 'hasOpenEpisodes')
  bool? get hasOpenEpisodes;
  @override
  @JsonKey(name: 'openEpisodes')
  List<EpisodeOfCare?>? get openEpisodes;
  @override
  @JsonKey(ignore: true)
  _$$_PatientPayloadCopyWith<_$_PatientPayload> get copyWith =>
      throw _privateConstructorUsedError;
}
