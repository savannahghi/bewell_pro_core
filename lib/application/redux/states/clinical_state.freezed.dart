// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'clinical_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ClinicalState _$ClinicalStateFromJson(Map<String, dynamic> json) {
  return _ClinicalState.fromJson(json);
}

/// @nodoc
mixin _$ClinicalState {
  /// the current visit. The episode of care the doctor is currently attending to
  @JsonKey(name: 'currentEpisodeOfCare')
  EpisodeOfCare? get currentEpisodeOfCare => throw _privateConstructorUsedError;

  /// the patient the doctor is currently attending to
  @JsonKey(name: 'patientPayload')
  PatientPayload? get patientPayload => throw _privateConstructorUsedError;

  /// searched patient by phone number
  @JsonKey(name: 'patientSearchResult')
  List<PatientEdge?>? get patientSearchResult =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'patientSearchFound')
  bool? get patientSearchFound => throw _privateConstructorUsedError;
  @JsonKey(name: 'patientSearchNumber')
  String? get patientSearchNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'startVisitType')
  StartVisitType? get startVisitType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClinicalStateCopyWith<ClinicalState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClinicalStateCopyWith<$Res> {
  factory $ClinicalStateCopyWith(
          ClinicalState value, $Res Function(ClinicalState) then) =
      _$ClinicalStateCopyWithImpl<$Res, ClinicalState>;
  @useResult
  $Res call(
      {@JsonKey(name: 'currentEpisodeOfCare')
          EpisodeOfCare? currentEpisodeOfCare,
      @JsonKey(name: 'patientPayload')
          PatientPayload? patientPayload,
      @JsonKey(name: 'patientSearchResult')
          List<PatientEdge?>? patientSearchResult,
      @JsonKey(name: 'patientSearchFound')
          bool? patientSearchFound,
      @JsonKey(name: 'patientSearchNumber')
          String? patientSearchNumber,
      @JsonKey(name: 'startVisitType')
          StartVisitType? startVisitType});

  $EpisodeOfCareCopyWith<$Res>? get currentEpisodeOfCare;
  $PatientPayloadCopyWith<$Res>? get patientPayload;
}

/// @nodoc
class _$ClinicalStateCopyWithImpl<$Res, $Val extends ClinicalState>
    implements $ClinicalStateCopyWith<$Res> {
  _$ClinicalStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentEpisodeOfCare = freezed,
    Object? patientPayload = freezed,
    Object? patientSearchResult = freezed,
    Object? patientSearchFound = freezed,
    Object? patientSearchNumber = freezed,
    Object? startVisitType = freezed,
  }) {
    return _then(_value.copyWith(
      currentEpisodeOfCare: freezed == currentEpisodeOfCare
          ? _value.currentEpisodeOfCare
          : currentEpisodeOfCare // ignore: cast_nullable_to_non_nullable
              as EpisodeOfCare?,
      patientPayload: freezed == patientPayload
          ? _value.patientPayload
          : patientPayload // ignore: cast_nullable_to_non_nullable
              as PatientPayload?,
      patientSearchResult: freezed == patientSearchResult
          ? _value.patientSearchResult
          : patientSearchResult // ignore: cast_nullable_to_non_nullable
              as List<PatientEdge?>?,
      patientSearchFound: freezed == patientSearchFound
          ? _value.patientSearchFound
          : patientSearchFound // ignore: cast_nullable_to_non_nullable
              as bool?,
      patientSearchNumber: freezed == patientSearchNumber
          ? _value.patientSearchNumber
          : patientSearchNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      startVisitType: freezed == startVisitType
          ? _value.startVisitType
          : startVisitType // ignore: cast_nullable_to_non_nullable
              as StartVisitType?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $EpisodeOfCareCopyWith<$Res>? get currentEpisodeOfCare {
    if (_value.currentEpisodeOfCare == null) {
      return null;
    }

    return $EpisodeOfCareCopyWith<$Res>(_value.currentEpisodeOfCare!, (value) {
      return _then(_value.copyWith(currentEpisodeOfCare: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PatientPayloadCopyWith<$Res>? get patientPayload {
    if (_value.patientPayload == null) {
      return null;
    }

    return $PatientPayloadCopyWith<$Res>(_value.patientPayload!, (value) {
      return _then(_value.copyWith(patientPayload: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ClinicalStateCopyWith<$Res>
    implements $ClinicalStateCopyWith<$Res> {
  factory _$$_ClinicalStateCopyWith(
          _$_ClinicalState value, $Res Function(_$_ClinicalState) then) =
      __$$_ClinicalStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'currentEpisodeOfCare')
          EpisodeOfCare? currentEpisodeOfCare,
      @JsonKey(name: 'patientPayload')
          PatientPayload? patientPayload,
      @JsonKey(name: 'patientSearchResult')
          List<PatientEdge?>? patientSearchResult,
      @JsonKey(name: 'patientSearchFound')
          bool? patientSearchFound,
      @JsonKey(name: 'patientSearchNumber')
          String? patientSearchNumber,
      @JsonKey(name: 'startVisitType')
          StartVisitType? startVisitType});

  @override
  $EpisodeOfCareCopyWith<$Res>? get currentEpisodeOfCare;
  @override
  $PatientPayloadCopyWith<$Res>? get patientPayload;
}

/// @nodoc
class __$$_ClinicalStateCopyWithImpl<$Res>
    extends _$ClinicalStateCopyWithImpl<$Res, _$_ClinicalState>
    implements _$$_ClinicalStateCopyWith<$Res> {
  __$$_ClinicalStateCopyWithImpl(
      _$_ClinicalState _value, $Res Function(_$_ClinicalState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentEpisodeOfCare = freezed,
    Object? patientPayload = freezed,
    Object? patientSearchResult = freezed,
    Object? patientSearchFound = freezed,
    Object? patientSearchNumber = freezed,
    Object? startVisitType = freezed,
  }) {
    return _then(_$_ClinicalState(
      currentEpisodeOfCare: freezed == currentEpisodeOfCare
          ? _value.currentEpisodeOfCare
          : currentEpisodeOfCare // ignore: cast_nullable_to_non_nullable
              as EpisodeOfCare?,
      patientPayload: freezed == patientPayload
          ? _value.patientPayload
          : patientPayload // ignore: cast_nullable_to_non_nullable
              as PatientPayload?,
      patientSearchResult: freezed == patientSearchResult
          ? _value._patientSearchResult
          : patientSearchResult // ignore: cast_nullable_to_non_nullable
              as List<PatientEdge?>?,
      patientSearchFound: freezed == patientSearchFound
          ? _value.patientSearchFound
          : patientSearchFound // ignore: cast_nullable_to_non_nullable
              as bool?,
      patientSearchNumber: freezed == patientSearchNumber
          ? _value.patientSearchNumber
          : patientSearchNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      startVisitType: freezed == startVisitType
          ? _value.startVisitType
          : startVisitType // ignore: cast_nullable_to_non_nullable
              as StartVisitType?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ClinicalState implements _ClinicalState {
  _$_ClinicalState(
      {@JsonKey(name: 'currentEpisodeOfCare')
          this.currentEpisodeOfCare,
      @JsonKey(name: 'patientPayload')
          this.patientPayload,
      @JsonKey(name: 'patientSearchResult')
          final List<PatientEdge?>? patientSearchResult,
      @JsonKey(name: 'patientSearchFound')
          this.patientSearchFound,
      @JsonKey(name: 'patientSearchNumber')
          this.patientSearchNumber,
      @JsonKey(name: 'startVisitType')
          this.startVisitType})
      : _patientSearchResult = patientSearchResult;

  factory _$_ClinicalState.fromJson(Map<String, dynamic> json) =>
      _$$_ClinicalStateFromJson(json);

  /// the current visit. The episode of care the doctor is currently attending to
  @override
  @JsonKey(name: 'currentEpisodeOfCare')
  final EpisodeOfCare? currentEpisodeOfCare;

  /// the patient the doctor is currently attending to
  @override
  @JsonKey(name: 'patientPayload')
  final PatientPayload? patientPayload;

  /// searched patient by phone number
  final List<PatientEdge?>? _patientSearchResult;

  /// searched patient by phone number
  @override
  @JsonKey(name: 'patientSearchResult')
  List<PatientEdge?>? get patientSearchResult {
    final value = _patientSearchResult;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'patientSearchFound')
  final bool? patientSearchFound;
  @override
  @JsonKey(name: 'patientSearchNumber')
  final String? patientSearchNumber;
  @override
  @JsonKey(name: 'startVisitType')
  final StartVisitType? startVisitType;

  @override
  String toString() {
    return 'ClinicalState(currentEpisodeOfCare: $currentEpisodeOfCare, patientPayload: $patientPayload, patientSearchResult: $patientSearchResult, patientSearchFound: $patientSearchFound, patientSearchNumber: $patientSearchNumber, startVisitType: $startVisitType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ClinicalState &&
            (identical(other.currentEpisodeOfCare, currentEpisodeOfCare) ||
                other.currentEpisodeOfCare == currentEpisodeOfCare) &&
            (identical(other.patientPayload, patientPayload) ||
                other.patientPayload == patientPayload) &&
            const DeepCollectionEquality()
                .equals(other._patientSearchResult, _patientSearchResult) &&
            (identical(other.patientSearchFound, patientSearchFound) ||
                other.patientSearchFound == patientSearchFound) &&
            (identical(other.patientSearchNumber, patientSearchNumber) ||
                other.patientSearchNumber == patientSearchNumber) &&
            (identical(other.startVisitType, startVisitType) ||
                other.startVisitType == startVisitType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentEpisodeOfCare,
      patientPayload,
      const DeepCollectionEquality().hash(_patientSearchResult),
      patientSearchFound,
      patientSearchNumber,
      startVisitType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ClinicalStateCopyWith<_$_ClinicalState> get copyWith =>
      __$$_ClinicalStateCopyWithImpl<_$_ClinicalState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ClinicalStateToJson(
      this,
    );
  }
}

abstract class _ClinicalState implements ClinicalState {
  factory _ClinicalState(
      {@JsonKey(name: 'currentEpisodeOfCare')
          final EpisodeOfCare? currentEpisodeOfCare,
      @JsonKey(name: 'patientPayload')
          final PatientPayload? patientPayload,
      @JsonKey(name: 'patientSearchResult')
          final List<PatientEdge?>? patientSearchResult,
      @JsonKey(name: 'patientSearchFound')
          final bool? patientSearchFound,
      @JsonKey(name: 'patientSearchNumber')
          final String? patientSearchNumber,
      @JsonKey(name: 'startVisitType')
          final StartVisitType? startVisitType}) = _$_ClinicalState;

  factory _ClinicalState.fromJson(Map<String, dynamic> json) =
      _$_ClinicalState.fromJson;

  @override

  /// the current visit. The episode of care the doctor is currently attending to
  @JsonKey(name: 'currentEpisodeOfCare')
  EpisodeOfCare? get currentEpisodeOfCare;
  @override

  /// the patient the doctor is currently attending to
  @JsonKey(name: 'patientPayload')
  PatientPayload? get patientPayload;
  @override

  /// searched patient by phone number
  @JsonKey(name: 'patientSearchResult')
  List<PatientEdge?>? get patientSearchResult;
  @override
  @JsonKey(name: 'patientSearchFound')
  bool? get patientSearchFound;
  @override
  @JsonKey(name: 'patientSearchNumber')
  String? get patientSearchNumber;
  @override
  @JsonKey(name: 'startVisitType')
  StartVisitType? get startVisitType;
  @override
  @JsonKey(ignore: true)
  _$$_ClinicalStateCopyWith<_$_ClinicalState> get copyWith =>
      throw _privateConstructorUsedError;
}
