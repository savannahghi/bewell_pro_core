// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'allergy_intolerance_reaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AllergyIntoleranceReaction _$AllergyIntoleranceReactionFromJson(
    Map<String, dynamic> json) {
  return _AllergyIntoleranceReaction.fromJson(json);
}

/// @nodoc
mixin _$AllergyIntoleranceReaction {
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;

  /// Identification of the specific substance (or pharmaceutical product)
  ///  considered to be responsible for the Adverse Reaction event.
  ///
  ///  Note: the substance for a specific reaction may be different from the
  ///  substance identified as the cause of the risk, but it must be
  ///  consistent with it. For instance, it may be a more specific
  ///  substance (e.g. a brand medication) or a composite product that
  ///  includes the identified substance. It must be clinically safe to only
  ///  process the 'code' and ignore the 'reaction.substance'.
  ///  If a receiving system is unable to confirm that
  ///  AllergyIntolerance.reaction.substance falls within the semantic scope
  ///  of AllergyIntolerance.code, then the receiving system should ignore
  ///  AllergyIntolerance.reaction.substance.
  @JsonKey(name: 'Substance')
  CodeableConcept? get substance => throw _privateConstructorUsedError;

  /// Clinical symptoms and/or signs that are observed or associated with the adverse reaction event.
  @JsonKey(name: 'Manifestation')
  List<CodeableConcept?>? get manifestation =>
      throw _privateConstructorUsedError;

  /// Text description about the reaction as a whole, including details of the manifestation if required.
  @JsonKey(name: 'Description')
  String? get description => throw _privateConstructorUsedError;

  /// Record of the date and/or time of the onset of the Reaction.
  @JsonKey(name: 'Onset')
  String? get onset => throw _privateConstructorUsedError;

  /// Clinical assessment of the severity of the reaction event as a whole,
  ///  potentially considering multiple different manifestations.
  @JsonKey(
      name: 'Severity',
      unknownEnumValue: AllergyIntoleranceReactionSeverityEnum.moderate)
  AllergyIntoleranceReactionSeverityEnum? get severity =>
      throw _privateConstructorUsedError;

  /// Identification of the route by which the subject was exposed to the substance.
  @JsonKey(name: 'ExposureRoute')
  CodeableConcept? get exposureRoute => throw _privateConstructorUsedError;

  /// Additional text about the adverse reaction event not captured in other fields.
  @JsonKey(name: 'Note')
  List<Annotation?>? get note => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AllergyIntoleranceReactionCopyWith<AllergyIntoleranceReaction>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllergyIntoleranceReactionCopyWith<$Res> {
  factory $AllergyIntoleranceReactionCopyWith(AllergyIntoleranceReaction value,
          $Res Function(AllergyIntoleranceReaction) then) =
      _$AllergyIntoleranceReactionCopyWithImpl<$Res,
          AllergyIntoleranceReaction>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID')
          String? id,
      @JsonKey(name: 'Substance')
          CodeableConcept? substance,
      @JsonKey(name: 'Manifestation')
          List<CodeableConcept?>? manifestation,
      @JsonKey(name: 'Description')
          String? description,
      @JsonKey(name: 'Onset')
          String? onset,
      @JsonKey(name: 'Severity', unknownEnumValue: AllergyIntoleranceReactionSeverityEnum.moderate)
          AllergyIntoleranceReactionSeverityEnum? severity,
      @JsonKey(name: 'ExposureRoute')
          CodeableConcept? exposureRoute,
      @JsonKey(name: 'Note')
          List<Annotation?>? note});

  $CodeableConceptCopyWith<$Res>? get substance;
  $CodeableConceptCopyWith<$Res>? get exposureRoute;
}

/// @nodoc
class _$AllergyIntoleranceReactionCopyWithImpl<$Res,
        $Val extends AllergyIntoleranceReaction>
    implements $AllergyIntoleranceReactionCopyWith<$Res> {
  _$AllergyIntoleranceReactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? substance = freezed,
    Object? manifestation = freezed,
    Object? description = freezed,
    Object? onset = freezed,
    Object? severity = freezed,
    Object? exposureRoute = freezed,
    Object? note = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      substance: freezed == substance
          ? _value.substance
          : substance // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      manifestation: freezed == manifestation
          ? _value.manifestation
          : manifestation // ignore: cast_nullable_to_non_nullable
              as List<CodeableConcept?>?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      onset: freezed == onset
          ? _value.onset
          : onset // ignore: cast_nullable_to_non_nullable
              as String?,
      severity: freezed == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as AllergyIntoleranceReactionSeverityEnum?,
      exposureRoute: freezed == exposureRoute
          ? _value.exposureRoute
          : exposureRoute // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as List<Annotation?>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CodeableConceptCopyWith<$Res>? get substance {
    if (_value.substance == null) {
      return null;
    }

    return $CodeableConceptCopyWith<$Res>(_value.substance!, (value) {
      return _then(_value.copyWith(substance: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CodeableConceptCopyWith<$Res>? get exposureRoute {
    if (_value.exposureRoute == null) {
      return null;
    }

    return $CodeableConceptCopyWith<$Res>(_value.exposureRoute!, (value) {
      return _then(_value.copyWith(exposureRoute: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AllergyIntoleranceReactionCopyWith<$Res>
    implements $AllergyIntoleranceReactionCopyWith<$Res> {
  factory _$$_AllergyIntoleranceReactionCopyWith(
          _$_AllergyIntoleranceReaction value,
          $Res Function(_$_AllergyIntoleranceReaction) then) =
      __$$_AllergyIntoleranceReactionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID')
          String? id,
      @JsonKey(name: 'Substance')
          CodeableConcept? substance,
      @JsonKey(name: 'Manifestation')
          List<CodeableConcept?>? manifestation,
      @JsonKey(name: 'Description')
          String? description,
      @JsonKey(name: 'Onset')
          String? onset,
      @JsonKey(name: 'Severity', unknownEnumValue: AllergyIntoleranceReactionSeverityEnum.moderate)
          AllergyIntoleranceReactionSeverityEnum? severity,
      @JsonKey(name: 'ExposureRoute')
          CodeableConcept? exposureRoute,
      @JsonKey(name: 'Note')
          List<Annotation?>? note});

  @override
  $CodeableConceptCopyWith<$Res>? get substance;
  @override
  $CodeableConceptCopyWith<$Res>? get exposureRoute;
}

/// @nodoc
class __$$_AllergyIntoleranceReactionCopyWithImpl<$Res>
    extends _$AllergyIntoleranceReactionCopyWithImpl<$Res,
        _$_AllergyIntoleranceReaction>
    implements _$$_AllergyIntoleranceReactionCopyWith<$Res> {
  __$$_AllergyIntoleranceReactionCopyWithImpl(
      _$_AllergyIntoleranceReaction _value,
      $Res Function(_$_AllergyIntoleranceReaction) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? substance = freezed,
    Object? manifestation = freezed,
    Object? description = freezed,
    Object? onset = freezed,
    Object? severity = freezed,
    Object? exposureRoute = freezed,
    Object? note = freezed,
  }) {
    return _then(_$_AllergyIntoleranceReaction(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      substance: freezed == substance
          ? _value.substance
          : substance // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      manifestation: freezed == manifestation
          ? _value._manifestation
          : manifestation // ignore: cast_nullable_to_non_nullable
              as List<CodeableConcept?>?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      onset: freezed == onset
          ? _value.onset
          : onset // ignore: cast_nullable_to_non_nullable
              as String?,
      severity: freezed == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as AllergyIntoleranceReactionSeverityEnum?,
      exposureRoute: freezed == exposureRoute
          ? _value.exposureRoute
          : exposureRoute // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      note: freezed == note
          ? _value._note
          : note // ignore: cast_nullable_to_non_nullable
              as List<Annotation?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AllergyIntoleranceReaction implements _AllergyIntoleranceReaction {
  _$_AllergyIntoleranceReaction(
      {@JsonKey(name: 'ID')
          this.id,
      @JsonKey(name: 'Substance')
          this.substance,
      @JsonKey(name: 'Manifestation')
          final List<CodeableConcept?>? manifestation,
      @JsonKey(name: 'Description')
          this.description,
      @JsonKey(name: 'Onset')
          this.onset,
      @JsonKey(name: 'Severity', unknownEnumValue: AllergyIntoleranceReactionSeverityEnum.moderate)
          this.severity,
      @JsonKey(name: 'ExposureRoute')
          this.exposureRoute,
      @JsonKey(name: 'Note')
          final List<Annotation?>? note})
      : _manifestation = manifestation,
        _note = note;

  factory _$_AllergyIntoleranceReaction.fromJson(Map<String, dynamic> json) =>
      _$$_AllergyIntoleranceReactionFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? id;

  /// Identification of the specific substance (or pharmaceutical product)
  ///  considered to be responsible for the Adverse Reaction event.
  ///
  ///  Note: the substance for a specific reaction may be different from the
  ///  substance identified as the cause of the risk, but it must be
  ///  consistent with it. For instance, it may be a more specific
  ///  substance (e.g. a brand medication) or a composite product that
  ///  includes the identified substance. It must be clinically safe to only
  ///  process the 'code' and ignore the 'reaction.substance'.
  ///  If a receiving system is unable to confirm that
  ///  AllergyIntolerance.reaction.substance falls within the semantic scope
  ///  of AllergyIntolerance.code, then the receiving system should ignore
  ///  AllergyIntolerance.reaction.substance.
  @override
  @JsonKey(name: 'Substance')
  final CodeableConcept? substance;

  /// Clinical symptoms and/or signs that are observed or associated with the adverse reaction event.
  final List<CodeableConcept?>? _manifestation;

  /// Clinical symptoms and/or signs that are observed or associated with the adverse reaction event.
  @override
  @JsonKey(name: 'Manifestation')
  List<CodeableConcept?>? get manifestation {
    final value = _manifestation;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Text description about the reaction as a whole, including details of the manifestation if required.
  @override
  @JsonKey(name: 'Description')
  final String? description;

  /// Record of the date and/or time of the onset of the Reaction.
  @override
  @JsonKey(name: 'Onset')
  final String? onset;

  /// Clinical assessment of the severity of the reaction event as a whole,
  ///  potentially considering multiple different manifestations.
  @override
  @JsonKey(
      name: 'Severity',
      unknownEnumValue: AllergyIntoleranceReactionSeverityEnum.moderate)
  final AllergyIntoleranceReactionSeverityEnum? severity;

  /// Identification of the route by which the subject was exposed to the substance.
  @override
  @JsonKey(name: 'ExposureRoute')
  final CodeableConcept? exposureRoute;

  /// Additional text about the adverse reaction event not captured in other fields.
  final List<Annotation?>? _note;

  /// Additional text about the adverse reaction event not captured in other fields.
  @override
  @JsonKey(name: 'Note')
  List<Annotation?>? get note {
    final value = _note;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AllergyIntoleranceReaction(id: $id, substance: $substance, manifestation: $manifestation, description: $description, onset: $onset, severity: $severity, exposureRoute: $exposureRoute, note: $note)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AllergyIntoleranceReaction &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.substance, substance) ||
                other.substance == substance) &&
            const DeepCollectionEquality()
                .equals(other._manifestation, _manifestation) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.onset, onset) || other.onset == onset) &&
            (identical(other.severity, severity) ||
                other.severity == severity) &&
            (identical(other.exposureRoute, exposureRoute) ||
                other.exposureRoute == exposureRoute) &&
            const DeepCollectionEquality().equals(other._note, _note));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      substance,
      const DeepCollectionEquality().hash(_manifestation),
      description,
      onset,
      severity,
      exposureRoute,
      const DeepCollectionEquality().hash(_note));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AllergyIntoleranceReactionCopyWith<_$_AllergyIntoleranceReaction>
      get copyWith => __$$_AllergyIntoleranceReactionCopyWithImpl<
          _$_AllergyIntoleranceReaction>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AllergyIntoleranceReactionToJson(
      this,
    );
  }
}

abstract class _AllergyIntoleranceReaction
    implements AllergyIntoleranceReaction {
  factory _AllergyIntoleranceReaction(
      {@JsonKey(name: 'ID')
          final String? id,
      @JsonKey(name: 'Substance')
          final CodeableConcept? substance,
      @JsonKey(name: 'Manifestation')
          final List<CodeableConcept?>? manifestation,
      @JsonKey(name: 'Description')
          final String? description,
      @JsonKey(name: 'Onset')
          final String? onset,
      @JsonKey(name: 'Severity', unknownEnumValue: AllergyIntoleranceReactionSeverityEnum.moderate)
          final AllergyIntoleranceReactionSeverityEnum? severity,
      @JsonKey(name: 'ExposureRoute')
          final CodeableConcept? exposureRoute,
      @JsonKey(name: 'Note')
          final List<Annotation?>? note}) = _$_AllergyIntoleranceReaction;

  factory _AllergyIntoleranceReaction.fromJson(Map<String, dynamic> json) =
      _$_AllergyIntoleranceReaction.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id;
  @override

  /// Identification of the specific substance (or pharmaceutical product)
  ///  considered to be responsible for the Adverse Reaction event.
  ///
  ///  Note: the substance for a specific reaction may be different from the
  ///  substance identified as the cause of the risk, but it must be
  ///  consistent with it. For instance, it may be a more specific
  ///  substance (e.g. a brand medication) or a composite product that
  ///  includes the identified substance. It must be clinically safe to only
  ///  process the 'code' and ignore the 'reaction.substance'.
  ///  If a receiving system is unable to confirm that
  ///  AllergyIntolerance.reaction.substance falls within the semantic scope
  ///  of AllergyIntolerance.code, then the receiving system should ignore
  ///  AllergyIntolerance.reaction.substance.
  @JsonKey(name: 'Substance')
  CodeableConcept? get substance;
  @override

  /// Clinical symptoms and/or signs that are observed or associated with the adverse reaction event.
  @JsonKey(name: 'Manifestation')
  List<CodeableConcept?>? get manifestation;
  @override

  /// Text description about the reaction as a whole, including details of the manifestation if required.
  @JsonKey(name: 'Description')
  String? get description;
  @override

  /// Record of the date and/or time of the onset of the Reaction.
  @JsonKey(name: 'Onset')
  String? get onset;
  @override

  /// Clinical assessment of the severity of the reaction event as a whole,
  ///  potentially considering multiple different manifestations.
  @JsonKey(
      name: 'Severity',
      unknownEnumValue: AllergyIntoleranceReactionSeverityEnum.moderate)
  AllergyIntoleranceReactionSeverityEnum? get severity;
  @override

  /// Identification of the route by which the subject was exposed to the substance.
  @JsonKey(name: 'ExposureRoute')
  CodeableConcept? get exposureRoute;
  @override

  /// Additional text about the adverse reaction event not captured in other fields.
  @JsonKey(name: 'Note')
  List<Annotation?>? get note;
  @override
  @JsonKey(ignore: true)
  _$$_AllergyIntoleranceReactionCopyWith<_$_AllergyIntoleranceReaction>
      get copyWith => throw _privateConstructorUsedError;
}
