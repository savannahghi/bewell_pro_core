import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bewell_pro_core/domain/clinical/entities/allergy_intolerance_relay_edge.dart';
import 'package:bewell_pro_core/domain/clinical/entities/annotation.dart';
import 'package:bewell_pro_core/domain/clinical/entities/codeable_concept.dart';
import 'package:bewell_pro_core/domain/clinical/entities/coding.dart';
import 'package:bewell_pro_core/domain/clinical/entities/condition_edge.dart';
import 'package:bewell_pro_core/domain/clinical/entities/current_episode.dart';
import 'package:bewell_pro_core/domain/clinical/entities/dosage.dart';
import 'package:bewell_pro_core/domain/clinical/entities/medication.dart';
import 'package:bewell_pro_core/domain/clinical/entities/medication_edge.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_connection.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_vital.dart';
import 'package:bewell_pro_core/domain/clinical/entities/reference.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/models/exam_composition.dart';
import 'package:bewell_pro_core/presentation/onboarding/profile/profile_page_items.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';
import 'package:rxdart/rxdart.dart';

class ExamChangeObject {
  factory ExamChangeObject() {
    return _singleton;
  }

  ExamChangeObject._internal();

  /// [generalExamChangeListener ] is used to refresh the UI when there is a
  /// change in the general exam
  BehaviorSubject<bool> generalExamChangeListener =
      BehaviorSubject<bool>.seeded(false);

  /// [onAddAllergyListener] used to notify this widget to refetch allergies after
  /// adding from side-drawer
  BehaviorSubject<bool> onAddAllergyListener =
      BehaviorSubject<bool>.seeded(false);

  /// [onAddMedicationListener] used to listen to changes in add a medication on exam flow causing a reload of test list
  BehaviorSubject<bool> onAddMedicationListener =
      BehaviorSubject<bool>.seeded(false);

  /// [onAddHistoryOfIllnessListener] used when items are changed in patient history stage
  BehaviorSubject<bool> onAddPatientHistoryListener =
      BehaviorSubject<bool>.seeded(false);

  /// [onAddProblemListener] used to listen to changes in add a problem on exam flow causing a reload of problem list
  BehaviorSubject<bool> onAddProblemListener =
      BehaviorSubject<bool>.seeded(false);

  /// [onAddTestListener] used to listen to changes in add a test on exam flow causing a reload of test list
  BehaviorSubject<bool> onAddTestListener = BehaviorSubject<bool>.seeded(false);

  /// [onAddHistoryOfIllnessListener] used when items are changed in patient history stage
  /// adding from side-pane
  BehaviorSubject<bool> onAddVitalListener =
      BehaviorSubject<bool>.seeded(false);

  /// [onAddDiagnosisListener] used when diagnosis is added on exam flow
  BehaviorSubject<bool> onDiagnosisChangeListener =
      BehaviorSubject<bool>.seeded(false);

  /// [reviewOfSystemsChangeListener ] is used to refresh the UI when there is a
  /// change in the review of systems data
  BehaviorSubject<bool> reviewOfSystemsChangeListener =
      BehaviorSubject<bool>.seeded(false);

  static final ExamChangeObject _singleton = ExamChangeObject._internal();
}

class SecondaryBannerChangeObject {
  factory SecondaryBannerChangeObject() {
    return _singleton;
  }

  SecondaryBannerChangeObject._internal();

  BehaviorSubject<bool> conditionsListener =
      BehaviorSubject<bool>.seeded(false);

  BehaviorSubject<bool> allergiesListener = BehaviorSubject<bool>.seeded(false);

  BehaviorSubject<bool> medicationsListener =
      BehaviorSubject<bool>.seeded(false);

  static final SecondaryBannerChangeObject _singleton =
      SecondaryBannerChangeObject._internal();
}

class ExamCompositionObject {
  factory ExamCompositionObject() {
    return _singleton;
  }

  ExamCompositionObject._internal();

  /// ------------------- [common] for all compositions ----------------------

  /// The title of the composition
  BehaviorSubject<CompositionTypeTitle?> compositionTitle =
      BehaviorSubject<CompositionTypeTitle?>();

  /// The date this composition was recorded
  BehaviorSubject<String?> dateRecorded = BehaviorSubject<String?>();

  /// The encounter reference for this patient
  BehaviorSubject<String?> encounterRef = BehaviorSubject<String?>();

  /// The id of the composition
  BehaviorSubject<String?> id = BehaviorSubject<String?>();

  /// The name of the patient which this composition belongs to
  BehaviorSubject<String?> patientName = BehaviorSubject<String?>();

  /// The patent reference of the patient to which this composition is for
  BehaviorSubject<String?> patientRef = BehaviorSubject<String?>();

  /// The doctor who made this composition
  BehaviorSubject<String?> recordingDoctor = BehaviorSubject<String?>();

  /// The composition ID for general exam
  BehaviorSubject<String?> generalCompositionID =
      BehaviorSubject<String?>.seeded('');

  /// [General Examination] data is an encoded Map<String, dynamic> containing
  /// the data from the general exam composition
  BehaviorSubject<String?> generalExamData = BehaviorSubject<String?>();

  /// the composition ID for patient history
  BehaviorSubject<String?> patientHistoryCompositionID =
      BehaviorSubject<String?>();

  /// Contains the patient history data, an encoded Map<String, dynamic>
  ///  containing the data from the patient's history
  BehaviorSubject<String?> patientHistory = BehaviorSubject<String?>();

  /// The composition ID for [Review of systems]
  BehaviorSubject<String?> reviewCompositionID =
      BehaviorSubject<String?>.seeded('');

  /// ------------
  /// These properties hold encoded Maps that contain data for the various
  /// review of system subsystems
  /// ------------

  BehaviorSubject<String?> respiratory = BehaviorSubject<String?>();
  BehaviorSubject<String?> ms = BehaviorSubject<String?>();
  BehaviorSubject<String?> neurologic = BehaviorSubject<String?>();
  BehaviorSubject<String?> cardiac = BehaviorSubject<String?>();
  BehaviorSubject<String?> skin = BehaviorSubject<String?>();
  BehaviorSubject<String?> urinary = BehaviorSubject<String?>();
  BehaviorSubject<String?> gastrointestinal = BehaviorSubject<String?>();
  BehaviorSubject<String?> gi = BehaviorSubject<String?>();
  BehaviorSubject<String?> gu = BehaviorSubject<String?>();
  BehaviorSubject<String?> heent = BehaviorSubject<String?>();
  BehaviorSubject<String?> heentTwo = BehaviorSubject<String?>();
  BehaviorSubject<String?> hematologic = BehaviorSubject<String?>();
  BehaviorSubject<String?> peripheral = BehaviorSubject<String?>();
  BehaviorSubject<String?> psychiatric = BehaviorSubject<String?>();

  static final ExamCompositionObject _singleton =
      ExamCompositionObject._internal();

  Map<String, dynamic> get data => <String, dynamic>{
        'id': this.id.valueOrNull,
        'patientRef': this.patientRef.valueOrNull,
        'patientName': this.patientName.valueOrNull,
        'encounterRef': this.encounterRef.valueOrNull,
        'recordingDoctor': this.recordingDoctor.valueOrNull,
        'dateRecorded': this.dateRecorded.valueOrNull,
        'compositionTitle': this.compositionTitle.valueOrNull?.name,
        'generalExam': this.generalExamData.valueOrNull,
        //review of system
        'patientHistory': this.patientHistory.valueOrNull,
        'respiratory': this.respiratory.valueOrNull,
        'cardiac': this.cardiac.valueOrNull,
        'peripheral': this.peripheral.valueOrNull,
        'gastrointestinal': this.gastrointestinal.valueOrNull,
        'hematologic': this.hematologic.valueOrNull,
        'neurologic': this.neurologic.valueOrNull,
        'urinary': this.urinary.valueOrNull,
        'heent': this.heent.valueOrNull,
        'heenttwo': this.heentTwo.valueOrNull,
        'gi': this.gi.valueOrNull,
        'gu': this.gu.valueOrNull,
        'ms': this.ms.valueOrNull,
        'skin': this.skin.valueOrNull,
        'psychiatric': this.psychiatric.valueOrNull,
      };

  void reset() {
    this.reviewCompositionID.add(null);
  }
}

class AddAllergyObject {
  factory AddAllergyObject() {
    return _singleton;
  }

  AddAllergyObject._internal();

  BehaviorSubject<String?> dateRecorded = BehaviorSubject<String?>();
  BehaviorSubject<String?> description = BehaviorSubject<String?>();
  BehaviorSubject<String?> encounterRef = BehaviorSubject<String?>();
  BehaviorSubject<String?> patientName = BehaviorSubject<String?>();
  BehaviorSubject<String?> patientRef = BehaviorSubject<String?>();
  BehaviorSubject<String?> recordingDoctor = BehaviorSubject<String?>();
  BehaviorSubject<String?> substanceConfirmationStatus =
      BehaviorSubject<String?>();

  BehaviorSubject<String?> substanceDisplayName = BehaviorSubject<String?>();
  BehaviorSubject<String?> substanceID = BehaviorSubject<String?>();
  BehaviorSubject<String?> substanceName = BehaviorSubject<String?>();

  static final AddAllergyObject _singleton = AddAllergyObject._internal();

  Map<String, dynamic> get data => <String, dynamic>{
        'patientRef': this.patientRef.value,
        'patientName': this.patientName.value,
        'encounterRef': this.encounterRef.value,
        'recordingDoctor': this.recordingDoctor.value,
        'dateRecorded': this.dateRecorded.value,
        'substanceName': this.substanceName.value,
        'substanceDisplayName': this.substanceDisplayName.value,
        'substanceID': this.substanceID.value,
        'substanceConfirmationStatus': this.substanceConfirmationStatus.value,
        'description': this.description.value
      };
}

class ReviewCardiacStore {
  factory ReviewCardiacStore() {
    return _singleton;
  }

  ReviewCardiacStore._internal();

  BehaviorSubject<String?> description = BehaviorSubject<String?>();
  List<String> symptoms = <String>[
    'none',
    'Edema',
    'Chest Pain',
    'DOE',
    'Palp',
    'PND',
    'Diaphore'
  ];

  Map<String, bool> symptomsMap = <String, bool>{
    'none': false,
    'Chest Pain': false,
    'DOE': false,
    'PND': false,
    'Palp': false,
    'Edema': false,
    'Diaphore': false,
  };

  static final ReviewCardiacStore _singleton = ReviewCardiacStore._internal();

  Map<String, dynamic> get data => <String, dynamic>{
        'description': this.description.value,
        'symptomNoneKnown': this.symptomsMap['none'] == true ? 'true' : 'false',
        'symptomEdema': this.symptomsMap['Edema'] == true ? 'true' : 'false',
        'symptomChestPain':
            this.symptomsMap['Chest Pain'] == true ? 'true' : 'false',
        'symptomDOE': this.symptomsMap['DOE'] == true ? 'true' : 'false',
        'symptomPalp': this.symptomsMap['Palp'] == true ? 'true' : 'false',
        'symptomPND': this.symptomsMap['PND'] == true ? 'true' : 'false',
        'symptomDiaphore':
            this.symptomsMap['Diaphore'] == true ? 'true' : 'false',
      };
}

class ReviewRespiratoryStore {
  factory ReviewRespiratoryStore() {
    return _singleton;
  }

  ReviewRespiratoryStore._internal();

  BehaviorSubject<String?> description = BehaviorSubject<String?>();

  List<String> symptoms = <String>[
    'none',
    'Cough',
    'Congest',
    'SOB',
    'Haemoptysis'
  ];

  Map<String, bool> symptomsMap = <String, bool>{
    'none': false,
    'Cough': false,
    'Congest': false,
    'SOB': false,
    'Haemoptysis': false,
  };

  static final ReviewRespiratoryStore _singleton =
      ReviewRespiratoryStore._internal();

  Map<String, dynamic> get data => <String, dynamic>{
        'description': this.description.value,
        'symptomNoneKnown': this.symptomsMap['none'] == true ? 'true' : 'false',
        'symptomCough': this.symptomsMap['Cough'] == true ? 'true' : 'false',
        'symptomCongest':
            this.symptomsMap['Congest'] == true ? 'true' : 'false',
        'symptomSOB': this.symptomsMap['SOB'] == true ? 'true' : 'false',
        'symptomHaemoptysis':
            this.symptomsMap['Haemoptysis'] == true ? 'true' : 'false',
      };
}

class ReviewGastroIntestinalStore {
  factory ReviewGastroIntestinalStore() {
    return _singleton;
  }

  ReviewGastroIntestinalStore._internal();

  BehaviorSubject<String?> description = BehaviorSubject<String?>();
  List<String> symptoms = <String>[
    'none',
    'Change of appetite or weight',
    'Problem swallowing',
    'Heartburn',
    'Nausea',
    'Vomiting',
    'Diarrhoea',
    'Vomiting Blood',
    'Constipation',
    'Change in bowel habits',
    'Abdominal pain',
    'Excessive belching',
    'Excessive flatus',
    'Jaundice',
    'Food intolerance',
    'Rectal bleeding/haemorrhoids',
  ];

  Map<String, bool> symptomsMap = <String, bool>{
    'none': false,
    'Change of appetite or weight': false,
    'Problem swallowing': false,
    'Nausea': false,
    'Heartburn': false,
    'Vomiting': false,
    'Vomiting Blood': false,
    'Diarrhoea': false,
    'Constipation': false,
    'Change in bowel habits': false,
    'Abdominal pain': false,
    'Excessive belching': false,
    'Excessive flatus': false,
    'Jaundice': false,
    'Food intolerance': false,
    'Rectal bleeding/haemorrhoids': false,
  };

  static final ReviewGastroIntestinalStore _singleton =
      ReviewGastroIntestinalStore._internal();

  Map<String, dynamic> get data => <String, dynamic>{
        'description': this.description.value,
        'symptomNoneKnown': this.symptomsMap['none'] == true ? 'true' : 'false',
        'symptomAppetiteandWeightChange':
            this.symptomsMap['Change of appetite or weight'] == true
                ? 'true'
                : 'false',
        'symptomProblemsSwallowing':
            this.symptomsMap['Problem swallowing'] == true ? 'true' : 'false',
        'symptomNausea': this.symptomsMap['Nausea'] == true ? 'true' : 'false',
        'symptomHeartburn':
            this.symptomsMap['Heartburn'] == true ? 'true' : 'false',
        'symptomVomiting':
            this.symptomsMap['Vomiting'] == true ? 'true' : 'false',
        'symptomVomitingBlood':
            this.symptomsMap['Vomiting Blood'] == true ? 'true' : 'false',
        'symptomDiarrhoea':
            this.symptomsMap['Diarrhoea'] == true ? 'true' : 'false',
        'symptomConstipation':
            this.symptomsMap['Constipation'] == true ? 'true' : 'false',
        'symptomStoolHabit': this.symptomsMap['Change in bowel habits'] == true
            ? 'true'
            : 'false',
        'symptomAbdominalPain':
            this.symptomsMap['Abdominal pain'] == true ? 'true' : 'false',
        'symptomBelching':
            this.symptomsMap['Excessive belching'] == true ? 'true' : 'false',
        'symptomFlatus':
            this.symptomsMap['Excessive flatus'] == true ? 'true' : 'false',
        'symptomJaundice':
            this.symptomsMap['Jaundice'] == true ? 'true' : 'false',
        'symptomIntolerance':
            this.symptomsMap['Food intolerance'] == true ? 'true' : 'false',
        'symptomBleeding':
            this.symptomsMap['Rectal bleeding/haemorrhoids'] == true
                ? 'true'
                : 'false',
      };
}

class GIStore {
  factory GIStore() {
    return _singleton;
  }

  GIStore._internal();

  BehaviorSubject<String?> description = BehaviorSubject<String?>();
  List<String> symptoms = <String>[
    'none',
    'Anorexia',
    'Heart burn',
    'Abdominal pain',
    'Diarrhoea',
    'Nausea',
    'Vomiting',
    'Dysphagia'
  ];

  Map<String, bool> symptomsMap = <String, bool>{
    'none': false,
    'Anorexia': false,
    'Heart burn': false,
    'Abdominal pain': false,
    'Diarrhoea': false,
    'Nausea': false,
    'Vomiting': false,
    'Dysphagia': false,
  };

  static final GIStore _singleton = GIStore._internal();

  Map<String, dynamic> get data => <String, dynamic>{
        'description': this.description.value,
        'symptomNoneKnown': this.symptomsMap['none'] == true ? 'true' : 'false',
        'symptomAnorexia':
            this.symptomsMap['Anorexia'] == true ? 'true' : 'false',
        'symptomHeartBurn':
            this.symptomsMap['Heart burn'] == true ? 'true' : 'false',
        'symptomAbdominalPain':
            this.symptomsMap['Abdominal pain'] == true ? 'true' : 'false',
        'symptomDiarrhoea':
            this.symptomsMap['Diarrhoea'] == true ? 'true' : 'false',
        'symptomNausea': this.symptomsMap['Nausea'] == true ? 'true' : 'false',
        'symptomVomiting':
            this.symptomsMap['Vomiting'] == true ? 'true' : 'false',
        'symptomDysphagia':
            this.symptomsMap['Dysphagia'] == true ? 'true' : 'false',
      };
}

class GenitourinaryStore {
  factory GenitourinaryStore() {
    return _singleton;
  }

  GenitourinaryStore._internal();

  BehaviorSubject<String?> description = BehaviorSubject<String?>();
  List<String> symptoms = <String>[
    'none',
    'Painful urination',
    'Frequent urination',
    'Prostate problems',
    'Bladder problems',
    'Impotence',
  ];

  Map<String, bool> symptomsMap = <String, bool>{
    'none': false,
    'Painful urination': false,
    'Frequent urination': false,
    'Prostate problems': false,
    'Bladder problems': false,
    'Impotence': false,
  };

  static final GenitourinaryStore _singleton = GenitourinaryStore._internal();

  Map<String, dynamic> get data => <String, dynamic>{
        'description': this.description.value,
        'symptomNoneKnown': this.symptomsMap['none'] == true ? 'true' : 'false',
        'symptomPainfulUrination':
            this.symptomsMap['Painful urination'] == true ? 'true' : 'false',
        'symptomFrequentUrination':
            this.symptomsMap['Frequent urination'] == true ? 'true' : 'false',
        'symptomProstate':
            this.symptomsMap['Prostate problems'] == true ? 'true' : 'false',
        'symptomBladderProblems':
            this.symptomsMap['Bladder problems'] == true ? 'true' : 'false',
        'symptomImpotence':
            this.symptomsMap['Impotence'] == true ? 'true' : 'false',
      };
}

class HEENTTwoStore {
  factory HEENTTwoStore() {
    return _singleton;
  }

  HEENTTwoStore._internal();

  BehaviorSubject<String?> description = BehaviorSubject<String?>();
  List<String> symptoms = <String>[
    'none',
    'Blur vision',
    'Ringing',
    'Deafness',
    'Vertigo',
    'Hoarse voice',
    'Epistaxis',
  ];

  Map<String, bool> symptomsMap = <String, bool>{
    'none': false,
    'Blur vision': false,
    'Ringing': false,
    'Deafness': false,
    'Hoarse voice': false,
    'Vertigo': false,
    'Epistaxis': false,
  };

  static final HEENTTwoStore _singleton = HEENTTwoStore._internal();

  Map<String, dynamic> get data => <String, dynamic>{
        'description': this.description.value,
        'symptomNoneKnown': this.symptomsMap['none'] == true ? 'true' : 'false',
        'symptomBlurVision':
            this.symptomsMap['Blur vision'] == true ? 'true' : 'false',
        'symptomRinging':
            this.symptomsMap['Ringing'] == true ? 'true' : 'false',
        'symptomDeafness':
            this.symptomsMap['Deafness'] == true ? 'true' : 'false',
        'symptomVertigo':
            this.symptomsMap['Vertigo'] == true ? 'true' : 'false',
        'symptomHoarseVoice':
            this.symptomsMap['Hoarse voice'] == true ? 'true' : 'false',
        'symptomEpistaxis':
            this.symptomsMap['Epistaxis'] == true ? 'true' : 'false',
      };
}

class HEENTStore {
  factory HEENTStore() {
    return _singleton;
  }

  HEENTStore._internal();

  BehaviorSubject<String?> description = BehaviorSubject<String?>();
  List<String> symptoms = <String>[
    'none',
    'Vision change',
    'Dizziness',
    'Ear ache',
    'Runny nose',
    'Sore throat',
    'Neck pain',
  ];

  Map<String, bool> symptomsMap = <String, bool>{
    'none': false,
    'Vision change': false,
    'Dizziness': false,
    'Ear ache': false,
    'Sore throat': false,
    'Runny nose': false,
    'Neck pain': false,
  };

  static final HEENTStore _singleton = HEENTStore._internal();

  Map<String, dynamic> get data => <String, dynamic>{
        'description': this.description.value,
        'symptomNoneKnown': this.symptomsMap['none'] == true ? 'true' : 'false',
        'symptomVisionChange':
            this.symptomsMap['Vision change'] == true ? 'true' : 'false',
        'symptomDizziness':
            this.symptomsMap['Dizziness'] == true ? 'true' : 'false',
        'symptomEarAche':
            this.symptomsMap['Ear ache'] == true ? 'true' : 'false',
        'symptomRunnyNose':
            this.symptomsMap['Runny nose'] == true ? 'true' : 'false',
        'symptomSoreThroat':
            this.symptomsMap['Sore throat'] == true ? 'true' : 'false',
        'symptomNeckPain':
            this.symptomsMap['Neck pain'] == true ? 'true' : 'false',
      };
}

class ReviewHematologicStore {
  factory ReviewHematologicStore() {
    return _singleton;
  }

  ReviewHematologicStore._internal();

  BehaviorSubject<String?> description = BehaviorSubject<String?>();
  List<String> symptoms = <String>[
    'none',
    'Anaemia',
    'Easy bruising/bleeding',
    'Past transfusions'
  ];

  Map<String, bool> symptomsMap = <String, bool>{
    'none': false,
    'Anaemia': false,
    'Easy bruising/bleeding': false,
    'Past transfusions': false,
  };

  static final ReviewHematologicStore _singleton =
      ReviewHematologicStore._internal();

  Map<String, dynamic> get data => <String, dynamic>{
        'description': this.description.value,
        'symptomNoneKnown': this.symptomsMap['none'] == true ? 'true' : 'false',
        'symptomAnemia': this.symptomsMap['Anaemia'] == true ? 'true' : 'false',
        'symptomBleeding': this.symptomsMap['Easy bruising/bleeding'] == true
            ? 'true'
            : 'false',
        'symptomTransfusion':
            this.symptomsMap['Past transfusions'] == true ? 'true' : 'false',
      };
}

class MuscularSkeletalStore {
  factory MuscularSkeletalStore() {
    return _singleton;
  }

  MuscularSkeletalStore._internal();

  BehaviorSubject<String?> description = BehaviorSubject<String?>();
  List<String> symptoms = <String>[
    'none',
    'Myalgia',
    'Back pain',
    'Injury',
    'Joint pain',
    'Shoulder pain',
    'Weakness',
    'Joint swell',
  ];

  Map<String, bool> symptomsMap = <String, bool>{
    'none': false,
    'Myalgia': false,
    'Backpain': false,
    'Injury': false,
    'Shoulder pain': false,
    'Joint pain': false,
    'Weakness': false,
    'Joint swell': false,
  };

  static final MuscularSkeletalStore _singleton =
      MuscularSkeletalStore._internal();

  Map<String, dynamic> get data => <String, dynamic>{
        'description': this.description.value,
        'symptomNoneKnown': this.symptomsMap['none'] == true ? 'true' : 'false',
        'symptomMyalgia':
            this.symptomsMap['Myalgia'] == true ? 'true' : 'false',
        'symptomBackPain':
            this.symptomsMap['Backpain'] == true ? 'true' : 'false',
        'symptomInjury': this.symptomsMap['Injury'] == true ? 'true' : 'false',
        'symptomJointPain':
            this.symptomsMap['Joint pain'] == true ? 'true' : 'false',
        'symptomShoulderPain':
            this.symptomsMap['Shoulder pain'] == true ? 'true' : 'false',
        'symptomJointSwell':
            this.symptomsMap['Joint swell'] == true ? 'true' : 'false',
        'symptomWeakness':
            this.symptomsMap['Weakness'] == true ? 'true' : 'false',
      };
}

class ReviewNeurologicStore {
  factory ReviewNeurologicStore() {
    return _singleton;
  }

  ReviewNeurologicStore._internal();

  BehaviorSubject<String?> description = BehaviorSubject<String?>();
  List<String> symptoms = <String>[
    'none',
    'Headaches',
    'Seizures',
    'Paralysis',
    'Weakness',
    'Loss of consciousness/Fainting',
    'Muscle spasm',
    'Involuntary movement',
    'Incoordination',
    'Loss of muscle size',
    'Numbness',
    'Feeling of "pins and needles"/tingles',
    'Tremor'
  ];

  Map<String, bool> symptomsMap = <String, bool>{
    'none': false,
    'Headaches': false,
    'Seizures': false,
    'Loss of consciousness/Fainting': false,
    'Paralysis': false,
    'Weakness': false,
    'Loss of muscle size': false,
    'Muscle spasm': false,
    'Tremor': false,
    'Involuntary movement': false,
    'Incoordination': false,
    'Numbness': false,
    'Feeling of "pins and needles"/tingles': false,
  };

  static final ReviewNeurologicStore _singleton =
      ReviewNeurologicStore._internal();

  Map<String, dynamic> get data => <String, dynamic>{
        'description': this.description.value,
        'symptomNoneKnown': this.symptomsMap['none'] == true ? 'true' : 'false',
        'symptomHeadache':
            this.symptomsMap['Headaches'] == true ? 'true' : 'false',
        'symptomSeizures':
            this.symptomsMap['Seizures'] == true ? 'true' : 'false',
        'symptomParalysis':
            this.symptomsMap['Paralysis'] == true ? 'true' : 'false',
        'symptomWeakness':
            this.symptomsMap['Weakness'] == true ? 'true' : 'false',
        'symptomLossofMuscle':
            this.symptomsMap['Loss of muscle size'] == true ? 'true' : 'false',
        'symptomMuscleSpasm':
            this.symptomsMap['Muscle spasm'] == true ? 'true' : 'false',
        'symptomTremor': this.symptomsMap['Tremor'] == true ? 'true' : 'false',
        'symptomInvoluntaryMovement':
            this.symptomsMap['Involuntary movement'] == true ? 'true' : 'false',
        'symptomIncoordination':
            this.symptomsMap['Incoordination'] == true ? 'true' : 'false',
        'symptomFainting':
            this.symptomsMap['Loss of consciousness/Fainting'] == true
                ? 'true'
                : 'false',
        'symptomNumbness':
            this.symptomsMap['Numbness'] == true ? 'true' : 'false',
        'symptomTingles':
            this.symptomsMap['Feeling of "pins and needles"/tingles'] == true
                ? 'true'
                : 'false',
      };
}

class ReviewPeripheralStore {
  factory ReviewPeripheralStore() {
    return _singleton;
  }

  ReviewPeripheralStore._internal();

  BehaviorSubject<String?> description = BehaviorSubject<String?>();
  List<String> symptoms = <String>[
    'none',
    'Leg cramps',
    'Varicose veins',
    'Clots in veins'
  ];

  Map<String, bool> symptomsMap = <String, bool>{
    'none': false,
    'Leg cramps': false,
    'Varicose veins': false,
    'Clots in veins': false,
  };

  static final ReviewPeripheralStore _singleton =
      ReviewPeripheralStore._internal();

  Map<String, dynamic> get data => <String, dynamic>{
        'description': this.description.value,
        'symptomNoneKnown': this.symptomsMap['none'] == true ? 'true' : 'false',
        'symptomLegCramp':
            this.symptomsMap['Leg cramps'] == true ? 'true' : 'false',
        'symptomVaricose':
            this.symptomsMap['Varicose veins'] == true ? 'true' : 'false',
        'symptomClot':
            this.symptomsMap['Clots in veins'] == true ? 'true' : 'false',
      };
}

class ReviewPsychiatricStore {
  factory ReviewPsychiatricStore() {
    return _singleton;
  }

  ReviewPsychiatricStore._internal();

  BehaviorSubject<String?> description = BehaviorSubject<String?>();

  List<String> symptoms = <String>[
    'none',
    'Anxiety',
    'Depression',
    'Insomnia',
    'Hallucination',
    'Agitation',
    'Disorientation',
  ];

  Map<String, bool> symptomsMap = <String, bool>{
    'none': false,
    'Anxiety': false,
    'Depression': false,
    'Insomnia': false,
    'Agitation': false,
    'Hallucination': false,
    'Disorientation': false,
  };

  static final ReviewPsychiatricStore _singleton =
      ReviewPsychiatricStore._internal();

  Map<String, dynamic> get data => <String, dynamic>{
        'description': this.description.value,
        'symptomNoneKnown': this.symptomsMap['none'] == true ? 'true' : 'false',
        'symptomAnxiety':
            this.symptomsMap['Anxiety'] == true ? 'true' : 'false',
        'symptomDepression':
            this.symptomsMap['Depression'] == true ? 'true' : 'false',
        'symptomInsomnia':
            this.symptomsMap['Insomnia'] == true ? 'true' : 'false',
        'symptomHallucination':
            this.symptomsMap['Hallucination'] == true ? 'true' : 'false',
        'symptomAgitation':
            this.symptomsMap['Agitation'] == true ? 'true' : 'false',
        'symptomDisorientation':
            this.symptomsMap['Disorientation'] == true ? 'true' : 'false',
      };
}

class ReviewSkinStore {
  factory ReviewSkinStore() {
    return _singleton;
  }

  ReviewSkinStore._internal();

  BehaviorSubject<String?> description = BehaviorSubject<String?>();
  List<String> symptoms = <String>[
    'none',
    'Anemia',
    'Adenopathy',
    'Rash',
    'Bruising',
    'Leg ulcer',
    'Itching',
  ];

  Map<String, bool> symptomsMap = <String, bool>{
    'none': false,
    'Anemia': false,
    'Adenopathy': false,
    'Rash': false,
    'Leg ulcer': false,
    'Bruising': false,
    'Itching': false,
  };

  static final ReviewSkinStore _singleton = ReviewSkinStore._internal();

  Map<String, dynamic> get data => <String, dynamic>{
        'description': this.description.value,
        'symptomNoneKnown': this.symptomsMap['none'] == true ? 'true' : 'false',
        'symptomAnemia': this.symptomsMap['Anemia'] == true ? 'true' : 'false',
        'symptomAdenopathy':
            this.symptomsMap['Adenopathy'] == true ? 'true' : 'false',
        'symptomRash': this.symptomsMap['Rash'] == true ? 'true' : 'false',
        'symptomBruising':
            this.symptomsMap['Bruising'] == true ? 'true' : 'false',
        'symptomLegUlcer':
            this.symptomsMap['Leg ulcer'] == true ? 'true' : 'false',
        'symptomItching':
            this.symptomsMap['Itching'] == true ? 'true' : 'false',
      };
}

class ReviewUrinaryStore {
  factory ReviewUrinaryStore() {
    return _singleton;
  }

  ReviewUrinaryStore._internal();

  BehaviorSubject<String?> description = BehaviorSubject<String?>();
  List<String> symptoms = <String>[
    'none',
    'Difficulty in urination',
    'Pain or burning in urination',
    'Frequent urination at night',
    'Urgent need to urinate',
    'Incontinence of urine',
    'Dribbling',
    'Decreased urine stream',
    'Blood in urine',
    'UTI/stones/prostate infection'
  ];

  Map<String, bool> symptomsMap = <String, bool>{
    'none': false,
    'Difficulty in urination': false,
    'Pain or burning in urination': false,
    'Frequent urination at night': false,
    'Urgent need to urinate': false,
    'Incontinence of urine': false,
    'Dribbling': false,
    'Decreased urine stream': false,
    'Blood in urine': false,
    'UTI/stones/prostate infection': false,
  };

  static final ReviewUrinaryStore _singleton = ReviewUrinaryStore._internal();

  Map<String, dynamic> get data => <String, dynamic>{
        'description': this.description.value,
        'symptomNoneKnown': this.symptomsMap['none'] == true ? 'true' : 'false',
        'symptomDifficultUrination':
            this.symptomsMap['Difficulty in urination'] == true
                ? 'true'
                : 'false',
        'symptomBurningUrination':
            this.symptomsMap['Pain or burning in urination'] == true
                ? 'true'
                : 'false',
        'symptomFrequentUrinationAtNight':
            this.symptomsMap['Frequent urination at night'] == true
                ? 'true'
                : 'false',
        'symptomUrgentUrination':
            this.symptomsMap['Urgent need to urinate'] == true
                ? 'true'
                : 'false',
        'symptomIncontinenceUrine':
            this.symptomsMap['Incontinence of urine'] == true
                ? 'true'
                : 'false',
        'symptomDribbling':
            this.symptomsMap['Dribbling'] == true ? 'true' : 'false',
        'symptomDecreaseStream':
            this.symptomsMap['Decreased urine stream'] == true
                ? 'true'
                : 'false',
        'symptomUrineBlood':
            this.symptomsMap['Blood in urine'] == true ? 'true' : 'false',
        'symptomInfection':
            this.symptomsMap['UTI/stones/prostate infection'] == true
                ? 'true'
                : 'false',
      };
}

class ViewSummaryStore {
  factory ViewSummaryStore() {
    return _singleton;
  }

  ViewSummaryStore._internal();

  final BehaviorSubject<bool> viewSummaryButton =
      BehaviorSubject<bool>.seeded(false);

  static final ViewSummaryStore _singleton = ViewSummaryStore._internal();
}

class AddBloodPressureObject {
  factory AddBloodPressureObject() {
    return _singleton;
  }

  AddBloodPressureObject._internal();

  BehaviorSubject<String?> dateRecorded = BehaviorSubject<String?>();
  BehaviorSubject<String?> diastole = BehaviorSubject<String?>();
  BehaviorSubject<String?> encounterRef = BehaviorSubject<String?>();
  BehaviorSubject<String?> evaluatedReading = BehaviorSubject<String?>();
  BehaviorSubject<String?> interpretation = BehaviorSubject<String?>();
  BehaviorSubject<String?> patientName = BehaviorSubject<String?>();
  BehaviorSubject<String?> patientRef = BehaviorSubject<String?>();
  BehaviorSubject<String?> systole = BehaviorSubject<String?>();

  static final AddBloodPressureObject _singleton =
      AddBloodPressureObject._internal();

  Map<String, dynamic> get data => <String, dynamic>{
        'patientRef': this.patientRef.value,
        'patientName': this.patientName.value,
        'evaluatedReading': this.evaluatedReading.value,
        'encounterRef': this.encounterRef.value,
        'dateRecorded': this.dateRecorded.value,
        'systole': this.systole.value,
        'diastole': this.diastole.value,
        'interpretationCode': this.interpretation.valueOrNull,
      };

  String? get evaluatedBloodPressure {
    if (this.systole.valueOrNull == null && this.diastole.valueOrNull == null) {
      return '';
    }
    return '${this.systole.valueOrNull} /'
        ' ${this.diastole.valueOrNull}';
  }

  // resets selected members of this class
  void reset() {
    this
      ..systole.add('')
      ..evaluatedReading.add('')
      ..diastole.add('')
      ..dateRecorded.add('');
  }
}

class AddBMIObject {
  factory AddBMIObject() {
    return _singleton;
  }

  AddBMIObject._internal();

  BehaviorSubject<String?> bmi = BehaviorSubject<String?>();
  BehaviorSubject<String?> dateRecorded = BehaviorSubject<String?>();
  BehaviorSubject<String?> encounterRef = BehaviorSubject<String?>();
  BehaviorSubject<String?> evaluatedReading = BehaviorSubject<String?>();
  BehaviorSubject<String?> height = BehaviorSubject<String?>();
  BehaviorSubject<double> heightInCm = BehaviorSubject<double>();
  BehaviorSubject<String?> interpretation = BehaviorSubject<String?>();
  BehaviorSubject<String?> interpretationCode = BehaviorSubject<String?>();
  BehaviorSubject<String?> patientName = BehaviorSubject<String?>();
  BehaviorSubject<String?> patientRef = BehaviorSubject<String?>();
  BehaviorSubject<String?> weight = BehaviorSubject<String?>();

  static final AddBMIObject _singleton = AddBMIObject._internal();

  Map<String, dynamic> get data => <String, dynamic>{
        'patientRef': this.patientRef.value,
        'patientName': this.patientName.value,
        'encounterRef': this.encounterRef.value,
        'dateRecorded': this.dateRecorded.value,
        'heightInCm': this.heightInCm.value,
        'weight': this.weight.value,
        'bmi': this.bmi.value,
        'interpretation': this.interpretation.valueOrNull,
        'interpretationCode': this.interpretationCode.valueOrNull,
        'evaluatedReading': this.evaluatedReading.value,
      };

  void reset() {
    this.height.add('');
    this.weight.add('');
    this.evaluatedReading.add('');
    this.bmi.add('');
  }

  void calculateBMI() {
    final double weight = double.tryParse(this.weight.value!)!;

    final double heightInm = double.tryParse(this.height.value!)! / 100;

    final double bmi = weight / (heightInm * heightInm);

    this..heightInCm.add(heightInm * 100)..bmi.add(bmi.toStringAsFixed(1));
  }
}

class AddOxygenSaturationObject {
  factory AddOxygenSaturationObject() {
    return _singleton;
  }

  AddOxygenSaturationObject._internal();

  BehaviorSubject<String?> dateRecorded = BehaviorSubject<String?>();
  BehaviorSubject<String?> encounterRef = BehaviorSubject<String?>();
  BehaviorSubject<String?> evaluatedReading = BehaviorSubject<String?>();
  BehaviorSubject<String?> oxygenSaturation = BehaviorSubject<String?>();
  BehaviorSubject<String?> patientName = BehaviorSubject<String?>();
  BehaviorSubject<String?> patientRef = BehaviorSubject<String?>();

  static final AddOxygenSaturationObject _singleton =
      AddOxygenSaturationObject._internal();

  Map<String, dynamic> get data => <String, dynamic>{
        'patientRef': this.patientRef.value,
        'patientName': this.patientName.value,
        'encounterRef': this.encounterRef.value,
        'dateRecorded': this.dateRecorded.value,
        'oxygenSaturation': this.oxygenSaturation.value,
        'evaluatedReading': this.evaluatedReading.value,
      };

  void reset() {
    this.evaluatedReading.add('');
    this.oxygenSaturation.add('');
    this.evaluatedReading.add('');
  }
}

class AddPulseObject {
  factory AddPulseObject() {
    return _singleton;
  }

  AddPulseObject._internal();

  BehaviorSubject<String?> dateRecorded = BehaviorSubject<String?>();
  BehaviorSubject<String?> encounterRef = BehaviorSubject<String?>();
  BehaviorSubject<String?> evaluatedReading = BehaviorSubject<String?>();
  BehaviorSubject<String?> interpretation = BehaviorSubject<String?>();
  BehaviorSubject<String?> patientName = BehaviorSubject<String?>();
  BehaviorSubject<String?> patientRef = BehaviorSubject<String?>();
  BehaviorSubject<String?> selectedReading = BehaviorSubject<String?>();

  static final AddPulseObject _singleton = AddPulseObject._internal();

  Map<String, dynamic> get data => <String, dynamic>{
        'patientRef': this.patientRef.value,
        'patientName': this.patientName.value,
        'encounterRef': this.encounterRef.value,
        'dateRecorded': this.dateRecorded.value,
        'evaluatedReading': this.evaluatedReading.value,
        'selectedReading': this.selectedReading.value,
        'interpretation': this.interpretation.valueOrNull,
      };

  void reset() {
    this
      ..evaluatedReading.add('')
      ..selectedReading.add('')
      ..evaluatedReading.add('');
  }
}

class AddRespiratoryRateObject {
  factory AddRespiratoryRateObject() {
    return _singleton;
  }

  AddRespiratoryRateObject._internal();

  BehaviorSubject<String?> dateRecorded = BehaviorSubject<String?>();
  BehaviorSubject<String?> encounterRef = BehaviorSubject<String?>();
  BehaviorSubject<String?> evaluatedReading = BehaviorSubject<String?>();
  BehaviorSubject<String?> patientName = BehaviorSubject<String?>();
  BehaviorSubject<String?> patientRef = BehaviorSubject<String?>();
  BehaviorSubject<dynamic> selectedReading = BehaviorSubject<dynamic>();

  static final AddRespiratoryRateObject _singleton =
      AddRespiratoryRateObject._internal();

  Map<String, dynamic> get data => <String, dynamic>{
        'patientRef': this.patientRef.value,
        'patientName': this.patientName.value,
        'encounterRef': this.encounterRef.value,
        'dateRecorded': this.dateRecorded.value,
        'selectedReading': this.selectedReading.value,
        'evaluatedReading': this.evaluatedReading.value,
      };

  void reset() {
    this
      ..evaluatedReading.add('')
      ..selectedReading.add('')
      ..evaluatedReading.add('');
  }
}

class AddTemperatureReadingObject {
  factory AddTemperatureReadingObject() {
    return _singleton;
  }

  AddTemperatureReadingObject._internal();

  BehaviorSubject<String?> dateRecorded = BehaviorSubject<String?>();
  BehaviorSubject<String?> encounterRef = BehaviorSubject<String?>();
  BehaviorSubject<String?> evaluatedReading = BehaviorSubject<String?>();
  BehaviorSubject<String?> interpretation = BehaviorSubject<String?>();
  BehaviorSubject<String?> patientName = BehaviorSubject<String?>();
  BehaviorSubject<String?> patientRef = BehaviorSubject<String?>();
  BehaviorSubject<String?> selectedReading = BehaviorSubject<String?>();

  static final AddTemperatureReadingObject _singleton =
      AddTemperatureReadingObject._internal();

  Map<String, dynamic> get data => <String, dynamic>{
        'patientRef': this.patientRef.value,
        'patientName': this.patientName.value,
        'encounterRef': this.encounterRef.value,
        'dateRecorded': this.dateRecorded.value,
        'selectedReading': this.selectedReading.value,
        'evaluatedReading': this.evaluatedReading.value,
        'interpretation': this.evaluatedReading.value,
      };

  void reset() {
    this.selectedReading.add('');
    this.evaluatedReading.add('');
    this.interpretation.add('');
  }
}

class AddMedicationObject {
  factory AddMedicationObject() {
    return _singleton;
  }

  AddMedicationObject._internal();

  BehaviorSubject<String?> administerAtFrequency = BehaviorSubject<String?>();
  BehaviorSubject<String?> administerAtTime = BehaviorSubject<String?>();
  BehaviorSubject<String?> administrationInstructions =
      BehaviorSubject<String?>();

  BehaviorSubject<String?> asDirected = BehaviorSubject<String?>();
  BehaviorSubject<String?> asNeeded = BehaviorSubject<String?>();
  BehaviorSubject<String?> dateRecorded = BehaviorSubject<String?>();
  BehaviorSubject<String?> diagnosisID = BehaviorSubject<String?>();
  BehaviorSubject<String?> diagnosisName = BehaviorSubject<String?>();
  BehaviorSubject<String?> dispensingInstructions = BehaviorSubject<String?>();
  BehaviorSubject<String?> doseSig = BehaviorSubject<String?>();
  BehaviorSubject<String?> doseUnit = BehaviorSubject<String?>();
  BehaviorSubject<String?> drugName = BehaviorSubject<String?>();
  BehaviorSubject<String?> encounterRef = BehaviorSubject<String?>();
  BehaviorSubject<String?> forDuration = BehaviorSubject<String?>();
  BehaviorSubject<String?> forValue = BehaviorSubject<String?>();
  BehaviorSubject<String?> medicationDisplayName = BehaviorSubject<String?>();
  BehaviorSubject<String?> medicationID = BehaviorSubject<String?>();
  BehaviorSubject<String?> medicationName = BehaviorSubject<String?>();
  BehaviorSubject<String?> note = BehaviorSubject<String?>();
  BehaviorSubject<String?> patientInstructions = BehaviorSubject<String?>();
  BehaviorSubject<String?> patientName = BehaviorSubject<String?>();
  // Drug name and dose unit
  BehaviorSubject<String?> patientRef = BehaviorSubject<String?>();

  BehaviorSubject<String?> recordingDoctor = BehaviorSubject<String?>();
  BehaviorSubject<String?> refill = BehaviorSubject<String?>();
  BehaviorSubject<String?> route = BehaviorSubject<String?>();
  BehaviorSubject<String?> rx = BehaviorSubject<String?>();
  BehaviorSubject<String?> start = BehaviorSubject<String?>();
  BehaviorSubject<String?> stop = BehaviorSubject<String?>();
  BehaviorSubject<String?> takeEvery = BehaviorSubject<String?>();
  BehaviorSubject<String?> takeEveryFrequency = BehaviorSubject<String?>();

  static final AddMedicationObject _singleton = AddMedicationObject._internal();

  Map<String, dynamic> addMedicationVariables() {
    final Medication _medicationObject = Medication(
      status: MedicationStatusEnum.active, // Suspect: converting to string
      intent: MedicationIntent.proposal,
      priority: Priority.routine,
      subject: Reference(
        display: this.patientName.valueOrNull,
        type: 'Patient',
        reference: this.patientRef.valueOrNull,
      ),
      encounter: Reference(
          reference: this.encounterRef.valueOrNull,
          type: 'Encounter',
          display: 'Encounter'),
      supportingInformation: <Reference>[
        Reference(
            id: this.diagnosisID.valueOrNull,
            reference: this.encounterRef.valueOrNull,
            display: this.diagnosisName.valueOrNull),
      ],
      requester: Reference(display: this.recordingDoctor.value),
      note: <Annotation>[
        Annotation(
          authorString: this.recordingDoctor.value,
          text: this.note.value,
        )
      ],
      medicationCodeableConcept: CodeableConcept(
        text: this.medicationName.value,
        coding: <Coding>[
          Coding(
            system: 'OCL:/orgs/CIEL/sources/CIEL/',
            code: this.medicationID.valueOrNull,
            display: this.medicationDisplayName.valueOrNull,
            userSelected: true,
          ),
        ],
      ),
      dosageInstruction: <Dosage>[
        Dosage(
          text: this.prescription,
          patientInstruction: this.patientInstructions.valueOrNull,
        )
      ],
      authoredOn: this.dateRecorded.valueOrNull,
    );
    final Map<String, dynamic> _medicationVariables =
        _medicationObject.toJson();

    return <String, dynamic>{'input': _medicationVariables};
  }

  Map<String, dynamic> get data => addMedicationVariables();

  String get prescription =>
      'Take ${this.rx.value} ${this.route.value} every ${this.takeEvery.value} ${this.takeEveryFrequency.value} for ${this.forValue.value} ${this.forDuration.value}.';
}

class AddTestObject {
  factory AddTestObject() {
    return _singleton;
  }

  AddTestObject._internal();

  BehaviorSubject<String?> clinicalNotes = BehaviorSubject<String?>();
  BehaviorSubject<String?> diagnosisID = BehaviorSubject<String?>();
  BehaviorSubject<String?> diagnosisName = BehaviorSubject<String?>();
  BehaviorSubject<String?> test = BehaviorSubject<String?>();

  static final AddTestObject _singleton = AddTestObject._internal();

  Map<String, dynamic> get data => <String, dynamic>{
        'test': this.test.value,
        'clinicalNotes': this.clinicalNotes.value,
      };
}

class GeneralExamObject {
  factory GeneralExamObject() {
    return _singleton;
  }

  GeneralExamObject._internal();

  BehaviorSubject<String?> description = BehaviorSubject<String?>();
  Map<String, bool> symptoms = <String, bool>{
    'fever': false,
    'nausea': false,
    'rash': false,
    'fatigue': false,
    'weightGain': false,
    'weightLoss': false,
  };

  static final GeneralExamObject _singleton = GeneralExamObject._internal();

  Map<String, dynamic> get data => <String, dynamic>{
        'description': this.description.value,
        'symptomFever': this.symptoms['fever'] == true ? 'true' : 'false',
        'symptomNausea': this.symptoms['nausea'] == true ? 'true' : 'false',
        'symptomRash': this.symptoms['rash'] == true ? 'true' : 'false',
        'symptomFatigue': this.symptoms['fatigue'] == true ? 'true' : 'false',
        'symptomWeighGain':
            this.symptoms['weightGain'] == true ? 'true' : 'false',
        'symptomWeightLoss':
            this.symptoms['weightLoss'] == true ? 'true' : 'false',
      };
}

class SidePaneDiagnosisStore {
  factory SidePaneDiagnosisStore() {
    return _singleton;
  }

  SidePaneDiagnosisStore._internal();

  BehaviorSubject<String?> diagnosisConfirmationClinicalStatus =
      BehaviorSubject<String?>();

  BehaviorSubject<String?> diagnosisID = BehaviorSubject<String?>();
  BehaviorSubject<String?> diagnosisName = BehaviorSubject<String?>();
  BehaviorSubject<String?> diagnosisNotes = BehaviorSubject<String?>();
  BehaviorSubject<String?> recorderDate = BehaviorSubject<String?>();

  static final SidePaneDiagnosisStore _singleton =
      SidePaneDiagnosisStore._internal();

  void reset() {
    this
      ..diagnosisName.add('')
      ..diagnosisID.add('')
      ..diagnosisConfirmationClinicalStatus.add('')
      ..diagnosisNotes.add('')
      ..recorderDate.add('');
  }
}

class SidePaneProblemStore {
  factory SidePaneProblemStore() {
    return _singleton;
  }

  SidePaneProblemStore._internal();

  BehaviorSubject<String?> problemConfirmationStatus =
      BehaviorSubject<String?>();

  BehaviorSubject<String?> problemID = BehaviorSubject<String?>();
  BehaviorSubject<String?> problemName = BehaviorSubject<String?>();
  BehaviorSubject<String?> problemNotes = BehaviorSubject<String?>.seeded('');

  static final SidePaneProblemStore _singleton =
      SidePaneProblemStore._internal();
}

class AddVitalsObject {
  factory AddVitalsObject() {
    return _singleton;
  }

  AddVitalsObject._internal();

  BehaviorSubject<PatientVital?> bmi = BehaviorSubject<PatientVital?>();
  BehaviorSubject<PatientVital?> diastolicBloodPressure =
      BehaviorSubject<PatientVital?>();

  BehaviorSubject<String?> encounterRef = BehaviorSubject<String?>();
  BehaviorSubject<String?> patientRef = BehaviorSubject<String?>();
  BehaviorSubject<PatientVital?> pulse = BehaviorSubject<PatientVital?>();
  BehaviorSubject<PatientVital?> respiratoryRate =
      BehaviorSubject<PatientVital?>();

  BehaviorSubject<PatientVital?> spo2 = BehaviorSubject<PatientVital?>();
  BehaviorSubject<PatientVital?> systolicBloodPressure =
      BehaviorSubject<PatientVital?>();

  BehaviorSubject<PatientVital?> temperature = BehaviorSubject<PatientVital?>();
  BehaviorSubject<List<dynamic>?> vitalsList =
      BehaviorSubject<List<dynamic>?>();

  static final AddVitalsObject _singleton = AddVitalsObject._internal();

  String? get evaluatedBloodPressure {
    final String systolicValue =
        this.systolicBloodPressure.valueOrNull?.vitalValue ?? '';
    final String diastolicValue =
        this.diastolicBloodPressure.valueOrNull?.vitalValue ?? '';

    if (diastolicValue.isEmpty) {
      return '';
    }

    return '$systolicValue / $diastolicValue';
  }

  Map<String, dynamic> get data => <String, dynamic>{
        'patientRef': this.patientRef.value,
        'encounterRef': this.encounterRef.value,
      };

  void reset() {
    this
      ..pulse.add(null)
      ..systolicBloodPressure.add(null)
      ..diastolicBloodPressure.add(null)
      ..respiratoryRate.add(null)
      ..temperature.add(null)
      ..bmi.add(null)
      ..spo2.add(null);
  }
}

class AddTestStore {
  factory AddTestStore() {
    return _singleton;
  }

  AddTestStore._internal();

  BehaviorSubject<String?> testCode = BehaviorSubject<String?>();
  BehaviorSubject<String?> testName = BehaviorSubject<String?>();
  BehaviorSubject<String?> testNotes = BehaviorSubject<String?>();
  BehaviorSubject<String?> testStatus = BehaviorSubject<String?>();

  static final AddTestStore _singleton = AddTestStore._internal();

  void reset() {
    this
      ..testName.add(null)
      ..testCode.add(null)
      ..testNotes.add(null)
      ..testStatus.add(null);
  }
}

class ExtraInformationObject {
  factory ExtraInformationObject() {
    return _singleton;
  }

  ExtraInformationObject._internal();

  BehaviorSubject<String?> email = BehaviorSubject<String?>();
  BehaviorSubject<bool> emailOptIn = BehaviorSubject<bool>.seeded(false);
  BehaviorSubject<MaritalStatus> maritalStatus =
      BehaviorSubject<MaritalStatus>();
  BehaviorSubject<String?> patientId = BehaviorSubject<String?>();

  static final ExtraInformationObject _singleton =
      ExtraInformationObject._internal();

  Map<String, dynamic> get data => <String, dynamic>{
        'id': this.patientId.value,
        'maritalStatus': this.maritalStatus.value.fhirName,
        'emailOptIn': this.emailOptIn.value,
        'email': this.email.value
      };

  /// clears every streamController in [this] except the [patientId]
  void clear() {
    this
      ..email.add(null)
      ..emailOptIn.add(false)
      ..maritalStatus.add(MaritalStatus.Unknown)
      ..patientId.add(null);
  }
}

/// Data objects used to pass data between widgets.
class SecondaryBannerInfoObject {
  factory SecondaryBannerInfoObject() {
    return _singleton;
  }

  SecondaryBannerInfoObject._internal();

  BehaviorSubject<List<AllergyIntoleranceRelayEdge?>?> allergiesList =
      BehaviorSubject<List<AllergyIntoleranceRelayEdge?>?>.seeded(
          <AllergyIntoleranceRelayEdge>[]);

  BehaviorSubject<List<MedicationEdgeRelay?>?> medicationsList =
      BehaviorSubject<List<MedicationEdgeRelay?>?>.seeded(
          <MedicationEdgeRelay>[]);

  BehaviorSubject<List<ConditionEdgeRelay?>?> problemsList =
      BehaviorSubject<List<ConditionEdgeRelay?>?>.seeded(null);

  static final SecondaryBannerInfoObject _singleton =
      SecondaryBannerInfoObject._internal();

  void reset() {
    this
      ..problemsList.add(<ConditionEdgeRelay?>[])
      ..allergiesList.add(<AllergyIntoleranceRelayEdge>[])
      ..medicationsList.add(<MedicationEdgeRelay>[]);
  }
}

class NHIFInformationObject {
  factory NHIFInformationObject() {
    return _singleton;
  }

  NHIFInformationObject._internal();

  BehaviorSubject<String?> frontImageBase64 = BehaviorSubject<String?>();
  BehaviorSubject<String?> frontImageContentType = BehaviorSubject<String?>();
  BehaviorSubject<String?> membershipNumber = BehaviorSubject<String?>();
  BehaviorSubject<String?> patientID = BehaviorSubject<String?>();

  static final NHIFInformationObject _singleton =
      NHIFInformationObject._internal();

  Map<String, dynamic> get data => <String, dynamic>{
        'patientID': this.patientID.value,
        'membershipNumber': this.membershipNumber.value,
        'frontImageBase64': this.frontImageBase64.value,
        'frontImageContentType:': this.frontImageContentType.value,
      };
}

class RetireReasonObject {
  factory RetireReasonObject() {
    return _singleton;
  }

  RetireReasonObject._internal();

  BehaviorSubject<String?> reason = BehaviorSubject<String?>();

  static final RetireReasonObject _singleton = RetireReasonObject._internal();

  Map<String, dynamic> get data => <String, dynamic>{
        'reason': this.reason.value,
      };

  void reset() {
    this.reason.add(null);
  }
}

class TimelineInfoObject {
  factory TimelineInfoObject() {
    return _singleton;
  }

  TimelineInfoObject._internal();

  /// Whether the api has more visits to give us for this patient
  BehaviorSubject<bool> apiHasMore = BehaviorSubject<bool>.seeded(false);

  List<String> patientsWithGrantedAccess = <String>[];

  /// Whether to show all visits for this patient
  BehaviorSubject<bool> showAll = BehaviorSubject<bool>.seeded(false);

  /// Stores all the patient's visits
  BehaviorSubject<List<dynamic>> visits =
      BehaviorSubject<List<dynamic>>.seeded(<List<dynamic>>[]);

  static final TimelineInfoObject _singleton = TimelineInfoObject._internal();

  void reset() {
    this
      ..visits.add(<List<dynamic>>[])
      ..showAll.add(false)
      ..apiHasMore.add(false);
  }
}

/// Used to store a record of the not found patient data.
/// It is used to determine whether the searched patient in
/// [PatientIdentification] does not exist in the system
class PatientSearchStore {
  factory PatientSearchStore() {
    return _singleton;
  }

  PatientSearchStore._internal();

  BehaviorSubject<bool> isNotFound = BehaviorSubject<bool>.seeded(false);
  BehaviorSubject<String?> phoneNumber = BehaviorSubject<String?>();

  static final PatientSearchStore _singleton = PatientSearchStore._internal();

  void reset() {
    this..isNotFound.add(false)..phoneNumber.add(null);
  }
}

class PrimaryBannerInfoObject {
  factory PrimaryBannerInfoObject() {
    return _singleton;
  }

  PrimaryBannerInfoObject._internal();

  BehaviorSubject<String?> allergiesList = BehaviorSubject<String?>();
  BehaviorSubject<bool> patientBannerChangeListener =
      BehaviorSubject<bool>.seeded(false);

  BehaviorSubject<String?> problemsList = BehaviorSubject<String?>();

  static final PrimaryBannerInfoObject _singleton =
      PrimaryBannerInfoObject._internal();

  void reset() {
    this
      ..problemsList.add(null)
      ..allergiesList.add(null)
      ..patientBannerChangeListener.add(false);
  }
}

class CurrentPatientInEpisode {
  factory CurrentPatientInEpisode() {
    return _singleton;
  }

  CurrentPatientInEpisode._internal();

  BehaviorSubject<String?> encounterID = BehaviorSubject<String?>();
  BehaviorSubject<EpisodeOfCarePayload> episodeOfCarePayload =
      BehaviorSubject<EpisodeOfCarePayload>.seeded(EpisodeOfCarePayload());

  BehaviorSubject<bool> fullAccess = BehaviorSubject<bool>.seeded(false);
  BehaviorSubject<PatientConnection> patientConnection =
      BehaviorSubject<PatientConnection>();

  static final CurrentPatientInEpisode _singleton =
      CurrentPatientInEpisode._internal();

  void reset() {
    this
      ..patientConnection.add(PatientConnection())
      ..encounterID.add(null)
      ..episodeOfCarePayload.add(EpisodeOfCarePayload())
      ..fullAccess.add(false);
  }
}

class SnackBarListenersChangeObject {
  factory SnackBarListenersChangeObject() {
    return _singleton;
  }

  SnackBarListenersChangeObject._internal();

  BehaviorSubject<bool> onCloseSummaryListener =
      BehaviorSubject<bool>.seeded(false);

  BehaviorSubject<bool> onEndVisitListener =
      BehaviorSubject<bool>.seeded(false);

  BehaviorSubject<bool> onPostVisitListener =
      BehaviorSubject<bool>.seeded(false);

  static final SnackBarListenersChangeObject _singleton =
      SnackBarListenersChangeObject._internal();
}

class ProfileSubject {
  factory ProfileSubject() {
    return _singleton;
  }

  ProfileSubject._internal();

  BehaviorSubject<Color> color =
      BehaviorSubject<Color>.seeded(Colors.purple[100]!);

  BehaviorSubject<String> selectedTile =
      BehaviorSubject<String>.seeded(contactInfo);

  BehaviorSubject<ValueNotifier<ProfileItem>> selection =
      BehaviorSubject<ValueNotifier<ProfileItem>>.seeded(
    ValueNotifier<ProfileItem>(
      const ProfileItem(
        text: contactInfo,
        section: ProfileItemType.account,
        onTapRoute: profileContactDetailsRoute,
      ),
    ),
  );

  static final ProfileSubject _singleton = ProfileSubject._internal();
}

class UserFeedStore {
  factory UserFeedStore() {
    return _singleton;
  }

  UserFeedStore._internal();

  /// A listener for the user feed status.
  ///
  /// If the value is true, the feed will refresh, otherwise not
  BehaviorSubject<bool> refreshFeed = BehaviorSubject<bool>.seeded(false);

  static final UserFeedStore _singleton = UserFeedStore._internal();
}
