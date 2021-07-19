import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/presentation/clinical/theme/healthcloud_styles.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/text_themes.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  test('should expect the right text styles for HealthcloudStyles', () {
    final TextStyle _copyText = HCStyles.copyText;
    expect(_copyText, TextThemes.veryBoldSize16Text(titleBlack));

    final TextStyle _titleStyle = HCStyles.titleStyle;
    expect(_titleStyle, TextThemes.veryBoldSize20Text(titleBlack));

    final TextStyle _subtitleStyle = HCStyles.subtitleStyle;
    expect(_subtitleStyle, TextThemes.normalSize17Text(subtitleGrey));

    final TextStyle _smallScreenSmallTitle = HCStyles.smallScreenSmallTitle;
    expect(_smallScreenSmallTitle, TextThemes.normalSize16Text(subtitleGrey));

    final TextStyle _smallScreenLargeTitle = HCStyles.smallScreenLargeTitle;
    expect(_smallScreenLargeTitle, TextThemes.heavySize18Text(titleBlack));

    final TextStyle _smallScreenContentText = HCStyles.smallScreenContentText;
    expect(_smallScreenContentText, TextThemes.veryBoldSize18Text(titleBlack));

    final TextStyle _smallText = HCStyles.smallText;
    expect(_smallText, TextThemes.normalSize16Text(titleBlack));

    final TextStyle _resultsTextStyle = HCStyles.resultsTextStyle;
    expect(
        _resultsTextStyle, TextThemes.veryBoldSize18Text(patientIDLightGrey));

    final TextStyle _resultsTextStyleDark = HCStyles.resultsTextStyleDark;
    expect(_resultsTextStyleDark, TextThemes.veryBoldSize18Text(titleBlack));

    final TextStyle _testTitle = HCStyles.testTitle;
    expect(_testTitle, TextThemes.veryBoldSize18Text(titleBlack));

    final TextStyle _diagnosisTitle = HCStyles.diagnosisTitle;
    expect(_diagnosisTitle, TextThemes.veryBoldSize20Text(titleBlack));

    final TextStyle _dateTexts = HCStyles.dateTexts;
    expect(_dateTexts, TextThemes.normalSize15Text(subtitleGrey));
  });
}
