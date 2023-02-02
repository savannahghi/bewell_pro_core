// Package imports:
import 'package:sghi_core/misc_utilities/misc.dart';

// Project imports:
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';

RegExp validNumberRegexp = RegExp(r'^-?[0-9]+$');

class InputValidators {
  /// check if the value contains only numbers
  static bool isNumeric(String value) {
    return validNumberRegexp.hasMatch(value);
  }

  /// Validates the systolic blood pressure
  static String? validateSystoleBloodPressure(String? value) {
    if (value == null || value.isEmpty) return systoleNullPrompt;

    final int parsedValue = int.parse(value);

    if (parsedValue <= 0) return systoleZeroPrompt;
    if (parsedValue > 300) return systoleHighPrompt;

    return null;
  }

  /// Validates the systolic blood pressure
  static String? validateEmailAddress(String? value) {
    if (value != null && value.isEmpty) {
      return emailIsRequired;
    }
    if (value != null && !validateEmail(value.trim())) {
      return validEmailPrompt;
    }
    return null;
  }

  /// Validate a height vital
  static String? validateHeight(String? value) {
    if (value == null || value.isEmpty) return heightNullPrompt;

    final double parsedValue = double.parse(value);

    if (parsedValue <= 0) return heightZeroPrompt;

    if (parsedValue > 300) return heightInvalidPrompt;

    return null;
  }

  /// Validate a weight vital
  static String? validateWeight(String? value) {
    if (value == null || value.isEmpty) return weightNullPrompt;

    final double parsedValue = double.parse(value);

    if (parsedValue <= 0) return weightZeroPrompt;

    if (parsedValue > 700) return weightInvalidPrompt;

    return null;
  }

  /// Validate a pulse rate
  static String? validatePulse(String? value) {
    if (value == null || value.isEmpty) return pulseRequiredPrompt;

    final int parsedValue = int.parse(value);

    if (parsedValue <= 0) return pulseZeroPrompt;

    if (parsedValue > 120) return pulseHighPrompt;

    return null;
  }

  /// Validate a temperature reading
  static String? validateTemperature(String? value) {
    if (value == null || value.isEmpty) return tempRequiredPrompt;

    final double parsedValue = double.parse(value);

    if (parsedValue <= 0) return tempZeroPrompt;

    if (parsedValue > 50) return tempHighPrompt;

    return null;
  }

  /// Validate a temperature reading
  static String? validateRespiratoryRate(String? value) {
    if (value == null || value.isEmpty) return bmpRequiredPrompt;

    final int parsedValue = int.parse(value);

    if (parsedValue <= 0) return bmpZeroPrompt;

    if (parsedValue > 200) return bmpHighPrompt;

    return null;
  }

  /// Validate a temperature reading
  static String? validateBloodOxygen(String? value) {
    if (value == null || value.isEmpty) return spo2RequiredPrompt;

    final double parsedValue = double.parse(value);

    if (parsedValue <= 0) return spo2ZeroPrompt;

    if (parsedValue > 100) return spo2HighPrompt;

    return null;
  }

  /// Validates the systolic blood pressure
  static String? validateDiastoleBloodPressure(String value) {
    if (value.isEmpty) {
      return diastoleNullPrompt;
    }
    if (int.parse(value) <= 0) {
      return diastoleZeroPrompt;
    }
    if (int.parse(value) > 200) {
      return diastoleHighPrompt;
    }
    return null;
  }

  /// Validates a user PIN
  ///
  /// The [value] is the PIN entered by the user
  ///
  /// [initiallyEnteredPin] is used in the case of
  /// verifying an already entered PIN
  static String? validatePin(
      {required String? value, String? initiallyEnteredPin}) {
    if (value == null || value.isEmpty) {
      return confirmPinPrompt;
    }
    if (!isNumeric(value)) {
      return loginPinDigits;
    }
    if (value.length < 4) {
      return loginPinLength;
    }

    if (initiallyEnteredPin != null) {
      if (value != initiallyEnteredPin) {
        return confirmPinMatch;
      }
    }
    return null;
  }

  /// Validates the test of a drawer search input
  static String? validateDrawerSearchInput(
      {required String value,
      required String labelText,
      required bool isItemSelected}) {
    if (value.isEmpty) {
      return 'Enter a $labelText to search';
    }

    if (value.length <= 2) {
      return searchInputAddMoreCharPrompt;
    }

    if (isItemSelected) {
      return null;
    }

    if (isItemSelected == false) {
      return 'Select a $labelText';
    }

    return null;
  }

  /// Validates a general input
  ///
  /// PARAMS
  ///
  /// - [value] the value to be validated
  /// - [valueString] the generic display name
  /// - [checkNull] checks for null in the values
  /// - [checkNumeric] checks if the input is a number
  /// - [checkNegative] checks if the input is a negative
  static String? validateGenericInput(
    String? value,
    String valueString, {
    bool checkNull = true,
    bool checkNumeric = true,
    bool checkNegative = true,
  }) {
    String getRequiredValue(String val, String validationText) =>
        '$val $validationText';

    if (checkNull) {
      if (value == null || value.isEmpty) {
        return getRequiredValue(valueString, 'is required');
      }
    }

    if (checkNumeric) {
      if (int.tryParse(value!) == null) {
        return getRequiredValue(valueString, 'must be a number');
      }
    }

    if (checkNegative) {
      if (int.parse(value!) <= 0) {
        return getRequiredValue(valueString, 'cannot be less than 0');
      }
    }

    return null;
  }
}
