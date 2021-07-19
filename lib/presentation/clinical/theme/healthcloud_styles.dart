import 'package:flutter/material.dart';

import 'package:shared_themes/text_themes.dart';
import 'package:shared_themes/colors.dart';

abstract class HCStyles {
  static TextStyle copyText = TextThemes.veryBoldSize16Text(titleBlack);
  static TextStyle titleStyle = TextThemes.veryBoldSize20Text(titleBlack);
  static TextStyle subtitleStyle = TextThemes.normalSize17Text(subtitleGrey);
  static TextStyle smallScreenSmallTitle =
      TextThemes.normalSize16Text(subtitleGrey);
  static TextStyle smallScreenLargeTitle =
      TextThemes.heavySize18Text(titleBlack);
  static TextStyle smallScreenContentText =
      TextThemes.veryBoldSize18Text(titleBlack);
  static TextStyle smallText = TextThemes.normalSize16Text(titleBlack);
  static TextStyle resultsTextStyle =
      TextThemes.veryBoldSize18Text(patientIDLightGrey);
  static TextStyle resultsTextStyleDark =
      TextThemes.veryBoldSize18Text(titleBlack);
  static TextStyle testTitle = TextThemes.veryBoldSize18Text(titleBlack);
  static TextStyle diagnosisTitle = TextThemes.veryBoldSize20Text(titleBlack);
  static TextStyle dateTexts = TextThemes.normalSize15Text(subtitleGrey);
}
