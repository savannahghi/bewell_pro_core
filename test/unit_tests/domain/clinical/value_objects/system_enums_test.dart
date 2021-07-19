import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';

void main() {
  group('system enums', () {
    test('EpisodeOfCareStatus enum returns correct string value', () async {
      expect(EpisodeOfCareStatus.planned.name, 'planned');
      expect(EpisodeOfCareStatus.waitList.name, 'waitlist');
      expect(EpisodeOfCareStatus.active.name, 'active');
      expect(EpisodeOfCareStatus.onHold.name, 'onhold');
      expect(EpisodeOfCareStatus.finished.name, 'finished');
      expect(EpisodeOfCareStatus.cancelled.name, 'cancelled');
      expect(EpisodeOfCareStatus.entered_in_error.name, 'entered_in_error');
    });

    group(
        'ReviewSystems enum returns correct ReviewSystemBase object with correct drawerData in =>',
        () {
      test('Respiratory', () async {
        final Map<String, bool> symptomsMap = <String, bool>{
          'none': false,
          'Cough': false,
          'Congest': false,
          'SOB': false,
          'Haemoptysis': false,
        };
        final List<String> symptoms = <String>[
          'none',
          'Cough',
          'Congest',
          'SOB',
          'Haemoptysis'
        ];
        ReviewRespiratoryStore().description.add('Test');
        // Verify returns correct objects
        expect(ReviewSystems.respiratory.drawerData!.symptoms, symptoms);
        expect(ReviewSystems.respiratory.drawerData!.symptomsMap, symptomsMap);
        expect(ReviewSystems.respiratory.drawerData!.description.value, 'Test');
        expect(ReviewSystems.respiratory.drawerData!.dataObject,
            ReviewRespiratoryStore());
        expect(ReviewSystems.respiratory.drawerData!.compositionDataObject,
            ExamCompositionObject().respiratory);
      });

      test('Peripheral', () async {
        final Map<String, bool> symptomsMap = <String, bool>{
          'none': false,
          'Leg cramps': false,
          'Varicose veins': false,
          'Clots in veins': false,
        };
        final List<String> symptoms = <String>[
          'none',
          'Leg cramps',
          'Varicose veins',
          'Clots in veins'
        ];
        ReviewPeripheralStore().description.add('Test');
        // Verify returns correct objects
        expect(ReviewSystems.peripheral.drawerData!.symptoms, symptoms);
        expect(ReviewSystems.peripheral.drawerData!.symptomsMap, symptomsMap);
        expect(ReviewSystems.peripheral.drawerData!.description.value, 'Test');
        expect(ReviewSystems.peripheral.drawerData!.dataObject,
            ReviewPeripheralStore());
        expect(ReviewSystems.peripheral.drawerData!.compositionDataObject,
            ExamCompositionObject().peripheral);
      });

      test('Gastrointestinal', () async {
        final Map<String, bool> symptomsMap = <String, bool>{
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
        final List<String> symptoms = <String>[
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
        ReviewGastroIntestinalStore().description.add('Test');
        // Verify returns correct objects
        expect(ReviewSystems.gastro.drawerData!.symptoms, symptoms);
        expect(ReviewSystems.gastro.drawerData!.symptomsMap, symptomsMap);
        expect(ReviewSystems.gastro.drawerData!.description.value, 'Test');
        expect(ReviewSystems.gastro.drawerData!.dataObject,
            ReviewGastroIntestinalStore());
        expect(ReviewSystems.gastro.drawerData!.compositionDataObject,
            ExamCompositionObject().gastrointestinal);
      });

      test('Urinary', () async {
        final Map<String, bool> symptomsMap = <String, bool>{
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
        final List<String> symptoms = <String>[
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
        ReviewUrinaryStore().description.add('Test');
        // Verify returns correct objects
        expect(ReviewSystems.urinary.drawerData!.symptoms, symptoms);
        expect(ReviewSystems.urinary.drawerData!.symptomsMap, symptomsMap);
        expect(ReviewSystems.urinary.drawerData!.description.value, 'Test');
        expect(
            ReviewSystems.urinary.drawerData!.dataObject, ReviewUrinaryStore());
        expect(ReviewSystems.urinary.drawerData!.compositionDataObject,
            ExamCompositionObject().urinary);
      });

      test('Neurologic', () async {
        final Map<String, bool> symptomsMap = <String, bool>{
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
        final List<String> symptoms = <String>[
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
        ReviewNeurologicStore().description.add('Test');
        // Verify returns correct objects
        expect(ReviewSystems.neurologic.drawerData!.symptoms, symptoms);
        expect(ReviewSystems.neurologic.drawerData!.symptomsMap, symptomsMap);
        expect(ReviewSystems.neurologic.drawerData!.description.value, 'Test');
        expect(ReviewSystems.neurologic.drawerData!.dataObject,
            ReviewNeurologicStore());
        expect(ReviewSystems.neurologic.drawerData!.compositionDataObject,
            ExamCompositionObject().neurologic);
      });

      test('Hematologic', () async {
        final Map<String, bool> symptomsMap = <String, bool>{
          'none': false,
          'Anaemia': false,
          'Easy bruising/bleeding': false,
          'Past transfusions': false,
        };
        final List<String> symptoms = <String>[
          'none',
          'Anaemia',
          'Easy bruising/bleeding',
          'Past transfusions'
        ];
        ReviewHematologicStore().description.add('Test');
        // Verify returns correct objects
        expect(ReviewSystems.hematologic.drawerData!.symptoms, symptoms);
        expect(ReviewSystems.hematologic.drawerData!.symptomsMap, symptomsMap);
        expect(ReviewSystems.hematologic.drawerData!.description.value, 'Test');
        expect(ReviewSystems.hematologic.drawerData!.dataObject,
            ReviewHematologicStore());
        expect(ReviewSystems.hematologic.drawerData!.compositionDataObject,
            ExamCompositionObject().hematologic);
      });

      test('Cardiac', () async {
        final Map<String, bool> symptomsMap = <String, bool>{
          'none': false,
          'Chest Pain': false,
          'DOE': false,
          'PND': false,
          'Palp': false,
          'Edema': false,
          'Diaphore': false,
        };
        final List<String> symptoms = <String>[
          'none',
          'Edema',
          'Chest Pain',
          'DOE',
          'Palp',
          'PND',
          'Diaphore'
        ];

        ReviewCardiacStore().description.add('Test');
        // Verify returns correct objects
        expect(ReviewSystems.cardiac.drawerData!.symptoms, symptoms);
        expect(ReviewSystems.cardiac.drawerData!.symptomsMap, symptomsMap);
        expect(ReviewSystems.cardiac.drawerData!.description.value, 'Test');
        expect(
            ReviewSystems.cardiac.drawerData!.dataObject, ReviewCardiacStore());
        expect(ReviewSystems.cardiac.drawerData!.compositionDataObject,
            ExamCompositionObject().cardiac);
      });

      test('Heent', () async {
        final List<String> symptoms = <String>[
          'none',
          'Vision change',
          'Dizziness',
          'Ear ache',
          'Runny nose',
          'Sore throat',
          'Neck pain',
        ];

        final Map<String, bool> symptomsMap = <String, bool>{
          'none': false,
          'Vision change': false,
          'Dizziness': false,
          'Ear ache': false,
          'Sore throat': false,
          'Runny nose': false,
          'Neck pain': false,
        };

        HEENTStore().description.add('Test');
        // Verify returns correct objects
        expect(ReviewSystems.heent.drawerData!.symptoms, symptoms);
        expect(ReviewSystems.heent.drawerData!.symptomsMap, symptomsMap);
        expect(ReviewSystems.heent.drawerData!.description.value, 'Test');
        expect(ReviewSystems.heent.drawerData!.dataObject, HEENTStore());
        expect(ReviewSystems.heent.drawerData!.compositionDataObject,
            ExamCompositionObject().heent);
      });

      test('HeentTwo', () async {
        final List<String> symptoms = <String>[
          'none',
          'Blur vision',
          'Ringing',
          'Deafness',
          'Vertigo',
          'Hoarse voice',
          'Epistaxis',
        ];

        final Map<String, bool> symptomsMap = <String, bool>{
          'none': false,
          'Blur vision': false,
          'Ringing': false,
          'Deafness': false,
          'Hoarse voice': false,
          'Vertigo': false,
          'Epistaxis': false,
        };
        HEENTTwoStore().description.add('Test');
        // Verify returns correct objects
        expect(ReviewSystems.heentTwo.drawerData!.symptoms, symptoms);
        expect(ReviewSystems.heentTwo.drawerData!.symptomsMap, symptomsMap);
        expect(ReviewSystems.heentTwo.drawerData!.description.value, 'Test');
        expect(ReviewSystems.heentTwo.drawerData!.dataObject, HEENTTwoStore());
        expect(ReviewSystems.heentTwo.drawerData!.compositionDataObject,
            ExamCompositionObject().heentTwo);
      });

      test('gi', () async {
        final List<String> symptoms = <String>[
          'none',
          'Anorexia',
          'Heart burn',
          'Abdominal pain',
          'Diarrhoea',
          'Nausea',
          'Vomiting',
          'Dysphagia'
        ];

        final Map<String, bool> symptomsMap = <String, bool>{
          'none': false,
          'Anorexia': false,
          'Heart burn': false,
          'Abdominal pain': false,
          'Diarrhoea': false,
          'Nausea': false,
          'Vomiting': false,
          'Dysphagia': false,
        };
        GIStore().description.add('Test');
        // Verify returns correct objects
        expect(ReviewSystems.gi.drawerData!.symptoms, symptoms);
        expect(ReviewSystems.gi.drawerData!.symptomsMap, symptomsMap);
        expect(ReviewSystems.gi.drawerData!.description.value, 'Test');
        expect(ReviewSystems.gi.drawerData!.dataObject, GIStore());
        expect(ReviewSystems.gi.drawerData!.compositionDataObject,
            ExamCompositionObject().gi);
      });

      test('genitourinary', () async {
        final List<String> symptoms = <String>[
          'none',
          'Painful urination',
          'Frequent urination',
          'Prostate problems',
          'Bladder problems',
          'Impotence',
        ];

        final Map<String, bool> symptomsMap = <String, bool>{
          'none': false,
          'Painful urination': false,
          'Frequent urination': false,
          'Prostate problems': false,
          'Bladder problems': false,
          'Impotence': false,
        };
        GenitourinaryStore().description.add('Test');
        // Verify returns correct objects
        expect(ReviewSystems.genitourinary.drawerData!.symptoms, symptoms);
        expect(
            ReviewSystems.genitourinary.drawerData!.symptomsMap, symptomsMap);
        expect(
            ReviewSystems.genitourinary.drawerData!.description.value, 'Test');
        expect(ReviewSystems.genitourinary.drawerData!.dataObject,
            GenitourinaryStore());
        expect(ReviewSystems.genitourinary.drawerData!.compositionDataObject,
            ExamCompositionObject().gu);
      });

      test('ms', () async {
        final List<String> symptoms = <String>[
          'none',
          'Myalgia',
          'Back pain',
          'Injury',
          'Joint pain',
          'Shoulder pain',
          'Weakness',
          'Joint swell',
        ];

        final Map<String, bool> symptomsMap = <String, bool>{
          'none': false,
          'Myalgia': false,
          'Backpain': false,
          'Injury': false,
          'Shoulder pain': false,
          'Joint pain': false,
          'Weakness': false,
          'Joint swell': false,
        };
        MuscularSkeletalStore().description.add('Test');
        // Verify returns correct objects
        expect(ReviewSystems.ms.drawerData!.symptoms, symptoms);
        expect(ReviewSystems.ms.drawerData!.symptomsMap, symptomsMap);
        expect(ReviewSystems.ms.drawerData!.description.value, 'Test');
        expect(
            ReviewSystems.ms.drawerData!.dataObject, MuscularSkeletalStore());
        expect(ReviewSystems.ms.drawerData!.compositionDataObject,
            ExamCompositionObject().ms);
      });

      test('Skin', () async {
        final List<String> symptoms = <String>[
          'none',
          'Anemia',
          'Adenopathy',
          'Rash',
          'Bruising',
          'Leg ulcer',
          'Itching',
        ];

        final Map<String, bool> symptomsMap = <String, bool>{
          'none': false,
          'Anemia': false,
          'Adenopathy': false,
          'Rash': false,
          'Leg ulcer': false,
          'Bruising': false,
          'Itching': false,
        };
        ReviewSkinStore().description.add('Test');
        // Verify returns correct objects
        expect(ReviewSystems.skin.drawerData!.symptoms, symptoms);
        expect(ReviewSystems.skin.drawerData!.symptomsMap, symptomsMap);
        expect(ReviewSystems.skin.drawerData!.description.value, 'Test');
        expect(ReviewSystems.skin.drawerData!.dataObject, ReviewSkinStore());
        expect(ReviewSystems.skin.drawerData!.compositionDataObject,
            ExamCompositionObject().skin);
      });

      test('Psychiatric', () async {
        final List<String> symptoms = <String>[
          'none',
          'Anxiety',
          'Depression',
          'Insomnia',
          'Hallucination',
          'Agitation',
          'Disorientation',
        ];

        final Map<String, bool> symptomsMap = <String, bool>{
          'none': false,
          'Anxiety': false,
          'Depression': false,
          'Insomnia': false,
          'Agitation': false,
          'Hallucination': false,
          'Disorientation': false,
        };
        ReviewPsychiatricStore().description.add('Test');
        // Verify returns correct objects
        expect(ReviewSystems.psychiatric.drawerData!.symptoms, symptoms);
        expect(ReviewSystems.psychiatric.drawerData!.symptomsMap, symptomsMap);
        expect(ReviewSystems.psychiatric.drawerData!.description.value, 'Test');
        expect(ReviewSystems.psychiatric.drawerData!.dataObject,
            ReviewPsychiatricStore());
        expect(ReviewSystems.psychiatric.drawerData!.compositionDataObject,
            ExamCompositionObject().psychiatric);
      });
    });

    test('NextOfKinRelation enum returns correct string value', () async {
      // Returns correct name
      expect(NextOfKinRelation.Emergency_Contact.name, 'Emergency Contact');
      expect(NextOfKinRelation.Employer.name, 'Employer');
      expect(NextOfKinRelation.Next_of_Kin.name, 'Next of Kin');
      expect(NextOfKinRelation.Federal_Agency.name, 'Federal Agency');
      expect(NextOfKinRelation.Insurance_Company.name, 'Insurance Company');
      expect(NextOfKinRelation.State_Agency.name, 'State Agency');
      expect(NextOfKinRelation.Unknown.name, 'Unknown');
      expect(NextOfKinRelation.Other.name, 'Other');
      // Returns correct fhirName
      expect(NextOfKinRelation.Emergency_Contact.fhirName, 'C');
      expect(NextOfKinRelation.Employer.fhirName, 'E');
      expect(NextOfKinRelation.Next_of_Kin.fhirName, 'N');
      expect(NextOfKinRelation.Federal_Agency.fhirName, 'F');
      expect(NextOfKinRelation.Insurance_Company.fhirName, 'I');
      expect(NextOfKinRelation.State_Agency.fhirName, 'S');
      expect(NextOfKinRelation.Unknown.fhirName, 'U');
      expect(NextOfKinRelation.Other.fhirName, 'O');
    });

    test('Priority enum returns correct string value', () async {
      expect(Priority.routine.name, 'Routine');
      expect(Priority.urgent.name, 'Urgent');
      expect(Priority.asap.name, 'As soon as possible');
    });

    test('MedicationStatusEnum returns correct string value', () async {
      expect(MedicationStatusEnum.active.name, 'Active');
      expect(MedicationStatusEnum.completed.name, 'Completed');
      expect(MedicationStatusEnum.inactive.name, 'Inactive');
    });
  });
}
