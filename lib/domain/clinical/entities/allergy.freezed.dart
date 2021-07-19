// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'allergy.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AllergyIntolerance _$AllergyIntoleranceFromJson(Map<String, dynamic> json) {
  return _AllergyIntolerance.fromJson(json);
}

/// @nodoc
class _$AllergyIntoleranceTearOff {
  const _$AllergyIntoleranceTearOff();

  _AllergyIntolerance call(
      {@JsonKey(name: 'ID')
          String? id,
      @JsonKey(name: 'Identifier')
          List<Identifier?>? identifier,
      @JsonKey(name: 'ClinicalStatus')
          CodeableConcept? clinicalStatus,
      @JsonKey(name: 'VerificationStatus')
          CodeableConcept? verificationStatus,
      @JsonKey(name: 'Type', unknownEnumValue: AllergyIntoleranceTypeEnum.allergy)
          AllergyIntoleranceTypeEnum? type,
      @JsonKey(name: 'Category', unknownEnumValue: AllergyIntoleranceCategoryEnum.environment)
          List<AllergyIntoleranceCategoryEnum?>? category,
      @JsonKey(name: 'Criticality', unknownEnumValue: AllergyIntoleranceCriticalityEnum.unable_to_assess)
          AllergyIntoleranceCriticalityEnum? criticality,
      @JsonKey(name: 'Code')
          CodeableConcept? code,
      @JsonKey(name: 'Patient')
          Reference? patient,
      @JsonKey(name: 'Encounter')
          Reference? encounter,
      @JsonKey(name: 'OnsetDateTime')
          String? onsetDateTime,
      @JsonKey(name: 'OnsetAge')
          Age? onsetAge,
      @JsonKey(name: 'OnsetPeriod')
          Period? onsetPeriod,
      @JsonKey(name: 'OnsetRange')
          Range? onsetRange,
      @JsonKey(name: 'OnsetString')
          String? onsetString,
      @JsonKey(name: 'RecordedDate')
          String? recordedDate,
      @JsonKey(name: 'Recorder')
          Reference? recorder,
      @JsonKey(name: 'Asserter')
          Reference? asserter,
      @JsonKey(name: 'LastOccurrence')
          String? lastOccurrence,
      @JsonKey(name: 'Note')
          List<Annotation?>? note,
      @JsonKey(name: 'Reaction')
          List<AllergyIntoleranceReaction?>? reaction}) {
    return _AllergyIntolerance(
      id: id,
      identifier: identifier,
      clinicalStatus: clinicalStatus,
      verificationStatus: verificationStatus,
      type: type,
      category: category,
      criticality: criticality,
      code: code,
      patient: patient,
      encounter: encounter,
      onsetDateTime: onsetDateTime,
      onsetAge: onsetAge,
      onsetPeriod: onsetPeriod,
      onsetRange: onsetRange,
      onsetString: onsetString,
      recordedDate: recordedDate,
      recorder: recorder,
      asserter: asserter,
      lastOccurrence: lastOccurrence,
      note: note,
      reaction: reaction,
    );
  }

  AllergyIntolerance fromJson(Map<String, Object> json) {
    return AllergyIntolerance.fromJson(json);
  }
}

/// @nodoc
const $AllergyIntolerance = _$AllergyIntoleranceTearOff();

/// @nodoc
mixin _$AllergyIntolerance {
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;

  /// Business identifiers assigned to this AllergyIntolerance by
  ///  the performer or other systems which remain constant as the resource
  ///  is updated and propagates from server to server.
  @JsonKey(name: 'Identifier')
  List<Identifier?>? get identifier => throw _privateConstructorUsedError;

  /// The clinical status of the allergy or intolerance.
  @JsonKey(name: 'ClinicalStatus')
  CodeableConcept? get clinicalStatus => throw _privateConstructorUsedError;

  /// Assertion about certainty associated with the propensity, or
  ///  potential risk, of a reaction to the identified substance
  ///  (including pharmaceutical product).
  @JsonKey(name: 'VerificationStatus')
  CodeableConcept? get verificationStatus => throw _privateConstructorUsedError;

  /// Identification of the underlying physiological mechanism for the reaction risk
  @JsonKey(name: 'Type', unknownEnumValue: AllergyIntoleranceTypeEnum.allergy)
  AllergyIntoleranceTypeEnum? get type => throw _privateConstructorUsedError;

  /// Category of the identified substance.
  @JsonKey(
      name: 'Category',
      unknownEnumValue: AllergyIntoleranceCategoryEnum.environment)
  List<AllergyIntoleranceCategoryEnum?>? get category =>
      throw _privateConstructorUsedError;

  /// Estimate of the potential clinical harm, or seriousness, of the
  ///  reaction to the identified substance.
  @JsonKey(
      name: 'Criticality',
      unknownEnumValue: AllergyIntoleranceCriticalityEnum.unable_to_assess)
  AllergyIntoleranceCriticalityEnum? get criticality =>
      throw _privateConstructorUsedError;

  /// Code for an allergy or intolerance statement
  ///  (either a positive or a negated/excluded statement).
  ///
  /// This may be a code for a substance or pharmaceutical product that is considered to
  ///  be responsible for the adverse reaction risk (e.g., "Latex"), an
  ///  allergy or intolerance condition (e.g., "Latex allergy"), or a
  ///  negated/excluded code for a specific substance or class (e.g., "No
  ///  latex allergy") or a general or categorical negated statement (e.g.,
  ///  "No known allergy", "No known drug allergies"). Note: the substance
  ///  for a specific reaction may be different from the substance identified
  ///  as the cause of the risk, but it must be consistent with it. For
  ///  instance, it may be a more specific substance (e.g. a brand medication)
  ///  or a composite product that includes the identified substance. It must
  ///  be clinically safe to only process the 'code' and ignore the
  ///  'reaction.substance'. If a receiving system is unable to confirm that
  ///  AllergyIntolerance.reaction.substance falls within the semantic scope
  ///  of AllergyIntolerance.code, then the receiving system should ignore
  ///  AllergyIntolerance.reaction.substance
  @JsonKey(name: 'Code')
  CodeableConcept? get code => throw _privateConstructorUsedError;

  /// The patient who has the allergy or intolerance.
  @JsonKey(name: 'Patient')
  Reference? get patient => throw _privateConstructorUsedError;

  /// The encounter when the allergy or intolerance was asserted.
  @JsonKey(name: 'Encounter')
  Reference? get encounter => throw _privateConstructorUsedError;

  /// Estimated or actual date, date-time, or age when allergy or intolerance
  ///  was identified.
  @JsonKey(name: 'OnsetDateTime')
  String? get onsetDateTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'OnsetAge')
  Age? get onsetAge => throw _privateConstructorUsedError;
  @JsonKey(name: 'OnsetPeriod')
  Period? get onsetPeriod => throw _privateConstructorUsedError;
  @JsonKey(name: 'OnsetRange')
  Range? get onsetRange => throw _privateConstructorUsedError;
  @JsonKey(name: 'OnsetString')
  String? get onsetString => throw _privateConstructorUsedError;

  /// The recordedDate represents when this particular AllergyIntolerance
  ///  record was created in the system, which is often a system-generated date.
  @JsonKey(name: 'RecordedDate')
  String? get recordedDate => throw _privateConstructorUsedError;

  /// Individual who recorded the record and takes responsibility for its content.
  @JsonKey(name: 'Recorder')
  Reference? get recorder => throw _privateConstructorUsedError;

  /// The source of the information about the allergy that is recorded
  @JsonKey(name: 'Asserter')
  Reference? get asserter => throw _privateConstructorUsedError;

  /// Represents the date and/or time of the last known occurrence of a reaction event.
  @JsonKey(name: 'LastOccurrence')
  String? get lastOccurrence => throw _privateConstructorUsedError;

  /// Additional narrative about the propensity for the Adverse Reaction, not captured in other fields.
  @JsonKey(name: 'Note')
  List<Annotation?>? get note => throw _privateConstructorUsedError;

  /// Details about each adverse reaction event linked to exposure to the
  ///  identified substance.
  @JsonKey(name: 'Reaction')
  List<AllergyIntoleranceReaction?>? get reaction =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AllergyIntoleranceCopyWith<AllergyIntolerance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllergyIntoleranceCopyWith<$Res> {
  factory $AllergyIntoleranceCopyWith(
          AllergyIntolerance value, $Res Function(AllergyIntolerance) then) =
      _$AllergyIntoleranceCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'ID')
          String? id,
      @JsonKey(name: 'Identifier')
          List<Identifier?>? identifier,
      @JsonKey(name: 'ClinicalStatus')
          CodeableConcept? clinicalStatus,
      @JsonKey(name: 'VerificationStatus')
          CodeableConcept? verificationStatus,
      @JsonKey(name: 'Type', unknownEnumValue: AllergyIntoleranceTypeEnum.allergy)
          AllergyIntoleranceTypeEnum? type,
      @JsonKey(name: 'Category', unknownEnumValue: AllergyIntoleranceCategoryEnum.environment)
          List<AllergyIntoleranceCategoryEnum?>? category,
      @JsonKey(name: 'Criticality', unknownEnumValue: AllergyIntoleranceCriticalityEnum.unable_to_assess)
          AllergyIntoleranceCriticalityEnum? criticality,
      @JsonKey(name: 'Code')
          CodeableConcept? code,
      @JsonKey(name: 'Patient')
          Reference? patient,
      @JsonKey(name: 'Encounter')
          Reference? encounter,
      @JsonKey(name: 'OnsetDateTime')
          String? onsetDateTime,
      @JsonKey(name: 'OnsetAge')
          Age? onsetAge,
      @JsonKey(name: 'OnsetPeriod')
          Period? onsetPeriod,
      @JsonKey(name: 'OnsetRange')
          Range? onsetRange,
      @JsonKey(name: 'OnsetString')
          String? onsetString,
      @JsonKey(name: 'RecordedDate')
          String? recordedDate,
      @JsonKey(name: 'Recorder')
          Reference? recorder,
      @JsonKey(name: 'Asserter')
          Reference? asserter,
      @JsonKey(name: 'LastOccurrence')
          String? lastOccurrence,
      @JsonKey(name: 'Note')
          List<Annotation?>? note,
      @JsonKey(name: 'Reaction')
          List<AllergyIntoleranceReaction?>? reaction});

  $CodeableConceptCopyWith<$Res>? get clinicalStatus;
  $CodeableConceptCopyWith<$Res>? get verificationStatus;
  $CodeableConceptCopyWith<$Res>? get code;
  $ReferenceCopyWith<$Res>? get patient;
  $ReferenceCopyWith<$Res>? get encounter;
  $AgeCopyWith<$Res>? get onsetAge;
  $PeriodCopyWith<$Res>? get onsetPeriod;
  $RangeCopyWith<$Res>? get onsetRange;
  $ReferenceCopyWith<$Res>? get recorder;
  $ReferenceCopyWith<$Res>? get asserter;
}

/// @nodoc
class _$AllergyIntoleranceCopyWithImpl<$Res>
    implements $AllergyIntoleranceCopyWith<$Res> {
  _$AllergyIntoleranceCopyWithImpl(this._value, this._then);

  final AllergyIntolerance _value;
  // ignore: unused_field
  final $Res Function(AllergyIntolerance) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? identifier = freezed,
    Object? clinicalStatus = freezed,
    Object? verificationStatus = freezed,
    Object? type = freezed,
    Object? category = freezed,
    Object? criticality = freezed,
    Object? code = freezed,
    Object? patient = freezed,
    Object? encounter = freezed,
    Object? onsetDateTime = freezed,
    Object? onsetAge = freezed,
    Object? onsetPeriod = freezed,
    Object? onsetRange = freezed,
    Object? onsetString = freezed,
    Object? recordedDate = freezed,
    Object? recorder = freezed,
    Object? asserter = freezed,
    Object? lastOccurrence = freezed,
    Object? note = freezed,
    Object? reaction = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      identifier: identifier == freezed
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as List<Identifier?>?,
      clinicalStatus: clinicalStatus == freezed
          ? _value.clinicalStatus
          : clinicalStatus // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      verificationStatus: verificationStatus == freezed
          ? _value.verificationStatus
          : verificationStatus // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AllergyIntoleranceTypeEnum?,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as List<AllergyIntoleranceCategoryEnum?>?,
      criticality: criticality == freezed
          ? _value.criticality
          : criticality // ignore: cast_nullable_to_non_nullable
              as AllergyIntoleranceCriticalityEnum?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      patient: patient == freezed
          ? _value.patient
          : patient // ignore: cast_nullable_to_non_nullable
              as Reference?,
      encounter: encounter == freezed
          ? _value.encounter
          : encounter // ignore: cast_nullable_to_non_nullable
              as Reference?,
      onsetDateTime: onsetDateTime == freezed
          ? _value.onsetDateTime
          : onsetDateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      onsetAge: onsetAge == freezed
          ? _value.onsetAge
          : onsetAge // ignore: cast_nullable_to_non_nullable
              as Age?,
      onsetPeriod: onsetPeriod == freezed
          ? _value.onsetPeriod
          : onsetPeriod // ignore: cast_nullable_to_non_nullable
              as Period?,
      onsetRange: onsetRange == freezed
          ? _value.onsetRange
          : onsetRange // ignore: cast_nullable_to_non_nullable
              as Range?,
      onsetString: onsetString == freezed
          ? _value.onsetString
          : onsetString // ignore: cast_nullable_to_non_nullable
              as String?,
      recordedDate: recordedDate == freezed
          ? _value.recordedDate
          : recordedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      recorder: recorder == freezed
          ? _value.recorder
          : recorder // ignore: cast_nullable_to_non_nullable
              as Reference?,
      asserter: asserter == freezed
          ? _value.asserter
          : asserter // ignore: cast_nullable_to_non_nullable
              as Reference?,
      lastOccurrence: lastOccurrence == freezed
          ? _value.lastOccurrence
          : lastOccurrence // ignore: cast_nullable_to_non_nullable
              as String?,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as List<Annotation?>?,
      reaction: reaction == freezed
          ? _value.reaction
          : reaction // ignore: cast_nullable_to_non_nullable
              as List<AllergyIntoleranceReaction?>?,
    ));
  }

  @override
  $CodeableConceptCopyWith<$Res>? get clinicalStatus {
    if (_value.clinicalStatus == null) {
      return null;
    }

    return $CodeableConceptCopyWith<$Res>(_value.clinicalStatus!, (value) {
      return _then(_value.copyWith(clinicalStatus: value));
    });
  }

  @override
  $CodeableConceptCopyWith<$Res>? get verificationStatus {
    if (_value.verificationStatus == null) {
      return null;
    }

    return $CodeableConceptCopyWith<$Res>(_value.verificationStatus!, (value) {
      return _then(_value.copyWith(verificationStatus: value));
    });
  }

  @override
  $CodeableConceptCopyWith<$Res>? get code {
    if (_value.code == null) {
      return null;
    }

    return $CodeableConceptCopyWith<$Res>(_value.code!, (value) {
      return _then(_value.copyWith(code: value));
    });
  }

  @override
  $ReferenceCopyWith<$Res>? get patient {
    if (_value.patient == null) {
      return null;
    }

    return $ReferenceCopyWith<$Res>(_value.patient!, (value) {
      return _then(_value.copyWith(patient: value));
    });
  }

  @override
  $ReferenceCopyWith<$Res>? get encounter {
    if (_value.encounter == null) {
      return null;
    }

    return $ReferenceCopyWith<$Res>(_value.encounter!, (value) {
      return _then(_value.copyWith(encounter: value));
    });
  }

  @override
  $AgeCopyWith<$Res>? get onsetAge {
    if (_value.onsetAge == null) {
      return null;
    }

    return $AgeCopyWith<$Res>(_value.onsetAge!, (value) {
      return _then(_value.copyWith(onsetAge: value));
    });
  }

  @override
  $PeriodCopyWith<$Res>? get onsetPeriod {
    if (_value.onsetPeriod == null) {
      return null;
    }

    return $PeriodCopyWith<$Res>(_value.onsetPeriod!, (value) {
      return _then(_value.copyWith(onsetPeriod: value));
    });
  }

  @override
  $RangeCopyWith<$Res>? get onsetRange {
    if (_value.onsetRange == null) {
      return null;
    }

    return $RangeCopyWith<$Res>(_value.onsetRange!, (value) {
      return _then(_value.copyWith(onsetRange: value));
    });
  }

  @override
  $ReferenceCopyWith<$Res>? get recorder {
    if (_value.recorder == null) {
      return null;
    }

    return $ReferenceCopyWith<$Res>(_value.recorder!, (value) {
      return _then(_value.copyWith(recorder: value));
    });
  }

  @override
  $ReferenceCopyWith<$Res>? get asserter {
    if (_value.asserter == null) {
      return null;
    }

    return $ReferenceCopyWith<$Res>(_value.asserter!, (value) {
      return _then(_value.copyWith(asserter: value));
    });
  }
}

/// @nodoc
abstract class _$AllergyIntoleranceCopyWith<$Res>
    implements $AllergyIntoleranceCopyWith<$Res> {
  factory _$AllergyIntoleranceCopyWith(
          _AllergyIntolerance value, $Res Function(_AllergyIntolerance) then) =
      __$AllergyIntoleranceCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'ID')
          String? id,
      @JsonKey(name: 'Identifier')
          List<Identifier?>? identifier,
      @JsonKey(name: 'ClinicalStatus')
          CodeableConcept? clinicalStatus,
      @JsonKey(name: 'VerificationStatus')
          CodeableConcept? verificationStatus,
      @JsonKey(name: 'Type', unknownEnumValue: AllergyIntoleranceTypeEnum.allergy)
          AllergyIntoleranceTypeEnum? type,
      @JsonKey(name: 'Category', unknownEnumValue: AllergyIntoleranceCategoryEnum.environment)
          List<AllergyIntoleranceCategoryEnum?>? category,
      @JsonKey(name: 'Criticality', unknownEnumValue: AllergyIntoleranceCriticalityEnum.unable_to_assess)
          AllergyIntoleranceCriticalityEnum? criticality,
      @JsonKey(name: 'Code')
          CodeableConcept? code,
      @JsonKey(name: 'Patient')
          Reference? patient,
      @JsonKey(name: 'Encounter')
          Reference? encounter,
      @JsonKey(name: 'OnsetDateTime')
          String? onsetDateTime,
      @JsonKey(name: 'OnsetAge')
          Age? onsetAge,
      @JsonKey(name: 'OnsetPeriod')
          Period? onsetPeriod,
      @JsonKey(name: 'OnsetRange')
          Range? onsetRange,
      @JsonKey(name: 'OnsetString')
          String? onsetString,
      @JsonKey(name: 'RecordedDate')
          String? recordedDate,
      @JsonKey(name: 'Recorder')
          Reference? recorder,
      @JsonKey(name: 'Asserter')
          Reference? asserter,
      @JsonKey(name: 'LastOccurrence')
          String? lastOccurrence,
      @JsonKey(name: 'Note')
          List<Annotation?>? note,
      @JsonKey(name: 'Reaction')
          List<AllergyIntoleranceReaction?>? reaction});

  @override
  $CodeableConceptCopyWith<$Res>? get clinicalStatus;
  @override
  $CodeableConceptCopyWith<$Res>? get verificationStatus;
  @override
  $CodeableConceptCopyWith<$Res>? get code;
  @override
  $ReferenceCopyWith<$Res>? get patient;
  @override
  $ReferenceCopyWith<$Res>? get encounter;
  @override
  $AgeCopyWith<$Res>? get onsetAge;
  @override
  $PeriodCopyWith<$Res>? get onsetPeriod;
  @override
  $RangeCopyWith<$Res>? get onsetRange;
  @override
  $ReferenceCopyWith<$Res>? get recorder;
  @override
  $ReferenceCopyWith<$Res>? get asserter;
}

/// @nodoc
class __$AllergyIntoleranceCopyWithImpl<$Res>
    extends _$AllergyIntoleranceCopyWithImpl<$Res>
    implements _$AllergyIntoleranceCopyWith<$Res> {
  __$AllergyIntoleranceCopyWithImpl(
      _AllergyIntolerance _value, $Res Function(_AllergyIntolerance) _then)
      : super(_value, (v) => _then(v as _AllergyIntolerance));

  @override
  _AllergyIntolerance get _value => super._value as _AllergyIntolerance;

  @override
  $Res call({
    Object? id = freezed,
    Object? identifier = freezed,
    Object? clinicalStatus = freezed,
    Object? verificationStatus = freezed,
    Object? type = freezed,
    Object? category = freezed,
    Object? criticality = freezed,
    Object? code = freezed,
    Object? patient = freezed,
    Object? encounter = freezed,
    Object? onsetDateTime = freezed,
    Object? onsetAge = freezed,
    Object? onsetPeriod = freezed,
    Object? onsetRange = freezed,
    Object? onsetString = freezed,
    Object? recordedDate = freezed,
    Object? recorder = freezed,
    Object? asserter = freezed,
    Object? lastOccurrence = freezed,
    Object? note = freezed,
    Object? reaction = freezed,
  }) {
    return _then(_AllergyIntolerance(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      identifier: identifier == freezed
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as List<Identifier?>?,
      clinicalStatus: clinicalStatus == freezed
          ? _value.clinicalStatus
          : clinicalStatus // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      verificationStatus: verificationStatus == freezed
          ? _value.verificationStatus
          : verificationStatus // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AllergyIntoleranceTypeEnum?,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as List<AllergyIntoleranceCategoryEnum?>?,
      criticality: criticality == freezed
          ? _value.criticality
          : criticality // ignore: cast_nullable_to_non_nullable
              as AllergyIntoleranceCriticalityEnum?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      patient: patient == freezed
          ? _value.patient
          : patient // ignore: cast_nullable_to_non_nullable
              as Reference?,
      encounter: encounter == freezed
          ? _value.encounter
          : encounter // ignore: cast_nullable_to_non_nullable
              as Reference?,
      onsetDateTime: onsetDateTime == freezed
          ? _value.onsetDateTime
          : onsetDateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      onsetAge: onsetAge == freezed
          ? _value.onsetAge
          : onsetAge // ignore: cast_nullable_to_non_nullable
              as Age?,
      onsetPeriod: onsetPeriod == freezed
          ? _value.onsetPeriod
          : onsetPeriod // ignore: cast_nullable_to_non_nullable
              as Period?,
      onsetRange: onsetRange == freezed
          ? _value.onsetRange
          : onsetRange // ignore: cast_nullable_to_non_nullable
              as Range?,
      onsetString: onsetString == freezed
          ? _value.onsetString
          : onsetString // ignore: cast_nullable_to_non_nullable
              as String?,
      recordedDate: recordedDate == freezed
          ? _value.recordedDate
          : recordedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      recorder: recorder == freezed
          ? _value.recorder
          : recorder // ignore: cast_nullable_to_non_nullable
              as Reference?,
      asserter: asserter == freezed
          ? _value.asserter
          : asserter // ignore: cast_nullable_to_non_nullable
              as Reference?,
      lastOccurrence: lastOccurrence == freezed
          ? _value.lastOccurrence
          : lastOccurrence // ignore: cast_nullable_to_non_nullable
              as String?,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as List<Annotation?>?,
      reaction: reaction == freezed
          ? _value.reaction
          : reaction // ignore: cast_nullable_to_non_nullable
              as List<AllergyIntoleranceReaction?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AllergyIntolerance implements _AllergyIntolerance {
  _$_AllergyIntolerance(
      {@JsonKey(name: 'ID')
          this.id,
      @JsonKey(name: 'Identifier')
          this.identifier,
      @JsonKey(name: 'ClinicalStatus')
          this.clinicalStatus,
      @JsonKey(name: 'VerificationStatus')
          this.verificationStatus,
      @JsonKey(name: 'Type', unknownEnumValue: AllergyIntoleranceTypeEnum.allergy)
          this.type,
      @JsonKey(name: 'Category', unknownEnumValue: AllergyIntoleranceCategoryEnum.environment)
          this.category,
      @JsonKey(name: 'Criticality', unknownEnumValue: AllergyIntoleranceCriticalityEnum.unable_to_assess)
          this.criticality,
      @JsonKey(name: 'Code')
          this.code,
      @JsonKey(name: 'Patient')
          this.patient,
      @JsonKey(name: 'Encounter')
          this.encounter,
      @JsonKey(name: 'OnsetDateTime')
          this.onsetDateTime,
      @JsonKey(name: 'OnsetAge')
          this.onsetAge,
      @JsonKey(name: 'OnsetPeriod')
          this.onsetPeriod,
      @JsonKey(name: 'OnsetRange')
          this.onsetRange,
      @JsonKey(name: 'OnsetString')
          this.onsetString,
      @JsonKey(name: 'RecordedDate')
          this.recordedDate,
      @JsonKey(name: 'Recorder')
          this.recorder,
      @JsonKey(name: 'Asserter')
          this.asserter,
      @JsonKey(name: 'LastOccurrence')
          this.lastOccurrence,
      @JsonKey(name: 'Note')
          this.note,
      @JsonKey(name: 'Reaction')
          this.reaction});

  factory _$_AllergyIntolerance.fromJson(Map<String, dynamic> json) =>
      _$_$_AllergyIntoleranceFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? id;
  @override

  /// Business identifiers assigned to this AllergyIntolerance by
  ///  the performer or other systems which remain constant as the resource
  ///  is updated and propagates from server to server.
  @JsonKey(name: 'Identifier')
  final List<Identifier?>? identifier;
  @override

  /// The clinical status of the allergy or intolerance.
  @JsonKey(name: 'ClinicalStatus')
  final CodeableConcept? clinicalStatus;
  @override

  /// Assertion about certainty associated with the propensity, or
  ///  potential risk, of a reaction to the identified substance
  ///  (including pharmaceutical product).
  @JsonKey(name: 'VerificationStatus')
  final CodeableConcept? verificationStatus;
  @override

  /// Identification of the underlying physiological mechanism for the reaction risk
  @JsonKey(name: 'Type', unknownEnumValue: AllergyIntoleranceTypeEnum.allergy)
  final AllergyIntoleranceTypeEnum? type;
  @override

  /// Category of the identified substance.
  @JsonKey(
      name: 'Category',
      unknownEnumValue: AllergyIntoleranceCategoryEnum.environment)
  final List<AllergyIntoleranceCategoryEnum?>? category;
  @override

  /// Estimate of the potential clinical harm, or seriousness, of the
  ///  reaction to the identified substance.
  @JsonKey(
      name: 'Criticality',
      unknownEnumValue: AllergyIntoleranceCriticalityEnum.unable_to_assess)
  final AllergyIntoleranceCriticalityEnum? criticality;
  @override

  /// Code for an allergy or intolerance statement
  ///  (either a positive or a negated/excluded statement).
  ///
  /// This may be a code for a substance or pharmaceutical product that is considered to
  ///  be responsible for the adverse reaction risk (e.g., "Latex"), an
  ///  allergy or intolerance condition (e.g., "Latex allergy"), or a
  ///  negated/excluded code for a specific substance or class (e.g., "No
  ///  latex allergy") or a general or categorical negated statement (e.g.,
  ///  "No known allergy", "No known drug allergies"). Note: the substance
  ///  for a specific reaction may be different from the substance identified
  ///  as the cause of the risk, but it must be consistent with it. For
  ///  instance, it may be a more specific substance (e.g. a brand medication)
  ///  or a composite product that includes the identified substance. It must
  ///  be clinically safe to only process the 'code' and ignore the
  ///  'reaction.substance'. If a receiving system is unable to confirm that
  ///  AllergyIntolerance.reaction.substance falls within the semantic scope
  ///  of AllergyIntolerance.code, then the receiving system should ignore
  ///  AllergyIntolerance.reaction.substance
  @JsonKey(name: 'Code')
  final CodeableConcept? code;
  @override

  /// The patient who has the allergy or intolerance.
  @JsonKey(name: 'Patient')
  final Reference? patient;
  @override

  /// The encounter when the allergy or intolerance was asserted.
  @JsonKey(name: 'Encounter')
  final Reference? encounter;
  @override

  /// Estimated or actual date, date-time, or age when allergy or intolerance
  ///  was identified.
  @JsonKey(name: 'OnsetDateTime')
  final String? onsetDateTime;
  @override
  @JsonKey(name: 'OnsetAge')
  final Age? onsetAge;
  @override
  @JsonKey(name: 'OnsetPeriod')
  final Period? onsetPeriod;
  @override
  @JsonKey(name: 'OnsetRange')
  final Range? onsetRange;
  @override
  @JsonKey(name: 'OnsetString')
  final String? onsetString;
  @override

  /// The recordedDate represents when this particular AllergyIntolerance
  ///  record was created in the system, which is often a system-generated date.
  @JsonKey(name: 'RecordedDate')
  final String? recordedDate;
  @override

  /// Individual who recorded the record and takes responsibility for its content.
  @JsonKey(name: 'Recorder')
  final Reference? recorder;
  @override

  /// The source of the information about the allergy that is recorded
  @JsonKey(name: 'Asserter')
  final Reference? asserter;
  @override

  /// Represents the date and/or time of the last known occurrence of a reaction event.
  @JsonKey(name: 'LastOccurrence')
  final String? lastOccurrence;
  @override

  /// Additional narrative about the propensity for the Adverse Reaction, not captured in other fields.
  @JsonKey(name: 'Note')
  final List<Annotation?>? note;
  @override

  /// Details about each adverse reaction event linked to exposure to the
  ///  identified substance.
  @JsonKey(name: 'Reaction')
  final List<AllergyIntoleranceReaction?>? reaction;

  @override
  String toString() {
    return 'AllergyIntolerance(id: $id, identifier: $identifier, clinicalStatus: $clinicalStatus, verificationStatus: $verificationStatus, type: $type, category: $category, criticality: $criticality, code: $code, patient: $patient, encounter: $encounter, onsetDateTime: $onsetDateTime, onsetAge: $onsetAge, onsetPeriod: $onsetPeriod, onsetRange: $onsetRange, onsetString: $onsetString, recordedDate: $recordedDate, recorder: $recorder, asserter: $asserter, lastOccurrence: $lastOccurrence, note: $note, reaction: $reaction)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AllergyIntolerance &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.identifier, identifier) ||
                const DeepCollectionEquality()
                    .equals(other.identifier, identifier)) &&
            (identical(other.clinicalStatus, clinicalStatus) ||
                const DeepCollectionEquality()
                    .equals(other.clinicalStatus, clinicalStatus)) &&
            (identical(other.verificationStatus, verificationStatus) ||
                const DeepCollectionEquality()
                    .equals(other.verificationStatus, verificationStatus)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.criticality, criticality) ||
                const DeepCollectionEquality()
                    .equals(other.criticality, criticality)) &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.patient, patient) ||
                const DeepCollectionEquality()
                    .equals(other.patient, patient)) &&
            (identical(other.encounter, encounter) ||
                const DeepCollectionEquality()
                    .equals(other.encounter, encounter)) &&
            (identical(other.onsetDateTime, onsetDateTime) ||
                const DeepCollectionEquality()
                    .equals(other.onsetDateTime, onsetDateTime)) &&
            (identical(other.onsetAge, onsetAge) ||
                const DeepCollectionEquality()
                    .equals(other.onsetAge, onsetAge)) &&
            (identical(other.onsetPeriod, onsetPeriod) ||
                const DeepCollectionEquality()
                    .equals(other.onsetPeriod, onsetPeriod)) &&
            (identical(other.onsetRange, onsetRange) ||
                const DeepCollectionEquality()
                    .equals(other.onsetRange, onsetRange)) &&
            (identical(other.onsetString, onsetString) ||
                const DeepCollectionEquality()
                    .equals(other.onsetString, onsetString)) &&
            (identical(other.recordedDate, recordedDate) ||
                const DeepCollectionEquality()
                    .equals(other.recordedDate, recordedDate)) &&
            (identical(other.recorder, recorder) ||
                const DeepCollectionEquality()
                    .equals(other.recorder, recorder)) &&
            (identical(other.asserter, asserter) ||
                const DeepCollectionEquality()
                    .equals(other.asserter, asserter)) &&
            (identical(other.lastOccurrence, lastOccurrence) ||
                const DeepCollectionEquality()
                    .equals(other.lastOccurrence, lastOccurrence)) &&
            (identical(other.note, note) ||
                const DeepCollectionEquality().equals(other.note, note)) &&
            (identical(other.reaction, reaction) ||
                const DeepCollectionEquality()
                    .equals(other.reaction, reaction)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(identifier) ^
      const DeepCollectionEquality().hash(clinicalStatus) ^
      const DeepCollectionEquality().hash(verificationStatus) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(criticality) ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(patient) ^
      const DeepCollectionEquality().hash(encounter) ^
      const DeepCollectionEquality().hash(onsetDateTime) ^
      const DeepCollectionEquality().hash(onsetAge) ^
      const DeepCollectionEquality().hash(onsetPeriod) ^
      const DeepCollectionEquality().hash(onsetRange) ^
      const DeepCollectionEquality().hash(onsetString) ^
      const DeepCollectionEquality().hash(recordedDate) ^
      const DeepCollectionEquality().hash(recorder) ^
      const DeepCollectionEquality().hash(asserter) ^
      const DeepCollectionEquality().hash(lastOccurrence) ^
      const DeepCollectionEquality().hash(note) ^
      const DeepCollectionEquality().hash(reaction);

  @JsonKey(ignore: true)
  @override
  _$AllergyIntoleranceCopyWith<_AllergyIntolerance> get copyWith =>
      __$AllergyIntoleranceCopyWithImpl<_AllergyIntolerance>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AllergyIntoleranceToJson(this);
  }
}

abstract class _AllergyIntolerance implements AllergyIntolerance {
  factory _AllergyIntolerance(
      {@JsonKey(name: 'ID')
          String? id,
      @JsonKey(name: 'Identifier')
          List<Identifier?>? identifier,
      @JsonKey(name: 'ClinicalStatus')
          CodeableConcept? clinicalStatus,
      @JsonKey(name: 'VerificationStatus')
          CodeableConcept? verificationStatus,
      @JsonKey(name: 'Type', unknownEnumValue: AllergyIntoleranceTypeEnum.allergy)
          AllergyIntoleranceTypeEnum? type,
      @JsonKey(name: 'Category', unknownEnumValue: AllergyIntoleranceCategoryEnum.environment)
          List<AllergyIntoleranceCategoryEnum?>? category,
      @JsonKey(name: 'Criticality', unknownEnumValue: AllergyIntoleranceCriticalityEnum.unable_to_assess)
          AllergyIntoleranceCriticalityEnum? criticality,
      @JsonKey(name: 'Code')
          CodeableConcept? code,
      @JsonKey(name: 'Patient')
          Reference? patient,
      @JsonKey(name: 'Encounter')
          Reference? encounter,
      @JsonKey(name: 'OnsetDateTime')
          String? onsetDateTime,
      @JsonKey(name: 'OnsetAge')
          Age? onsetAge,
      @JsonKey(name: 'OnsetPeriod')
          Period? onsetPeriod,
      @JsonKey(name: 'OnsetRange')
          Range? onsetRange,
      @JsonKey(name: 'OnsetString')
          String? onsetString,
      @JsonKey(name: 'RecordedDate')
          String? recordedDate,
      @JsonKey(name: 'Recorder')
          Reference? recorder,
      @JsonKey(name: 'Asserter')
          Reference? asserter,
      @JsonKey(name: 'LastOccurrence')
          String? lastOccurrence,
      @JsonKey(name: 'Note')
          List<Annotation?>? note,
      @JsonKey(name: 'Reaction')
          List<AllergyIntoleranceReaction?>? reaction}) = _$_AllergyIntolerance;

  factory _AllergyIntolerance.fromJson(Map<String, dynamic> json) =
      _$_AllergyIntolerance.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;
  @override

  /// Business identifiers assigned to this AllergyIntolerance by
  ///  the performer or other systems which remain constant as the resource
  ///  is updated and propagates from server to server.
  @JsonKey(name: 'Identifier')
  List<Identifier?>? get identifier => throw _privateConstructorUsedError;
  @override

  /// The clinical status of the allergy or intolerance.
  @JsonKey(name: 'ClinicalStatus')
  CodeableConcept? get clinicalStatus => throw _privateConstructorUsedError;
  @override

  /// Assertion about certainty associated with the propensity, or
  ///  potential risk, of a reaction to the identified substance
  ///  (including pharmaceutical product).
  @JsonKey(name: 'VerificationStatus')
  CodeableConcept? get verificationStatus => throw _privateConstructorUsedError;
  @override

  /// Identification of the underlying physiological mechanism for the reaction risk
  @JsonKey(name: 'Type', unknownEnumValue: AllergyIntoleranceTypeEnum.allergy)
  AllergyIntoleranceTypeEnum? get type => throw _privateConstructorUsedError;
  @override

  /// Category of the identified substance.
  @JsonKey(
      name: 'Category',
      unknownEnumValue: AllergyIntoleranceCategoryEnum.environment)
  List<AllergyIntoleranceCategoryEnum?>? get category =>
      throw _privateConstructorUsedError;
  @override

  /// Estimate of the potential clinical harm, or seriousness, of the
  ///  reaction to the identified substance.
  @JsonKey(
      name: 'Criticality',
      unknownEnumValue: AllergyIntoleranceCriticalityEnum.unable_to_assess)
  AllergyIntoleranceCriticalityEnum? get criticality =>
      throw _privateConstructorUsedError;
  @override

  /// Code for an allergy or intolerance statement
  ///  (either a positive or a negated/excluded statement).
  ///
  /// This may be a code for a substance or pharmaceutical product that is considered to
  ///  be responsible for the adverse reaction risk (e.g., "Latex"), an
  ///  allergy or intolerance condition (e.g., "Latex allergy"), or a
  ///  negated/excluded code for a specific substance or class (e.g., "No
  ///  latex allergy") or a general or categorical negated statement (e.g.,
  ///  "No known allergy", "No known drug allergies"). Note: the substance
  ///  for a specific reaction may be different from the substance identified
  ///  as the cause of the risk, but it must be consistent with it. For
  ///  instance, it may be a more specific substance (e.g. a brand medication)
  ///  or a composite product that includes the identified substance. It must
  ///  be clinically safe to only process the 'code' and ignore the
  ///  'reaction.substance'. If a receiving system is unable to confirm that
  ///  AllergyIntolerance.reaction.substance falls within the semantic scope
  ///  of AllergyIntolerance.code, then the receiving system should ignore
  ///  AllergyIntolerance.reaction.substance
  @JsonKey(name: 'Code')
  CodeableConcept? get code => throw _privateConstructorUsedError;
  @override

  /// The patient who has the allergy or intolerance.
  @JsonKey(name: 'Patient')
  Reference? get patient => throw _privateConstructorUsedError;
  @override

  /// The encounter when the allergy or intolerance was asserted.
  @JsonKey(name: 'Encounter')
  Reference? get encounter => throw _privateConstructorUsedError;
  @override

  /// Estimated or actual date, date-time, or age when allergy or intolerance
  ///  was identified.
  @JsonKey(name: 'OnsetDateTime')
  String? get onsetDateTime => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'OnsetAge')
  Age? get onsetAge => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'OnsetPeriod')
  Period? get onsetPeriod => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'OnsetRange')
  Range? get onsetRange => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'OnsetString')
  String? get onsetString => throw _privateConstructorUsedError;
  @override

  /// The recordedDate represents when this particular AllergyIntolerance
  ///  record was created in the system, which is often a system-generated date.
  @JsonKey(name: 'RecordedDate')
  String? get recordedDate => throw _privateConstructorUsedError;
  @override

  /// Individual who recorded the record and takes responsibility for its content.
  @JsonKey(name: 'Recorder')
  Reference? get recorder => throw _privateConstructorUsedError;
  @override

  /// The source of the information about the allergy that is recorded
  @JsonKey(name: 'Asserter')
  Reference? get asserter => throw _privateConstructorUsedError;
  @override

  /// Represents the date and/or time of the last known occurrence of a reaction event.
  @JsonKey(name: 'LastOccurrence')
  String? get lastOccurrence => throw _privateConstructorUsedError;
  @override

  /// Additional narrative about the propensity for the Adverse Reaction, not captured in other fields.
  @JsonKey(name: 'Note')
  List<Annotation?>? get note => throw _privateConstructorUsedError;
  @override

  /// Details about each adverse reaction event linked to exposure to the
  ///  identified substance.
  @JsonKey(name: 'Reaction')
  List<AllergyIntoleranceReaction?>? get reaction =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AllergyIntoleranceCopyWith<_AllergyIntolerance> get copyWith =>
      throw _privateConstructorUsedError;
}
