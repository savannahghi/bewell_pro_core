// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'medication.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Medication _$MedicationFromJson(Map<String, dynamic> json) {
  return _Medication.fromJson(json);
}

/// @nodoc
mixin _$Medication {
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Identifier')
  List<Identifier?>? get identifier => throw _privateConstructorUsedError;
  @JsonKey(name: 'Status', unknownEnumValue: MedicationStatusEnum.inactive)
  MedicationStatusEnum? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'StatusReason')
  CodeableConcept? get statusReason => throw _privateConstructorUsedError;
  @JsonKey(name: 'Intent', unknownEnumValue: MedicationIntent.proposal)
  MedicationIntent? get intent => throw _privateConstructorUsedError;
  @JsonKey(name: 'Category')
  List<CodeableConcept?>? get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'Priority', unknownEnumValue: Priority.routine)
  Priority? get priority => throw _privateConstructorUsedError;
  @JsonKey(name: 'ReportedBoolean')
  bool? get reportedBoolean => throw _privateConstructorUsedError;
  @JsonKey(name: 'ReportedReference')
  Reference? get reportedReference => throw _privateConstructorUsedError;
  @JsonKey(name: 'MedicationCodeableConcept')
  CodeableConcept? get medicationCodeableConcept =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'MedicationReference')
  Reference? get medicationReference => throw _privateConstructorUsedError;
  @JsonKey(name: 'Subject')
  Reference? get subject => throw _privateConstructorUsedError;
  @JsonKey(name: 'Encounter')
  Reference? get encounter => throw _privateConstructorUsedError;
  @JsonKey(name: 'SupportingInformation')
  List<Reference?>? get supportingInformation =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'AuthoredOn')
  String? get authoredOn => throw _privateConstructorUsedError;
  @JsonKey(name: 'Requester')
  Reference? get requester => throw _privateConstructorUsedError;
  @JsonKey(name: 'Performer')
  Reference? get performer => throw _privateConstructorUsedError;
  @JsonKey(name: 'PerformerType')
  CodeableConcept? get performerType => throw _privateConstructorUsedError;
  @JsonKey(name: 'Recorder')
  Reference? get recorder => throw _privateConstructorUsedError;
  @JsonKey(name: 'ReasonReference')
  List<Reference?>? get reasonReference => throw _privateConstructorUsedError;
  @JsonKey(name: 'BasedOn')
  List<Reference?>? get basedOn => throw _privateConstructorUsedError;
  @JsonKey(name: 'GroupIdentifier')
  Identifier? get groupIdentifier => throw _privateConstructorUsedError;
  @JsonKey(name: 'CourseOfTherapyType')
  CodeableConcept? get courseOfTherapyType =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'Insurance')
  List<Reference?>? get insurance => throw _privateConstructorUsedError;
  @JsonKey(name: 'Note')
  List<Annotation?>? get note => throw _privateConstructorUsedError;
  @JsonKey(name: 'DosageInstruction')
  List<Dosage?>? get dosageInstruction => throw _privateConstructorUsedError;
  @JsonKey(name: 'DispenseRequest')
  MedicationRequestDispense? get dispenseRequest =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'Substitution')
  MedicationRequestSubstitution? get substitution =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'PriorPrescription')
  Reference? get priorPrescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'DetectedIssue')
  List<Reference?>? get detectedIssue => throw _privateConstructorUsedError;
  @JsonKey(name: 'EventHistory')
  List<Reference?>? get eventHistory => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MedicationCopyWith<Medication> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedicationCopyWith<$Res> {
  factory $MedicationCopyWith(
          Medication value, $Res Function(Medication) then) =
      _$MedicationCopyWithImpl<$Res, Medication>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID')
          String? id,
      @JsonKey(name: 'Identifier')
          List<Identifier?>? identifier,
      @JsonKey(name: 'Status', unknownEnumValue: MedicationStatusEnum.inactive)
          MedicationStatusEnum? status,
      @JsonKey(name: 'StatusReason')
          CodeableConcept? statusReason,
      @JsonKey(name: 'Intent', unknownEnumValue: MedicationIntent.proposal)
          MedicationIntent? intent,
      @JsonKey(name: 'Category')
          List<CodeableConcept?>? category,
      @JsonKey(name: 'Priority', unknownEnumValue: Priority.routine)
          Priority? priority,
      @JsonKey(name: 'ReportedBoolean')
          bool? reportedBoolean,
      @JsonKey(name: 'ReportedReference')
          Reference? reportedReference,
      @JsonKey(name: 'MedicationCodeableConcept')
          CodeableConcept? medicationCodeableConcept,
      @JsonKey(name: 'MedicationReference')
          Reference? medicationReference,
      @JsonKey(name: 'Subject')
          Reference? subject,
      @JsonKey(name: 'Encounter')
          Reference? encounter,
      @JsonKey(name: 'SupportingInformation')
          List<Reference?>? supportingInformation,
      @JsonKey(name: 'AuthoredOn')
          String? authoredOn,
      @JsonKey(name: 'Requester')
          Reference? requester,
      @JsonKey(name: 'Performer')
          Reference? performer,
      @JsonKey(name: 'PerformerType')
          CodeableConcept? performerType,
      @JsonKey(name: 'Recorder')
          Reference? recorder,
      @JsonKey(name: 'ReasonReference')
          List<Reference?>? reasonReference,
      @JsonKey(name: 'BasedOn')
          List<Reference?>? basedOn,
      @JsonKey(name: 'GroupIdentifier')
          Identifier? groupIdentifier,
      @JsonKey(name: 'CourseOfTherapyType')
          CodeableConcept? courseOfTherapyType,
      @JsonKey(name: 'Insurance')
          List<Reference?>? insurance,
      @JsonKey(name: 'Note')
          List<Annotation?>? note,
      @JsonKey(name: 'DosageInstruction')
          List<Dosage?>? dosageInstruction,
      @JsonKey(name: 'DispenseRequest')
          MedicationRequestDispense? dispenseRequest,
      @JsonKey(name: 'Substitution')
          MedicationRequestSubstitution? substitution,
      @JsonKey(name: 'PriorPrescription')
          Reference? priorPrescription,
      @JsonKey(name: 'DetectedIssue')
          List<Reference?>? detectedIssue,
      @JsonKey(name: 'EventHistory')
          List<Reference?>? eventHistory});

  $CodeableConceptCopyWith<$Res>? get statusReason;
  $ReferenceCopyWith<$Res>? get reportedReference;
  $CodeableConceptCopyWith<$Res>? get medicationCodeableConcept;
  $ReferenceCopyWith<$Res>? get medicationReference;
  $ReferenceCopyWith<$Res>? get subject;
  $ReferenceCopyWith<$Res>? get encounter;
  $ReferenceCopyWith<$Res>? get requester;
  $ReferenceCopyWith<$Res>? get performer;
  $CodeableConceptCopyWith<$Res>? get performerType;
  $ReferenceCopyWith<$Res>? get recorder;
  $IdentifierCopyWith<$Res>? get groupIdentifier;
  $CodeableConceptCopyWith<$Res>? get courseOfTherapyType;
  $MedicationRequestDispenseCopyWith<$Res>? get dispenseRequest;
  $MedicationRequestSubstitutionCopyWith<$Res>? get substitution;
  $ReferenceCopyWith<$Res>? get priorPrescription;
}

/// @nodoc
class _$MedicationCopyWithImpl<$Res, $Val extends Medication>
    implements $MedicationCopyWith<$Res> {
  _$MedicationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? identifier = freezed,
    Object? status = freezed,
    Object? statusReason = freezed,
    Object? intent = freezed,
    Object? category = freezed,
    Object? priority = freezed,
    Object? reportedBoolean = freezed,
    Object? reportedReference = freezed,
    Object? medicationCodeableConcept = freezed,
    Object? medicationReference = freezed,
    Object? subject = freezed,
    Object? encounter = freezed,
    Object? supportingInformation = freezed,
    Object? authoredOn = freezed,
    Object? requester = freezed,
    Object? performer = freezed,
    Object? performerType = freezed,
    Object? recorder = freezed,
    Object? reasonReference = freezed,
    Object? basedOn = freezed,
    Object? groupIdentifier = freezed,
    Object? courseOfTherapyType = freezed,
    Object? insurance = freezed,
    Object? note = freezed,
    Object? dosageInstruction = freezed,
    Object? dispenseRequest = freezed,
    Object? substitution = freezed,
    Object? priorPrescription = freezed,
    Object? detectedIssue = freezed,
    Object? eventHistory = freezed,
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
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MedicationStatusEnum?,
      statusReason: freezed == statusReason
          ? _value.statusReason
          : statusReason // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      intent: freezed == intent
          ? _value.intent
          : intent // ignore: cast_nullable_to_non_nullable
              as MedicationIntent?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as List<CodeableConcept?>?,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as Priority?,
      reportedBoolean: freezed == reportedBoolean
          ? _value.reportedBoolean
          : reportedBoolean // ignore: cast_nullable_to_non_nullable
              as bool?,
      reportedReference: freezed == reportedReference
          ? _value.reportedReference
          : reportedReference // ignore: cast_nullable_to_non_nullable
              as Reference?,
      medicationCodeableConcept: freezed == medicationCodeableConcept
          ? _value.medicationCodeableConcept
          : medicationCodeableConcept // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      medicationReference: freezed == medicationReference
          ? _value.medicationReference
          : medicationReference // ignore: cast_nullable_to_non_nullable
              as Reference?,
      subject: freezed == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as Reference?,
      encounter: freezed == encounter
          ? _value.encounter
          : encounter // ignore: cast_nullable_to_non_nullable
              as Reference?,
      supportingInformation: freezed == supportingInformation
          ? _value.supportingInformation
          : supportingInformation // ignore: cast_nullable_to_non_nullable
              as List<Reference?>?,
      authoredOn: freezed == authoredOn
          ? _value.authoredOn
          : authoredOn // ignore: cast_nullable_to_non_nullable
              as String?,
      requester: freezed == requester
          ? _value.requester
          : requester // ignore: cast_nullable_to_non_nullable
              as Reference?,
      performer: freezed == performer
          ? _value.performer
          : performer // ignore: cast_nullable_to_non_nullable
              as Reference?,
      performerType: freezed == performerType
          ? _value.performerType
          : performerType // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      recorder: freezed == recorder
          ? _value.recorder
          : recorder // ignore: cast_nullable_to_non_nullable
              as Reference?,
      reasonReference: freezed == reasonReference
          ? _value.reasonReference
          : reasonReference // ignore: cast_nullable_to_non_nullable
              as List<Reference?>?,
      basedOn: freezed == basedOn
          ? _value.basedOn
          : basedOn // ignore: cast_nullable_to_non_nullable
              as List<Reference?>?,
      groupIdentifier: freezed == groupIdentifier
          ? _value.groupIdentifier
          : groupIdentifier // ignore: cast_nullable_to_non_nullable
              as Identifier?,
      courseOfTherapyType: freezed == courseOfTherapyType
          ? _value.courseOfTherapyType
          : courseOfTherapyType // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      insurance: freezed == insurance
          ? _value.insurance
          : insurance // ignore: cast_nullable_to_non_nullable
              as List<Reference?>?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as List<Annotation?>?,
      dosageInstruction: freezed == dosageInstruction
          ? _value.dosageInstruction
          : dosageInstruction // ignore: cast_nullable_to_non_nullable
              as List<Dosage?>?,
      dispenseRequest: freezed == dispenseRequest
          ? _value.dispenseRequest
          : dispenseRequest // ignore: cast_nullable_to_non_nullable
              as MedicationRequestDispense?,
      substitution: freezed == substitution
          ? _value.substitution
          : substitution // ignore: cast_nullable_to_non_nullable
              as MedicationRequestSubstitution?,
      priorPrescription: freezed == priorPrescription
          ? _value.priorPrescription
          : priorPrescription // ignore: cast_nullable_to_non_nullable
              as Reference?,
      detectedIssue: freezed == detectedIssue
          ? _value.detectedIssue
          : detectedIssue // ignore: cast_nullable_to_non_nullable
              as List<Reference?>?,
      eventHistory: freezed == eventHistory
          ? _value.eventHistory
          : eventHistory // ignore: cast_nullable_to_non_nullable
              as List<Reference?>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CodeableConceptCopyWith<$Res>? get statusReason {
    if (_value.statusReason == null) {
      return null;
    }

    return $CodeableConceptCopyWith<$Res>(_value.statusReason!, (value) {
      return _then(_value.copyWith(statusReason: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ReferenceCopyWith<$Res>? get reportedReference {
    if (_value.reportedReference == null) {
      return null;
    }

    return $ReferenceCopyWith<$Res>(_value.reportedReference!, (value) {
      return _then(_value.copyWith(reportedReference: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CodeableConceptCopyWith<$Res>? get medicationCodeableConcept {
    if (_value.medicationCodeableConcept == null) {
      return null;
    }

    return $CodeableConceptCopyWith<$Res>(_value.medicationCodeableConcept!,
        (value) {
      return _then(_value.copyWith(medicationCodeableConcept: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ReferenceCopyWith<$Res>? get medicationReference {
    if (_value.medicationReference == null) {
      return null;
    }

    return $ReferenceCopyWith<$Res>(_value.medicationReference!, (value) {
      return _then(_value.copyWith(medicationReference: value) as $Val);
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
  $ReferenceCopyWith<$Res>? get requester {
    if (_value.requester == null) {
      return null;
    }

    return $ReferenceCopyWith<$Res>(_value.requester!, (value) {
      return _then(_value.copyWith(requester: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ReferenceCopyWith<$Res>? get performer {
    if (_value.performer == null) {
      return null;
    }

    return $ReferenceCopyWith<$Res>(_value.performer!, (value) {
      return _then(_value.copyWith(performer: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CodeableConceptCopyWith<$Res>? get performerType {
    if (_value.performerType == null) {
      return null;
    }

    return $CodeableConceptCopyWith<$Res>(_value.performerType!, (value) {
      return _then(_value.copyWith(performerType: value) as $Val);
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
  $IdentifierCopyWith<$Res>? get groupIdentifier {
    if (_value.groupIdentifier == null) {
      return null;
    }

    return $IdentifierCopyWith<$Res>(_value.groupIdentifier!, (value) {
      return _then(_value.copyWith(groupIdentifier: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CodeableConceptCopyWith<$Res>? get courseOfTherapyType {
    if (_value.courseOfTherapyType == null) {
      return null;
    }

    return $CodeableConceptCopyWith<$Res>(_value.courseOfTherapyType!, (value) {
      return _then(_value.copyWith(courseOfTherapyType: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MedicationRequestDispenseCopyWith<$Res>? get dispenseRequest {
    if (_value.dispenseRequest == null) {
      return null;
    }

    return $MedicationRequestDispenseCopyWith<$Res>(_value.dispenseRequest!,
        (value) {
      return _then(_value.copyWith(dispenseRequest: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MedicationRequestSubstitutionCopyWith<$Res>? get substitution {
    if (_value.substitution == null) {
      return null;
    }

    return $MedicationRequestSubstitutionCopyWith<$Res>(_value.substitution!,
        (value) {
      return _then(_value.copyWith(substitution: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ReferenceCopyWith<$Res>? get priorPrescription {
    if (_value.priorPrescription == null) {
      return null;
    }

    return $ReferenceCopyWith<$Res>(_value.priorPrescription!, (value) {
      return _then(_value.copyWith(priorPrescription: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MedicationCopyWith<$Res>
    implements $MedicationCopyWith<$Res> {
  factory _$$_MedicationCopyWith(
          _$_Medication value, $Res Function(_$_Medication) then) =
      __$$_MedicationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID')
          String? id,
      @JsonKey(name: 'Identifier')
          List<Identifier?>? identifier,
      @JsonKey(name: 'Status', unknownEnumValue: MedicationStatusEnum.inactive)
          MedicationStatusEnum? status,
      @JsonKey(name: 'StatusReason')
          CodeableConcept? statusReason,
      @JsonKey(name: 'Intent', unknownEnumValue: MedicationIntent.proposal)
          MedicationIntent? intent,
      @JsonKey(name: 'Category')
          List<CodeableConcept?>? category,
      @JsonKey(name: 'Priority', unknownEnumValue: Priority.routine)
          Priority? priority,
      @JsonKey(name: 'ReportedBoolean')
          bool? reportedBoolean,
      @JsonKey(name: 'ReportedReference')
          Reference? reportedReference,
      @JsonKey(name: 'MedicationCodeableConcept')
          CodeableConcept? medicationCodeableConcept,
      @JsonKey(name: 'MedicationReference')
          Reference? medicationReference,
      @JsonKey(name: 'Subject')
          Reference? subject,
      @JsonKey(name: 'Encounter')
          Reference? encounter,
      @JsonKey(name: 'SupportingInformation')
          List<Reference?>? supportingInformation,
      @JsonKey(name: 'AuthoredOn')
          String? authoredOn,
      @JsonKey(name: 'Requester')
          Reference? requester,
      @JsonKey(name: 'Performer')
          Reference? performer,
      @JsonKey(name: 'PerformerType')
          CodeableConcept? performerType,
      @JsonKey(name: 'Recorder')
          Reference? recorder,
      @JsonKey(name: 'ReasonReference')
          List<Reference?>? reasonReference,
      @JsonKey(name: 'BasedOn')
          List<Reference?>? basedOn,
      @JsonKey(name: 'GroupIdentifier')
          Identifier? groupIdentifier,
      @JsonKey(name: 'CourseOfTherapyType')
          CodeableConcept? courseOfTherapyType,
      @JsonKey(name: 'Insurance')
          List<Reference?>? insurance,
      @JsonKey(name: 'Note')
          List<Annotation?>? note,
      @JsonKey(name: 'DosageInstruction')
          List<Dosage?>? dosageInstruction,
      @JsonKey(name: 'DispenseRequest')
          MedicationRequestDispense? dispenseRequest,
      @JsonKey(name: 'Substitution')
          MedicationRequestSubstitution? substitution,
      @JsonKey(name: 'PriorPrescription')
          Reference? priorPrescription,
      @JsonKey(name: 'DetectedIssue')
          List<Reference?>? detectedIssue,
      @JsonKey(name: 'EventHistory')
          List<Reference?>? eventHistory});

  @override
  $CodeableConceptCopyWith<$Res>? get statusReason;
  @override
  $ReferenceCopyWith<$Res>? get reportedReference;
  @override
  $CodeableConceptCopyWith<$Res>? get medicationCodeableConcept;
  @override
  $ReferenceCopyWith<$Res>? get medicationReference;
  @override
  $ReferenceCopyWith<$Res>? get subject;
  @override
  $ReferenceCopyWith<$Res>? get encounter;
  @override
  $ReferenceCopyWith<$Res>? get requester;
  @override
  $ReferenceCopyWith<$Res>? get performer;
  @override
  $CodeableConceptCopyWith<$Res>? get performerType;
  @override
  $ReferenceCopyWith<$Res>? get recorder;
  @override
  $IdentifierCopyWith<$Res>? get groupIdentifier;
  @override
  $CodeableConceptCopyWith<$Res>? get courseOfTherapyType;
  @override
  $MedicationRequestDispenseCopyWith<$Res>? get dispenseRequest;
  @override
  $MedicationRequestSubstitutionCopyWith<$Res>? get substitution;
  @override
  $ReferenceCopyWith<$Res>? get priorPrescription;
}

/// @nodoc
class __$$_MedicationCopyWithImpl<$Res>
    extends _$MedicationCopyWithImpl<$Res, _$_Medication>
    implements _$$_MedicationCopyWith<$Res> {
  __$$_MedicationCopyWithImpl(
      _$_Medication _value, $Res Function(_$_Medication) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? identifier = freezed,
    Object? status = freezed,
    Object? statusReason = freezed,
    Object? intent = freezed,
    Object? category = freezed,
    Object? priority = freezed,
    Object? reportedBoolean = freezed,
    Object? reportedReference = freezed,
    Object? medicationCodeableConcept = freezed,
    Object? medicationReference = freezed,
    Object? subject = freezed,
    Object? encounter = freezed,
    Object? supportingInformation = freezed,
    Object? authoredOn = freezed,
    Object? requester = freezed,
    Object? performer = freezed,
    Object? performerType = freezed,
    Object? recorder = freezed,
    Object? reasonReference = freezed,
    Object? basedOn = freezed,
    Object? groupIdentifier = freezed,
    Object? courseOfTherapyType = freezed,
    Object? insurance = freezed,
    Object? note = freezed,
    Object? dosageInstruction = freezed,
    Object? dispenseRequest = freezed,
    Object? substitution = freezed,
    Object? priorPrescription = freezed,
    Object? detectedIssue = freezed,
    Object? eventHistory = freezed,
  }) {
    return _then(_$_Medication(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      identifier: freezed == identifier
          ? _value._identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as List<Identifier?>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MedicationStatusEnum?,
      statusReason: freezed == statusReason
          ? _value.statusReason
          : statusReason // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      intent: freezed == intent
          ? _value.intent
          : intent // ignore: cast_nullable_to_non_nullable
              as MedicationIntent?,
      category: freezed == category
          ? _value._category
          : category // ignore: cast_nullable_to_non_nullable
              as List<CodeableConcept?>?,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as Priority?,
      reportedBoolean: freezed == reportedBoolean
          ? _value.reportedBoolean
          : reportedBoolean // ignore: cast_nullable_to_non_nullable
              as bool?,
      reportedReference: freezed == reportedReference
          ? _value.reportedReference
          : reportedReference // ignore: cast_nullable_to_non_nullable
              as Reference?,
      medicationCodeableConcept: freezed == medicationCodeableConcept
          ? _value.medicationCodeableConcept
          : medicationCodeableConcept // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      medicationReference: freezed == medicationReference
          ? _value.medicationReference
          : medicationReference // ignore: cast_nullable_to_non_nullable
              as Reference?,
      subject: freezed == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as Reference?,
      encounter: freezed == encounter
          ? _value.encounter
          : encounter // ignore: cast_nullable_to_non_nullable
              as Reference?,
      supportingInformation: freezed == supportingInformation
          ? _value._supportingInformation
          : supportingInformation // ignore: cast_nullable_to_non_nullable
              as List<Reference?>?,
      authoredOn: freezed == authoredOn
          ? _value.authoredOn
          : authoredOn // ignore: cast_nullable_to_non_nullable
              as String?,
      requester: freezed == requester
          ? _value.requester
          : requester // ignore: cast_nullable_to_non_nullable
              as Reference?,
      performer: freezed == performer
          ? _value.performer
          : performer // ignore: cast_nullable_to_non_nullable
              as Reference?,
      performerType: freezed == performerType
          ? _value.performerType
          : performerType // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      recorder: freezed == recorder
          ? _value.recorder
          : recorder // ignore: cast_nullable_to_non_nullable
              as Reference?,
      reasonReference: freezed == reasonReference
          ? _value._reasonReference
          : reasonReference // ignore: cast_nullable_to_non_nullable
              as List<Reference?>?,
      basedOn: freezed == basedOn
          ? _value._basedOn
          : basedOn // ignore: cast_nullable_to_non_nullable
              as List<Reference?>?,
      groupIdentifier: freezed == groupIdentifier
          ? _value.groupIdentifier
          : groupIdentifier // ignore: cast_nullable_to_non_nullable
              as Identifier?,
      courseOfTherapyType: freezed == courseOfTherapyType
          ? _value.courseOfTherapyType
          : courseOfTherapyType // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      insurance: freezed == insurance
          ? _value._insurance
          : insurance // ignore: cast_nullable_to_non_nullable
              as List<Reference?>?,
      note: freezed == note
          ? _value._note
          : note // ignore: cast_nullable_to_non_nullable
              as List<Annotation?>?,
      dosageInstruction: freezed == dosageInstruction
          ? _value._dosageInstruction
          : dosageInstruction // ignore: cast_nullable_to_non_nullable
              as List<Dosage?>?,
      dispenseRequest: freezed == dispenseRequest
          ? _value.dispenseRequest
          : dispenseRequest // ignore: cast_nullable_to_non_nullable
              as MedicationRequestDispense?,
      substitution: freezed == substitution
          ? _value.substitution
          : substitution // ignore: cast_nullable_to_non_nullable
              as MedicationRequestSubstitution?,
      priorPrescription: freezed == priorPrescription
          ? _value.priorPrescription
          : priorPrescription // ignore: cast_nullable_to_non_nullable
              as Reference?,
      detectedIssue: freezed == detectedIssue
          ? _value._detectedIssue
          : detectedIssue // ignore: cast_nullable_to_non_nullable
              as List<Reference?>?,
      eventHistory: freezed == eventHistory
          ? _value._eventHistory
          : eventHistory // ignore: cast_nullable_to_non_nullable
              as List<Reference?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Medication implements _Medication {
  _$_Medication(
      {@JsonKey(name: 'ID')
          this.id,
      @JsonKey(name: 'Identifier')
          final List<Identifier?>? identifier,
      @JsonKey(name: 'Status', unknownEnumValue: MedicationStatusEnum.inactive)
          this.status,
      @JsonKey(name: 'StatusReason')
          this.statusReason,
      @JsonKey(name: 'Intent', unknownEnumValue: MedicationIntent.proposal)
          this.intent,
      @JsonKey(name: 'Category')
          final List<CodeableConcept?>? category,
      @JsonKey(name: 'Priority', unknownEnumValue: Priority.routine)
          this.priority,
      @JsonKey(name: 'ReportedBoolean')
          this.reportedBoolean,
      @JsonKey(name: 'ReportedReference')
          this.reportedReference,
      @JsonKey(name: 'MedicationCodeableConcept')
          this.medicationCodeableConcept,
      @JsonKey(name: 'MedicationReference')
          this.medicationReference,
      @JsonKey(name: 'Subject')
          this.subject,
      @JsonKey(name: 'Encounter')
          this.encounter,
      @JsonKey(name: 'SupportingInformation')
          final List<Reference?>? supportingInformation,
      @JsonKey(name: 'AuthoredOn')
          this.authoredOn,
      @JsonKey(name: 'Requester')
          this.requester,
      @JsonKey(name: 'Performer')
          this.performer,
      @JsonKey(name: 'PerformerType')
          this.performerType,
      @JsonKey(name: 'Recorder')
          this.recorder,
      @JsonKey(name: 'ReasonReference')
          final List<Reference?>? reasonReference,
      @JsonKey(name: 'BasedOn')
          final List<Reference?>? basedOn,
      @JsonKey(name: 'GroupIdentifier')
          this.groupIdentifier,
      @JsonKey(name: 'CourseOfTherapyType')
          this.courseOfTherapyType,
      @JsonKey(name: 'Insurance')
          final List<Reference?>? insurance,
      @JsonKey(name: 'Note')
          final List<Annotation?>? note,
      @JsonKey(name: 'DosageInstruction')
          final List<Dosage?>? dosageInstruction,
      @JsonKey(name: 'DispenseRequest')
          this.dispenseRequest,
      @JsonKey(name: 'Substitution')
          this.substitution,
      @JsonKey(name: 'PriorPrescription')
          this.priorPrescription,
      @JsonKey(name: 'DetectedIssue')
          final List<Reference?>? detectedIssue,
      @JsonKey(name: 'EventHistory')
          final List<Reference?>? eventHistory})
      : _identifier = identifier,
        _category = category,
        _supportingInformation = supportingInformation,
        _reasonReference = reasonReference,
        _basedOn = basedOn,
        _insurance = insurance,
        _note = note,
        _dosageInstruction = dosageInstruction,
        _detectedIssue = detectedIssue,
        _eventHistory = eventHistory;

  factory _$_Medication.fromJson(Map<String, dynamic> json) =>
      _$$_MedicationFromJson(json);

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
  @JsonKey(name: 'Status', unknownEnumValue: MedicationStatusEnum.inactive)
  final MedicationStatusEnum? status;
  @override
  @JsonKey(name: 'StatusReason')
  final CodeableConcept? statusReason;
  @override
  @JsonKey(name: 'Intent', unknownEnumValue: MedicationIntent.proposal)
  final MedicationIntent? intent;
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
  @JsonKey(name: 'Priority', unknownEnumValue: Priority.routine)
  final Priority? priority;
  @override
  @JsonKey(name: 'ReportedBoolean')
  final bool? reportedBoolean;
  @override
  @JsonKey(name: 'ReportedReference')
  final Reference? reportedReference;
  @override
  @JsonKey(name: 'MedicationCodeableConcept')
  final CodeableConcept? medicationCodeableConcept;
  @override
  @JsonKey(name: 'MedicationReference')
  final Reference? medicationReference;
  @override
  @JsonKey(name: 'Subject')
  final Reference? subject;
  @override
  @JsonKey(name: 'Encounter')
  final Reference? encounter;
  final List<Reference?>? _supportingInformation;
  @override
  @JsonKey(name: 'SupportingInformation')
  List<Reference?>? get supportingInformation {
    final value = _supportingInformation;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'AuthoredOn')
  final String? authoredOn;
  @override
  @JsonKey(name: 'Requester')
  final Reference? requester;
  @override
  @JsonKey(name: 'Performer')
  final Reference? performer;
  @override
  @JsonKey(name: 'PerformerType')
  final CodeableConcept? performerType;
  @override
  @JsonKey(name: 'Recorder')
  final Reference? recorder;
  final List<Reference?>? _reasonReference;
  @override
  @JsonKey(name: 'ReasonReference')
  List<Reference?>? get reasonReference {
    final value = _reasonReference;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Reference?>? _basedOn;
  @override
  @JsonKey(name: 'BasedOn')
  List<Reference?>? get basedOn {
    final value = _basedOn;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'GroupIdentifier')
  final Identifier? groupIdentifier;
  @override
  @JsonKey(name: 'CourseOfTherapyType')
  final CodeableConcept? courseOfTherapyType;
  final List<Reference?>? _insurance;
  @override
  @JsonKey(name: 'Insurance')
  List<Reference?>? get insurance {
    final value = _insurance;
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

  final List<Dosage?>? _dosageInstruction;
  @override
  @JsonKey(name: 'DosageInstruction')
  List<Dosage?>? get dosageInstruction {
    final value = _dosageInstruction;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'DispenseRequest')
  final MedicationRequestDispense? dispenseRequest;
  @override
  @JsonKey(name: 'Substitution')
  final MedicationRequestSubstitution? substitution;
  @override
  @JsonKey(name: 'PriorPrescription')
  final Reference? priorPrescription;
  final List<Reference?>? _detectedIssue;
  @override
  @JsonKey(name: 'DetectedIssue')
  List<Reference?>? get detectedIssue {
    final value = _detectedIssue;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Reference?>? _eventHistory;
  @override
  @JsonKey(name: 'EventHistory')
  List<Reference?>? get eventHistory {
    final value = _eventHistory;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Medication(id: $id, identifier: $identifier, status: $status, statusReason: $statusReason, intent: $intent, category: $category, priority: $priority, reportedBoolean: $reportedBoolean, reportedReference: $reportedReference, medicationCodeableConcept: $medicationCodeableConcept, medicationReference: $medicationReference, subject: $subject, encounter: $encounter, supportingInformation: $supportingInformation, authoredOn: $authoredOn, requester: $requester, performer: $performer, performerType: $performerType, recorder: $recorder, reasonReference: $reasonReference, basedOn: $basedOn, groupIdentifier: $groupIdentifier, courseOfTherapyType: $courseOfTherapyType, insurance: $insurance, note: $note, dosageInstruction: $dosageInstruction, dispenseRequest: $dispenseRequest, substitution: $substitution, priorPrescription: $priorPrescription, detectedIssue: $detectedIssue, eventHistory: $eventHistory)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Medication &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._identifier, _identifier) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.statusReason, statusReason) ||
                other.statusReason == statusReason) &&
            (identical(other.intent, intent) || other.intent == intent) &&
            const DeepCollectionEquality().equals(other._category, _category) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.reportedBoolean, reportedBoolean) ||
                other.reportedBoolean == reportedBoolean) &&
            (identical(other.reportedReference, reportedReference) ||
                other.reportedReference == reportedReference) &&
            (identical(other.medicationCodeableConcept,
                    medicationCodeableConcept) ||
                other.medicationCodeableConcept == medicationCodeableConcept) &&
            (identical(other.medicationReference, medicationReference) ||
                other.medicationReference == medicationReference) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.encounter, encounter) ||
                other.encounter == encounter) &&
            const DeepCollectionEquality()
                .equals(other._supportingInformation, _supportingInformation) &&
            (identical(other.authoredOn, authoredOn) ||
                other.authoredOn == authoredOn) &&
            (identical(other.requester, requester) ||
                other.requester == requester) &&
            (identical(other.performer, performer) ||
                other.performer == performer) &&
            (identical(other.performerType, performerType) ||
                other.performerType == performerType) &&
            (identical(other.recorder, recorder) ||
                other.recorder == recorder) &&
            const DeepCollectionEquality()
                .equals(other._reasonReference, _reasonReference) &&
            const DeepCollectionEquality().equals(other._basedOn, _basedOn) &&
            (identical(other.groupIdentifier, groupIdentifier) ||
                other.groupIdentifier == groupIdentifier) &&
            (identical(other.courseOfTherapyType, courseOfTherapyType) ||
                other.courseOfTherapyType == courseOfTherapyType) &&
            const DeepCollectionEquality()
                .equals(other._insurance, _insurance) &&
            const DeepCollectionEquality().equals(other._note, _note) &&
            const DeepCollectionEquality()
                .equals(other._dosageInstruction, _dosageInstruction) &&
            (identical(other.dispenseRequest, dispenseRequest) ||
                other.dispenseRequest == dispenseRequest) &&
            (identical(other.substitution, substitution) ||
                other.substitution == substitution) &&
            (identical(other.priorPrescription, priorPrescription) ||
                other.priorPrescription == priorPrescription) &&
            const DeepCollectionEquality()
                .equals(other._detectedIssue, _detectedIssue) &&
            const DeepCollectionEquality()
                .equals(other._eventHistory, _eventHistory));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        const DeepCollectionEquality().hash(_identifier),
        status,
        statusReason,
        intent,
        const DeepCollectionEquality().hash(_category),
        priority,
        reportedBoolean,
        reportedReference,
        medicationCodeableConcept,
        medicationReference,
        subject,
        encounter,
        const DeepCollectionEquality().hash(_supportingInformation),
        authoredOn,
        requester,
        performer,
        performerType,
        recorder,
        const DeepCollectionEquality().hash(_reasonReference),
        const DeepCollectionEquality().hash(_basedOn),
        groupIdentifier,
        courseOfTherapyType,
        const DeepCollectionEquality().hash(_insurance),
        const DeepCollectionEquality().hash(_note),
        const DeepCollectionEquality().hash(_dosageInstruction),
        dispenseRequest,
        substitution,
        priorPrescription,
        const DeepCollectionEquality().hash(_detectedIssue),
        const DeepCollectionEquality().hash(_eventHistory)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MedicationCopyWith<_$_Medication> get copyWith =>
      __$$_MedicationCopyWithImpl<_$_Medication>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MedicationToJson(
      this,
    );
  }
}

abstract class _Medication implements Medication {
  factory _Medication(
      {@JsonKey(name: 'ID')
          final String? id,
      @JsonKey(name: 'Identifier')
          final List<Identifier?>? identifier,
      @JsonKey(name: 'Status', unknownEnumValue: MedicationStatusEnum.inactive)
          final MedicationStatusEnum? status,
      @JsonKey(name: 'StatusReason')
          final CodeableConcept? statusReason,
      @JsonKey(name: 'Intent', unknownEnumValue: MedicationIntent.proposal)
          final MedicationIntent? intent,
      @JsonKey(name: 'Category')
          final List<CodeableConcept?>? category,
      @JsonKey(name: 'Priority', unknownEnumValue: Priority.routine)
          final Priority? priority,
      @JsonKey(name: 'ReportedBoolean')
          final bool? reportedBoolean,
      @JsonKey(name: 'ReportedReference')
          final Reference? reportedReference,
      @JsonKey(name: 'MedicationCodeableConcept')
          final CodeableConcept? medicationCodeableConcept,
      @JsonKey(name: 'MedicationReference')
          final Reference? medicationReference,
      @JsonKey(name: 'Subject')
          final Reference? subject,
      @JsonKey(name: 'Encounter')
          final Reference? encounter,
      @JsonKey(name: 'SupportingInformation')
          final List<Reference?>? supportingInformation,
      @JsonKey(name: 'AuthoredOn')
          final String? authoredOn,
      @JsonKey(name: 'Requester')
          final Reference? requester,
      @JsonKey(name: 'Performer')
          final Reference? performer,
      @JsonKey(name: 'PerformerType')
          final CodeableConcept? performerType,
      @JsonKey(name: 'Recorder')
          final Reference? recorder,
      @JsonKey(name: 'ReasonReference')
          final List<Reference?>? reasonReference,
      @JsonKey(name: 'BasedOn')
          final List<Reference?>? basedOn,
      @JsonKey(name: 'GroupIdentifier')
          final Identifier? groupIdentifier,
      @JsonKey(name: 'CourseOfTherapyType')
          final CodeableConcept? courseOfTherapyType,
      @JsonKey(name: 'Insurance')
          final List<Reference?>? insurance,
      @JsonKey(name: 'Note')
          final List<Annotation?>? note,
      @JsonKey(name: 'DosageInstruction')
          final List<Dosage?>? dosageInstruction,
      @JsonKey(name: 'DispenseRequest')
          final MedicationRequestDispense? dispenseRequest,
      @JsonKey(name: 'Substitution')
          final MedicationRequestSubstitution? substitution,
      @JsonKey(name: 'PriorPrescription')
          final Reference? priorPrescription,
      @JsonKey(name: 'DetectedIssue')
          final List<Reference?>? detectedIssue,
      @JsonKey(name: 'EventHistory')
          final List<Reference?>? eventHistory}) = _$_Medication;

  factory _Medication.fromJson(Map<String, dynamic> json) =
      _$_Medication.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id;
  @override
  @JsonKey(name: 'Identifier')
  List<Identifier?>? get identifier;
  @override
  @JsonKey(name: 'Status', unknownEnumValue: MedicationStatusEnum.inactive)
  MedicationStatusEnum? get status;
  @override
  @JsonKey(name: 'StatusReason')
  CodeableConcept? get statusReason;
  @override
  @JsonKey(name: 'Intent', unknownEnumValue: MedicationIntent.proposal)
  MedicationIntent? get intent;
  @override
  @JsonKey(name: 'Category')
  List<CodeableConcept?>? get category;
  @override
  @JsonKey(name: 'Priority', unknownEnumValue: Priority.routine)
  Priority? get priority;
  @override
  @JsonKey(name: 'ReportedBoolean')
  bool? get reportedBoolean;
  @override
  @JsonKey(name: 'ReportedReference')
  Reference? get reportedReference;
  @override
  @JsonKey(name: 'MedicationCodeableConcept')
  CodeableConcept? get medicationCodeableConcept;
  @override
  @JsonKey(name: 'MedicationReference')
  Reference? get medicationReference;
  @override
  @JsonKey(name: 'Subject')
  Reference? get subject;
  @override
  @JsonKey(name: 'Encounter')
  Reference? get encounter;
  @override
  @JsonKey(name: 'SupportingInformation')
  List<Reference?>? get supportingInformation;
  @override
  @JsonKey(name: 'AuthoredOn')
  String? get authoredOn;
  @override
  @JsonKey(name: 'Requester')
  Reference? get requester;
  @override
  @JsonKey(name: 'Performer')
  Reference? get performer;
  @override
  @JsonKey(name: 'PerformerType')
  CodeableConcept? get performerType;
  @override
  @JsonKey(name: 'Recorder')
  Reference? get recorder;
  @override
  @JsonKey(name: 'ReasonReference')
  List<Reference?>? get reasonReference;
  @override
  @JsonKey(name: 'BasedOn')
  List<Reference?>? get basedOn;
  @override
  @JsonKey(name: 'GroupIdentifier')
  Identifier? get groupIdentifier;
  @override
  @JsonKey(name: 'CourseOfTherapyType')
  CodeableConcept? get courseOfTherapyType;
  @override
  @JsonKey(name: 'Insurance')
  List<Reference?>? get insurance;
  @override
  @JsonKey(name: 'Note')
  List<Annotation?>? get note;
  @override
  @JsonKey(name: 'DosageInstruction')
  List<Dosage?>? get dosageInstruction;
  @override
  @JsonKey(name: 'DispenseRequest')
  MedicationRequestDispense? get dispenseRequest;
  @override
  @JsonKey(name: 'Substitution')
  MedicationRequestSubstitution? get substitution;
  @override
  @JsonKey(name: 'PriorPrescription')
  Reference? get priorPrescription;
  @override
  @JsonKey(name: 'DetectedIssue')
  List<Reference?>? get detectedIssue;
  @override
  @JsonKey(name: 'EventHistory')
  List<Reference?>? get eventHistory;
  @override
  @JsonKey(ignore: true)
  _$$_MedicationCopyWith<_$_Medication> get copyWith =>
      throw _privateConstructorUsedError;
}
