// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'allergy_intolerance_reaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AllergyIntoleranceReaction _$AllergyIntoleranceReactionFromJson(
    Map<String, dynamic> json) {
  return _AllergyIntoleranceReaction.fromJson(json);
}

/// @nodoc
class _$AllergyIntoleranceReactionTearOff {
  const _$AllergyIntoleranceReactionTearOff();

  _AllergyIntoleranceReaction call(
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
          List<Annotation?>? note}) {
    return _AllergyIntoleranceReaction(
      id: id,
      substance: substance,
      manifestation: manifestation,
      description: description,
      onset: onset,
      severity: severity,
      exposureRoute: exposureRoute,
      note: note,
    );
  }

  AllergyIntoleranceReaction fromJson(Map<String, Object> json) {
    return AllergyIntoleranceReaction.fromJson(json);
  }
}

/// @nodoc
const $AllergyIntoleranceReaction = _$AllergyIntoleranceReactionTearOff();

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
      _$AllergyIntoleranceReactionCopyWithImpl<$Res>;
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
class _$AllergyIntoleranceReactionCopyWithImpl<$Res>
    implements $AllergyIntoleranceReactionCopyWith<$Res> {
  _$AllergyIntoleranceReactionCopyWithImpl(this._value, this._then);

  final AllergyIntoleranceReaction _value;
  // ignore: unused_field
  final $Res Function(AllergyIntoleranceReaction) _then;

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
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      substance: substance == freezed
          ? _value.substance
          : substance // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      manifestation: manifestation == freezed
          ? _value.manifestation
          : manifestation // ignore: cast_nullable_to_non_nullable
              as List<CodeableConcept?>?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      onset: onset == freezed
          ? _value.onset
          : onset // ignore: cast_nullable_to_non_nullable
              as String?,
      severity: severity == freezed
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as AllergyIntoleranceReactionSeverityEnum?,
      exposureRoute: exposureRoute == freezed
          ? _value.exposureRoute
          : exposureRoute // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as List<Annotation?>?,
    ));
  }

  @override
  $CodeableConceptCopyWith<$Res>? get substance {
    if (_value.substance == null) {
      return null;
    }

    return $CodeableConceptCopyWith<$Res>(_value.substance!, (value) {
      return _then(_value.copyWith(substance: value));
    });
  }

  @override
  $CodeableConceptCopyWith<$Res>? get exposureRoute {
    if (_value.exposureRoute == null) {
      return null;
    }

    return $CodeableConceptCopyWith<$Res>(_value.exposureRoute!, (value) {
      return _then(_value.copyWith(exposureRoute: value));
    });
  }
}

/// @nodoc
abstract class _$AllergyIntoleranceReactionCopyWith<$Res>
    implements $AllergyIntoleranceReactionCopyWith<$Res> {
  factory _$AllergyIntoleranceReactionCopyWith(
          _AllergyIntoleranceReaction value,
          $Res Function(_AllergyIntoleranceReaction) then) =
      __$AllergyIntoleranceReactionCopyWithImpl<$Res>;
  @override
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
class __$AllergyIntoleranceReactionCopyWithImpl<$Res>
    extends _$AllergyIntoleranceReactionCopyWithImpl<$Res>
    implements _$AllergyIntoleranceReactionCopyWith<$Res> {
  __$AllergyIntoleranceReactionCopyWithImpl(_AllergyIntoleranceReaction _value,
      $Res Function(_AllergyIntoleranceReaction) _then)
      : super(_value, (v) => _then(v as _AllergyIntoleranceReaction));

  @override
  _AllergyIntoleranceReaction get _value =>
      super._value as _AllergyIntoleranceReaction;

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
    return _then(_AllergyIntoleranceReaction(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      substance: substance == freezed
          ? _value.substance
          : substance // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      manifestation: manifestation == freezed
          ? _value.manifestation
          : manifestation // ignore: cast_nullable_to_non_nullable
              as List<CodeableConcept?>?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      onset: onset == freezed
          ? _value.onset
          : onset // ignore: cast_nullable_to_non_nullable
              as String?,
      severity: severity == freezed
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as AllergyIntoleranceReactionSeverityEnum?,
      exposureRoute: exposureRoute == freezed
          ? _value.exposureRoute
          : exposureRoute // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      note: note == freezed
          ? _value.note
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
          this.manifestation,
      @JsonKey(name: 'Description')
          this.description,
      @JsonKey(name: 'Onset')
          this.onset,
      @JsonKey(name: 'Severity', unknownEnumValue: AllergyIntoleranceReactionSeverityEnum.moderate)
          this.severity,
      @JsonKey(name: 'ExposureRoute')
          this.exposureRoute,
      @JsonKey(name: 'Note')
          this.note});

  factory _$_AllergyIntoleranceReaction.fromJson(Map<String, dynamic> json) =>
      _$_$_AllergyIntoleranceReactionFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? id;
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
  final CodeableConcept? substance;
  @override

  /// Clinical symptoms and/or signs that are observed or associated with the adverse reaction event.
  @JsonKey(name: 'Manifestation')
  final List<CodeableConcept?>? manifestation;
  @override

  /// Text description about the reaction as a whole, including details of the manifestation if required.
  @JsonKey(name: 'Description')
  final String? description;
  @override

  /// Record of the date and/or time of the onset of the Reaction.
  @JsonKey(name: 'Onset')
  final String? onset;
  @override

  /// Clinical assessment of the severity of the reaction event as a whole,
  ///  potentially considering multiple different manifestations.
  @JsonKey(
      name: 'Severity',
      unknownEnumValue: AllergyIntoleranceReactionSeverityEnum.moderate)
  final AllergyIntoleranceReactionSeverityEnum? severity;
  @override

  /// Identification of the route by which the subject was exposed to the substance.
  @JsonKey(name: 'ExposureRoute')
  final CodeableConcept? exposureRoute;
  @override

  /// Additional text about the adverse reaction event not captured in other fields.
  @JsonKey(name: 'Note')
  final List<Annotation?>? note;

  @override
  String toString() {
    return 'AllergyIntoleranceReaction(id: $id, substance: $substance, manifestation: $manifestation, description: $description, onset: $onset, severity: $severity, exposureRoute: $exposureRoute, note: $note)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AllergyIntoleranceReaction &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.substance, substance) ||
                const DeepCollectionEquality()
                    .equals(other.substance, substance)) &&
            (identical(other.manifestation, manifestation) ||
                const DeepCollectionEquality()
                    .equals(other.manifestation, manifestation)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.onset, onset) ||
                const DeepCollectionEquality().equals(other.onset, onset)) &&
            (identical(other.severity, severity) ||
                const DeepCollectionEquality()
                    .equals(other.severity, severity)) &&
            (identical(other.exposureRoute, exposureRoute) ||
                const DeepCollectionEquality()
                    .equals(other.exposureRoute, exposureRoute)) &&
            (identical(other.note, note) ||
                const DeepCollectionEquality().equals(other.note, note)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(substance) ^
      const DeepCollectionEquality().hash(manifestation) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(onset) ^
      const DeepCollectionEquality().hash(severity) ^
      const DeepCollectionEquality().hash(exposureRoute) ^
      const DeepCollectionEquality().hash(note);

  @JsonKey(ignore: true)
  @override
  _$AllergyIntoleranceReactionCopyWith<_AllergyIntoleranceReaction>
      get copyWith => __$AllergyIntoleranceReactionCopyWithImpl<
          _AllergyIntoleranceReaction>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AllergyIntoleranceReactionToJson(this);
  }
}

abstract class _AllergyIntoleranceReaction
    implements AllergyIntoleranceReaction {
  factory _AllergyIntoleranceReaction(
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
          List<Annotation?>? note}) = _$_AllergyIntoleranceReaction;

  factory _AllergyIntoleranceReaction.fromJson(Map<String, dynamic> json) =
      _$_AllergyIntoleranceReaction.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;
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
  CodeableConcept? get substance => throw _privateConstructorUsedError;
  @override

  /// Clinical symptoms and/or signs that are observed or associated with the adverse reaction event.
  @JsonKey(name: 'Manifestation')
  List<CodeableConcept?>? get manifestation =>
      throw _privateConstructorUsedError;
  @override

  /// Text description about the reaction as a whole, including details of the manifestation if required.
  @JsonKey(name: 'Description')
  String? get description => throw _privateConstructorUsedError;
  @override

  /// Record of the date and/or time of the onset of the Reaction.
  @JsonKey(name: 'Onset')
  String? get onset => throw _privateConstructorUsedError;
  @override

  /// Clinical assessment of the severity of the reaction event as a whole,
  ///  potentially considering multiple different manifestations.
  @JsonKey(
      name: 'Severity',
      unknownEnumValue: AllergyIntoleranceReactionSeverityEnum.moderate)
  AllergyIntoleranceReactionSeverityEnum? get severity =>
      throw _privateConstructorUsedError;
  @override

  /// Identification of the route by which the subject was exposed to the substance.
  @JsonKey(name: 'ExposureRoute')
  CodeableConcept? get exposureRoute => throw _privateConstructorUsedError;
  @override

  /// Additional text about the adverse reaction event not captured in other fields.
  @JsonKey(name: 'Note')
  List<Annotation?>? get note => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AllergyIntoleranceReactionCopyWith<_AllergyIntoleranceReaction>
      get copyWith => throw _privateConstructorUsedError;
}
