// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'medication_request_substitution.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MedicationRequestSubstitution _$MedicationRequestSubstitutionFromJson(
    Map<String, dynamic> json) {
  return _MedicationRequestSubstitution.fromJson(json);
}

/// @nodoc
mixin _$MedicationRequestSubstitution {
  @JsonKey(name: 'ID')
  String? get id =>
      throw _privateConstructorUsedError; //if substitution is allowed
  @JsonKey(name: 'AllowedBoolean')
  bool? get allowedBoolean => throw _privateConstructorUsedError;
  @JsonKey(name: 'AllowedCodeableConcept')
  CodeableConcept? get allowedCodeableConcept =>
      throw _privateConstructorUsedError; //why it should or should not be substituted
  @JsonKey(name: 'Reason')
  CodeableConcept? get reason => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MedicationRequestSubstitutionCopyWith<MedicationRequestSubstitution>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedicationRequestSubstitutionCopyWith<$Res> {
  factory $MedicationRequestSubstitutionCopyWith(
          MedicationRequestSubstitution value,
          $Res Function(MedicationRequestSubstitution) then) =
      _$MedicationRequestSubstitutionCopyWithImpl<$Res,
          MedicationRequestSubstitution>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID')
          String? id,
      @JsonKey(name: 'AllowedBoolean')
          bool? allowedBoolean,
      @JsonKey(name: 'AllowedCodeableConcept')
          CodeableConcept? allowedCodeableConcept,
      @JsonKey(name: 'Reason')
          CodeableConcept? reason});

  $CodeableConceptCopyWith<$Res>? get allowedCodeableConcept;
  $CodeableConceptCopyWith<$Res>? get reason;
}

/// @nodoc
class _$MedicationRequestSubstitutionCopyWithImpl<$Res,
        $Val extends MedicationRequestSubstitution>
    implements $MedicationRequestSubstitutionCopyWith<$Res> {
  _$MedicationRequestSubstitutionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? allowedBoolean = freezed,
    Object? allowedCodeableConcept = freezed,
    Object? reason = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      allowedBoolean: freezed == allowedBoolean
          ? _value.allowedBoolean
          : allowedBoolean // ignore: cast_nullable_to_non_nullable
              as bool?,
      allowedCodeableConcept: freezed == allowedCodeableConcept
          ? _value.allowedCodeableConcept
          : allowedCodeableConcept // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CodeableConceptCopyWith<$Res>? get allowedCodeableConcept {
    if (_value.allowedCodeableConcept == null) {
      return null;
    }

    return $CodeableConceptCopyWith<$Res>(_value.allowedCodeableConcept!,
        (value) {
      return _then(_value.copyWith(allowedCodeableConcept: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CodeableConceptCopyWith<$Res>? get reason {
    if (_value.reason == null) {
      return null;
    }

    return $CodeableConceptCopyWith<$Res>(_value.reason!, (value) {
      return _then(_value.copyWith(reason: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MedicationRequestSubstitutionCopyWith<$Res>
    implements $MedicationRequestSubstitutionCopyWith<$Res> {
  factory _$$_MedicationRequestSubstitutionCopyWith(
          _$_MedicationRequestSubstitution value,
          $Res Function(_$_MedicationRequestSubstitution) then) =
      __$$_MedicationRequestSubstitutionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID')
          String? id,
      @JsonKey(name: 'AllowedBoolean')
          bool? allowedBoolean,
      @JsonKey(name: 'AllowedCodeableConcept')
          CodeableConcept? allowedCodeableConcept,
      @JsonKey(name: 'Reason')
          CodeableConcept? reason});

  @override
  $CodeableConceptCopyWith<$Res>? get allowedCodeableConcept;
  @override
  $CodeableConceptCopyWith<$Res>? get reason;
}

/// @nodoc
class __$$_MedicationRequestSubstitutionCopyWithImpl<$Res>
    extends _$MedicationRequestSubstitutionCopyWithImpl<$Res,
        _$_MedicationRequestSubstitution>
    implements _$$_MedicationRequestSubstitutionCopyWith<$Res> {
  __$$_MedicationRequestSubstitutionCopyWithImpl(
      _$_MedicationRequestSubstitution _value,
      $Res Function(_$_MedicationRequestSubstitution) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? allowedBoolean = freezed,
    Object? allowedCodeableConcept = freezed,
    Object? reason = freezed,
  }) {
    return _then(_$_MedicationRequestSubstitution(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      allowedBoolean: freezed == allowedBoolean
          ? _value.allowedBoolean
          : allowedBoolean // ignore: cast_nullable_to_non_nullable
              as bool?,
      allowedCodeableConcept: freezed == allowedCodeableConcept
          ? _value.allowedCodeableConcept
          : allowedCodeableConcept // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MedicationRequestSubstitution
    implements _MedicationRequestSubstitution {
  _$_MedicationRequestSubstitution(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'AllowedBoolean') this.allowedBoolean,
      @JsonKey(name: 'AllowedCodeableConcept') this.allowedCodeableConcept,
      @JsonKey(name: 'Reason') this.reason});

  factory _$_MedicationRequestSubstitution.fromJson(
          Map<String, dynamic> json) =>
      _$$_MedicationRequestSubstitutionFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? id;
//if substitution is allowed
  @override
  @JsonKey(name: 'AllowedBoolean')
  final bool? allowedBoolean;
  @override
  @JsonKey(name: 'AllowedCodeableConcept')
  final CodeableConcept? allowedCodeableConcept;
//why it should or should not be substituted
  @override
  @JsonKey(name: 'Reason')
  final CodeableConcept? reason;

  @override
  String toString() {
    return 'MedicationRequestSubstitution(id: $id, allowedBoolean: $allowedBoolean, allowedCodeableConcept: $allowedCodeableConcept, reason: $reason)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MedicationRequestSubstitution &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.allowedBoolean, allowedBoolean) ||
                other.allowedBoolean == allowedBoolean) &&
            (identical(other.allowedCodeableConcept, allowedCodeableConcept) ||
                other.allowedCodeableConcept == allowedCodeableConcept) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, allowedBoolean, allowedCodeableConcept, reason);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MedicationRequestSubstitutionCopyWith<_$_MedicationRequestSubstitution>
      get copyWith => __$$_MedicationRequestSubstitutionCopyWithImpl<
          _$_MedicationRequestSubstitution>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MedicationRequestSubstitutionToJson(
      this,
    );
  }
}

abstract class _MedicationRequestSubstitution
    implements MedicationRequestSubstitution {
  factory _MedicationRequestSubstitution(
      {@JsonKey(name: 'ID')
          final String? id,
      @JsonKey(name: 'AllowedBoolean')
          final bool? allowedBoolean,
      @JsonKey(name: 'AllowedCodeableConcept')
          final CodeableConcept? allowedCodeableConcept,
      @JsonKey(name: 'Reason')
          final CodeableConcept? reason}) = _$_MedicationRequestSubstitution;

  factory _MedicationRequestSubstitution.fromJson(Map<String, dynamic> json) =
      _$_MedicationRequestSubstitution.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id;
  @override //if substitution is allowed
  @JsonKey(name: 'AllowedBoolean')
  bool? get allowedBoolean;
  @override
  @JsonKey(name: 'AllowedCodeableConcept')
  CodeableConcept? get allowedCodeableConcept;
  @override //why it should or should not be substituted
  @JsonKey(name: 'Reason')
  CodeableConcept? get reason;
  @override
  @JsonKey(ignore: true)
  _$$_MedicationRequestSubstitutionCopyWith<_$_MedicationRequestSubstitution>
      get copyWith => throw _privateConstructorUsedError;
}
