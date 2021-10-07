// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:bewell_pro_core/domain/clinical/entities/annotation.dart';
import 'package:bewell_pro_core/domain/clinical/entities/codeable_concept.dart';
import 'package:bewell_pro_core/domain/clinical/entities/dosage.dart';
import 'package:bewell_pro_core/domain/clinical/entities/identifier.dart';
import 'package:bewell_pro_core/domain/clinical/entities/medication_request_dispense.dart';
import 'package:bewell_pro_core/domain/clinical/entities/medication_request_substitution.dart';
import 'package:bewell_pro_core/domain/clinical/entities/reference.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';

part 'medication.freezed.dart';
part 'medication.g.dart';

@freezed
class Medication with _$Medication {
  factory Medication({
    @JsonKey(name: 'ID') String? id,
    @JsonKey(name: 'Identifier') List<Identifier?>? identifier,
    @JsonKey(name: 'Status', unknownEnumValue: MedicationStatusEnum.inactive)
        MedicationStatusEnum? status,
    @JsonKey(name: 'StatusReason') CodeableConcept? statusReason,
    @JsonKey(name: 'Intent', unknownEnumValue: MedicationIntent.proposal)
        MedicationIntent? intent,
    @JsonKey(name: 'Category') List<CodeableConcept?>? category,
    @JsonKey(name: 'Priority', unknownEnumValue: Priority.routine)
        Priority? priority,
    @JsonKey(name: 'ReportedBoolean') bool? reportedBoolean,
    @JsonKey(name: 'ReportedReference') Reference? reportedReference,
    @JsonKey(name: 'MedicationCodeableConcept')
        CodeableConcept? medicationCodeableConcept,
    @JsonKey(name: 'MedicationReference') Reference? medicationReference,
    @JsonKey(name: 'Subject') Reference? subject,
    @JsonKey(name: 'Encounter') Reference? encounter,
    @JsonKey(name: 'SupportingInformation')
        List<Reference?>? supportingInformation,
    @JsonKey(name: 'AuthoredOn') String? authoredOn,
    @JsonKey(name: 'Requester') Reference? requester,
    @JsonKey(name: 'Performer') Reference? performer,
    @JsonKey(name: 'PerformerType') CodeableConcept? performerType,
    @JsonKey(name: 'Recorder') Reference? recorder,
    @JsonKey(name: 'ReasonReference') List<Reference?>? reasonReference,
    @JsonKey(name: 'BasedOn') List<Reference?>? basedOn,
    @JsonKey(name: 'GroupIdentifier') Identifier? groupIdentifier,
    @JsonKey(name: 'CourseOfTherapyType') CodeableConcept? courseOfTherapyType,
    @JsonKey(name: 'Insurance') List<Reference?>? insurance,
    @JsonKey(name: 'Note') List<Annotation?>? note,
    @JsonKey(name: 'DosageInstruction') List<Dosage?>? dosageInstruction,
    @JsonKey(name: 'DispenseRequest')
        MedicationRequestDispense? dispenseRequest,
    @JsonKey(name: 'Substitution') MedicationRequestSubstitution? substitution,
    @JsonKey(name: 'PriorPrescription') Reference? priorPrescription,
    @JsonKey(name: 'DetectedIssue') List<Reference?>? detectedIssue,
    @JsonKey(name: 'EventHistory') List<Reference?>? eventHistory,
  }) = _Medication;

  factory Medication.fromJson(Map<String, dynamic> json) =>
      _$MedicationFromJson(json);
}
