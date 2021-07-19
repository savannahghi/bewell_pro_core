// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'condition.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Condition _$ConditionFromJson(Map<String, dynamic> json) {
  return _Condition.fromJson(json);
}

/// @nodoc
class _$ConditionTearOff {
  const _$ConditionTearOff();

  _Condition call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'Identifier') List<Identifier?>? identifier,
      @JsonKey(name: 'ClinicalStatus') CodeableConcept? clinicalStatus,
      @JsonKey(name: 'VerificationStatus') CodeableConcept? verificationStatus,
      @JsonKey(name: 'Category') List<CodeableConcept?>? category,
      @JsonKey(name: 'Severity') CodeableConcept? severity,
      @JsonKey(name: 'Code') CodeableConcept? code,
      @JsonKey(name: 'BodySite') List<CodeableConcept?>? bodySite,
      @JsonKey(name: 'Subject') Reference? subject,
      @JsonKey(name: 'Encounter') Reference? encounter,
      @JsonKey(name: 'OnsetDateTime') String? onsetDateTime,
      @JsonKey(name: 'OnsetAge') Age? onsetAge,
      @JsonKey(name: 'OnsetPeriod') Period? onsetPeriod,
      @JsonKey(name: 'OnsetRange') Quantity? onsetRange,
      @JsonKey(name: 'OnsetString') String? onsetString,
      @JsonKey(name: 'AbatementDateTime') String? abatementDateTime,
      @JsonKey(name: 'AbatementAge') Age? abatementAge,
      @JsonKey(name: 'AbatementPeriod') Period? abatementPeriod,
      @JsonKey(name: 'AbatementRange') Quantity? abatementRange,
      @JsonKey(name: 'AbatementString') String? abatementString,
      @JsonKey(name: 'RecordedDate') String? recordedDate,
      @JsonKey(name: 'Recorder') Reference? recorder,
      @JsonKey(name: 'Asserter') Reference? asserter,
      @JsonKey(name: 'Stage') Stage? stage,
      @JsonKey(name: 'Evidence') List<Evidence?>? evidence,
      @JsonKey(name: 'Note') List<Annotation?>? note}) {
    return _Condition(
      id: id,
      identifier: identifier,
      clinicalStatus: clinicalStatus,
      verificationStatus: verificationStatus,
      category: category,
      severity: severity,
      code: code,
      bodySite: bodySite,
      subject: subject,
      encounter: encounter,
      onsetDateTime: onsetDateTime,
      onsetAge: onsetAge,
      onsetPeriod: onsetPeriod,
      onsetRange: onsetRange,
      onsetString: onsetString,
      abatementDateTime: abatementDateTime,
      abatementAge: abatementAge,
      abatementPeriod: abatementPeriod,
      abatementRange: abatementRange,
      abatementString: abatementString,
      recordedDate: recordedDate,
      recorder: recorder,
      asserter: asserter,
      stage: stage,
      evidence: evidence,
      note: note,
    );
  }

  Condition fromJson(Map<String, Object> json) {
    return Condition.fromJson(json);
  }
}

/// @nodoc
const $Condition = _$ConditionTearOff();

/// @nodoc
mixin _$Condition {
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Identifier')
  List<Identifier?>? get identifier => throw _privateConstructorUsedError;
  @JsonKey(name: 'ClinicalStatus')
  CodeableConcept? get clinicalStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'VerificationStatus')
  CodeableConcept? get verificationStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'Category')
  List<CodeableConcept?>? get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'Severity')
  CodeableConcept? get severity => throw _privateConstructorUsedError;
  @JsonKey(name: 'Code')
  CodeableConcept? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'BodySite')
  List<CodeableConcept?>? get bodySite => throw _privateConstructorUsedError;
  @JsonKey(name: 'Subject')
  Reference? get subject => throw _privateConstructorUsedError;
  @JsonKey(name: 'Encounter')
  Reference? get encounter => throw _privateConstructorUsedError;
  @JsonKey(name: 'OnsetDateTime')
  String? get onsetDateTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'OnsetAge')
  Age? get onsetAge => throw _privateConstructorUsedError;
  @JsonKey(name: 'OnsetPeriod')
  Period? get onsetPeriod => throw _privateConstructorUsedError;
  @JsonKey(name: 'OnsetRange')
  Quantity? get onsetRange => throw _privateConstructorUsedError;
  @JsonKey(name: 'OnsetString')
  String? get onsetString => throw _privateConstructorUsedError;
  @JsonKey(name: 'AbatementDateTime')
  String? get abatementDateTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'AbatementAge')
  Age? get abatementAge => throw _privateConstructorUsedError;
  @JsonKey(name: 'AbatementPeriod')
  Period? get abatementPeriod => throw _privateConstructorUsedError;
  @JsonKey(name: 'AbatementRange')
  Quantity? get abatementRange => throw _privateConstructorUsedError;
  @JsonKey(name: 'AbatementString')
  String? get abatementString => throw _privateConstructorUsedError;
  @JsonKey(name: 'RecordedDate')
  String? get recordedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'Recorder')
  Reference? get recorder => throw _privateConstructorUsedError;
  @JsonKey(name: 'Asserter')
  Reference? get asserter => throw _privateConstructorUsedError;
  @JsonKey(name: 'Stage')
  Stage? get stage => throw _privateConstructorUsedError;
  @JsonKey(name: 'Evidence')
  List<Evidence?>? get evidence => throw _privateConstructorUsedError;
  @JsonKey(name: 'Note')
  List<Annotation?>? get note => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConditionCopyWith<Condition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConditionCopyWith<$Res> {
  factory $ConditionCopyWith(Condition value, $Res Function(Condition) then) =
      _$ConditionCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'Identifier') List<Identifier?>? identifier,
      @JsonKey(name: 'ClinicalStatus') CodeableConcept? clinicalStatus,
      @JsonKey(name: 'VerificationStatus') CodeableConcept? verificationStatus,
      @JsonKey(name: 'Category') List<CodeableConcept?>? category,
      @JsonKey(name: 'Severity') CodeableConcept? severity,
      @JsonKey(name: 'Code') CodeableConcept? code,
      @JsonKey(name: 'BodySite') List<CodeableConcept?>? bodySite,
      @JsonKey(name: 'Subject') Reference? subject,
      @JsonKey(name: 'Encounter') Reference? encounter,
      @JsonKey(name: 'OnsetDateTime') String? onsetDateTime,
      @JsonKey(name: 'OnsetAge') Age? onsetAge,
      @JsonKey(name: 'OnsetPeriod') Period? onsetPeriod,
      @JsonKey(name: 'OnsetRange') Quantity? onsetRange,
      @JsonKey(name: 'OnsetString') String? onsetString,
      @JsonKey(name: 'AbatementDateTime') String? abatementDateTime,
      @JsonKey(name: 'AbatementAge') Age? abatementAge,
      @JsonKey(name: 'AbatementPeriod') Period? abatementPeriod,
      @JsonKey(name: 'AbatementRange') Quantity? abatementRange,
      @JsonKey(name: 'AbatementString') String? abatementString,
      @JsonKey(name: 'RecordedDate') String? recordedDate,
      @JsonKey(name: 'Recorder') Reference? recorder,
      @JsonKey(name: 'Asserter') Reference? asserter,
      @JsonKey(name: 'Stage') Stage? stage,
      @JsonKey(name: 'Evidence') List<Evidence?>? evidence,
      @JsonKey(name: 'Note') List<Annotation?>? note});

  $CodeableConceptCopyWith<$Res>? get clinicalStatus;
  $CodeableConceptCopyWith<$Res>? get verificationStatus;
  $CodeableConceptCopyWith<$Res>? get severity;
  $CodeableConceptCopyWith<$Res>? get code;
  $ReferenceCopyWith<$Res>? get subject;
  $ReferenceCopyWith<$Res>? get encounter;
  $AgeCopyWith<$Res>? get onsetAge;
  $PeriodCopyWith<$Res>? get onsetPeriod;
  $QuantityCopyWith<$Res>? get onsetRange;
  $AgeCopyWith<$Res>? get abatementAge;
  $PeriodCopyWith<$Res>? get abatementPeriod;
  $QuantityCopyWith<$Res>? get abatementRange;
  $ReferenceCopyWith<$Res>? get recorder;
  $ReferenceCopyWith<$Res>? get asserter;
  $StageCopyWith<$Res>? get stage;
}

/// @nodoc
class _$ConditionCopyWithImpl<$Res> implements $ConditionCopyWith<$Res> {
  _$ConditionCopyWithImpl(this._value, this._then);

  final Condition _value;
  // ignore: unused_field
  final $Res Function(Condition) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? identifier = freezed,
    Object? clinicalStatus = freezed,
    Object? verificationStatus = freezed,
    Object? category = freezed,
    Object? severity = freezed,
    Object? code = freezed,
    Object? bodySite = freezed,
    Object? subject = freezed,
    Object? encounter = freezed,
    Object? onsetDateTime = freezed,
    Object? onsetAge = freezed,
    Object? onsetPeriod = freezed,
    Object? onsetRange = freezed,
    Object? onsetString = freezed,
    Object? abatementDateTime = freezed,
    Object? abatementAge = freezed,
    Object? abatementPeriod = freezed,
    Object? abatementRange = freezed,
    Object? abatementString = freezed,
    Object? recordedDate = freezed,
    Object? recorder = freezed,
    Object? asserter = freezed,
    Object? stage = freezed,
    Object? evidence = freezed,
    Object? note = freezed,
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
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as List<CodeableConcept?>?,
      severity: severity == freezed
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      bodySite: bodySite == freezed
          ? _value.bodySite
          : bodySite // ignore: cast_nullable_to_non_nullable
              as List<CodeableConcept?>?,
      subject: subject == freezed
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
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
              as Quantity?,
      onsetString: onsetString == freezed
          ? _value.onsetString
          : onsetString // ignore: cast_nullable_to_non_nullable
              as String?,
      abatementDateTime: abatementDateTime == freezed
          ? _value.abatementDateTime
          : abatementDateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      abatementAge: abatementAge == freezed
          ? _value.abatementAge
          : abatementAge // ignore: cast_nullable_to_non_nullable
              as Age?,
      abatementPeriod: abatementPeriod == freezed
          ? _value.abatementPeriod
          : abatementPeriod // ignore: cast_nullable_to_non_nullable
              as Period?,
      abatementRange: abatementRange == freezed
          ? _value.abatementRange
          : abatementRange // ignore: cast_nullable_to_non_nullable
              as Quantity?,
      abatementString: abatementString == freezed
          ? _value.abatementString
          : abatementString // ignore: cast_nullable_to_non_nullable
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
      stage: stage == freezed
          ? _value.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as Stage?,
      evidence: evidence == freezed
          ? _value.evidence
          : evidence // ignore: cast_nullable_to_non_nullable
              as List<Evidence?>?,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as List<Annotation?>?,
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
  $CodeableConceptCopyWith<$Res>? get severity {
    if (_value.severity == null) {
      return null;
    }

    return $CodeableConceptCopyWith<$Res>(_value.severity!, (value) {
      return _then(_value.copyWith(severity: value));
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
  $ReferenceCopyWith<$Res>? get subject {
    if (_value.subject == null) {
      return null;
    }

    return $ReferenceCopyWith<$Res>(_value.subject!, (value) {
      return _then(_value.copyWith(subject: value));
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
  $QuantityCopyWith<$Res>? get onsetRange {
    if (_value.onsetRange == null) {
      return null;
    }

    return $QuantityCopyWith<$Res>(_value.onsetRange!, (value) {
      return _then(_value.copyWith(onsetRange: value));
    });
  }

  @override
  $AgeCopyWith<$Res>? get abatementAge {
    if (_value.abatementAge == null) {
      return null;
    }

    return $AgeCopyWith<$Res>(_value.abatementAge!, (value) {
      return _then(_value.copyWith(abatementAge: value));
    });
  }

  @override
  $PeriodCopyWith<$Res>? get abatementPeriod {
    if (_value.abatementPeriod == null) {
      return null;
    }

    return $PeriodCopyWith<$Res>(_value.abatementPeriod!, (value) {
      return _then(_value.copyWith(abatementPeriod: value));
    });
  }

  @override
  $QuantityCopyWith<$Res>? get abatementRange {
    if (_value.abatementRange == null) {
      return null;
    }

    return $QuantityCopyWith<$Res>(_value.abatementRange!, (value) {
      return _then(_value.copyWith(abatementRange: value));
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

  @override
  $StageCopyWith<$Res>? get stage {
    if (_value.stage == null) {
      return null;
    }

    return $StageCopyWith<$Res>(_value.stage!, (value) {
      return _then(_value.copyWith(stage: value));
    });
  }
}

/// @nodoc
abstract class _$ConditionCopyWith<$Res> implements $ConditionCopyWith<$Res> {
  factory _$ConditionCopyWith(
          _Condition value, $Res Function(_Condition) then) =
      __$ConditionCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'Identifier') List<Identifier?>? identifier,
      @JsonKey(name: 'ClinicalStatus') CodeableConcept? clinicalStatus,
      @JsonKey(name: 'VerificationStatus') CodeableConcept? verificationStatus,
      @JsonKey(name: 'Category') List<CodeableConcept?>? category,
      @JsonKey(name: 'Severity') CodeableConcept? severity,
      @JsonKey(name: 'Code') CodeableConcept? code,
      @JsonKey(name: 'BodySite') List<CodeableConcept?>? bodySite,
      @JsonKey(name: 'Subject') Reference? subject,
      @JsonKey(name: 'Encounter') Reference? encounter,
      @JsonKey(name: 'OnsetDateTime') String? onsetDateTime,
      @JsonKey(name: 'OnsetAge') Age? onsetAge,
      @JsonKey(name: 'OnsetPeriod') Period? onsetPeriod,
      @JsonKey(name: 'OnsetRange') Quantity? onsetRange,
      @JsonKey(name: 'OnsetString') String? onsetString,
      @JsonKey(name: 'AbatementDateTime') String? abatementDateTime,
      @JsonKey(name: 'AbatementAge') Age? abatementAge,
      @JsonKey(name: 'AbatementPeriod') Period? abatementPeriod,
      @JsonKey(name: 'AbatementRange') Quantity? abatementRange,
      @JsonKey(name: 'AbatementString') String? abatementString,
      @JsonKey(name: 'RecordedDate') String? recordedDate,
      @JsonKey(name: 'Recorder') Reference? recorder,
      @JsonKey(name: 'Asserter') Reference? asserter,
      @JsonKey(name: 'Stage') Stage? stage,
      @JsonKey(name: 'Evidence') List<Evidence?>? evidence,
      @JsonKey(name: 'Note') List<Annotation?>? note});

  @override
  $CodeableConceptCopyWith<$Res>? get clinicalStatus;
  @override
  $CodeableConceptCopyWith<$Res>? get verificationStatus;
  @override
  $CodeableConceptCopyWith<$Res>? get severity;
  @override
  $CodeableConceptCopyWith<$Res>? get code;
  @override
  $ReferenceCopyWith<$Res>? get subject;
  @override
  $ReferenceCopyWith<$Res>? get encounter;
  @override
  $AgeCopyWith<$Res>? get onsetAge;
  @override
  $PeriodCopyWith<$Res>? get onsetPeriod;
  @override
  $QuantityCopyWith<$Res>? get onsetRange;
  @override
  $AgeCopyWith<$Res>? get abatementAge;
  @override
  $PeriodCopyWith<$Res>? get abatementPeriod;
  @override
  $QuantityCopyWith<$Res>? get abatementRange;
  @override
  $ReferenceCopyWith<$Res>? get recorder;
  @override
  $ReferenceCopyWith<$Res>? get asserter;
  @override
  $StageCopyWith<$Res>? get stage;
}

/// @nodoc
class __$ConditionCopyWithImpl<$Res> extends _$ConditionCopyWithImpl<$Res>
    implements _$ConditionCopyWith<$Res> {
  __$ConditionCopyWithImpl(_Condition _value, $Res Function(_Condition) _then)
      : super(_value, (v) => _then(v as _Condition));

  @override
  _Condition get _value => super._value as _Condition;

  @override
  $Res call({
    Object? id = freezed,
    Object? identifier = freezed,
    Object? clinicalStatus = freezed,
    Object? verificationStatus = freezed,
    Object? category = freezed,
    Object? severity = freezed,
    Object? code = freezed,
    Object? bodySite = freezed,
    Object? subject = freezed,
    Object? encounter = freezed,
    Object? onsetDateTime = freezed,
    Object? onsetAge = freezed,
    Object? onsetPeriod = freezed,
    Object? onsetRange = freezed,
    Object? onsetString = freezed,
    Object? abatementDateTime = freezed,
    Object? abatementAge = freezed,
    Object? abatementPeriod = freezed,
    Object? abatementRange = freezed,
    Object? abatementString = freezed,
    Object? recordedDate = freezed,
    Object? recorder = freezed,
    Object? asserter = freezed,
    Object? stage = freezed,
    Object? evidence = freezed,
    Object? note = freezed,
  }) {
    return _then(_Condition(
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
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as List<CodeableConcept?>?,
      severity: severity == freezed
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      bodySite: bodySite == freezed
          ? _value.bodySite
          : bodySite // ignore: cast_nullable_to_non_nullable
              as List<CodeableConcept?>?,
      subject: subject == freezed
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
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
              as Quantity?,
      onsetString: onsetString == freezed
          ? _value.onsetString
          : onsetString // ignore: cast_nullable_to_non_nullable
              as String?,
      abatementDateTime: abatementDateTime == freezed
          ? _value.abatementDateTime
          : abatementDateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      abatementAge: abatementAge == freezed
          ? _value.abatementAge
          : abatementAge // ignore: cast_nullable_to_non_nullable
              as Age?,
      abatementPeriod: abatementPeriod == freezed
          ? _value.abatementPeriod
          : abatementPeriod // ignore: cast_nullable_to_non_nullable
              as Period?,
      abatementRange: abatementRange == freezed
          ? _value.abatementRange
          : abatementRange // ignore: cast_nullable_to_non_nullable
              as Quantity?,
      abatementString: abatementString == freezed
          ? _value.abatementString
          : abatementString // ignore: cast_nullable_to_non_nullable
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
      stage: stage == freezed
          ? _value.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as Stage?,
      evidence: evidence == freezed
          ? _value.evidence
          : evidence // ignore: cast_nullable_to_non_nullable
              as List<Evidence?>?,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as List<Annotation?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Condition implements _Condition {
  _$_Condition(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'Identifier') this.identifier,
      @JsonKey(name: 'ClinicalStatus') this.clinicalStatus,
      @JsonKey(name: 'VerificationStatus') this.verificationStatus,
      @JsonKey(name: 'Category') this.category,
      @JsonKey(name: 'Severity') this.severity,
      @JsonKey(name: 'Code') this.code,
      @JsonKey(name: 'BodySite') this.bodySite,
      @JsonKey(name: 'Subject') this.subject,
      @JsonKey(name: 'Encounter') this.encounter,
      @JsonKey(name: 'OnsetDateTime') this.onsetDateTime,
      @JsonKey(name: 'OnsetAge') this.onsetAge,
      @JsonKey(name: 'OnsetPeriod') this.onsetPeriod,
      @JsonKey(name: 'OnsetRange') this.onsetRange,
      @JsonKey(name: 'OnsetString') this.onsetString,
      @JsonKey(name: 'AbatementDateTime') this.abatementDateTime,
      @JsonKey(name: 'AbatementAge') this.abatementAge,
      @JsonKey(name: 'AbatementPeriod') this.abatementPeriod,
      @JsonKey(name: 'AbatementRange') this.abatementRange,
      @JsonKey(name: 'AbatementString') this.abatementString,
      @JsonKey(name: 'RecordedDate') this.recordedDate,
      @JsonKey(name: 'Recorder') this.recorder,
      @JsonKey(name: 'Asserter') this.asserter,
      @JsonKey(name: 'Stage') this.stage,
      @JsonKey(name: 'Evidence') this.evidence,
      @JsonKey(name: 'Note') this.note});

  factory _$_Condition.fromJson(Map<String, dynamic> json) =>
      _$_$_ConditionFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? id;
  @override
  @JsonKey(name: 'Identifier')
  final List<Identifier?>? identifier;
  @override
  @JsonKey(name: 'ClinicalStatus')
  final CodeableConcept? clinicalStatus;
  @override
  @JsonKey(name: 'VerificationStatus')
  final CodeableConcept? verificationStatus;
  @override
  @JsonKey(name: 'Category')
  final List<CodeableConcept?>? category;
  @override
  @JsonKey(name: 'Severity')
  final CodeableConcept? severity;
  @override
  @JsonKey(name: 'Code')
  final CodeableConcept? code;
  @override
  @JsonKey(name: 'BodySite')
  final List<CodeableConcept?>? bodySite;
  @override
  @JsonKey(name: 'Subject')
  final Reference? subject;
  @override
  @JsonKey(name: 'Encounter')
  final Reference? encounter;
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
  final Quantity? onsetRange;
  @override
  @JsonKey(name: 'OnsetString')
  final String? onsetString;
  @override
  @JsonKey(name: 'AbatementDateTime')
  final String? abatementDateTime;
  @override
  @JsonKey(name: 'AbatementAge')
  final Age? abatementAge;
  @override
  @JsonKey(name: 'AbatementPeriod')
  final Period? abatementPeriod;
  @override
  @JsonKey(name: 'AbatementRange')
  final Quantity? abatementRange;
  @override
  @JsonKey(name: 'AbatementString')
  final String? abatementString;
  @override
  @JsonKey(name: 'RecordedDate')
  final String? recordedDate;
  @override
  @JsonKey(name: 'Recorder')
  final Reference? recorder;
  @override
  @JsonKey(name: 'Asserter')
  final Reference? asserter;
  @override
  @JsonKey(name: 'Stage')
  final Stage? stage;
  @override
  @JsonKey(name: 'Evidence')
  final List<Evidence?>? evidence;
  @override
  @JsonKey(name: 'Note')
  final List<Annotation?>? note;

  @override
  String toString() {
    return 'Condition(id: $id, identifier: $identifier, clinicalStatus: $clinicalStatus, verificationStatus: $verificationStatus, category: $category, severity: $severity, code: $code, bodySite: $bodySite, subject: $subject, encounter: $encounter, onsetDateTime: $onsetDateTime, onsetAge: $onsetAge, onsetPeriod: $onsetPeriod, onsetRange: $onsetRange, onsetString: $onsetString, abatementDateTime: $abatementDateTime, abatementAge: $abatementAge, abatementPeriod: $abatementPeriod, abatementRange: $abatementRange, abatementString: $abatementString, recordedDate: $recordedDate, recorder: $recorder, asserter: $asserter, stage: $stage, evidence: $evidence, note: $note)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Condition &&
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
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.severity, severity) ||
                const DeepCollectionEquality()
                    .equals(other.severity, severity)) &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.bodySite, bodySite) ||
                const DeepCollectionEquality()
                    .equals(other.bodySite, bodySite)) &&
            (identical(other.subject, subject) ||
                const DeepCollectionEquality()
                    .equals(other.subject, subject)) &&
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
            (identical(other.abatementDateTime, abatementDateTime) ||
                const DeepCollectionEquality()
                    .equals(other.abatementDateTime, abatementDateTime)) &&
            (identical(other.abatementAge, abatementAge) ||
                const DeepCollectionEquality()
                    .equals(other.abatementAge, abatementAge)) &&
            (identical(other.abatementPeriod, abatementPeriod) ||
                const DeepCollectionEquality()
                    .equals(other.abatementPeriod, abatementPeriod)) &&
            (identical(other.abatementRange, abatementRange) ||
                const DeepCollectionEquality()
                    .equals(other.abatementRange, abatementRange)) &&
            (identical(other.abatementString, abatementString) ||
                const DeepCollectionEquality()
                    .equals(other.abatementString, abatementString)) &&
            (identical(other.recordedDate, recordedDate) ||
                const DeepCollectionEquality()
                    .equals(other.recordedDate, recordedDate)) &&
            (identical(other.recorder, recorder) ||
                const DeepCollectionEquality()
                    .equals(other.recorder, recorder)) &&
            (identical(other.asserter, asserter) ||
                const DeepCollectionEquality().equals(other.asserter, asserter)) &&
            (identical(other.stage, stage) || const DeepCollectionEquality().equals(other.stage, stage)) &&
            (identical(other.evidence, evidence) || const DeepCollectionEquality().equals(other.evidence, evidence)) &&
            (identical(other.note, note) || const DeepCollectionEquality().equals(other.note, note)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(identifier) ^
      const DeepCollectionEquality().hash(clinicalStatus) ^
      const DeepCollectionEquality().hash(verificationStatus) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(severity) ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(bodySite) ^
      const DeepCollectionEquality().hash(subject) ^
      const DeepCollectionEquality().hash(encounter) ^
      const DeepCollectionEquality().hash(onsetDateTime) ^
      const DeepCollectionEquality().hash(onsetAge) ^
      const DeepCollectionEquality().hash(onsetPeriod) ^
      const DeepCollectionEquality().hash(onsetRange) ^
      const DeepCollectionEquality().hash(onsetString) ^
      const DeepCollectionEquality().hash(abatementDateTime) ^
      const DeepCollectionEquality().hash(abatementAge) ^
      const DeepCollectionEquality().hash(abatementPeriod) ^
      const DeepCollectionEquality().hash(abatementRange) ^
      const DeepCollectionEquality().hash(abatementString) ^
      const DeepCollectionEquality().hash(recordedDate) ^
      const DeepCollectionEquality().hash(recorder) ^
      const DeepCollectionEquality().hash(asserter) ^
      const DeepCollectionEquality().hash(stage) ^
      const DeepCollectionEquality().hash(evidence) ^
      const DeepCollectionEquality().hash(note);

  @JsonKey(ignore: true)
  @override
  _$ConditionCopyWith<_Condition> get copyWith =>
      __$ConditionCopyWithImpl<_Condition>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ConditionToJson(this);
  }
}

abstract class _Condition implements Condition {
  factory _Condition(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'Identifier') List<Identifier?>? identifier,
      @JsonKey(name: 'ClinicalStatus') CodeableConcept? clinicalStatus,
      @JsonKey(name: 'VerificationStatus') CodeableConcept? verificationStatus,
      @JsonKey(name: 'Category') List<CodeableConcept?>? category,
      @JsonKey(name: 'Severity') CodeableConcept? severity,
      @JsonKey(name: 'Code') CodeableConcept? code,
      @JsonKey(name: 'BodySite') List<CodeableConcept?>? bodySite,
      @JsonKey(name: 'Subject') Reference? subject,
      @JsonKey(name: 'Encounter') Reference? encounter,
      @JsonKey(name: 'OnsetDateTime') String? onsetDateTime,
      @JsonKey(name: 'OnsetAge') Age? onsetAge,
      @JsonKey(name: 'OnsetPeriod') Period? onsetPeriod,
      @JsonKey(name: 'OnsetRange') Quantity? onsetRange,
      @JsonKey(name: 'OnsetString') String? onsetString,
      @JsonKey(name: 'AbatementDateTime') String? abatementDateTime,
      @JsonKey(name: 'AbatementAge') Age? abatementAge,
      @JsonKey(name: 'AbatementPeriod') Period? abatementPeriod,
      @JsonKey(name: 'AbatementRange') Quantity? abatementRange,
      @JsonKey(name: 'AbatementString') String? abatementString,
      @JsonKey(name: 'RecordedDate') String? recordedDate,
      @JsonKey(name: 'Recorder') Reference? recorder,
      @JsonKey(name: 'Asserter') Reference? asserter,
      @JsonKey(name: 'Stage') Stage? stage,
      @JsonKey(name: 'Evidence') List<Evidence?>? evidence,
      @JsonKey(name: 'Note') List<Annotation?>? note}) = _$_Condition;

  factory _Condition.fromJson(Map<String, dynamic> json) =
      _$_Condition.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Identifier')
  List<Identifier?>? get identifier => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'ClinicalStatus')
  CodeableConcept? get clinicalStatus => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'VerificationStatus')
  CodeableConcept? get verificationStatus => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Category')
  List<CodeableConcept?>? get category => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Severity')
  CodeableConcept? get severity => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Code')
  CodeableConcept? get code => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'BodySite')
  List<CodeableConcept?>? get bodySite => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Subject')
  Reference? get subject => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Encounter')
  Reference? get encounter => throw _privateConstructorUsedError;
  @override
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
  Quantity? get onsetRange => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'OnsetString')
  String? get onsetString => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'AbatementDateTime')
  String? get abatementDateTime => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'AbatementAge')
  Age? get abatementAge => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'AbatementPeriod')
  Period? get abatementPeriod => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'AbatementRange')
  Quantity? get abatementRange => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'AbatementString')
  String? get abatementString => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'RecordedDate')
  String? get recordedDate => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Recorder')
  Reference? get recorder => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Asserter')
  Reference? get asserter => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Stage')
  Stage? get stage => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Evidence')
  List<Evidence?>? get evidence => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Note')
  List<Annotation?>? get note => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ConditionCopyWith<_Condition> get copyWith =>
      throw _privateConstructorUsedError;
}
