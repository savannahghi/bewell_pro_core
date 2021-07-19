// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'clinical_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ClinicalState _$ClinicalStateFromJson(Map<String, dynamic> json) {
  return _ClinicalState.fromJson(json);
}

/// @nodoc
class _$ClinicalStateTearOff {
  const _$ClinicalStateTearOff();

  _ClinicalState call(
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
          StartVisitType? startVisitType}) {
    return _ClinicalState(
      currentEpisodeOfCare: currentEpisodeOfCare,
      patientPayload: patientPayload,
      patientSearchResult: patientSearchResult,
      patientSearchFound: patientSearchFound,
      patientSearchNumber: patientSearchNumber,
      startVisitType: startVisitType,
    );
  }

  ClinicalState fromJson(Map<String, Object> json) {
    return ClinicalState.fromJson(json);
  }
}

/// @nodoc
const $ClinicalState = _$ClinicalStateTearOff();

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
      _$ClinicalStateCopyWithImpl<$Res>;
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
class _$ClinicalStateCopyWithImpl<$Res>
    implements $ClinicalStateCopyWith<$Res> {
  _$ClinicalStateCopyWithImpl(this._value, this._then);

  final ClinicalState _value;
  // ignore: unused_field
  final $Res Function(ClinicalState) _then;

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
      currentEpisodeOfCare: currentEpisodeOfCare == freezed
          ? _value.currentEpisodeOfCare
          : currentEpisodeOfCare // ignore: cast_nullable_to_non_nullable
              as EpisodeOfCare?,
      patientPayload: patientPayload == freezed
          ? _value.patientPayload
          : patientPayload // ignore: cast_nullable_to_non_nullable
              as PatientPayload?,
      patientSearchResult: patientSearchResult == freezed
          ? _value.patientSearchResult
          : patientSearchResult // ignore: cast_nullable_to_non_nullable
              as List<PatientEdge?>?,
      patientSearchFound: patientSearchFound == freezed
          ? _value.patientSearchFound
          : patientSearchFound // ignore: cast_nullable_to_non_nullable
              as bool?,
      patientSearchNumber: patientSearchNumber == freezed
          ? _value.patientSearchNumber
          : patientSearchNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      startVisitType: startVisitType == freezed
          ? _value.startVisitType
          : startVisitType // ignore: cast_nullable_to_non_nullable
              as StartVisitType?,
    ));
  }

  @override
  $EpisodeOfCareCopyWith<$Res>? get currentEpisodeOfCare {
    if (_value.currentEpisodeOfCare == null) {
      return null;
    }

    return $EpisodeOfCareCopyWith<$Res>(_value.currentEpisodeOfCare!, (value) {
      return _then(_value.copyWith(currentEpisodeOfCare: value));
    });
  }

  @override
  $PatientPayloadCopyWith<$Res>? get patientPayload {
    if (_value.patientPayload == null) {
      return null;
    }

    return $PatientPayloadCopyWith<$Res>(_value.patientPayload!, (value) {
      return _then(_value.copyWith(patientPayload: value));
    });
  }
}

/// @nodoc
abstract class _$ClinicalStateCopyWith<$Res>
    implements $ClinicalStateCopyWith<$Res> {
  factory _$ClinicalStateCopyWith(
          _ClinicalState value, $Res Function(_ClinicalState) then) =
      __$ClinicalStateCopyWithImpl<$Res>;
  @override
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
class __$ClinicalStateCopyWithImpl<$Res>
    extends _$ClinicalStateCopyWithImpl<$Res>
    implements _$ClinicalStateCopyWith<$Res> {
  __$ClinicalStateCopyWithImpl(
      _ClinicalState _value, $Res Function(_ClinicalState) _then)
      : super(_value, (v) => _then(v as _ClinicalState));

  @override
  _ClinicalState get _value => super._value as _ClinicalState;

  @override
  $Res call({
    Object? currentEpisodeOfCare = freezed,
    Object? patientPayload = freezed,
    Object? patientSearchResult = freezed,
    Object? patientSearchFound = freezed,
    Object? patientSearchNumber = freezed,
    Object? startVisitType = freezed,
  }) {
    return _then(_ClinicalState(
      currentEpisodeOfCare: currentEpisodeOfCare == freezed
          ? _value.currentEpisodeOfCare
          : currentEpisodeOfCare // ignore: cast_nullable_to_non_nullable
              as EpisodeOfCare?,
      patientPayload: patientPayload == freezed
          ? _value.patientPayload
          : patientPayload // ignore: cast_nullable_to_non_nullable
              as PatientPayload?,
      patientSearchResult: patientSearchResult == freezed
          ? _value.patientSearchResult
          : patientSearchResult // ignore: cast_nullable_to_non_nullable
              as List<PatientEdge?>?,
      patientSearchFound: patientSearchFound == freezed
          ? _value.patientSearchFound
          : patientSearchFound // ignore: cast_nullable_to_non_nullable
              as bool?,
      patientSearchNumber: patientSearchNumber == freezed
          ? _value.patientSearchNumber
          : patientSearchNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      startVisitType: startVisitType == freezed
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
      {@JsonKey(name: 'currentEpisodeOfCare') this.currentEpisodeOfCare,
      @JsonKey(name: 'patientPayload') this.patientPayload,
      @JsonKey(name: 'patientSearchResult') this.patientSearchResult,
      @JsonKey(name: 'patientSearchFound') this.patientSearchFound,
      @JsonKey(name: 'patientSearchNumber') this.patientSearchNumber,
      @JsonKey(name: 'startVisitType') this.startVisitType});

  factory _$_ClinicalState.fromJson(Map<String, dynamic> json) =>
      _$_$_ClinicalStateFromJson(json);

  @override

  /// the current visit. The episode of care the doctor is currently attending to
  @JsonKey(name: 'currentEpisodeOfCare')
  final EpisodeOfCare? currentEpisodeOfCare;
  @override

  /// the patient the doctor is currently attending to
  @JsonKey(name: 'patientPayload')
  final PatientPayload? patientPayload;
  @override

  /// searched patient by phone number
  @JsonKey(name: 'patientSearchResult')
  final List<PatientEdge?>? patientSearchResult;
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
        (other is _ClinicalState &&
            (identical(other.currentEpisodeOfCare, currentEpisodeOfCare) ||
                const DeepCollectionEquality().equals(
                    other.currentEpisodeOfCare, currentEpisodeOfCare)) &&
            (identical(other.patientPayload, patientPayload) ||
                const DeepCollectionEquality()
                    .equals(other.patientPayload, patientPayload)) &&
            (identical(other.patientSearchResult, patientSearchResult) ||
                const DeepCollectionEquality()
                    .equals(other.patientSearchResult, patientSearchResult)) &&
            (identical(other.patientSearchFound, patientSearchFound) ||
                const DeepCollectionEquality()
                    .equals(other.patientSearchFound, patientSearchFound)) &&
            (identical(other.patientSearchNumber, patientSearchNumber) ||
                const DeepCollectionEquality()
                    .equals(other.patientSearchNumber, patientSearchNumber)) &&
            (identical(other.startVisitType, startVisitType) ||
                const DeepCollectionEquality()
                    .equals(other.startVisitType, startVisitType)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(currentEpisodeOfCare) ^
      const DeepCollectionEquality().hash(patientPayload) ^
      const DeepCollectionEquality().hash(patientSearchResult) ^
      const DeepCollectionEquality().hash(patientSearchFound) ^
      const DeepCollectionEquality().hash(patientSearchNumber) ^
      const DeepCollectionEquality().hash(startVisitType);

  @JsonKey(ignore: true)
  @override
  _$ClinicalStateCopyWith<_ClinicalState> get copyWith =>
      __$ClinicalStateCopyWithImpl<_ClinicalState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ClinicalStateToJson(this);
  }
}

abstract class _ClinicalState implements ClinicalState {
  factory _ClinicalState(
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
          StartVisitType? startVisitType}) = _$_ClinicalState;

  factory _ClinicalState.fromJson(Map<String, dynamic> json) =
      _$_ClinicalState.fromJson;

  @override

  /// the current visit. The episode of care the doctor is currently attending to
  @JsonKey(name: 'currentEpisodeOfCare')
  EpisodeOfCare? get currentEpisodeOfCare => throw _privateConstructorUsedError;
  @override

  /// the patient the doctor is currently attending to
  @JsonKey(name: 'patientPayload')
  PatientPayload? get patientPayload => throw _privateConstructorUsedError;
  @override

  /// searched patient by phone number
  @JsonKey(name: 'patientSearchResult')
  List<PatientEdge?>? get patientSearchResult =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'patientSearchFound')
  bool? get patientSearchFound => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'patientSearchNumber')
  String? get patientSearchNumber => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'startVisitType')
  StartVisitType? get startVisitType => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ClinicalStateCopyWith<_ClinicalState> get copyWith =>
      throw _privateConstructorUsedError;
}
