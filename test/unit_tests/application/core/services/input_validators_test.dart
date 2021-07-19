import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/core/services/input_validators.dart';

void main() {
  group('InputValidators', () {
    test('should validate systolic blood pressure', () {
      expect(InputValidators.validateSystoleBloodPressure(''),
          'Systolic pressure is required');
      expect(InputValidators.validateSystoleBloodPressure('-1'),
          'Systolic pressure cannot be less than 0');
      expect(InputValidators.validateSystoleBloodPressure('350'),
          'Systolic pressure is too high');
      expect(InputValidators.validateSystoleBloodPressure('100'), isNull);
    });

    test('should validate diastolic blood pressure', () {
      expect(InputValidators.validateDiastoleBloodPressure(''),
          'Diastolic pressure is required');
      expect(InputValidators.validateDiastoleBloodPressure('-1'),
          'Diastolic pressure cannot be less than 0');
      expect(InputValidators.validateDiastoleBloodPressure('350'),
          'Diastolic pressure is too high');
      expect(InputValidators.validateDiastoleBloodPressure('100'), isNull);
    });

    test('should validate a user PIN', () {
      expect(
          InputValidators.validatePin(value: ''), 'A 4 digit PIN is required');
      expect(InputValidators.validatePin(value: '123x'),
          'Only numbers are allowed, 0-9');
      expect(
          InputValidators.validatePin(value: '123'), 'Enter a four digit PIN');

      expect(
          InputValidators.validatePin(
              value: '1234', initiallyEnteredPin: '0000'),
          'PINs do not match');

      expect(InputValidators.validatePin(value: '1234'), isNull);
      expect(
          InputValidators.validatePin(
              value: '1234', initiallyEnteredPin: '1234'),
          isNull);
    });

    test('should validate a drawer search input', () {
      expect(
          InputValidators.validateDrawerSearchInput(
              value: '', isItemSelected: true, labelText: 'medication'),
          'Enter a medication to search');

      expect(
          InputValidators.validateDrawerSearchInput(
              value: 'Am', isItemSelected: false, labelText: 'medication'),
          'Add more characters');

      expect(
          InputValidators.validateDrawerSearchInput(
              value: 'Amoxicillin',
              isItemSelected: false,
              labelText: 'medication'),
          'Select a medication');

      expect(
          InputValidators.validateDrawerSearchInput(
              value: 'Amoxicillin',
              isItemSelected: true,
              labelText: 'medication'),
          isNull);

      expect(
          InputValidators.validateDrawerSearchInput(
              value: 'some', isItemSelected: true, labelText: 'medication'),
          isNull);
    });

    test('should validate a generic input', () {
      expect(InputValidators.validateGenericInput('', 'bp'), 'bp is required');
      expect(InputValidators.validateGenericInput('1x', 'bp'),
          'bp must be a number');

      expect(InputValidators.validateGenericInput('0', 'bp'),
          'bp cannot be less than 0');
    });
  });
}
