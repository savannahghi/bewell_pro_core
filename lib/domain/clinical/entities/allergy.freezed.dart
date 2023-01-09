// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'allergy.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AllergyIntolerance _$AllergyIntoleranceFromJson(Map<String, dynamic> json) {
  return _AllergyIntolerance.fromJson(json);
}

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
      _$AllergyIntoleranceCopyWithImpl<$Res, AllergyIntolerance>;
  @useResult
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
class _$AllergyIntoleranceCopyWithImpl<$Res, $Val extends AllergyIntolerance>
    implements $AllergyIntoleranceCopyWith<$Res> {
  _$AllergyIntoleranceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
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
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      identifier: freezed == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as List<Identifier?>?,
      clinicalStatus: freezed == clinicalStatus
          ? _value.clinicalStatus
          : clinicalStatus // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      verificationStatus: freezed == verificationStatus
          ? _value.verificationStatus
          : verificationStatus // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AllergyIntoleranceTypeEnum?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as List<AllergyIntoleranceCategoryEnum?>?,
      criticality: freezed == criticality
          ? _value.criticality
          : criticality // ignore: cast_nullable_to_non_nullable
              as AllergyIntoleranceCriticalityEnum?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      patient: freezed == patient
          ? _value.patient
          : patient // ignore: cast_nullable_to_non_nullable
              as Reference?,
      encounter: freezed == encounter
          ? _value.encounter
          : encounter // ignore: cast_nullable_to_non_nullable
              as Reference?,
      onsetDateTime: freezed == onsetDateTime
          ? _value.onsetDateTime
          : onsetDateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      onsetAge: freezed == onsetAge
          ? _value.onsetAge
          : onsetAge // ignore: cast_nullable_to_non_nullable
              as Age?,
      onsetPeriod: freezed == onsetPeriod
          ? _value.onsetPeriod
          : onsetPeriod // ignore: cast_nullable_to_non_nullable
              as Period?,
      onsetRange: freezed == onsetRange
          ? _value.onsetRange
          : onsetRange // ignore: cast_nullable_to_non_nullable
              as Range?,
      onsetString: freezed == onsetString
          ? _value.onsetString
          : onsetString // ignore: cast_nullable_to_non_nullable
              as String?,
      recordedDate: freezed == recordedDate
          ? _value.recordedDate
          : recordedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      recorder: freezed == recorder
          ? _value.recorder
          : recorder // ignore: cast_nullable_to_non_nullable
              as Reference?,
      asserter: freezed == asserter
          ? _value.asserter
          : asserter // ignore: cast_nullable_to_non_nullable
              as Reference?,
      lastOccurrence: freezed == lastOccurrence
          ? _value.lastOccurrence
          : lastOccurrence // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as List<Annotation?>?,
      reaction: freezed == reaction
          ? _value.reaction
          : reaction // ignore: cast_nullable_to_non_nullable
              as List<AllergyIntoleranceReaction?>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CodeableConceptCopyWith<$Res>? get clinicalStatus {
    if (_value.clinicalStatus == null) {
      return null;
    }

    return $CodeableConceptCopyWith<$Res>(_value.clinicalStatus!, (value) {
      return _then(_value.copyWith(clinicalStatus: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CodeableConceptCopyWith<$Res>? get verificationStatus {
    if (_value.verificationStatus == null) {
      return null;
    }

    return $CodeableConceptCopyWith<$Res>(_value.verificationStatus!, (value) {
      return _then(_value.copyWith(verificationStatus: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CodeableConceptCopyWith<$Res>? get code {
    if (_value.code == null) {
      return null;
    }

    return $CodeableConceptCopyWith<$Res>(_value.code!, (value) {
      return _then(_value.copyWith(code: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ReferenceCopyWith<$Res>? get patient {
    if (_value.patient == null) {
      return null;
    }

    return $ReferenceCopyWith<$Res>(_value.patient!, (value) {
      return _then(_value.copyWith(patient: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ReferenceCopyWith<$Res>? get encounter {
    if (_value.encounter == null) {
      return null;
    }

    return $ReferenceCopyWith<$Res>(_value.encounter!, (value) {
      return _then(_value.copyWith(encounter: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AgeCopyWith<$Res>? get onsetAge {
    if (_value.onsetAge == null) {
      return null;
    }

    return $AgeCopyWith<$Res>(_value.onsetAge!, (value) {
      return _then(_value.copyWith(onsetAge: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PeriodCopyWith<$Res>? get onsetPeriod {
    if (_value.onsetPeriod == null) {
      return null;
    }

    return $PeriodCopyWith<$Res>(_value.onsetPeriod!, (value) {
      return _then(_value.copyWith(onsetPeriod: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RangeCopyWith<$Res>? get onsetRange {
    if (_value.onsetRange == null) {
      return null;
    }

    return $RangeCopyWith<$Res>(_value.onsetRange!, (value) {
      return _then(_value.copyWith(onsetRange: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ReferenceCopyWith<$Res>? get recorder {
    if (_value.recorder == null) {
      return null;
    }

    return $ReferenceCopyWith<$Res>(_value.recorder!, (value) {
      return _then(_value.copyWith(recorder: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ReferenceCopyWith<$Res>? get asserter {
    if (_value.asserter == null) {
      return null;
    }

    return $ReferenceCopyWith<$Res>(_value.asserter!, (value) {
      return _then(_value.copyWith(asserter: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AllergyIntoleranceCopyWith<$Res>
    implements $AllergyIntoleranceCopyWith<$Res> {
  factory _$$_AllergyIntoleranceCopyWith(_$_AllergyIntolerance value,
          $Res Function(_$_AllergyIntolerance) then) =
      __$$_AllergyIntoleranceCopyWithImpl<$Res>;
  @override
  @useResult
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
class __$$_AllergyIntoleranceCopyWithImpl<$Res>
    extends _$AllergyIntoleranceCopyWithImpl<$Res, _$_AllergyIntolerance>
    implements _$$_AllergyIntoleranceCopyWith<$Res> {
  __$$_AllergyIntoleranceCopyWithImpl(
      _$_AllergyIntolerance _value, $Res Function(_$_AllergyIntolerance) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
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
    return _then(_$_AllergyIntolerance(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      identifier: freezed == identifier
          ? _value._identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as List<Identifier?>?,
      clinicalStatus: freezed == clinicalStatus
          ? _value.clinicalStatus
          : clinicalStatus // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      verificationStatus: freezed == verificationStatus
          ? _value.verificationStatus
          : verificationStatus // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AllergyIntoleranceTypeEnum?,
      category: freezed == category
          ? _value._category
          : category // ignore: cast_nullable_to_non_nullable
              as List<AllergyIntoleranceCategoryEnum?>?,
      criticality: freezed == criticality
          ? _value.criticality
          : criticality // ignore: cast_nullable_to_non_nullable
              as AllergyIntoleranceCriticalityEnum?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      patient: freezed == patient
          ? _value.patient
          : patient // ignore: cast_nullable_to_non_nullable
              as Reference?,
      encounter: freezed == encounter
          ? _value.encounter
          : encounter // ignore: cast_nullable_to_non_nullable
              as Reference?,
      onsetDateTime: freezed == onsetDateTime
          ? _value.onsetDateTime
          : onsetDateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      onsetAge: freezed == onsetAge
          ? _value.onsetAge
          : onsetAge // ignore: cast_nullable_to_non_nullable
              as Age?,
      onsetPeriod: freezed == onsetPeriod
          ? _value.onsetPeriod
          : onsetPeriod // ignore: cast_nullable_to_non_nullable
              as Period?,
      onsetRange: freezed == onsetRange
          ? _value.onsetRange
          : onsetRange // ignore: cast_nullable_to_non_nullable
              as Range?,
      onsetString: freezed == onsetString
          ? _value.onsetString
          : onsetString // ignore: cast_nullable_to_non_nullable
              as String?,
      recordedDate: freezed == recordedDate
          ? _value.recordedDate
          : recordedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      recorder: freezed == recorder
          ? _value.recorder
          : recorder // ignore: cast_nullable_to_non_nullable
              as Reference?,
      asserter: freezed == asserter
          ? _value.asserter
          : asserter // ignore: cast_nullable_to_non_nullable
              as Reference?,
      lastOccurrence: freezed == lastOccurrence
          ? _value.lastOccurrence
          : lastOccurrence // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value._note
          : note // ignore: cast_nullable_to_non_nullable
              as List<Annotation?>?,
      reaction: freezed == reaction
          ? _value._reaction
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
          final List<Identifier?>? identifier,
      @JsonKey(name: 'ClinicalStatus')
          this.clinicalStatus,
      @JsonKey(name: 'VerificationStatus')
          this.verificationStatus,
      @JsonKey(name: 'Type', unknownEnumValue: AllergyIntoleranceTypeEnum.allergy)
          this.type,
      @JsonKey(name: 'Category', unknownEnumValue: AllergyIntoleranceCategoryEnum.environment)
          final List<AllergyIntoleranceCategoryEnum?>? category,
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
          final List<Annotation?>? note,
      @JsonKey(name: 'Reaction')
          final List<AllergyIntoleranceReaction?>? reaction})
      : _identifier = identifier,
        _category = category,
        _note = note,
        _reaction = reaction;

  factory _$_AllergyIntolerance.fromJson(Map<String, dynamic> json) =>
      _$$_AllergyIntoleranceFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? id;

  /// Business identifiers assigned to this AllergyIntolerance by
  ///  the performer or other systems which remain constant as the resource
  ///  is updated and propagates from server to server.
  final List<Identifier?>? _identifier;

  /// Business identifiers assigned to this AllergyIntolerance by
  ///  the performer or other systems which remain constant as the resource
  ///  is updated and propagates from server to server.
  @override
  @JsonKey(name: 'Identifier')
  List<Identifier?>? get identifier {
    final value = _identifier;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// The clinical status of the allergy or intolerance.
  @override
  @JsonKey(name: 'ClinicalStatus')
  final CodeableConcept? clinicalStatus;

  /// Assertion about certainty associated with the propensity, or
  ///  potential risk, of a reaction to the identified substance
  ///  (including pharmaceutical product).
  @override
  @JsonKey(name: 'VerificationStatus')
  final CodeableConcept? verificationStatus;

  /// Identification of the underlying physiological mechanism for the reaction risk
  @override
  @JsonKey(name: 'Type', unknownEnumValue: AllergyIntoleranceTypeEnum.allergy)
  final AllergyIntoleranceTypeEnum? type;

  /// Category of the identified substance.
  final List<AllergyIntoleranceCategoryEnum?>? _category;

  /// Category of the identified substance.
  @override
  @JsonKey(
      name: 'Category',
      unknownEnumValue: AllergyIntoleranceCategoryEnum.environment)
  List<AllergyIntoleranceCategoryEnum?>? get category {
    final value = _category;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Estimate of the potential clinical harm, or seriousness, of the
  ///  reaction to the identified substance.
  @override
  @JsonKey(
      name: 'Criticality',
      unknownEnumValue: AllergyIntoleranceCriticalityEnum.unable_to_assess)
  final AllergyIntoleranceCriticalityEnum? criticality;

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
  @override
  @JsonKey(name: 'Code')
  final CodeableConcept? code;

  /// The patient who has the allergy or intolerance.
  @override
  @JsonKey(name: 'Patient')
  final Reference? patient;

  /// The encounter when the allergy or intolerance was asserted.
  @override
  @JsonKey(name: 'Encounter')
  final Reference? encounter;

  /// Estimated or actual date, date-time, or age when allergy or intolerance
  ///  was identified.
  @override
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

  /// The recordedDate represents when this particular AllergyIntolerance
  ///  record was created in the system, which is often a system-generated date.
  @override
  @JsonKey(name: 'RecordedDate')
  final String? recordedDate;

  /// Individual who recorded the record and takes responsibility for its content.
  @override
  @JsonKey(name: 'Recorder')
  final Reference? recorder;

  /// The source of the information about the allergy that is recorded
  @override
  @JsonKey(name: 'Asserter')
  final Reference? asserter;

  /// Represents the date and/or time of the last known occurrence of a reaction event.
  @override
  @JsonKey(name: 'LastOccurrence')
  final String? lastOccurrence;

  /// Additional narrative about the propensity for the Adverse Reaction, not captured in other fields.
  final List<Annotation?>? _note;

  /// Additional narrative about the propensity for the Adverse Reaction, not captured in other fields.
  @override
  @JsonKey(name: 'Note')
  List<Annotation?>? get note {
    final value = _note;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Details about each adverse reaction event linked to exposure to the
  ///  identified substance.
  final List<AllergyIntoleranceReaction?>? _reaction;

  /// Details about each adverse reaction event linked to exposure to the
  ///  identified substance.
  @override
  @JsonKey(name: 'Reaction')
  List<AllergyIntoleranceReaction?>? get reaction {
    final value = _reaction;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AllergyIntolerance(id: $id, identifier: $identifier, clinicalStatus: $clinicalStatus, verificationStatus: $verificationStatus, type: $type, category: $category, criticality: $criticality, code: $code, patient: $patient, encounter: $encounter, onsetDateTime: $onsetDateTime, onsetAge: $onsetAge, onsetPeriod: $onsetPeriod, onsetRange: $onsetRange, onsetString: $onsetString, recordedDate: $recordedDate, recorder: $recorder, asserter: $asserter, lastOccurrence: $lastOccurrence, note: $note, reaction: $reaction)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AllergyIntolerance &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._identifier, _identifier) &&
            (identical(other.clinicalStatus, clinicalStatus) ||
                other.clinicalStatus == clinicalStatus) &&
            (identical(other.verificationStatus, verificationStatus) ||
                other.verificationStatus == verificationStatus) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._category, _category) &&
            (identical(other.criticality, criticality) ||
                other.criticality == criticality) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.patient, patient) || other.patient == patient) &&
            (identical(other.encounter, encounter) ||
                other.encounter == encounter) &&
            (identical(other.onsetDateTime, onsetDateTime) ||
                other.onsetDateTime == onsetDateTime) &&
            (identical(other.onsetAge, onsetAge) ||
                other.onsetAge == onsetAge) &&
            (identical(other.onsetPeriod, onsetPeriod) ||
                other.onsetPeriod == onsetPeriod) &&
            (identical(other.onsetRange, onsetRange) ||
                other.onsetRange == onsetRange) &&
            (identical(other.onsetString, onsetString) ||
                other.onsetString == onsetString) &&
            (identical(other.recordedDate, recordedDate) ||
                other.recordedDate == recordedDate) &&
            (identical(other.recorder, recorder) ||
                other.recorder == recorder) &&
            (identical(other.asserter, asserter) ||
                other.asserter == asserter) &&
            (identical(other.lastOccurrence, lastOccurrence) ||
                other.lastOccurrence == lastOccurrence) &&
            const DeepCollectionEquality().equals(other._note, _note) &&
            const DeepCollectionEquality().equals(other._reaction, _reaction));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        const DeepCollectionEquality().hash(_identifier),
        clinicalStatus,
        verificationStatus,
        type,
        const DeepCollectionEquality().hash(_category),
        criticality,
        code,
        patient,
        encounter,
        onsetDateTime,
        onsetAge,
        onsetPeriod,
        onsetRange,
        onsetString,
        recordedDate,
        recorder,
        asserter,
        lastOccurrence,
        const DeepCollectionEquality().hash(_note),
        const DeepCollectionEquality().hash(_reaction)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AllergyIntoleranceCopyWith<_$_AllergyIntolerance> get copyWith =>
      __$$_AllergyIntoleranceCopyWithImpl<_$_AllergyIntolerance>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AllergyIntoleranceToJson(
      this,
    );
  }
}

abstract class _AllergyIntolerance implements AllergyIntolerance {
  factory _AllergyIntolerance(
      {@JsonKey(name: 'ID')
          final String? id,
      @JsonKey(name: 'Identifier')
          final List<Identifier?>? identifier,
      @JsonKey(name: 'ClinicalStatus')
          final CodeableConcept? clinicalStatus,
      @JsonKey(name: 'VerificationStatus')
          final CodeableConcept? verificationStatus,
      @JsonKey(name: 'Type', unknownEnumValue: AllergyIntoleranceTypeEnum.allergy)
          final AllergyIntoleranceTypeEnum? type,
      @JsonKey(name: 'Category', unknownEnumValue: AllergyIntoleranceCategoryEnum.environment)
          final List<AllergyIntoleranceCategoryEnum?>? category,
      @JsonKey(name: 'Criticality', unknownEnumValue: AllergyIntoleranceCriticalityEnum.unable_to_assess)
          final AllergyIntoleranceCriticalityEnum? criticality,
      @JsonKey(name: 'Code')
          final CodeableConcept? code,
      @JsonKey(name: 'Patient')
          final Reference? patient,
      @JsonKey(name: 'Encounter')
          final Reference? encounter,
      @JsonKey(name: 'OnsetDateTime')
          final String? onsetDateTime,
      @JsonKey(name: 'OnsetAge')
          final Age? onsetAge,
      @JsonKey(name: 'OnsetPeriod')
          final Period? onsetPeriod,
      @JsonKey(name: 'OnsetRange')
          final Range? onsetRange,
      @JsonKey(name: 'OnsetString')
          final String? onsetString,
      @JsonKey(name: 'RecordedDate')
          final String? recordedDate,
      @JsonKey(name: 'Recorder')
          final Reference? recorder,
      @JsonKey(name: 'Asserter')
          final Reference? asserter,
      @JsonKey(name: 'LastOccurrence')
          final String? lastOccurrence,
      @JsonKey(name: 'Note')
          final List<Annotation?>? note,
      @JsonKey(name: 'Reaction')
          final List<AllergyIntoleranceReaction?>? reaction}) = _$_AllergyIntolerance;

  factory _AllergyIntolerance.fromJson(Map<String, dynamic> json) =
      _$_AllergyIntolerance.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id;
  @override

  /// Business identifiers assigned to this AllergyIntolerance by
  ///  the performer or other systems which remain constant as the resource
  ///  is updated and propagates from server to server.
  @JsonKey(name: 'Identifier')
  List<Identifier?>? get identifier;
  @override

  /// The clinical status of the allergy or intolerance.
  @JsonKey(name: 'ClinicalStatus')
  CodeableConcept? get clinicalStatus;
  @override

  /// Assertion about certainty associated with the propensity, or
  ///  potential risk, of a reaction to the identified substance
  ///  (including pharmaceutical product).
  @JsonKey(name: 'VerificationStatus')
  CodeableConcept? get verificationStatus;
  @override

  /// Identification of the underlying physiological mechanism for the reaction risk
  @JsonKey(name: 'Type', unknownEnumValue: AllergyIntoleranceTypeEnum.allergy)
  AllergyIntoleranceTypeEnum? get type;
  @override

  /// Category of the identified substance.
  @JsonKey(
      name: 'Category',
      unknownEnumValue: AllergyIntoleranceCategoryEnum.environment)
  List<AllergyIntoleranceCategoryEnum?>? get category;
  @override

  /// Estimate of the potential clinical harm, or seriousness, of the
  ///  reaction to the identified substance.
  @JsonKey(
      name: 'Criticality',
      unknownEnumValue: AllergyIntoleranceCriticalityEnum.unable_to_assess)
  AllergyIntoleranceCriticalityEnum? get criticality;
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
  CodeableConcept? get code;
  @override

  /// The patient who has the allergy or intolerance.
  @JsonKey(name: 'Patient')
  Reference? get patient;
  @override

  /// The encounter when the allergy or intolerance was asserted.
  @JsonKey(name: 'Encounter')
  Reference? get encounter;
  @override

  /// Estimated or actual date, date-time, or age when allergy or intolerance
  ///  was identified.
  @JsonKey(name: 'OnsetDateTime')
  String? get onsetDateTime;
  @override
  @JsonKey(name: 'OnsetAge')
  Age? get onsetAge;
  @override
  @JsonKey(name: 'OnsetPeriod')
  Period? get onsetPeriod;
  @override
  @JsonKey(name: 'OnsetRange')
  Range? get onsetRange;
  @override
  @JsonKey(name: 'OnsetString')
  String? get onsetString;
  @override

  /// The recordedDate represents when this particular AllergyIntolerance
  ///  record was created in the system, which is often a system-generated date.
  @JsonKey(name: 'RecordedDate')
  String? get recordedDate;
  @override

  /// Individual who recorded the record and takes responsibility for its content.
  @JsonKey(name: 'Recorder')
  Reference? get recorder;
  @override

  /// The source of the information about the allergy that is recorded
  @JsonKey(name: 'Asserter')
  Reference? get asserter;
  @override

  /// Represents the date and/or time of the last known occurrence of a reaction event.
  @JsonKey(name: 'LastOccurrence')
  String? get lastOccurrence;
  @override

  /// Additional narrative about the propensity for the Adverse Reaction, not captured in other fields.
  @JsonKey(name: 'Note')
  List<Annotation?>? get note;
  @override

  /// Details about each adverse reaction event linked to exposure to the
  ///  identified substance.
  @JsonKey(name: 'Reaction')
  List<AllergyIntoleranceReaction?>? get reaction;
  @override
  @JsonKey(ignore: true)
  _$$_AllergyIntoleranceCopyWith<_$_AllergyIntolerance> get copyWith =>
      throw _privateConstructorUsedError;
}
