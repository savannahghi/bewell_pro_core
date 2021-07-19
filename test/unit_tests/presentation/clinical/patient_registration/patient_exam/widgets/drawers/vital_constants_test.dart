import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawers/vital_constants.dart';
import 'package:rxdart/rxdart.dart';

void main() {
  group('Vital constants', () {
    test('should check pulse rate', () {
      String value = '80';
      const VitalType vitalType = VitalType.pulse;
      final BehaviorSubject<dynamic> updateValue = BehaviorSubject<dynamic>();

      expect(updateValue.valueOrNull, null);

      checkVitals(
        value: value,
        vitalType: vitalType,
        updateValue: updateValue,
      );

      expect(updateValue.value, isNotNull);
      expect(updateValue.value, isA<String>());
      expect(updateValue.value, 'NORMAL');

      value = '40';
      checkVitals(value: value, vitalType: vitalType, updateValue: updateValue);
      expect(updateValue.value, 'LOW');

      value = '100';
      checkVitals(value: value, vitalType: vitalType, updateValue: updateValue);
      expect(updateValue.value, 'HIGH');
    });

    test('should check blood pressure', () {
      String value = '100';
      const VitalType vitalType = VitalType.systolicBloodPressure;
      final BehaviorSubject<dynamic> updateValue = BehaviorSubject<dynamic>();

      expect(updateValue.valueOrNull, null);

      checkVitals(value: value, vitalType: vitalType, updateValue: updateValue);

      expect(updateValue.value, isNotNull);
      expect(updateValue.value, isA<String>());
      expect(updateValue.value, 'NORMAL');

      value = '40';
      checkVitals(value: value, vitalType: vitalType, updateValue: updateValue);
      expect(updateValue.value, 'LOW');

      value = '150';
      checkVitals(value: value, vitalType: vitalType, updateValue: updateValue);
      expect(updateValue.value, 'HIGH');
    });

    test('should check respiratory rate', () {
      String value = '15';
      const VitalType vitalType = VitalType.respiratoryRate;
      final BehaviorSubject<dynamic> updateValue = BehaviorSubject<dynamic>();

      expect(updateValue.valueOrNull, null);

      checkVitals(value: value, vitalType: vitalType, updateValue: updateValue);

      expect(updateValue.value, isNotNull);
      expect(updateValue.value, isA<String>());
      expect(updateValue.value, 'NORMAL');

      value = '5';
      checkVitals(value: value, vitalType: vitalType, updateValue: updateValue);
      expect(updateValue.value, 'LOW');

      value = '22';
      checkVitals(value: value, vitalType: vitalType, updateValue: updateValue);
      expect(updateValue.value, 'HIGH');
    });

    test('should check bmi', () {
      String value = '23';
      const VitalType vitalType = VitalType.bmi;
      final BehaviorSubject<dynamic> updateValue = BehaviorSubject<dynamic>();

      expect(updateValue.valueOrNull, null);

      checkVitals(value: value, vitalType: vitalType, updateValue: updateValue);

      expect(updateValue.value, isNotNull);
      expect(updateValue.value, isA<String>());
      expect(updateValue.value, 'NORMAL');

      value = '16';
      checkVitals(value: value, vitalType: vitalType, updateValue: updateValue);
      expect(updateValue.value, 'LOW');

      value = '30';
      checkVitals(value: value, vitalType: vitalType, updateValue: updateValue);
      expect(updateValue.value, 'HIGH');
    });

    test('should check blood oxygen', () {
      String value = '89';
      const VitalType vitalType = VitalType.bloodOxygen;
      final BehaviorSubject<dynamic> updateValue = BehaviorSubject<dynamic>();

      expect(updateValue.valueOrNull, null);

      checkVitals(value: value, vitalType: vitalType, updateValue: updateValue);

      expect(updateValue.value, isNotNull);
      expect(updateValue.value, isA<String>());
      expect(updateValue.value, 'NORMAL');

      value = '80';
      checkVitals(value: value, vitalType: vitalType, updateValue: updateValue);
      expect(updateValue.value, 'LOW');

      value = '95';
      checkVitals(value: value, vitalType: vitalType, updateValue: updateValue);
      expect(updateValue.value, 'HIGH');
    });

    test('should check temperature', () {
      String value = '37.5';
      const VitalType vitalType = VitalType.temperature;
      final BehaviorSubject<dynamic> updateValue = BehaviorSubject<dynamic>();

      expect(updateValue.valueOrNull, null);

      checkVitals(value: value, vitalType: vitalType, updateValue: updateValue);

      expect(updateValue.value, isNotNull);
      expect(updateValue.value, isA<String>());
      expect(updateValue.value, 'NORMAL');

      value = '30.5';
      checkVitals(value: value, vitalType: vitalType, updateValue: updateValue);
      expect(updateValue.value, 'LOW');

      value = '39.2';
      checkVitals(value: value, vitalType: vitalType, updateValue: updateValue);
      expect(updateValue.value, 'HIGH');
    });
  });
}
