// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';

// Project imports:
import 'package:bewell_pro_core/domain/clinical/entities/patient_vital.dart';
import 'package:bewell_pro_core/domain/clinical/entities/review_of_system_definition.dart';
import 'package:bewell_pro_core/domain/clinical/entities/review_systems_base.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/asset_strings.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/diagnosis/add_diagnosis_drawer.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/allergies/add_allergy_drawer.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/clinical_exam_forms/review_of_systems_form_builder.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawers/add_blood_pressure_drawer.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawers/add_bmi_reading_drawer.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawers/add_oxygen_saturation_drawer.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawers/add_pulse_reading_drawer.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawers/add_respiratory_rate_drawer.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawers/add_temperature_reading_drawer.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/medications/add_medication_drawer.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/problems/add_problem_drawer.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/treatment_plan/add_test_drawer.dart';

enum NameUse {
  usual,
  official,
  temp,
  nickname,
  anonymous,
  old,
  maiden,
}

enum ContactPointSystem {
  phone,
  fax,
  email,
  pager,
  url,
  sms,
  other,
}

enum ContactPointUse {
  home,
  work,
  temp,
  old,
  mobile,
}

enum AddressUse {
  home,
  work,
  temp,
  old,
  billing,
}

enum AddressType {
  postal,
  physical,
  both,
}

enum CompositionStatusEnum {
  preliminary,
  finall, // this is not a typo. Rather is a fallback to not conflict with dart keyword `final`
  amended,
  entered_in_error,
}

enum CompositionAttesterModeEnum {
  personal,
  professional,
  legal,
  official,
}

enum ComparatorEnum {
  less_than,
  less_than_or_equal_to,
  greater_than_or_equal_to,
  greater_than,
}

enum EpisodeOfCareStatus {
  planned,
  waitList,
  active,
  onHold,
  finished,
  cancelled,
  entered_in_error,
}

// TODO!!(abiud): use freezed enums
extension EpisodeOfCareStatusEx on EpisodeOfCareStatus {
  String get name {
    switch (this) {
      case EpisodeOfCareStatus.planned:
        return 'planned';
      case EpisodeOfCareStatus.waitList:
        return 'waitlist';
      case EpisodeOfCareStatus.active:
        return 'active';
      case EpisodeOfCareStatus.onHold:
        return 'onhold';
      case EpisodeOfCareStatus.finished:
        return 'finished';
      case EpisodeOfCareStatus.cancelled:
        return 'cancelled';
      case EpisodeOfCareStatus.entered_in_error:
        return 'entered_in_error';
    }
  }
}

/// Stores a list of all the vitals we measure on a patient
enum VitalType {
  pulse,
  systolicBloodPressure,
  diastolicBloodPressure,
  respiratoryRate,
  temperature,
  bmi,
  bloodOxygen
}

/// Returns all the values in [VitalType] as strings
extension VitalTypeEx on VitalType {
  /// returns the full known name of [this] vital
  ///
  ///  used in [BeWellVitalCard()]
  String get fullName {
    switch (this) {
      case VitalType.pulse:
        return 'Pulse';

      case VitalType.systolicBloodPressure:
        return 'Blood Pressure';

      case VitalType.diastolicBloodPressure:
        return 'Diastolic Blood Pressure';

      case VitalType.respiratoryRate:
        return 'Respiratory Rate';

      case VitalType.temperature:
        return 'Temperature';

      case VitalType.bmi:
        return 'Height and weight';

      case VitalType.bloodOxygen:
        return 'SPO2';
    }
  }

  /// returns the full clinical name of [this] vital from FHIR
  ///
  ///  used in [BeWellVitalCard()]
  String get clinicalFullName {
    switch (this) {
      case VitalType.pulse:
        return 'Heart Rate';

      case VitalType.systolicBloodPressure:
        return 'Systolic Blood Pressure';

      case VitalType.diastolicBloodPressure:
        return 'Diastolic Blood Pressure';

      case VitalType.respiratoryRate:
        return 'Respiratory Rate';

      case VitalType.temperature:
        return 'Body Temperature';

      case VitalType.bmi:
        return 'Body Mass Index';

      case VitalType.bloodOxygen:
        return 'Oxygen Saturation';
    }
  }

  /// returns the unit of measure of [this] vital
  ///
  /// used in [BeWellVitalCard()]
  String get unit {
    switch (this) {
      case VitalType.pulse:
        return 'BPM';

      case VitalType.systolicBloodPressure:
        return 'mmHg';

      case VitalType.diastolicBloodPressure:
        return 'mmHg';

      case VitalType.respiratoryRate:
        return 'BPM';

      case VitalType.temperature:
        return '°C';

      case VitalType.bmi:
        return 'kg/m2';

      case VitalType.bloodOxygen:
        return '%';
    }
  }

  /// returns the drawer to be opened when the add button of [this]
  /// vital is tapped
  ///
  /// used in [BeWellVitalCard()]
  DrawerType get drawerType {
    switch (this) {
      case VitalType.pulse:
        return DrawerType.pulse;

      case VitalType.systolicBloodPressure:
        return DrawerType.bloodPressure;

      case VitalType.diastolicBloodPressure:
        return DrawerType.bloodPressure;

      case VitalType.respiratoryRate:
        return DrawerType.respiratoryRate;

      case VitalType.temperature:
        return DrawerType.temperature;

      case VitalType.bmi:
        return DrawerType.heightAndWeight;

      case VitalType.bloodOxygen:
        return DrawerType.bloodOxygen;
    }
  }

  /// returns the [BehaviorSubject<PatientVital?>] to be updated/accessed by
  /// [this] vital
  ///
  /// used in [BeWellVitalCard()]
  BehaviorSubject<PatientVital?> get updateBehaviorSubject {
    final AddVitalsObject addVitalsObject = AddVitalsObject();

    switch (this) {
      case VitalType.pulse:
        return addVitalsObject.pulse;

      case VitalType.systolicBloodPressure:
        return addVitalsObject.systolicBloodPressure;

      case VitalType.diastolicBloodPressure:
        return addVitalsObject.diastolicBloodPressure;

      case VitalType.respiratoryRate:
        return addVitalsObject.respiratoryRate;

      case VitalType.temperature:
        return addVitalsObject.temperature;

      case VitalType.bmi:
        return addVitalsObject.bmi;

      case VitalType.bloodOxygen:
        return addVitalsObject.spo2;
    }
  }

  /// returns the image asset url for [this] vital
  ///
  /// used in [BeWellVitalCard()]
  String get iconUrl {
    switch (this) {
      case VitalType.pulse:
        return pulseIconUrl;

      case VitalType.systolicBloodPressure:
        return bloodPressureIconUrl;

      case VitalType.diastolicBloodPressure:
        return bloodPressureIconUrl;

      case VitalType.respiratoryRate:
        return respiratoryRateIcon;

      case VitalType.temperature:
        return temperatureIconUrl;

      case VitalType.bmi:
        return bmiIconUrl;

      case VitalType.bloodOxygen:
        return respiratoryRateIcon;
    }
  }
}

/// a record of all the drawers used in patient exam
enum DrawerType {
  problem,
  condition,
  allergy,
  diagnosis,
  medication,
  test,
  cardiac,
  respiratory,
  review,
  peripheral,
  gastrointestinal,
  urinary,
  neurologic,
  hematologic,
  heent,
  heentTwo,
  gi,
  genitourinary,
  ms,
  skin,
  psychiatric,

  // patient vitals
  pulse,
  bloodPressure,
  respiratoryRate,
  temperature,
  heightAndWeight,
  bloodOxygen,
}

/// returns string values of the [DrawerType] above
extension DrawerTypeEx on DrawerType {
  String get name {
    switch (this) {
      case DrawerType.problem:
        return 'problem';
      case DrawerType.condition:
        return 'condition';
      case DrawerType.allergy:
        return 'allergy';
      case DrawerType.diagnosis:
        return 'diagnosis';
      case DrawerType.medication:
        return 'medication';
      case DrawerType.test:
        return 'test';
      case DrawerType.cardiac:
        return 'cardiac';
      case DrawerType.respiratory:
        return 'respiratory';
      //Review of Systems Drawer
      case DrawerType.review:
        return 'review';
      case DrawerType.peripheral:
        return 'peripheral';
      case DrawerType.gastrointestinal:
        return 'gastrointestinal';
      case DrawerType.urinary:
        return 'urinary';
      case DrawerType.neurologic:
        return 'neurologic';
      case DrawerType.hematologic:
        return 'hematologic';
      case DrawerType.heent:
        return 'heent';
      case DrawerType.heentTwo:
        return 'heenttwo';
      case DrawerType.gi:
        return 'gi';
      case DrawerType.genitourinary:
        return 'gu';
      case DrawerType.ms:
        return 'ms';
      case DrawerType.skin:
        return 'skin';
      case DrawerType.psychiatric:
        return 'psychiatric';

      // Patient vitals drawers
      case DrawerType.pulse:
        return 'pulse';
      case DrawerType.bloodPressure:
        return 'bloodPressure';
      case DrawerType.respiratoryRate:
        return 'respiratoryRate';
      case DrawerType.temperature:
        return 'temperature';
      case DrawerType.heightAndWeight:
        return 'heightAndWeight';
      case DrawerType.bloodOxygen:
        return 'bloodOxygen';
    }
  }
}

/// returns a widget indicating the active drawer based on the string provided
Widget activeDrawer({required String drawer}) {
  switch (drawer) {
    case 'problem':
      return const AddProblem(
        conditionCategory: ConditionCategory.problemListItem,
      );

    case 'condition':
      return const AddProblem(
        conditionCategory: ConditionCategory.encounterDiagnosis,
      );

    case 'allergy':
      return AddAllergy();

    case 'diagnosis':
      return AddDiagnosis();

    case 'medication':
      return AddMedication();

    case 'test':
      return const AddTestDrawer();

    case 'respiratory':
      return const ReviewOfSystemsFormBuilder(
          system: ReviewSystems.respiratory);

    case 'peripheral':
      return const ReviewOfSystemsFormBuilder(system: ReviewSystems.peripheral);

    case 'gastrointestinal':
      return const ReviewOfSystemsFormBuilder(system: ReviewSystems.gastro);

    case 'urinary':
      return const ReviewOfSystemsFormBuilder(system: ReviewSystems.urinary);

    case 'cardiac':
      return const ReviewOfSystemsFormBuilder(system: ReviewSystems.cardiac);

    case 'neurologic':
      return const ReviewOfSystemsFormBuilder(system: ReviewSystems.neurologic);

    case 'hematologic':
      return const ReviewOfSystemsFormBuilder(
          system: ReviewSystems.hematologic);

    case 'gi':
      return const ReviewOfSystemsFormBuilder(system: ReviewSystems.gi);

    case 'gu':
      return const ReviewOfSystemsFormBuilder(
          system: ReviewSystems.genitourinary);

    case 'heent':
      return const ReviewOfSystemsFormBuilder(system: ReviewSystems.heent);

    case 'heenttwo':
      return const ReviewOfSystemsFormBuilder(system: ReviewSystems.heentTwo);

    case 'ms':
      return const ReviewOfSystemsFormBuilder(system: ReviewSystems.ms);

    case 'skin':
      return const ReviewOfSystemsFormBuilder(system: ReviewSystems.skin);

    case 'psychiatric':
      return const ReviewOfSystemsFormBuilder(
          system: ReviewSystems.psychiatric);

    // Patient vitals drawers
    case 'pulse':
      return AddPulseReading();

    case 'bloodPressure':
      return AddBloodPressure();

    case 'respiratoryRate':
      return AddRespiratoryRate();

    case 'temperature':
      return AddTemperature();

    case 'heightAndWeight':
      return AddBMI();

    case 'bloodOxygen':
      return AddOxygenSaturation();
  }
  return const AddProblem(
    conditionCategory: ConditionCategory.problemListItem,
  );
}

enum ReviewSystems {
  respiratory,
  peripheral,
  gastro,
  urinary,
  neurologic,
  hematologic,
  cardiac,
  heent,
  heentTwo,
  gi,
  genitourinary,
  ms,
  skin,
  psychiatric,
}

extension ReviewSystemEx on ReviewSystems {
  /// returns a [ReviewOfSystemItemDefinition] for [this] item. This is useful
  /// when generating the quick access items in review of systems
  ReviewOfSystemItemDefinition get reviewDefinition {
    switch (this) {
      case ReviewSystems.respiratory:
        return ReviewOfSystemItemDefinition(
            reviewName: 'Respiratory', drawerType: DrawerType.respiratory);

      case ReviewSystems.peripheral:
        return ReviewOfSystemItemDefinition(
            reviewName: 'Peripheral Vascular',
            drawerType: DrawerType.peripheral);

      case ReviewSystems.gastro:
        return ReviewOfSystemItemDefinition(
            reviewName: 'Gastrointestinal',
            drawerType: DrawerType.gastrointestinal);

      case ReviewSystems.urinary:
        return ReviewOfSystemItemDefinition(
            reviewName: 'Urinary', drawerType: DrawerType.urinary);

      case ReviewSystems.neurologic:
        return ReviewOfSystemItemDefinition(
            reviewName: 'Neurologic', drawerType: DrawerType.neurologic);

      case ReviewSystems.hematologic:
        return ReviewOfSystemItemDefinition(
            reviewName: 'Hematologic', drawerType: DrawerType.hematologic);

      case ReviewSystems.cardiac:
        return ReviewOfSystemItemDefinition(
            reviewName: 'Cardiac', drawerType: DrawerType.cardiac);

      case ReviewSystems.heent:
        return ReviewOfSystemItemDefinition(
            reviewName: 'HEENT', drawerType: DrawerType.heent);

      case ReviewSystems.heentTwo:
        return ReviewOfSystemItemDefinition(
            reviewName: 'HEENT2', drawerType: DrawerType.heentTwo);

      case ReviewSystems.gi:
        return ReviewOfSystemItemDefinition(
            reviewName: 'GI', drawerType: DrawerType.gi);

      case ReviewSystems.genitourinary:
        return ReviewOfSystemItemDefinition(
            reviewName: 'GU', drawerType: DrawerType.genitourinary);

      case ReviewSystems.ms:
        return ReviewOfSystemItemDefinition(
            reviewName: 'MS', drawerType: DrawerType.ms);

      case ReviewSystems.skin:
        return ReviewOfSystemItemDefinition(
            reviewName: 'Skin', drawerType: DrawerType.skin);

      case ReviewSystems.psychiatric:
        return ReviewOfSystemItemDefinition(
            reviewName: 'Psychiatric', drawerType: DrawerType.psychiatric);
    }
  }

  /// The [systemDataName] is used when deconstructing the system's data in the
  ///  [ReviewOfSystems] widget
  String get systemDataName {
    switch (this) {
      case ReviewSystems.respiratory:
        return 'respiratory';

      case ReviewSystems.peripheral:
        return 'peripheral';

      case ReviewSystems.gastro:
        return 'gastrointestinal';

      case ReviewSystems.urinary:
        return 'urinary';

      case ReviewSystems.neurologic:
        return 'neurologic';

      case ReviewSystems.hematologic:
        return 'hematologic';

      case ReviewSystems.cardiac:
        return 'cardiac';

      case ReviewSystems.heent:
        return 'heent';

      case ReviewSystems.heentTwo:
        return 'heenttwo';

      case ReviewSystems.gi:
        return 'gi';

      case ReviewSystems.genitourinary:
        return 'gu';

      case ReviewSystems.ms:
        return 'ms';

      case ReviewSystems.skin:
        return 'skin';

      case ReviewSystems.psychiatric:
        return 'psychiatric';
    }
  }

  /// [drawerData] is used to provide the system information to the
  /// [ReviewOfSystemsFormBuilder] so that it may decide what UI to render
  ReviewSystemBase? get drawerData {
    switch (this) {
      case ReviewSystems.respiratory:
        return ReviewSystemBase(
          symptoms: ReviewRespiratoryStore().symptoms,
          symptomsMap: ReviewRespiratoryStore().symptomsMap,
          description: ReviewRespiratoryStore().description,
          dataObject: ReviewRespiratoryStore(),
          compositionDataObject: ExamCompositionObject().respiratory,
        );
      case ReviewSystems.peripheral:
        return ReviewSystemBase(
          symptoms: ReviewPeripheralStore().symptoms,
          symptomsMap: ReviewPeripheralStore().symptomsMap,
          description: ReviewPeripheralStore().description,
          dataObject: ReviewPeripheralStore(),
          compositionDataObject: ExamCompositionObject().peripheral,
        );
      case ReviewSystems.gastro:
        return ReviewSystemBase(
          symptoms: ReviewGastroIntestinalStore().symptoms,
          symptomsMap: ReviewGastroIntestinalStore().symptomsMap,
          description: ReviewGastroIntestinalStore().description,
          dataObject: ReviewGastroIntestinalStore(),
          compositionDataObject: ExamCompositionObject().gastrointestinal,
        );
      case ReviewSystems.urinary:
        return ReviewSystemBase(
          symptoms: ReviewUrinaryStore().symptoms,
          symptomsMap: ReviewUrinaryStore().symptomsMap,
          description: ReviewUrinaryStore().description,
          dataObject: ReviewUrinaryStore(),
          compositionDataObject: ExamCompositionObject().urinary,
        );
      case ReviewSystems.neurologic:
        return ReviewSystemBase(
          symptoms: ReviewNeurologicStore().symptoms,
          symptomsMap: ReviewNeurologicStore().symptomsMap,
          description: ReviewNeurologicStore().description,
          dataObject: ReviewNeurologicStore(),
          compositionDataObject: ExamCompositionObject().neurologic,
        );
      case ReviewSystems.hematologic:
        return ReviewSystemBase(
          symptoms: ReviewHematologicStore().symptoms,
          symptomsMap: ReviewHematologicStore().symptomsMap,
          description: ReviewHematologicStore().description,
          dataObject: ReviewHematologicStore(),
          compositionDataObject: ExamCompositionObject().hematologic,
        );
      case ReviewSystems.cardiac:
        return ReviewSystemBase(
          symptoms: ReviewCardiacStore().symptoms,
          symptomsMap: ReviewCardiacStore().symptomsMap,
          description: ReviewCardiacStore().description,
          dataObject: ReviewCardiacStore(),
          compositionDataObject: ExamCompositionObject().cardiac,
        );
      case ReviewSystems.heent:
        return ReviewSystemBase(
          symptoms: HEENTStore().symptoms,
          symptomsMap: HEENTStore().symptomsMap,
          description: HEENTStore().description,
          dataObject: HEENTStore(),
          compositionDataObject: ExamCompositionObject().heent,
        );
      case ReviewSystems.heentTwo:
        return ReviewSystemBase(
          symptoms: HEENTTwoStore().symptoms,
          symptomsMap: HEENTTwoStore().symptomsMap,
          description: HEENTTwoStore().description,
          dataObject: HEENTTwoStore(),
          compositionDataObject: ExamCompositionObject().heentTwo,
        );
      case ReviewSystems.gi:
        return ReviewSystemBase(
          symptoms: GIStore().symptoms,
          symptomsMap: GIStore().symptomsMap,
          description: GIStore().description,
          dataObject: GIStore(),
          compositionDataObject: ExamCompositionObject().gi,
        );
      case ReviewSystems.genitourinary:
        return ReviewSystemBase(
          symptoms: GenitourinaryStore().symptoms,
          symptomsMap: GenitourinaryStore().symptomsMap,
          description: GenitourinaryStore().description,
          dataObject: GenitourinaryStore(),
          compositionDataObject: ExamCompositionObject().gu,
        );
      case ReviewSystems.ms:
        return ReviewSystemBase(
          symptoms: MuscularSkeletalStore().symptoms,
          symptomsMap: MuscularSkeletalStore().symptomsMap,
          description: MuscularSkeletalStore().description,
          dataObject: MuscularSkeletalStore(),
          compositionDataObject: ExamCompositionObject().ms,
        );
      case ReviewSystems.skin:
        return ReviewSystemBase(
          symptoms: ReviewSkinStore().symptoms,
          symptomsMap: ReviewSkinStore().symptomsMap,
          description: ReviewSkinStore().description,
          dataObject: ReviewSkinStore(),
          compositionDataObject: ExamCompositionObject().skin,
        );
      case ReviewSystems.psychiatric:
        return ReviewSystemBase(
          symptoms: ReviewPsychiatricStore().symptoms,
          symptomsMap: ReviewPsychiatricStore().symptomsMap,
          description: ReviewPsychiatricStore().description,
          dataObject: ReviewPsychiatricStore(),
          compositionDataObject: ExamCompositionObject().psychiatric,
        );
    }
  }
}

enum VisitSummaryType {
  allergy,
  composition,
  observation,
  medication,
  condition,
  service
}

enum DocumentType { National_ID, Passport, Alien_ID }

extension DocumentTypeExtension on DocumentType {
  String get name {
    return describeEnum(this).replaceAll('_', ' ');
  }

  String get uploadFormat {
    return describeEnum(this).toLowerCase();
  }
}

enum ImageDocumentType { Profile, IDDocumentFront, IDDocumentBack }

extension ImageDocumentTypeEx on ImageDocumentType {
  String get name {
    switch (this) {
      case ImageDocumentType.Profile:
        return 'profile';

      case ImageDocumentType.IDDocumentFront:
        return 'document-front';

      case ImageDocumentType.IDDocumentBack:
        return 'document-back';
    }
  }
}

enum ImageContentType { PNG, JPG, PDF }

extension ImageContentTypeEx on ImageContentType {
  String toStringShort() {
    return describeEnum(this);
  }
}

enum MaritalStatus {
  Divorced,
  Legally_Separated,
  Married,
  Polygamous,
  Not_Married,
  Domestic_Partner,
  Widowed,
  Unknown,
}

extension MaritalStatusExtension on MaritalStatus {
  String get name {
    return describeEnum(this).replaceAll('_', ' ');
  }

  String get fhirName {
    switch (this) {
      case MaritalStatus.Married:
        return 'M';
      case MaritalStatus.Divorced:
        return 'D';
      case MaritalStatus.Legally_Separated:
        return 'L';
      case MaritalStatus.Polygamous:
        return 'P';
      case MaritalStatus.Not_Married:
        return 'S';
      case MaritalStatus.Domestic_Partner:
        return 'T';
      case MaritalStatus.Widowed:
        return 'W';
      case MaritalStatus.Unknown:
        return 'UNK';
    }
  }
}

enum Language { en, sw }

extension LanguagesEx on Language {
  String toStringShort() {
    return describeEnum(this);
  }
}

enum NextOfKinRelation {
  Emergency_Contact,
  Employer,
  Next_of_Kin,
  Federal_Agency,
  Insurance_Company,
  State_Agency,
  Unknown,
  Other
}

extension NextOfKinEx on NextOfKinRelation {
  String get name {
    return describeEnum(this).replaceAll('_', ' ');
  }

  String get fhirName {
    switch (this) {
      case NextOfKinRelation.Emergency_Contact:
        return 'C';
      case NextOfKinRelation.Employer:
        return 'E';
      case NextOfKinRelation.Next_of_Kin:
        return 'N';
      case NextOfKinRelation.Federal_Agency:
        return 'F';
      case NextOfKinRelation.Insurance_Company:
        return 'I';
      case NextOfKinRelation.State_Agency:
        return 'S';
      case NextOfKinRelation.Unknown:
        return 'U';
      case NextOfKinRelation.Other:
        return 'O';
    }
  }
}

enum AppRequestTypes { POST, GET, PUT, PATCH }

extension AppRequestTypesEx on AppRequestTypes {
  String get name => describeEnum(this).toUpperCase();
}

enum SetPinStatus { IsChangingPin, IsSettingPin, IsResettingPin }

enum SectionType {
  condition,
  allergy,
  test,
  medication,
  diagnosis,

  reviewOfSystem,
  generalExam,
}

/// [SectionTypeEx] extends [SectionType] enum to get the values as
/// strings
extension SectionTypeEx on SectionType {
  String get name {
    switch (this) {
      case SectionType.condition:
        return 'condition';
      case SectionType.allergy:
        return 'allergy';
      case SectionType.test:
        return 'test';
      case SectionType.medication:
        return 'medication';
      case SectionType.diagnosis:
        return 'diagnosis';
      case SectionType.reviewOfSystem:
        return 'review of system';
      case SectionType.generalExam:
        return 'general exam';
    }
  }
}

enum ConceptClass { diagnosis, drug, test }

extension ConceptClassEx on ConceptClass {
  String get name => toBeginningOfSentenceCase(describeEnum(this))!;
}

/// Used to store the type of condition being added.
///
/// Used when adding problems and allergies
///
/// If the category is  `encounter-diagnosis` then the problem/condition
/// is saved as a diagnosis. This will not be displayed in the primary
/// patient banner because it is not a long term condition.
/// It is mainly used when adding a `chief complaint` and `diagnoses`
///
/// If the category is `problem-list-item` then the problem/condition is
/// saved to the patient's primary patient banner and secondary patient banner
/// because it is now marked as a long term condition
enum ConditionCategory { encounterDiagnosis, problemListItem }

extension ConditionCategoryEx on ConditionCategory {
  String get name {
    switch (this) {
      case ConditionCategory.encounterDiagnosis:
        return 'encounter-diagnosis';

      case ConditionCategory.problemListItem:
        return 'problem-list-item';
    }
  }
}

enum TimingRepeatPeriodUnit { s, min, h, d, wk, mo, a }

enum TimingRepeatWhen {
  MORN,
  MORN_early,
  MORN_late,
  NOON,
  AFT,
  AFT_early,
  AFT_late,
  EVE,
  EVE_early,
  EVE_late,
  NIGHT,
  PHS,
  HS,
  WAKE,
  C,
  CM,
  CD,
  CV,
  AC,
  ACM,
  ACD,
  ACV,
  PC,
  PCM,
  PCD,
  PCV
}

enum DayOfWeek { MON, TUE, WED, THUR, FRI, SAT, SUN }

enum TimingCodes { BID, TID, QID, AM, PM, QD, QOD }

enum Priority { routine, urgent, asap }

extension PriorityEx on Priority {
  String get name {
    switch (this) {
      case Priority.routine:
        return 'Routine';

      case Priority.urgent:
        return 'Urgent';

      case Priority.asap:
        return 'As soon as possible';
    }
  }
}

enum MedicationIntent { proposal, plan, original_order }

enum MedicationStatusEnum { active, completed, inactive }

extension MedicationStatusEx on MedicationStatusEnum {
  String get name {
    switch (this) {
      case MedicationStatusEnum.active:
        return 'Active';

      case MedicationStatusEnum.completed:
        return 'Completed';

      case MedicationStatusEnum.inactive:
        return 'Inactive';
    }
  }
}

enum AuthTokenStatus { okay, requiresLogin, requiresPin }
