// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:sghi_core/shared_themes/colors.dart';
import 'package:sghi_core/shared_themes/text_themes.dart';

// Project imports:
import 'package:bewell_pro_core/presentation/clinical/theme/form_styles.dart';

void main() {
  test('should expect the right text styles for BasicDetailsStyles', () {
    final TextStyle _registerPatientSectionTitle =
        PatientStyles.registerPatientSectionTitle;
    expect(
        _registerPatientSectionTitle, TextThemes.heavySize24Text(titleBlack));

    final TextStyle _registerPatientSectionSubTitle =
        PatientStyles.registerPatientSectionSubTitle;
    expect(_registerPatientSectionSubTitle,
        TextThemes.normalSize20Text(subtitleColor));

    final TextStyle _textFormHintText = PatientStyles.textFormHintText;
    expect(_textFormHintText, TextThemes.heavySize18Text(subtitleGrey));

    final TextStyle _patientRegistrationBody =
        PatientStyles.patientRegistrationBody;
    expect(
        _patientRegistrationBody, TextThemes.veryBoldSize18Text(textBodyColor));

    final TextStyle _resultsTextStyle = PatientStyles.resultsTextStyle;
    expect(
        _resultsTextStyle, TextThemes.veryBoldSize16Text(patientIDLightGrey));

    final TextStyle _resultsTextStyleDarker =
        PatientStyles.resultsTextStyleDarker;
    expect(_resultsTextStyleDarker, TextThemes.veryBoldSize16Text(titleColor));
  });

  testWidgets('TextFormHintText renders correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: TextFormHintText(hintText: 'this is the hint text'),
    ));

    expect(find.text('this is the hint text'), findsOneWidget);
  });

  testWidgets('RequiredTextFormHintText renders correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: RequiredTextFormHintText(
        hintText: 'this is the hint text',
      ),
    ));

    expect(find.text('this is the hint text'), findsOneWidget);
  });
}
