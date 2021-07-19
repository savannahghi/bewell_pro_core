// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'medication.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Medication _$MedicationFromJson(Map<String, dynamic> json) {
  return _Medication.fromJson(json);
}

/// @nodoc
class _$MedicationTearOff {
  const _$MedicationTearOff();

  _Medication call(
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
          List<Reference?>? eventHistory}) {
    return _Medication(
      id: id,
      identifier: identifier,
      status: status,
      statusReason: statusReason,
      intent: intent,
      category: category,
      priority: priority,
      reportedBoolean: reportedBoolean,
      reportedReference: reportedReference,
      medicationCodeableConcept: medicationCodeableConcept,
      medicationReference: medicationReference,
      subject: subject,
      encounter: encounter,
      supportingInformation: supportingInformation,
      authoredOn: authoredOn,
      requester: requester,
      performer: performer,
      performerType: performerType,
      recorder: recorder,
      reasonReference: reasonReference,
      basedOn: basedOn,
      groupIdentifier: groupIdentifier,
      courseOfTherapyType: courseOfTherapyType,
      insurance: insurance,
      note: note,
      dosageInstruction: dosageInstruction,
      dispenseRequest: dispenseRequest,
      substitution: substitution,
      priorPrescription: priorPrescription,
      detectedIssue: detectedIssue,
      eventHistory: eventHistory,
    );
  }

  Medication fromJson(Map<String, Object> json) {
    return Medication.fromJson(json);
  }
}

/// @nodoc
const $Medication = _$MedicationTearOff();

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
      _$MedicationCopyWithImpl<$Res>;
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
class _$MedicationCopyWithImpl<$Res> implements $MedicationCopyWith<$Res> {
  _$MedicationCopyWithImpl(this._value, this._then);

  final Medication _value;
  // ignore: unused_field
  final $Res Function(Medication) _then;

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
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      identifier: identifier == freezed
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as List<Identifier?>?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MedicationStatusEnum?,
      statusReason: statusReason == freezed
          ? _value.statusReason
          : statusReason // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      intent: intent == freezed
          ? _value.intent
          : intent // ignore: cast_nullable_to_non_nullable
              as MedicationIntent?,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as List<CodeableConcept?>?,
      priority: priority == freezed
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as Priority?,
      reportedBoolean: reportedBoolean == freezed
          ? _value.reportedBoolean
          : reportedBoolean // ignore: cast_nullable_to_non_nullable
              as bool?,
      reportedReference: reportedReference == freezed
          ? _value.reportedReference
          : reportedReference // ignore: cast_nullable_to_non_nullable
              as Reference?,
      medicationCodeableConcept: medicationCodeableConcept == freezed
          ? _value.medicationCodeableConcept
          : medicationCodeableConcept // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      medicationReference: medicationReference == freezed
          ? _value.medicationReference
          : medicationReference // ignore: cast_nullable_to_non_nullable
              as Reference?,
      subject: subject == freezed
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as Reference?,
      encounter: encounter == freezed
          ? _value.encounter
          : encounter // ignore: cast_nullable_to_non_nullable
              as Reference?,
      supportingInformation: supportingInformation == freezed
          ? _value.supportingInformation
          : supportingInformation // ignore: cast_nullable_to_non_nullable
              as List<Reference?>?,
      authoredOn: authoredOn == freezed
          ? _value.authoredOn
          : authoredOn // ignore: cast_nullable_to_non_nullable
              as String?,
      requester: requester == freezed
          ? _value.requester
          : requester // ignore: cast_nullable_to_non_nullable
              as Reference?,
      performer: performer == freezed
          ? _value.performer
          : performer // ignore: cast_nullable_to_non_nullable
              as Reference?,
      performerType: performerType == freezed
          ? _value.performerType
          : performerType // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      recorder: recorder == freezed
          ? _value.recorder
          : recorder // ignore: cast_nullable_to_non_nullable
              as Reference?,
      reasonReference: reasonReference == freezed
          ? _value.reasonReference
          : reasonReference // ignore: cast_nullable_to_non_nullable
              as List<Reference?>?,
      basedOn: basedOn == freezed
          ? _value.basedOn
          : basedOn // ignore: cast_nullable_to_non_nullable
              as List<Reference?>?,
      groupIdentifier: groupIdentifier == freezed
          ? _value.groupIdentifier
          : groupIdentifier // ignore: cast_nullable_to_non_nullable
              as Identifier?,
      courseOfTherapyType: courseOfTherapyType == freezed
          ? _value.courseOfTherapyType
          : courseOfTherapyType // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      insurance: insurance == freezed
          ? _value.insurance
          : insurance // ignore: cast_nullable_to_non_nullable
              as List<Reference?>?,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as List<Annotation?>?,
      dosageInstruction: dosageInstruction == freezed
          ? _value.dosageInstruction
          : dosageInstruction // ignore: cast_nullable_to_non_nullable
              as List<Dosage?>?,
      dispenseRequest: dispenseRequest == freezed
          ? _value.dispenseRequest
          : dispenseRequest // ignore: cast_nullable_to_non_nullable
              as MedicationRequestDispense?,
      substitution: substitution == freezed
          ? _value.substitution
          : substitution // ignore: cast_nullable_to_non_nullable
              as MedicationRequestSubstitution?,
      priorPrescription: priorPrescription == freezed
          ? _value.priorPrescription
          : priorPrescription // ignore: cast_nullable_to_non_nullable
              as Reference?,
      detectedIssue: detectedIssue == freezed
          ? _value.detectedIssue
          : detectedIssue // ignore: cast_nullable_to_non_nullable
              as List<Reference?>?,
      eventHistory: eventHistory == freezed
          ? _value.eventHistory
          : eventHistory // ignore: cast_nullable_to_non_nullable
              as List<Reference?>?,
    ));
  }

  @override
  $CodeableConceptCopyWith<$Res>? get statusReason {
    if (_value.statusReason == null) {
      return null;
    }

    return $CodeableConceptCopyWith<$Res>(_value.statusReason!, (value) {
      return _then(_value.copyWith(statusReason: value));
    });
  }

  @override
  $ReferenceCopyWith<$Res>? get reportedReference {
    if (_value.reportedReference == null) {
      return null;
    }

    return $ReferenceCopyWith<$Res>(_value.reportedReference!, (value) {
      return _then(_value.copyWith(reportedReference: value));
    });
  }

  @override
  $CodeableConceptCopyWith<$Res>? get medicationCodeableConcept {
    if (_value.medicationCodeableConcept == null) {
      return null;
    }

    return $CodeableConceptCopyWith<$Res>(_value.medicationCodeableConcept!,
        (value) {
      return _then(_value.copyWith(medicationCodeableConcept: value));
    });
  }

  @override
  $ReferenceCopyWith<$Res>? get medicationReference {
    if (_value.medicationReference == null) {
      return null;
    }

    return $ReferenceCopyWith<$Res>(_value.medicationReference!, (value) {
      return _then(_value.copyWith(medicationReference: value));
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
  $ReferenceCopyWith<$Res>? get requester {
    if (_value.requester == null) {
      return null;
    }

    return $ReferenceCopyWith<$Res>(_value.requester!, (value) {
      return _then(_value.copyWith(requester: value));
    });
  }

  @override
  $ReferenceCopyWith<$Res>? get performer {
    if (_value.performer == null) {
      return null;
    }

    return $ReferenceCopyWith<$Res>(_value.performer!, (value) {
      return _then(_value.copyWith(performer: value));
    });
  }

  @override
  $CodeableConceptCopyWith<$Res>? get performerType {
    if (_value.performerType == null) {
      return null;
    }

    return $CodeableConceptCopyWith<$Res>(_value.performerType!, (value) {
      return _then(_value.copyWith(performerType: value));
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
  $IdentifierCopyWith<$Res>? get groupIdentifier {
    if (_value.groupIdentifier == null) {
      return null;
    }

    return $IdentifierCopyWith<$Res>(_value.groupIdentifier!, (value) {
      return _then(_value.copyWith(groupIdentifier: value));
    });
  }

  @override
  $CodeableConceptCopyWith<$Res>? get courseOfTherapyType {
    if (_value.courseOfTherapyType == null) {
      return null;
    }

    return $CodeableConceptCopyWith<$Res>(_value.courseOfTherapyType!, (value) {
      return _then(_value.copyWith(courseOfTherapyType: value));
    });
  }

  @override
  $MedicationRequestDispenseCopyWith<$Res>? get dispenseRequest {
    if (_value.dispenseRequest == null) {
      return null;
    }

    return $MedicationRequestDispenseCopyWith<$Res>(_value.dispenseRequest!,
        (value) {
      return _then(_value.copyWith(dispenseRequest: value));
    });
  }

  @override
  $MedicationRequestSubstitutionCopyWith<$Res>? get substitution {
    if (_value.substitution == null) {
      return null;
    }

    return $MedicationRequestSubstitutionCopyWith<$Res>(_value.substitution!,
        (value) {
      return _then(_value.copyWith(substitution: value));
    });
  }

  @override
  $ReferenceCopyWith<$Res>? get priorPrescription {
    if (_value.priorPrescription == null) {
      return null;
    }

    return $ReferenceCopyWith<$Res>(_value.priorPrescription!, (value) {
      return _then(_value.copyWith(priorPrescription: value));
    });
  }
}

/// @nodoc
abstract class _$MedicationCopyWith<$Res> implements $MedicationCopyWith<$Res> {
  factory _$MedicationCopyWith(
          _Medication value, $Res Function(_Medication) then) =
      __$MedicationCopyWithImpl<$Res>;
  @override
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
class __$MedicationCopyWithImpl<$Res> extends _$MedicationCopyWithImpl<$Res>
    implements _$MedicationCopyWith<$Res> {
  __$MedicationCopyWithImpl(
      _Medication _value, $Res Function(_Medication) _then)
      : super(_value, (v) => _then(v as _Medication));

  @override
  _Medication get _value => super._value as _Medication;

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
    return _then(_Medication(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      identifier: identifier == freezed
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as List<Identifier?>?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MedicationStatusEnum?,
      statusReason: statusReason == freezed
          ? _value.statusReason
          : statusReason // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      intent: intent == freezed
          ? _value.intent
          : intent // ignore: cast_nullable_to_non_nullable
              as MedicationIntent?,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as List<CodeableConcept?>?,
      priority: priority == freezed
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as Priority?,
      reportedBoolean: reportedBoolean == freezed
          ? _value.reportedBoolean
          : reportedBoolean // ignore: cast_nullable_to_non_nullable
              as bool?,
      reportedReference: reportedReference == freezed
          ? _value.reportedReference
          : reportedReference // ignore: cast_nullable_to_non_nullable
              as Reference?,
      medicationCodeableConcept: medicationCodeableConcept == freezed
          ? _value.medicationCodeableConcept
          : medicationCodeableConcept // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      medicationReference: medicationReference == freezed
          ? _value.medicationReference
          : medicationReference // ignore: cast_nullable_to_non_nullable
              as Reference?,
      subject: subject == freezed
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as Reference?,
      encounter: encounter == freezed
          ? _value.encounter
          : encounter // ignore: cast_nullable_to_non_nullable
              as Reference?,
      supportingInformation: supportingInformation == freezed
          ? _value.supportingInformation
          : supportingInformation // ignore: cast_nullable_to_non_nullable
              as List<Reference?>?,
      authoredOn: authoredOn == freezed
          ? _value.authoredOn
          : authoredOn // ignore: cast_nullable_to_non_nullable
              as String?,
      requester: requester == freezed
          ? _value.requester
          : requester // ignore: cast_nullable_to_non_nullable
              as Reference?,
      performer: performer == freezed
          ? _value.performer
          : performer // ignore: cast_nullable_to_non_nullable
              as Reference?,
      performerType: performerType == freezed
          ? _value.performerType
          : performerType // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      recorder: recorder == freezed
          ? _value.recorder
          : recorder // ignore: cast_nullable_to_non_nullable
              as Reference?,
      reasonReference: reasonReference == freezed
          ? _value.reasonReference
          : reasonReference // ignore: cast_nullable_to_non_nullable
              as List<Reference?>?,
      basedOn: basedOn == freezed
          ? _value.basedOn
          : basedOn // ignore: cast_nullable_to_non_nullable
              as List<Reference?>?,
      groupIdentifier: groupIdentifier == freezed
          ? _value.groupIdentifier
          : groupIdentifier // ignore: cast_nullable_to_non_nullable
              as Identifier?,
      courseOfTherapyType: courseOfTherapyType == freezed
          ? _value.courseOfTherapyType
          : courseOfTherapyType // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      insurance: insurance == freezed
          ? _value.insurance
          : insurance // ignore: cast_nullable_to_non_nullable
              as List<Reference?>?,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as List<Annotation?>?,
      dosageInstruction: dosageInstruction == freezed
          ? _value.dosageInstruction
          : dosageInstruction // ignore: cast_nullable_to_non_nullable
              as List<Dosage?>?,
      dispenseRequest: dispenseRequest == freezed
          ? _value.dispenseRequest
          : dispenseRequest // ignore: cast_nullable_to_non_nullable
              as MedicationRequestDispense?,
      substitution: substitution == freezed
          ? _value.substitution
          : substitution // ignore: cast_nullable_to_non_nullable
              as MedicationRequestSubstitution?,
      priorPrescription: priorPrescription == freezed
          ? _value.priorPrescription
          : priorPrescription // ignore: cast_nullable_to_non_nullable
              as Reference?,
      detectedIssue: detectedIssue == freezed
          ? _value.detectedIssue
          : detectedIssue // ignore: cast_nullable_to_non_nullable
              as List<Reference?>?,
      eventHistory: eventHistory == freezed
          ? _value.eventHistory
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
          this.identifier,
      @JsonKey(name: 'Status', unknownEnumValue: MedicationStatusEnum.inactive)
          this.status,
      @JsonKey(name: 'StatusReason')
          this.statusReason,
      @JsonKey(name: 'Intent', unknownEnumValue: MedicationIntent.proposal)
          this.intent,
      @JsonKey(name: 'Category')
          this.category,
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
          this.supportingInformation,
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
          this.reasonReference,
      @JsonKey(name: 'BasedOn')
          this.basedOn,
      @JsonKey(name: 'GroupIdentifier')
          this.groupIdentifier,
      @JsonKey(name: 'CourseOfTherapyType')
          this.courseOfTherapyType,
      @JsonKey(name: 'Insurance')
          this.insurance,
      @JsonKey(name: 'Note')
          this.note,
      @JsonKey(name: 'DosageInstruction')
          this.dosageInstruction,
      @JsonKey(name: 'DispenseRequest')
          this.dispenseRequest,
      @JsonKey(name: 'Substitution')
          this.substitution,
      @JsonKey(name: 'PriorPrescription')
          this.priorPrescription,
      @JsonKey(name: 'DetectedIssue')
          this.detectedIssue,
      @JsonKey(name: 'EventHistory')
          this.eventHistory});

  factory _$_Medication.fromJson(Map<String, dynamic> json) =>
      _$_$_MedicationFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? id;
  @override
  @JsonKey(name: 'Identifier')
  final List<Identifier?>? identifier;
  @override
  @JsonKey(name: 'Status', unknownEnumValue: MedicationStatusEnum.inactive)
  final MedicationStatusEnum? status;
  @override
  @JsonKey(name: 'StatusReason')
  final CodeableConcept? statusReason;
  @override
  @JsonKey(name: 'Intent', unknownEnumValue: MedicationIntent.proposal)
  final MedicationIntent? intent;
  @override
  @JsonKey(name: 'Category')
  final List<CodeableConcept?>? category;
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
  @override
  @JsonKey(name: 'SupportingInformation')
  final List<Reference?>? supportingInformation;
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
  @override
  @JsonKey(name: 'ReasonReference')
  final List<Reference?>? reasonReference;
  @override
  @JsonKey(name: 'BasedOn')
  final List<Reference?>? basedOn;
  @override
  @JsonKey(name: 'GroupIdentifier')
  final Identifier? groupIdentifier;
  @override
  @JsonKey(name: 'CourseOfTherapyType')
  final CodeableConcept? courseOfTherapyType;
  @override
  @JsonKey(name: 'Insurance')
  final List<Reference?>? insurance;
  @override
  @JsonKey(name: 'Note')
  final List<Annotation?>? note;
  @override
  @JsonKey(name: 'DosageInstruction')
  final List<Dosage?>? dosageInstruction;
  @override
  @JsonKey(name: 'DispenseRequest')
  final MedicationRequestDispense? dispenseRequest;
  @override
  @JsonKey(name: 'Substitution')
  final MedicationRequestSubstitution? substitution;
  @override
  @JsonKey(name: 'PriorPrescription')
  final Reference? priorPrescription;
  @override
  @JsonKey(name: 'DetectedIssue')
  final List<Reference?>? detectedIssue;
  @override
  @JsonKey(name: 'EventHistory')
  final List<Reference?>? eventHistory;

  @override
  String toString() {
    return 'Medication(id: $id, identifier: $identifier, status: $status, statusReason: $statusReason, intent: $intent, category: $category, priority: $priority, reportedBoolean: $reportedBoolean, reportedReference: $reportedReference, medicationCodeableConcept: $medicationCodeableConcept, medicationReference: $medicationReference, subject: $subject, encounter: $encounter, supportingInformation: $supportingInformation, authoredOn: $authoredOn, requester: $requester, performer: $performer, performerType: $performerType, recorder: $recorder, reasonReference: $reasonReference, basedOn: $basedOn, groupIdentifier: $groupIdentifier, courseOfTherapyType: $courseOfTherapyType, insurance: $insurance, note: $note, dosageInstruction: $dosageInstruction, dispenseRequest: $dispenseRequest, substitution: $substitution, priorPrescription: $priorPrescription, detectedIssue: $detectedIssue, eventHistory: $eventHistory)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Medication &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.identifier, identifier) ||
                const DeepCollectionEquality()
                    .equals(other.identifier, identifier)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.statusReason, statusReason) ||
                const DeepCollectionEquality()
                    .equals(other.statusReason, statusReason)) &&
            (identical(other.intent, intent) ||
                const DeepCollectionEquality().equals(other.intent, intent)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.priority, priority) ||
                const DeepCollectionEquality()
                    .equals(other.priority, priority)) &&
            (identical(other.reportedBoolean, reportedBoolean) ||
                const DeepCollectionEquality()
                    .equals(other.reportedBoolean, reportedBoolean)) &&
            (identical(other.reportedReference, reportedReference) ||
                const DeepCollectionEquality()
                    .equals(other.reportedReference, reportedReference)) &&
            (identical(other.medicationCodeableConcept, medicationCodeableConcept) ||
                const DeepCollectionEquality().equals(
                    other.medicationCodeableConcept,
                    medicationCodeableConcept)) &&
            (identical(other.medicationReference, medicationReference) ||
                const DeepCollectionEquality()
                    .equals(other.medicationReference, medicationReference)) &&
            (identical(other.subject, subject) ||
                const DeepCollectionEquality()
                    .equals(other.subject, subject)) &&
            (identical(other.encounter, encounter) ||
                const DeepCollectionEquality()
                    .equals(other.encounter, encounter)) &&
            (identical(other.supportingInformation, supportingInformation) ||
                const DeepCollectionEquality().equals(
                    other.supportingInformation, supportingInformation)) &&
            (identical(other.authoredOn, authoredOn) ||
                const DeepCollectionEquality()
                    .equals(other.authoredOn, authoredOn)) &&
            (identical(other.requester, requester) ||
                const DeepCollectionEquality()
                    .equals(other.requester, requester)) &&
            (identical(other.performer, performer) ||
                const DeepCollectionEquality()
                    .equals(other.performer, performer)) &&
            (identical(other.performerType, performerType) ||
                const DeepCollectionEquality()
                    .equals(other.performerType, performerType)) &&
            (identical(other.recorder, recorder) ||
                const DeepCollectionEquality()
                    .equals(other.recorder, recorder)) &&
            (identical(other.reasonReference, reasonReference) ||
                const DeepCollectionEquality().equals(other.reasonReference, reasonReference)) &&
            (identical(other.basedOn, basedOn) || const DeepCollectionEquality().equals(other.basedOn, basedOn)) &&
            (identical(other.groupIdentifier, groupIdentifier) || const DeepCollectionEquality().equals(other.groupIdentifier, groupIdentifier)) &&
            (identical(other.courseOfTherapyType, courseOfTherapyType) || const DeepCollectionEquality().equals(other.courseOfTherapyType, courseOfTherapyType)) &&
            (identical(other.insurance, insurance) || const DeepCollectionEquality().equals(other.insurance, insurance)) &&
            (identical(other.note, note) || const DeepCollectionEquality().equals(other.note, note)) &&
            (identical(other.dosageInstruction, dosageInstruction) || const DeepCollectionEquality().equals(other.dosageInstruction, dosageInstruction)) &&
            (identical(other.dispenseRequest, dispenseRequest) || const DeepCollectionEquality().equals(other.dispenseRequest, dispenseRequest)) &&
            (identical(other.substitution, substitution) || const DeepCollectionEquality().equals(other.substitution, substitution)) &&
            (identical(other.priorPrescription, priorPrescription) || const DeepCollectionEquality().equals(other.priorPrescription, priorPrescription)) &&
            (identical(other.detectedIssue, detectedIssue) || const DeepCollectionEquality().equals(other.detectedIssue, detectedIssue)) &&
            (identical(other.eventHistory, eventHistory) || const DeepCollectionEquality().equals(other.eventHistory, eventHistory)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(identifier) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(statusReason) ^
      const DeepCollectionEquality().hash(intent) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(priority) ^
      const DeepCollectionEquality().hash(reportedBoolean) ^
      const DeepCollectionEquality().hash(reportedReference) ^
      const DeepCollectionEquality().hash(medicationCodeableConcept) ^
      const DeepCollectionEquality().hash(medicationReference) ^
      const DeepCollectionEquality().hash(subject) ^
      const DeepCollectionEquality().hash(encounter) ^
      const DeepCollectionEquality().hash(supportingInformation) ^
      const DeepCollectionEquality().hash(authoredOn) ^
      const DeepCollectionEquality().hash(requester) ^
      const DeepCollectionEquality().hash(performer) ^
      const DeepCollectionEquality().hash(performerType) ^
      const DeepCollectionEquality().hash(recorder) ^
      const DeepCollectionEquality().hash(reasonReference) ^
      const DeepCollectionEquality().hash(basedOn) ^
      const DeepCollectionEquality().hash(groupIdentifier) ^
      const DeepCollectionEquality().hash(courseOfTherapyType) ^
      const DeepCollectionEquality().hash(insurance) ^
      const DeepCollectionEquality().hash(note) ^
      const DeepCollectionEquality().hash(dosageInstruction) ^
      const DeepCollectionEquality().hash(dispenseRequest) ^
      const DeepCollectionEquality().hash(substitution) ^
      const DeepCollectionEquality().hash(priorPrescription) ^
      const DeepCollectionEquality().hash(detectedIssue) ^
      const DeepCollectionEquality().hash(eventHistory);

  @JsonKey(ignore: true)
  @override
  _$MedicationCopyWith<_Medication> get copyWith =>
      __$MedicationCopyWithImpl<_Medication>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MedicationToJson(this);
  }
}

abstract class _Medication implements Medication {
  factory _Medication(
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
          List<Reference?>? eventHistory}) = _$_Medication;

  factory _Medication.fromJson(Map<String, dynamic> json) =
      _$_Medication.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Identifier')
  List<Identifier?>? get identifier => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Status', unknownEnumValue: MedicationStatusEnum.inactive)
  MedicationStatusEnum? get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'StatusReason')
  CodeableConcept? get statusReason => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Intent', unknownEnumValue: MedicationIntent.proposal)
  MedicationIntent? get intent => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Category')
  List<CodeableConcept?>? get category => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Priority', unknownEnumValue: Priority.routine)
  Priority? get priority => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'ReportedBoolean')
  bool? get reportedBoolean => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'ReportedReference')
  Reference? get reportedReference => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'MedicationCodeableConcept')
  CodeableConcept? get medicationCodeableConcept =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'MedicationReference')
  Reference? get medicationReference => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Subject')
  Reference? get subject => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Encounter')
  Reference? get encounter => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'SupportingInformation')
  List<Reference?>? get supportingInformation =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'AuthoredOn')
  String? get authoredOn => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Requester')
  Reference? get requester => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Performer')
  Reference? get performer => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'PerformerType')
  CodeableConcept? get performerType => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Recorder')
  Reference? get recorder => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'ReasonReference')
  List<Reference?>? get reasonReference => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'BasedOn')
  List<Reference?>? get basedOn => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'GroupIdentifier')
  Identifier? get groupIdentifier => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'CourseOfTherapyType')
  CodeableConcept? get courseOfTherapyType =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Insurance')
  List<Reference?>? get insurance => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Note')
  List<Annotation?>? get note => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'DosageInstruction')
  List<Dosage?>? get dosageInstruction => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'DispenseRequest')
  MedicationRequestDispense? get dispenseRequest =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Substitution')
  MedicationRequestSubstitution? get substitution =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'PriorPrescription')
  Reference? get priorPrescription => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'DetectedIssue')
  List<Reference?>? get detectedIssue => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'EventHistory')
  List<Reference?>? get eventHistory => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MedicationCopyWith<_Medication> get copyWith =>
      throw _privateConstructorUsedError;
}
