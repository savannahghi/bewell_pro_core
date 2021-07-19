import 'package:flutter/material.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';

import 'package:rxdart/rxdart.dart';
import 'package:shared_themes/colors.dart';

const String lowText = 'LOW';
const String normalText = 'NORMAL';
const String highText = 'HIGH';

/// This class is a blueprint for storing vital constants
class VitalBound {
  final double lowerBound;
  final double upperBound;

  VitalBound({required this.lowerBound, required this.upperBound});
}

/// the following values were retrieved from the [NEWS 2 Final Report] page 29
/// downloaded from https://www.rcplondon.ac.uk/file/8636/download
/// from the website https://www.rcplondon.ac.uk/projects/outputs/national-early-warning-score-news-2
///
/// Alternatively you can get them from the [Optimal Health Vision] document found at
/// https://drive.google.com/file/d/1gptxtDzsWXqFTWT5n-uZkbhDgWIeqoZy/view?usp=sharing
/// on page 96

/// The range of the normal pulse rate
/// Units of measurements are Beats Per Minute (BPM).
VitalBound normalPulseRange = VitalBound(lowerBound: 51, upperBound: 90);

/// The range of the normal systolic blood pressure.
/// Units of measurements are mmHg
VitalBound normalBloodPressureRange =
    VitalBound(lowerBound: 90, upperBound: 120);

/// The range of the normal respiratory rate.
/// Units of measurements are Beats Per Minute
VitalBound normalRespiratoryRateRange =
    VitalBound(lowerBound: 12, upperBound: 20);

/// The range of the normal temperature.
/// Units of measurements are Degrees Celsius
VitalBound normalTemperatureRange =
    VitalBound(lowerBound: 36.1, upperBound: 38.5);

/// The range of the normal Body Mass Index (BMI).
/// Units of measurements are (kg/m2)
VitalBound normalBMIRange = VitalBound(lowerBound: 18.5, upperBound: 25.0);

/// The range of the Blood Oxygen Concentration (SpO2).
/// Units of measurements are a percentage (%)
VitalBound normalSpo2Range = VitalBound(lowerBound: 88, upperBound: 92);

void checkVitals({
  required String value,
  required VitalType vitalType,
  required BehaviorSubject<dynamic> updateValue,
}) {
  String? evaluatedValue;
  final double parsedValue = double.parse(value).toDouble();

  switch (vitalType) {
    case VitalType.pulse:
      if (parsedValue < normalPulseRange.lowerBound) evaluatedValue = lowText;
      if (parsedValue >= normalPulseRange.lowerBound &&
          parsedValue <= normalPulseRange.upperBound) {
        evaluatedValue = normalText;
      }
      if (parsedValue > normalPulseRange.upperBound) evaluatedValue = highText;
      break;

    case VitalType.systolicBloodPressure:
      if (parsedValue < normalBloodPressureRange.lowerBound) {
        evaluatedValue = lowText;
      }
      if (parsedValue >= normalBloodPressureRange.lowerBound &&
          parsedValue <= normalBloodPressureRange.upperBound) {
        evaluatedValue = normalText;
      }
      if (parsedValue > normalBloodPressureRange.upperBound) {
        evaluatedValue = highText;
      }
      break;

    case VitalType.diastolicBloodPressure:
      if (parsedValue < normalBloodPressureRange.lowerBound) {
        evaluatedValue = lowText;
      }
      if (parsedValue >= normalBloodPressureRange.lowerBound &&
          parsedValue <= normalBloodPressureRange.upperBound) {
        evaluatedValue = normalText;
      }
      if (parsedValue > normalBloodPressureRange.upperBound) {
        evaluatedValue = highText;
      }
      break;

    case VitalType.respiratoryRate:
      if (parsedValue < normalRespiratoryRateRange.lowerBound) {
        evaluatedValue = lowText;
      }
      if (parsedValue >= normalRespiratoryRateRange.lowerBound &&
          parsedValue <= normalRespiratoryRateRange.upperBound) {
        evaluatedValue = normalText;
      }
      if (parsedValue > normalRespiratoryRateRange.upperBound) {
        evaluatedValue = highText;
      }
      break;

    case VitalType.temperature:
      if (parsedValue < normalTemperatureRange.lowerBound) {
        evaluatedValue = lowText;
      }
      if (parsedValue >= normalTemperatureRange.lowerBound &&
          parsedValue <= normalTemperatureRange.upperBound) {
        evaluatedValue = normalText;
      }
      if (parsedValue > normalTemperatureRange.upperBound) {
        evaluatedValue = highText;
      }
      break;

    case VitalType.bmi:
      if (parsedValue < normalBMIRange.lowerBound) evaluatedValue = lowText;
      if (parsedValue >= normalBMIRange.lowerBound &&
          parsedValue <= normalBMIRange.upperBound) {
        evaluatedValue = normalText;
      }
      if (parsedValue > normalBMIRange.upperBound) evaluatedValue = highText;
      break;

    case VitalType.bloodOxygen:
      if (parsedValue < normalSpo2Range.lowerBound) evaluatedValue = lowText;
      if (parsedValue >= normalSpo2Range.lowerBound &&
          parsedValue <= normalSpo2Range.upperBound) {
        evaluatedValue = normalText;
      }
      if (parsedValue > normalSpo2Range.upperBound) evaluatedValue = highText;
      break;
  }

  updateValue.add(evaluatedValue);
}

Color getVitalColor(
    {required String? vitalText, required BuildContext context}) {
  const Color primaryColor = healthcloudPrimaryColor;
  if (vitalText == lowText) return redAccent;
  if (vitalText == normalText) return primaryColor;
  if (vitalText == highText) return redAccent;

  return primaryColor;
}
