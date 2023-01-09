// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'episodeofcare_diagnosis.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EpisodeofcareDiagnosis _$EpisodeofcareDiagnosisFromJson(
    Map<String, dynamic> json) {
  return _EpisodeofcareDiagnosis.fromJson(json);
}

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
      _$EpisodeofcareDiagnosisCopyWithImpl<$Res, EpisodeofcareDiagnosis>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'Condition') Reference? condition,
      @JsonKey(name: 'Role') CodeableConcept? role,
      @JsonKey(name: 'Rank') int? rank});

  $ReferenceCopyWith<$Res>? get condition;
  $CodeableConceptCopyWith<$Res>? get role;
}

/// @nodoc
class _$EpisodeofcareDiagnosisCopyWithImpl<$Res,
        $Val extends EpisodeofcareDiagnosis>
    implements $EpisodeofcareDiagnosisCopyWith<$Res> {
  _$EpisodeofcareDiagnosisCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? condition = freezed,
    Object? role = freezed,
    Object? rank = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      condition: freezed == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as Reference?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      rank: freezed == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ReferenceCopyWith<$Res>? get condition {
    if (_value.condition == null) {
      return null;
    }

    return $ReferenceCopyWith<$Res>(_value.condition!, (value) {
      return _then(_value.copyWith(condition: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CodeableConceptCopyWith<$Res>? get role {
    if (_value.role == null) {
      return null;
    }

    return $CodeableConceptCopyWith<$Res>(_value.role!, (value) {
      return _then(_value.copyWith(role: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_EpisodeofcareDiagnosisCopyWith<$Res>
    implements $EpisodeofcareDiagnosisCopyWith<$Res> {
  factory _$$_EpisodeofcareDiagnosisCopyWith(_$_EpisodeofcareDiagnosis value,
          $Res Function(_$_EpisodeofcareDiagnosis) then) =
      __$$_EpisodeofcareDiagnosisCopyWithImpl<$Res>;
  @override
  @useResult
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
class __$$_EpisodeofcareDiagnosisCopyWithImpl<$Res>
    extends _$EpisodeofcareDiagnosisCopyWithImpl<$Res,
        _$_EpisodeofcareDiagnosis>
    implements _$$_EpisodeofcareDiagnosisCopyWith<$Res> {
  __$$_EpisodeofcareDiagnosisCopyWithImpl(_$_EpisodeofcareDiagnosis _value,
      $Res Function(_$_EpisodeofcareDiagnosis) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? condition = freezed,
    Object? role = freezed,
    Object? rank = freezed,
  }) {
    return _then(_$_EpisodeofcareDiagnosis(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      condition: freezed == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as Reference?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      rank: freezed == rank
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
      _$$_EpisodeofcareDiagnosisFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? id;

  /// Conditions/problems/diagnoses that this episode of care is intended to be providing care for.
  @override
  @JsonKey(name: 'Condition')
  final Reference? condition;

  /// Role that this diagnosis has within the episode of care (e.g. admission, billing, discharge …).
  @override
  @JsonKey(name: 'Role')
  final CodeableConcept? role;

  /// Ranking of the diagnosis (for each role type).
  @override
  @JsonKey(name: 'Rank')
  final int? rank;

  @override
  String toString() {
    return 'EpisodeofcareDiagnosis(id: $id, condition: $condition, role: $role, rank: $rank)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EpisodeofcareDiagnosis &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.condition, condition) ||
                other.condition == condition) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.rank, rank) || other.rank == rank));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, condition, role, rank);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EpisodeofcareDiagnosisCopyWith<_$_EpisodeofcareDiagnosis> get copyWith =>
      __$$_EpisodeofcareDiagnosisCopyWithImpl<_$_EpisodeofcareDiagnosis>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EpisodeofcareDiagnosisToJson(
      this,
    );
  }
}

abstract class _EpisodeofcareDiagnosis implements EpisodeofcareDiagnosis {
  factory _EpisodeofcareDiagnosis(
      {@JsonKey(name: 'ID') final String? id,
      @JsonKey(name: 'Condition') final Reference? condition,
      @JsonKey(name: 'Role') final CodeableConcept? role,
      @JsonKey(name: 'Rank') final int? rank}) = _$_EpisodeofcareDiagnosis;

  factory _EpisodeofcareDiagnosis.fromJson(Map<String, dynamic> json) =
      _$_EpisodeofcareDiagnosis.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id;
  @override

  /// Conditions/problems/diagnoses that this episode of care is intended to be providing care for.
  @JsonKey(name: 'Condition')
  Reference? get condition;
  @override

  /// Role that this diagnosis has within the episode of care (e.g. admission, billing, discharge …).
  @JsonKey(name: 'Role')
  CodeableConcept? get role;
  @override

  /// Ranking of the diagnosis (for each role type).
  @JsonKey(name: 'Rank')
  int? get rank;
  @override
  @JsonKey(ignore: true)
  _$$_EpisodeofcareDiagnosisCopyWith<_$_EpisodeofcareDiagnosis> get copyWith =>
      throw _privateConstructorUsedError;
}
