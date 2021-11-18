// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/models/exam_composition.dart';

void main() {
  group('common behavior objects should create valid objects', () {
    test('ExamCompositionObject should create a valid object', () {
      final ExamCompositionObject examCompositionObject =
          ExamCompositionObject();

      examCompositionObject.compositionTitle
          .add(CompositionTypeTitle.patientHistory);
      examCompositionObject.id.add('some id');

      expect(examCompositionObject.compositionTitle.value,
          CompositionTypeTitle.patientHistory);

      examCompositionObject.reset();
      expect(examCompositionObject.reviewCompositionID.value, null);
    });

    test('evaluatedBloodPressure getter returns correct values', () {
      final AddBloodPressureObject addBloodPressureObject =
          AddBloodPressureObject();
      addBloodPressureObject.patientRef.add('some value');
      expect(addBloodPressureObject.evaluatedBloodPressure, '');
    });

    test('ReviewCardiacStore should create valid object', () {
      final ReviewCardiacStore reviewCardiacStore = ReviewCardiacStore();
      const Map<String, bool> symptomsMap = <String, bool>{
        'none': false,
        'Chest Pain': false,
        'DOE': false,
        'PND': false,
        'Palp': false,
        'Edema': false,
        'Diaphore': false,
      };
      reviewCardiacStore.description.add('some description');
      expect(reviewCardiacStore.description.value, 'some description');

      reviewCardiacStore.symptomsMap.addAll(symptomsMap);
      expect(reviewCardiacStore.data.containsKey('symptomNoneKnown'), true);
      expect(reviewCardiacStore.data.containsKey('symptomEdema'), true);

      expect(reviewCardiacStore.data['symptomNoneKnown'], 'false');
      expect(reviewCardiacStore.data['symptomEdema'], 'false');
    });

    test('ReviewRespiratoryStore should create a valid object', () {
      final ReviewRespiratoryStore reviewRespiratoryStore =
          ReviewRespiratoryStore();
      final Map<String, bool> symptomsMap = <String, bool>{
        'none': false,
        'Cough': false,
        'Congest': false,
        'SOB': false,
        'Haemoptysis': false,
      };

      reviewRespiratoryStore.description.add('some description');
      expect(reviewRespiratoryStore.description.value, 'some description');

      reviewRespiratoryStore.symptomsMap.addAll(symptomsMap);
      expect(reviewRespiratoryStore.data.containsKey('symptomNoneKnown'), true);
      expect(reviewRespiratoryStore.data.containsKey('symptomCough'), true);

      expect(reviewRespiratoryStore.data['symptomNoneKnown'], 'false');
      expect(reviewRespiratoryStore.data['symptomCough'], 'false');
    });

    test('ReviewGastroIntestinalStore should create a valid object', () {
      final ReviewGastroIntestinalStore reviewGastroIntestinalStore =
          ReviewGastroIntestinalStore();
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

      reviewGastroIntestinalStore.description.add('some description');
      expect(reviewGastroIntestinalStore.description.value, 'some description');

      reviewGastroIntestinalStore.symptomsMap.addAll(symptomsMap);
      expect(reviewGastroIntestinalStore.data.containsKey('symptomNoneKnown'),
          true);
      expect(
          reviewGastroIntestinalStore.data.containsKey('symptomNausea'), true);

      expect(reviewGastroIntestinalStore.data['symptomNoneKnown'], 'false');
      expect(reviewGastroIntestinalStore.data['symptomNausea'], 'false');
    });

    test('GIStore should create a valid object', () {
      final GIStore gIStore = GIStore();
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

      gIStore.description.add('some description');
      expect(gIStore.description.value, 'some description');

      gIStore.symptomsMap.addAll(symptomsMap);
      expect(gIStore.data.containsKey('symptomNoneKnown'), true);
      expect(gIStore.data.containsKey('symptomAnorexia'), true);

      expect(gIStore.data['symptomNoneKnown'], 'false');
      expect(gIStore.data['symptomAnorexia'], 'false');
    });
    test('GenitourinaryStore should create a valid object', () {
      final GenitourinaryStore genitourinaryStore = GenitourinaryStore();
      final Map<String, bool> symptomsMap = <String, bool>{
        'none': false,
        'Blur vision': false,
        'Ringing': false,
        'Deafness': false,
        'Hoarse voice': false,
        'Vertigo': false,
        'Epistaxis': false,
      };

      genitourinaryStore.description.add('some description');
      expect(genitourinaryStore.description.value, 'some description');

      genitourinaryStore.symptomsMap.addAll(symptomsMap);
      expect(genitourinaryStore.data.containsKey('symptomNoneKnown'), true);
      expect(genitourinaryStore.data.containsKey('symptomProstate'), true);

      expect(genitourinaryStore.data['symptomNoneKnown'], 'false');
      expect(genitourinaryStore.data['symptomProstate'], 'false');
    });

    test('HEENTTwoStore should create a valid object', () {
      final HEENTTwoStore heentTwoStore = HEENTTwoStore();
      final Map<String, bool> symptomsMap = <String, bool>{
        'none': false,
        'Painful urination': false,
        'Frequent urination': false,
        'Prostate problems': false,
        'Bladder problems': false,
        'Impotence': false,
      };

      heentTwoStore.description.add('some description');
      expect(heentTwoStore.description.value, 'some description');

      heentTwoStore.symptomsMap.addAll(symptomsMap);
      expect(heentTwoStore.data.containsKey('symptomNoneKnown'), true);
      expect(heentTwoStore.data.containsKey('symptomBlurVision'), true);

      expect(heentTwoStore.data['symptomNoneKnown'], 'false');
      expect(heentTwoStore.data['symptomBlurVision'], 'false');
    });

    test('HEENTStore should create a valid object', () {
      final HEENTStore heentStore = HEENTStore();
      final Map<String, bool> symptomsMap = <String, bool>{
        'none': false,
        'Vision change': false,
        'Dizziness': false,
        'Ear ache': false,
        'Sore throat': false,
        'Runny nose': false,
        'Neck pain': false,
      };

      heentStore.description.add('some description');
      expect(heentStore.description.value, 'some description');

      heentStore.symptomsMap.addAll(symptomsMap);
      expect(heentStore.data.containsKey('symptomNoneKnown'), true);
      expect(heentStore.data.containsKey('symptomEarAche'), true);

      expect(heentStore.data['symptomNoneKnown'], 'false');
      expect(heentStore.data['symptomEarAche'], 'false');
    });

    test('ReviewHematologicStore should create a valid object', () {
      final ReviewHematologicStore reviewHematologicStore =
          ReviewHematologicStore();
      final Map<String, bool> symptomsMap = <String, bool>{
        'none': false,
        'Anaemia': false,
        'Easy bruising/bleeding': false,
        'Past transfusions': false,
      };
      reviewHematologicStore.description.add('some description');
      expect(reviewHematologicStore.description.value, 'some description');

      reviewHematologicStore.symptomsMap.addAll(symptomsMap);
      expect(reviewHematologicStore.data.containsKey('symptomNoneKnown'), true);
      expect(reviewHematologicStore.data.containsKey('symptomAnemia'), true);

      expect(reviewHematologicStore.data['symptomNoneKnown'], 'false');
      expect(reviewHematologicStore.data['symptomAnemia'], 'false');
    });

    test('MuscularSkeletalStore should create a valid object', () {
      final MuscularSkeletalStore muscularSkeletalStore =
          MuscularSkeletalStore();
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
      muscularSkeletalStore.description.add('some description');
      expect(muscularSkeletalStore.description.value, 'some description');

      muscularSkeletalStore.symptomsMap.addAll(symptomsMap);
      expect(muscularSkeletalStore.data.containsKey('symptomNoneKnown'), true);
      expect(muscularSkeletalStore.data.containsKey('symptomMyalgia'), true);

      expect(muscularSkeletalStore.data['symptomNoneKnown'], 'false');
      expect(muscularSkeletalStore.data['symptomMyalgia'], 'false');
    });

    test('ReviewNeurologicStore should create a valid object', () {
      final ReviewNeurologicStore reviewNeurologicStore =
          ReviewNeurologicStore();
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
      reviewNeurologicStore.description.add('some description');
      expect(reviewNeurologicStore.description.value, 'some description');

      reviewNeurologicStore.symptomsMap.addAll(symptomsMap);
      expect(reviewNeurologicStore.data.containsKey('symptomNoneKnown'), true);
      expect(reviewNeurologicStore.data.containsKey('symptomSeizures'), true);

      expect(reviewNeurologicStore.data['symptomNoneKnown'], 'false');
      expect(reviewNeurologicStore.data['symptomSeizures'], 'false');
    });

    test('ReviewPsychiatricStore should create a valid object', () {
      final ReviewPsychiatricStore reviewPsychiatricStore =
          ReviewPsychiatricStore();
      final Map<String, bool> symptomsMap = <String, bool>{
        'none': false,
        'Anxiety': false,
        'Depression': false,
        'Insomnia': false,
        'Agitation': false,
        'Hallucination': false,
        'Disorientation': false,
      };
      reviewPsychiatricStore.description.add('some description');
      expect(reviewPsychiatricStore.description.value, 'some description');

      reviewPsychiatricStore.symptomsMap.addAll(symptomsMap);
      expect(reviewPsychiatricStore.data.containsKey('symptomNoneKnown'), true);
      expect(reviewPsychiatricStore.data.containsKey('symptomAnxiety'), true);

      expect(reviewPsychiatricStore.data['symptomNoneKnown'], 'false');
      expect(reviewPsychiatricStore.data['symptomAnxiety'], 'false');
    });

    test('ReviewSkinStore should create a valid object', () {
      final ReviewSkinStore reviewSkinStore = ReviewSkinStore();
      final Map<String, bool> symptomsMap = <String, bool>{
        'none': false,
        'Anemia': false,
        'Adenopathy': false,
        'Rash': false,
        'Leg ulcer': false,
        'Bruising': false,
        'Itching': false,
      };
      reviewSkinStore.description.add('some description');
      expect(reviewSkinStore.description.value, 'some description');

      reviewSkinStore.symptomsMap.addAll(symptomsMap);
      expect(reviewSkinStore.data.containsKey('symptomNoneKnown'), true);
      expect(reviewSkinStore.data.containsKey('symptomAnemia'), true);

      expect(reviewSkinStore.data['symptomNoneKnown'], 'false');
      expect(reviewSkinStore.data['symptomAnemia'], 'false');
    });

    test('ReviewUrinaryStore should create a valid object', () {
      final ReviewUrinaryStore reviewSkinStore = ReviewUrinaryStore();
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
      reviewSkinStore.description.add('some description');
      expect(reviewSkinStore.description.value, 'some description');

      reviewSkinStore.symptomsMap.addAll(symptomsMap);
      expect(reviewSkinStore.data.containsKey('symptomNoneKnown'), true);
      expect(reviewSkinStore.data.containsKey('symptomUrgentUrination'), true);

      expect(reviewSkinStore.data['symptomNoneKnown'], 'false');
      expect(reviewSkinStore.data['symptomUrgentUrination'], 'false');
    });
    test('AddTestObject should create a vlid object', () {
      final AddTestObject addTestObject = AddTestObject();
      addTestObject.test.add('some test');
      addTestObject.clinicalNotes.add('some notes');

      expect(addTestObject.test.value, 'some test');
      expect(addTestObject.data.containsKey('test'), true);
      expect(addTestObject.data.containsKey('clinicalNotes'), true);
      expect(addTestObject.data['test'], 'some test');
      expect(addTestObject.data['clinicalNotes'], 'some notes');
    });

    test('AddVitalsObject should create a vlid object', () {
      final AddVitalsObject addVitalsObject = AddVitalsObject();
      addVitalsObject.encounterRef.add('some encounter');
      addVitalsObject.patientRef.add('some reference');

      expect(addVitalsObject.encounterRef.value, 'some encounter');
      expect(addVitalsObject.data.containsKey('patientRef'), true);
      expect(addVitalsObject.data.containsKey('encounterRef'), true);
      expect(addVitalsObject.data['patientRef'], 'some reference');
      expect(addVitalsObject.data['encounterRef'], 'some encounter');
    });

    test('RetireReasonObject should create a vlid object', () {
      final RetireReasonObject retireReasonObject = RetireReasonObject();
      retireReasonObject.reason.add('some reason');

      expect(retireReasonObject.reason.value, 'some reason');
      expect(retireReasonObject.data.containsKey('reason'), true);
      expect(retireReasonObject.data['reason'], 'some reason');
    });
  });
}
