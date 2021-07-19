// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'episodeofcare_diagnosis.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EpisodeofcareDiagnosis _$EpisodeofcareDiagnosisFromJson(
    Map<String, dynamic> json) {
  return _EpisodeofcareDiagnosis.fromJson(json);
}

/// @nodoc
class _$EpisodeofcareDiagnosisTearOff {
  const _$EpisodeofcareDiagnosisTearOff();

  _EpisodeofcareDiagnosis call(
      {@JsonKey(name: 'ID') String? id = '',
      @JsonKey(name: 'Condition') Reference? condition,
      @JsonKey(name: 'Role') CodeableConcept? role,
      @JsonKey(name: 'Rank') int? rank}) {
    return _EpisodeofcareDiagnosis(
      id: id,
      condition: condition,
      role: role,
      rank: rank,
    );
  }

  EpisodeofcareDiagnosis fromJson(Map<String, Object> json) {
    return EpisodeofcareDiagnosis.fromJson(json);
  }
}

/// @nodoc
const $EpisodeofcareDiagnosis = _$EpisodeofcareDiagnosisTearOff();

/// @nodoc
mixin _$EpisodeofcareDiagnosis {
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;

  /// Conditions/problems/diagnoses that this episode of care is intended to be providing care for.
  @JsonKey(name: 'Condition')
  Reference? get condition => throw _privateConstructorUsedError;

  /// Role that this diagnosis has within the episode of care (e.g. admission, billing, discharge …).
  @JsonKey(name: 'Role')
  CodeableConcept? get role => throw _privateConstructorUsedError;

  /// Ranking of the diagnosis (for each role type).
  @JsonKey(name: 'Rank')
  int? get rank => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EpisodeofcareDiagnosisCopyWith<EpisodeofcareDiagnosis> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EpisodeofcareDiagnosisCopyWith<$Res> {
  factory $EpisodeofcareDiagnosisCopyWith(EpisodeofcareDiagnosis value,
          $Res Function(EpisodeofcareDiagnosis) then) =
      _$EpisodeofcareDiagnosisCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'Condition') Reference? condition,
      @JsonKey(name: 'Role') CodeableConcept? role,
      @JsonKey(name: 'Rank') int? rank});

  $ReferenceCopyWith<$Res>? get condition;
  $CodeableConceptCopyWith<$Res>? get role;
}

/// @nodoc
class _$EpisodeofcareDiagnosisCopyWithImpl<$Res>
    implements $EpisodeofcareDiagnosisCopyWith<$Res> {
  _$EpisodeofcareDiagnosisCopyWithImpl(this._value, this._then);

  final EpisodeofcareDiagnosis _value;
  // ignore: unused_field
  final $Res Function(EpisodeofcareDiagnosis) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? condition = freezed,
    Object? role = freezed,
    Object? rank = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      condition: condition == freezed
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as Reference?,
      role: role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      rank: rank == freezed
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }

  @override
  $ReferenceCopyWith<$Res>? get condition {
    if (_value.condition == null) {
      return null;
    }

    return $ReferenceCopyWith<$Res>(_value.condition!, (value) {
      return _then(_value.copyWith(condition: value));
    });
  }

  @override
  $CodeableConceptCopyWith<$Res>? get role {
    if (_value.role == null) {
      return null;
    }

    return $CodeableConceptCopyWith<$Res>(_value.role!, (value) {
      return _then(_value.copyWith(role: value));
    });
  }
}

/// @nodoc
abstract class _$EpisodeofcareDiagnosisCopyWith<$Res>
    implements $EpisodeofcareDiagnosisCopyWith<$Res> {
  factory _$EpisodeofcareDiagnosisCopyWith(_EpisodeofcareDiagnosis value,
          $Res Function(_EpisodeofcareDiagnosis) then) =
      __$EpisodeofcareDiagnosisCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'Condition') Reference? condition,
      @JsonKey(name: 'Role') CodeableConcept? role,
      @JsonKey(name: 'Rank') int? rank});

  @override
  $ReferenceCopyWith<$Res>? get condition;
  @override
  $CodeableConceptCopyWith<$Res>? get role;
}

/// @nodoc
class __$EpisodeofcareDiagnosisCopyWithImpl<$Res>
    extends _$EpisodeofcareDiagnosisCopyWithImpl<$Res>
    implements _$EpisodeofcareDiagnosisCopyWith<$Res> {
  __$EpisodeofcareDiagnosisCopyWithImpl(_EpisodeofcareDiagnosis _value,
      $Res Function(_EpisodeofcareDiagnosis) _then)
      : super(_value, (v) => _then(v as _EpisodeofcareDiagnosis));

  @override
  _EpisodeofcareDiagnosis get _value => super._value as _EpisodeofcareDiagnosis;

  @override
  $Res call({
    Object? id = freezed,
    Object? condition = freezed,
    Object? role = freezed,
    Object? rank = freezed,
  }) {
    return _then(_EpisodeofcareDiagnosis(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      condition: condition == freezed
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as Reference?,
      role: role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      rank: rank == freezed
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EpisodeofcareDiagnosis implements _EpisodeofcareDiagnosis {
  _$_EpisodeofcareDiagnosis(
      {@JsonKey(name: 'ID') this.id = '',
      @JsonKey(name: 'Condition') this.condition,
      @JsonKey(name: 'Role') this.role,
      @JsonKey(name: 'Rank') this.rank});

  factory _$_EpisodeofcareDiagnosis.fromJson(Map<String, dynamic> json) =>
      _$_$_EpisodeofcareDiagnosisFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? id;
  @override

  /// Conditions/problems/diagnoses that this episode of care is intended to be providing care for.
  @JsonKey(name: 'Condition')
  final Reference? condition;
  @override

  /// Role that this diagnosis has within the episode of care (e.g. admission, billing, discharge …).
  @JsonKey(name: 'Role')
  final CodeableConcept? role;
  @override

  /// Ranking of the diagnosis (for each role type).
  @JsonKey(name: 'Rank')
  final int? rank;

  @override
  String toString() {
    return 'EpisodeofcareDiagnosis(id: $id, condition: $condition, role: $role, rank: $rank)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _EpisodeofcareDiagnosis &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.condition, condition) ||
                const DeepCollectionEquality()
                    .equals(other.condition, condition)) &&
            (identical(other.role, role) ||
                const DeepCollectionEquality().equals(other.role, role)) &&
            (identical(other.rank, rank) ||
                const DeepCollectionEquality().equals(other.rank, rank)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(condition) ^
      const DeepCollectionEquality().hash(role) ^
      const DeepCollectionEquality().hash(rank);

  @JsonKey(ignore: true)
  @override
  _$EpisodeofcareDiagnosisCopyWith<_EpisodeofcareDiagnosis> get copyWith =>
      __$EpisodeofcareDiagnosisCopyWithImpl<_EpisodeofcareDiagnosis>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_EpisodeofcareDiagnosisToJson(this);
  }
}

abstract class _EpisodeofcareDiagnosis implements EpisodeofcareDiagnosis {
  factory _EpisodeofcareDiagnosis(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'Condition') Reference? condition,
      @JsonKey(name: 'Role') CodeableConcept? role,
      @JsonKey(name: 'Rank') int? rank}) = _$_EpisodeofcareDiagnosis;

  factory _EpisodeofcareDiagnosis.fromJson(Map<String, dynamic> json) =
      _$_EpisodeofcareDiagnosis.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;
  @override

  /// Conditions/problems/diagnoses that this episode of care is intended to be providing care for.
  @JsonKey(name: 'Condition')
  Reference? get condition => throw _privateConstructorUsedError;
  @override

  /// Role that this diagnosis has within the episode of care (e.g. admission, billing, discharge …).
  @JsonKey(name: 'Role')
  CodeableConcept? get role => throw _privateConstructorUsedError;
  @override

  /// Ranking of the diagnosis (for each role type).
  @JsonKey(name: 'Rank')
  int? get rank => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$EpisodeofcareDiagnosisCopyWith<_EpisodeofcareDiagnosis> get copyWith =>
      throw _privateConstructorUsedError;
}
