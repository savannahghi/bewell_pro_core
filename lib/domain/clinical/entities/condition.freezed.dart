// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'condition.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Condition _$ConditionFromJson(Map<String, dynamic> json) {
  return _Condition.fromJson(json);
}

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
      _$ConditionCopyWithImpl<$Res, Condition>;
  @useResult
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
class _$ConditionCopyWithImpl<$Res, $Val extends Condition>
    implements $ConditionCopyWith<$Res> {
  _$ConditionCopyWithImpl(this._value, this._then);

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
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as List<CodeableConcept?>?,
      severity: freezed == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      bodySite: freezed == bodySite
          ? _value.bodySite
          : bodySite // ignore: cast_nullable_to_non_nullable
              as List<CodeableConcept?>?,
      subject: freezed == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
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
              as Quantity?,
      onsetString: freezed == onsetString
          ? _value.onsetString
          : onsetString // ignore: cast_nullable_to_non_nullable
              as String?,
      abatementDateTime: freezed == abatementDateTime
          ? _value.abatementDateTime
          : abatementDateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      abatementAge: freezed == abatementAge
          ? _value.abatementAge
          : abatementAge // ignore: cast_nullable_to_non_nullable
              as Age?,
      abatementPeriod: freezed == abatementPeriod
          ? _value.abatementPeriod
          : abatementPeriod // ignore: cast_nullable_to_non_nullable
              as Period?,
      abatementRange: freezed == abatementRange
          ? _value.abatementRange
          : abatementRange // ignore: cast_nullable_to_non_nullable
              as Quantity?,
      abatementString: freezed == abatementString
          ? _value.abatementString
          : abatementString // ignore: cast_nullable_to_non_nullable
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
      stage: freezed == stage
          ? _value.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as Stage?,
      evidence: freezed == evidence
          ? _value.evidence
          : evidence // ignore: cast_nullable_to_non_nullable
              as List<Evidence?>?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as List<Annotation?>?,
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
  $CodeableConceptCopyWith<$Res>? get severity {
    if (_value.severity == null) {
      return null;
    }

    return $CodeableConceptCopyWith<$Res>(_value.severity!, (value) {
      return _then(_value.copyWith(severity: value) as $Val);
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
  $ReferenceCopyWith<$Res>? get subject {
    if (_value.subject == null) {
      return null;
    }

    return $ReferenceCopyWith<$Res>(_value.subject!, (value) {
      return _then(_value.copyWith(subject: value) as $Val);
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
  $QuantityCopyWith<$Res>? get onsetRange {
    if (_value.onsetRange == null) {
      return null;
    }

    return $QuantityCopyWith<$Res>(_value.onsetRange!, (value) {
      return _then(_value.copyWith(onsetRange: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AgeCopyWith<$Res>? get abatementAge {
    if (_value.abatementAge == null) {
      return null;
    }

    return $AgeCopyWith<$Res>(_value.abatementAge!, (value) {
      return _then(_value.copyWith(abatementAge: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PeriodCopyWith<$Res>? get abatementPeriod {
    if (_value.abatementPeriod == null) {
      return null;
    }

    return $PeriodCopyWith<$Res>(_value.abatementPeriod!, (value) {
      return _then(_value.copyWith(abatementPeriod: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $QuantityCopyWith<$Res>? get abatementRange {
    if (_value.abatementRange == null) {
      return null;
    }

    return $QuantityCopyWith<$Res>(_value.abatementRange!, (value) {
      return _then(_value.copyWith(abatementRange: value) as $Val);
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

  @override
  @pragma('vm:prefer-inline')
  $StageCopyWith<$Res>? get stage {
    if (_value.stage == null) {
      return null;
    }

    return $StageCopyWith<$Res>(_value.stage!, (value) {
      return _then(_value.copyWith(stage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ConditionCopyWith<$Res> implements $ConditionCopyWith<$Res> {
  factory _$$_ConditionCopyWith(
          _$_Condition value, $Res Function(_$_Condition) then) =
      __$$_ConditionCopyWithImpl<$Res>;
  @override
  @useResult
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
class __$$_ConditionCopyWithImpl<$Res>
    extends _$ConditionCopyWithImpl<$Res, _$_Condition>
    implements _$$_ConditionCopyWith<$Res> {
  __$$_ConditionCopyWithImpl(
      _$_Condition _value, $Res Function(_$_Condition) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
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
    return _then(_$_Condition(
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
      category: freezed == category
          ? _value._category
          : category // ignore: cast_nullable_to_non_nullable
              as List<CodeableConcept?>?,
      severity: freezed == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      bodySite: freezed == bodySite
          ? _value._bodySite
          : bodySite // ignore: cast_nullable_to_non_nullable
              as List<CodeableConcept?>?,
      subject: freezed == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
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
              as Quantity?,
      onsetString: freezed == onsetString
          ? _value.onsetString
          : onsetString // ignore: cast_nullable_to_non_nullable
              as String?,
      abatementDateTime: freezed == abatementDateTime
          ? _value.abatementDateTime
          : abatementDateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      abatementAge: freezed == abatementAge
          ? _value.abatementAge
          : abatementAge // ignore: cast_nullable_to_non_nullable
              as Age?,
      abatementPeriod: freezed == abatementPeriod
          ? _value.abatementPeriod
          : abatementPeriod // ignore: cast_nullable_to_non_nullable
              as Period?,
      abatementRange: freezed == abatementRange
          ? _value.abatementRange
          : abatementRange // ignore: cast_nullable_to_non_nullable
              as Quantity?,
      abatementString: freezed == abatementString
          ? _value.abatementString
          : abatementString // ignore: cast_nullable_to_non_nullable
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
      stage: freezed == stage
          ? _value.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as Stage?,
      evidence: freezed == evidence
          ? _value._evidence
          : evidence // ignore: cast_nullable_to_non_nullable
              as List<Evidence?>?,
      note: freezed == note
          ? _value._note
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
      @JsonKey(name: 'Identifier') final List<Identifier?>? identifier,
      @JsonKey(name: 'ClinicalStatus') this.clinicalStatus,
      @JsonKey(name: 'VerificationStatus') this.verificationStatus,
      @JsonKey(name: 'Category') final List<CodeableConcept?>? category,
      @JsonKey(name: 'Severity') this.severity,
      @JsonKey(name: 'Code') this.code,
      @JsonKey(name: 'BodySite') final List<CodeableConcept?>? bodySite,
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
      @JsonKey(name: 'Evidence') final List<Evidence?>? evidence,
      @JsonKey(name: 'Note') final List<Annotation?>? note})
      : _identifier = identifier,
        _category = category,
        _bodySite = bodySite,
        _evidence = evidence,
        _note = note;

  factory _$_Condition.fromJson(Map<String, dynamic> json) =>
      _$$_ConditionFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? id;
  final List<Identifier?>? _identifier;
  @override
  @JsonKey(name: 'Identifier')
  List<Identifier?>? get identifier {
    final value = _identifier;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'ClinicalStatus')
  final CodeableConcept? clinicalStatus;
  @override
  @JsonKey(name: 'VerificationStatus')
  final CodeableConcept? verificationStatus;
  final List<CodeableConcept?>? _category;
  @override
  @JsonKey(name: 'Category')
  List<CodeableConcept?>? get category {
    final value = _category;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'Severity')
  final CodeableConcept? severity;
  @override
  @JsonKey(name: 'Code')
  final CodeableConcept? code;
  final List<CodeableConcept?>? _bodySite;
  @override
  @JsonKey(name: 'BodySite')
  List<CodeableConcept?>? get bodySite {
    final value = _bodySite;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

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
  final List<Evidence?>? _evidence;
  @override
  @JsonKey(name: 'Evidence')
  List<Evidence?>? get evidence {
    final value = _evidence;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Annotation?>? _note;
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
    return 'Condition(id: $id, identifier: $identifier, clinicalStatus: $clinicalStatus, verificationStatus: $verificationStatus, category: $category, severity: $severity, code: $code, bodySite: $bodySite, subject: $subject, encounter: $encounter, onsetDateTime: $onsetDateTime, onsetAge: $onsetAge, onsetPeriod: $onsetPeriod, onsetRange: $onsetRange, onsetString: $onsetString, abatementDateTime: $abatementDateTime, abatementAge: $abatementAge, abatementPeriod: $abatementPeriod, abatementRange: $abatementRange, abatementString: $abatementString, recordedDate: $recordedDate, recorder: $recorder, asserter: $asserter, stage: $stage, evidence: $evidence, note: $note)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Condition &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._identifier, _identifier) &&
            (identical(other.clinicalStatus, clinicalStatus) ||
                other.clinicalStatus == clinicalStatus) &&
            (identical(other.verificationStatus, verificationStatus) ||
                other.verificationStatus == verificationStatus) &&
            const DeepCollectionEquality().equals(other._category, _category) &&
            (identical(other.severity, severity) ||
                other.severity == severity) &&
            (identical(other.code, code) || other.code == code) &&
            const DeepCollectionEquality().equals(other._bodySite, _bodySite) &&
            (identical(other.subject, subject) || other.subject == subject) &&
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
            (identical(other.abatementDateTime, abatementDateTime) ||
                other.abatementDateTime == abatementDateTime) &&
            (identical(other.abatementAge, abatementAge) ||
                other.abatementAge == abatementAge) &&
            (identical(other.abatementPeriod, abatementPeriod) ||
                other.abatementPeriod == abatementPeriod) &&
            (identical(other.abatementRange, abatementRange) ||
                other.abatementRange == abatementRange) &&
            (identical(other.abatementString, abatementString) ||
                other.abatementString == abatementString) &&
            (identical(other.recordedDate, recordedDate) ||
                other.recordedDate == recordedDate) &&
            (identical(other.recorder, recorder) ||
                other.recorder == recorder) &&
            (identical(other.asserter, asserter) ||
                other.asserter == asserter) &&
            (identical(other.stage, stage) || other.stage == stage) &&
            const DeepCollectionEquality().equals(other._evidence, _evidence) &&
            const DeepCollectionEquality().equals(other._note, _note));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        const DeepCollectionEquality().hash(_identifier),
        clinicalStatus,
        verificationStatus,
        const DeepCollectionEquality().hash(_category),
        severity,
        code,
        const DeepCollectionEquality().hash(_bodySite),
        subject,
        encounter,
        onsetDateTime,
        onsetAge,
        onsetPeriod,
        onsetRange,
        onsetString,
        abatementDateTime,
        abatementAge,
        abatementPeriod,
        abatementRange,
        abatementString,
        recordedDate,
        recorder,
        asserter,
        stage,
        const DeepCollectionEquality().hash(_evidence),
        const DeepCollectionEquality().hash(_note)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ConditionCopyWith<_$_Condition> get copyWith =>
      __$$_ConditionCopyWithImpl<_$_Condition>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ConditionToJson(
      this,
    );
  }
}

abstract class _Condition implements Condition {
  factory _Condition(
      {@JsonKey(name: 'ID')
          final String? id,
      @JsonKey(name: 'Identifier')
          final List<Identifier?>? identifier,
      @JsonKey(name: 'ClinicalStatus')
          final CodeableConcept? clinicalStatus,
      @JsonKey(name: 'VerificationStatus')
          final CodeableConcept? verificationStatus,
      @JsonKey(name: 'Category')
          final List<CodeableConcept?>? category,
      @JsonKey(name: 'Severity')
          final CodeableConcept? severity,
      @JsonKey(name: 'Code')
          final CodeableConcept? code,
      @JsonKey(name: 'BodySite')
          final List<CodeableConcept?>? bodySite,
      @JsonKey(name: 'Subject')
          final Reference? subject,
      @JsonKey(name: 'Encounter')
          final Reference? encounter,
      @JsonKey(name: 'OnsetDateTime')
          final String? onsetDateTime,
      @JsonKey(name: 'OnsetAge')
          final Age? onsetAge,
      @JsonKey(name: 'OnsetPeriod')
          final Period? onsetPeriod,
      @JsonKey(name: 'OnsetRange')
          final Quantity? onsetRange,
      @JsonKey(name: 'OnsetString')
          final String? onsetString,
      @JsonKey(name: 'AbatementDateTime')
          final String? abatementDateTime,
      @JsonKey(name: 'AbatementAge')
          final Age? abatementAge,
      @JsonKey(name: 'AbatementPeriod')
          final Period? abatementPeriod,
      @JsonKey(name: 'AbatementRange')
          final Quantity? abatementRange,
      @JsonKey(name: 'AbatementString')
          final String? abatementString,
      @JsonKey(name: 'RecordedDate')
          final String? recordedDate,
      @JsonKey(name: 'Recorder')
          final Reference? recorder,
      @JsonKey(name: 'Asserter')
          final Reference? asserter,
      @JsonKey(name: 'Stage')
          final Stage? stage,
      @JsonKey(name: 'Evidence')
          final List<Evidence?>? evidence,
      @JsonKey(name: 'Note')
          final List<Annotation?>? note}) = _$_Condition;

  factory _Condition.fromJson(Map<String, dynamic> json) =
      _$_Condition.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id;
  @override
  @JsonKey(name: 'Identifier')
  List<Identifier?>? get identifier;
  @override
  @JsonKey(name: 'ClinicalStatus')
  CodeableConcept? get clinicalStatus;
  @override
  @JsonKey(name: 'VerificationStatus')
  CodeableConcept? get verificationStatus;
  @override
  @JsonKey(name: 'Category')
  List<CodeableConcept?>? get category;
  @override
  @JsonKey(name: 'Severity')
  CodeableConcept? get severity;
  @override
  @JsonKey(name: 'Code')
  CodeableConcept? get code;
  @override
  @JsonKey(name: 'BodySite')
  List<CodeableConcept?>? get bodySite;
  @override
  @JsonKey(name: 'Subject')
  Reference? get subject;
  @override
  @JsonKey(name: 'Encounter')
  Reference? get encounter;
  @override
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
  Quantity? get onsetRange;
  @override
  @JsonKey(name: 'OnsetString')
  String? get onsetString;
  @override
  @JsonKey(name: 'AbatementDateTime')
  String? get abatementDateTime;
  @override
  @JsonKey(name: 'AbatementAge')
  Age? get abatementAge;
  @override
  @JsonKey(name: 'AbatementPeriod')
  Period? get abatementPeriod;
  @override
  @JsonKey(name: 'AbatementRange')
  Quantity? get abatementRange;
  @override
  @JsonKey(name: 'AbatementString')
  String? get abatementString;
  @override
  @JsonKey(name: 'RecordedDate')
  String? get recordedDate;
  @override
  @JsonKey(name: 'Recorder')
  Reference? get recorder;
  @override
  @JsonKey(name: 'Asserter')
  Reference? get asserter;
  @override
  @JsonKey(name: 'Stage')
  Stage? get stage;
  @override
  @JsonKey(name: 'Evidence')
  List<Evidence?>? get evidence;
  @override
  @JsonKey(name: 'Note')
  List<Annotation?>? get note;
  @override
  @JsonKey(ignore: true)
  _$$_ConditionCopyWith<_$_Condition> get copyWith =>
      throw _privateConstructorUsedError;
}
