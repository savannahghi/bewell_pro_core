// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:bewell_pro_core/domain/clinical/entities/codeable_concept.dart';
import 'package:bewell_pro_core/domain/clinical/entities/fhir.dart';
import 'package:bewell_pro_core/domain/clinical/entities/identifier.dart';
import 'package:bewell_pro_core/domain/clinical/entities/narrative_status.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';

void main() {
  group('fhir classes should create valid objects', () {
    test('Attester should cerate a valid object', () {
      final Attester _attester = Attester(
          id: CodeableConcept(id: 'some id', text: 'some text'),
          mode: CompositionAttesterModeEnum.personal);

      final Map<String, dynamic> _attesterObject = _attester.toJson();
      expect(_attesterObject.containsKey('ID'), true);
      expect(_attesterObject.containsKey('Mode'), true);

      final Map<String, dynamic> _attesterData = <String, dynamic>{
        'ID': <String, dynamic>{'ID': 'some id', 'Text': 'some text'},
        'Mode': 'legal',
      };

      final Attester _serializedAttester = Attester.fromJson(_attesterData);
      expect(_serializedAttester.id!.id, 'some id');
    });

    test('RelatesTo should cerate a valid object', () {
      final RelatesTo _relatesTo = RelatesTo(
          id: CodeableConcept(id: 'some id', text: 'some text'),
          code: 'some code');

      final Map<String, dynamic> _relatesToObject = _relatesTo.toJson();
      expect(_relatesToObject.containsKey('ID'), true);
      expect(_relatesToObject.containsKey('Code'), true);

      final Map<String, dynamic> _relatesToData = <String, dynamic>{
        'ID': <String, dynamic>{'ID': 'some id', 'Text': 'some text'},
        'Code': 'some code',
      };

      final RelatesTo _serializedRelatesto = RelatesTo.fromJson(_relatesToData);
      expect(_serializedRelatesto.id!.id, 'some id');
    });

    test('Event should cerate a valid object', () {
      final Event _event = Event(
          id: CodeableConcept(id: 'some id', text: 'some text'),
          code: 'some code');

      final Map<String, dynamic> _eventObject = _event.toJson();
      expect(_eventObject.containsKey('ID'), true);
      expect(_eventObject.containsKey('Code'), true);

      final Map<String, dynamic> _eventData = <String, dynamic>{
        'ID': <String, dynamic>{'ID': 'some id', 'Text': 'some text'},
        'Code': 'some code',
      };

      final Event _serializedEvent = Event.fromJson(_eventData);
      expect(_serializedEvent.id!.id, 'some id');
      expect(_serializedEvent.code, 'some code');
    });
    test('Section should cerate a valid object', () {
      final Section _section = Section(
        id: 'some id',
        title: 'some title',
        code: 'some code',
        mode: 'some mode',
      );

      final Map<String, dynamic> _sectionObject = _section.toJson();
      expect(_sectionObject.containsKey('ID'), true);
      expect(_sectionObject.containsKey('Code'), true);
      expect(_sectionObject.containsKey('Mode'), true);
      expect(_sectionObject.containsKey('Title'), true);

      final Map<String, dynamic> _sectionData = <String, dynamic>{
        'ID': 'some id',
        'Title': 'some title',
        'Code': 'some code',
        'Mode': 'some mode',
      };

      final Section _serializedEvent = Section.fromJson(_sectionData);
      expect(_serializedEvent.id, 'some id');
      expect(_serializedEvent.title, 'some title');
      expect(_serializedEvent.code, 'some code');
      expect(_serializedEvent.mode, 'some mode');
    });

    test('Age should cerate a valid object', () {
      final Age _age = Age(
        id: CodeableConcept(id: 'some id', text: 'some text'),
        code: 'some code',
        value: 20,
      );

      final Map<String, dynamic> _ageObject = _age.toJson();
      expect(_ageObject.containsKey('ID'), true);
      expect(_ageObject.containsKey('Code'), true);
      expect(_ageObject.containsKey('Value'), true);

      final Map<String, dynamic> _ageData = <String, dynamic>{
        'ID': <String, dynamic>{'ID': 'some id', 'Text': 'some text'},
        'Code': 'some code',
        'Value': 20,
      };

      final Age _serializedAge = Age.fromJson(_ageData);
      expect(_serializedAge.id!.id, 'some id');
      expect(_serializedAge.code, 'some code');
      expect(_serializedAge.value, 20);
    });

    test('Quantity should cerate a valid object', () {
      final Quantity _quantity = Quantity(
        id: 'some id',
        code: 'some code',
        value: 20,
      );

      final Map<String, dynamic> _quantityObject = _quantity.toJson();
      expect(_quantityObject.containsKey('ID'), true);
      expect(_quantityObject.containsKey('Code'), true);
      expect(_quantityObject.containsKey('Value'), true);

      final Map<String, dynamic> _quantityData = <String, dynamic>{
        'ID': 'some id',
        'Code': 'some code',
        'Value': 20,
      };

      final Quantity _serializedQuantity = Quantity.fromJson(_quantityData);
      expect(_serializedQuantity.id, 'some id');
      expect(_serializedQuantity.code, 'some code');
      expect(_serializedQuantity.value, 20);
    });

    test('Stage should cerate a valid object', () {
      final Stage _stage = Stage(
        id: 'some id',
        summary: CodeableConcept(text: 'some text'),
      );

      final Map<String, dynamic> _stageObject = _stage.toJson();
      expect(_stageObject.containsKey('ID'), true);
      expect(_stageObject.containsKey('Summary'), true);

      final Map<String, dynamic> _stageData = <String, dynamic>{
        'ID': 'some id',
        'Summary': <String, dynamic>{'Text': 'some text'},
      };

      final Stage _serializedStage = Stage.fromJson(_stageData);
      expect(_serializedStage.id, 'some id');
      expect(_serializedStage.summary!.text, 'some text');
    });

    test('Evidence should cerate a valid object', () {
      final Evidence _evidence = Evidence(
        id: 'some id',
        code: CodeableConcept(text: 'some text'),
      );

      final Map<String, dynamic> _eviednceObject = _evidence.toJson();
      expect(_eviednceObject.containsKey('ID'), true);
      expect(_eviednceObject.containsKey('Code'), true);

      final Map<String, dynamic> _stageData = <String, dynamic>{
        'ID': 'some id',
        'Code': <String, dynamic>{'Text': 'some text'},
      };

      final Evidence _serializedStage = Evidence.fromJson(_stageData);
      expect(_serializedStage.id, 'some id');
      expect(_serializedStage.code!.text, 'some text');
    });

    test('Composition should cerate a valid object', () {
      final Composition _composition = Composition(
        id: 'some id',
        identifier: Identifier(value: 'some value'),
        title: 'some title',
        date: 'some date',
      );

      final Map<String, dynamic> _compositionObject = _composition.toJson();
      expect(_compositionObject.containsKey('ID'), true);
      expect(_compositionObject.containsKey('Identifier'), true);
      expect(_compositionObject.containsKey('Title'), true);

      final Map<String, dynamic> _compositionData = <String, dynamic>{
        'ID': 'some id',
        'Text': <String, dynamic>{'Status': NarrativeStatusEnum.empty},
        'Identifier': <String, dynamic>{'Value': 'some value'},
        'Title': 'some title',
        'Date': 'some date',
      };

      final Composition _serializedComposition =
          Composition.fromJson(_compositionData);
      expect(_serializedComposition.id, 'some id');
      expect(_serializedComposition.title, 'some title');
      expect(_serializedComposition.date, 'some date');
    });

    test('TimingRepeat should cerate a valid object', () {
      final TimingRepeat _timingRepeat = TimingRepeat(
          id: 'some id', frequency: 10, duration: 10, count: 10, offset: 1);

      final Map<String, dynamic> _timingRepeatObject = _timingRepeat.toJson();
      expect(_timingRepeatObject.containsKey('ID'), true);
      expect(_timingRepeatObject.containsKey('Frequency'), true);
      expect(_timingRepeatObject.containsKey('Duration'), true);
      expect(_timingRepeatObject.containsKey('Count'), true);

      final Map<String, dynamic> _timingRepeatData = <String, dynamic>{
        'ID': 'some id',
        'Count': 10,
        'CountMax': 10,
        'Duration': 10
      };

      final TimingRepeat _serializedTimingRepeat =
          TimingRepeat.fromJson(_timingRepeatData);

      expect(_serializedTimingRepeat.id, 'some id');
      expect(_serializedTimingRepeat.count, 10);
      expect(_serializedTimingRepeat.countMax, 10);
    });

    test('Timing should cerate a valid object', () {
      final Timing _timing = Timing(
        id: 'some id',
      );

      final Map<String, dynamic> _timingObject = _timing.toJson();
      expect(_timingObject.containsKey('ID'), true);

      final Map<String, dynamic> _timingData = <String, dynamic>{
        'ID': 'some id'
      };
      final Timing _serializedTiming = Timing.fromJson(_timingData);
      expect(_serializedTiming.id, 'some id');
    });

    test('RateRatio should cerate a valid object', () {
      final RateRatio _rateRatio = RateRatio(
        id: 'some id',
        numerator: Quantity(value: 10),
        denominator: Quantity(value: 10),
      );

      final Map<String, dynamic> _rateRatioObject = _rateRatio.toJson();

      expect(_rateRatioObject.containsKey('ID'), true);
      expect(_rateRatioObject.containsKey('Numerator'), true);
      expect(_rateRatioObject.containsKey('Denominator'), true);

      final Map<String, dynamic> _rateRatioData = <String, dynamic>{
        'ID': 'some id',
        'Numerator': <String, dynamic>{'Value': 10},
        'Denominator': <String, dynamic>{'Value': 10}
      };
      final RateRatio _serializedRateRatio = RateRatio.fromJson(_rateRatioData);
      expect(_serializedRateRatio.id, 'some id');
      expect(_serializedRateRatio.numerator!.value, 10);
      expect(_serializedRateRatio.denominator!.value, 10);
    });

    test('DosageDoseAndRate should cerate a valid object', () {
      final DosageDoseAndRate _dosageDoseAndRate = DosageDoseAndRate(
          id: 'some id', type: CodeableConcept(text: 'some text'));

      final Map<String, dynamic> _dosageDoseAndRateObject =
          _dosageDoseAndRate.toJson();

      expect(_dosageDoseAndRateObject.containsKey('ID'), true);
      expect(_dosageDoseAndRateObject.containsKey('Type'), true);

      final Map<String, dynamic> _dosageDoseAndRateData = <String, dynamic>{
        'ID': 'some id',
        'Type': <String, dynamic>{'Text': 'some text'},
      };
      final DosageDoseAndRate _serializedDosageDoseAndRate =
          DosageDoseAndRate.fromJson(_dosageDoseAndRateData);
      expect(_serializedDosageDoseAndRate.id, 'some id');
      expect(_serializedDosageDoseAndRate.type!.text, 'some text');
    });
  });
}
