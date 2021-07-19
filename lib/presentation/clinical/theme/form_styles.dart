import 'package:flutter/material.dart';

import 'package:shared_themes/text_themes.dart';
import 'package:shared_themes/colors.dart';

abstract class PatientStyles {
  static TextStyle registerPatientSectionTitle =
      TextThemes.heavySize24Text(titleBlack);
  static TextStyle registerPatientSectionSubTitle =
      TextThemes.normalSize20Text(subtitleColor);
  static TextStyle textFormHintText = TextThemes.heavySize18Text(subtitleGrey);
  static TextStyle patientRegistrationBody =
      TextThemes.veryBoldSize18Text(textBodyColor);
  static TextStyle resultsTextStyle =
      TextThemes.veryBoldSize16Text(patientIDLightGrey);
  static TextStyle resultsTextStyleDarker =
      TextThemes.veryBoldSize16Text(titleColor);
}

class TextFormHintText extends StatelessWidget {
  final String hintText;
  const TextFormHintText({required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Text(
      hintText,
      style: PatientStyles.textFormHintText,
    );
  }
}

class RequiredTextFormHintText extends StatelessWidget {
  final String hintText;

  const RequiredTextFormHintText({required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        TextFormHintText(hintText: hintText),
        Flexible(child: Text('*', style: TextThemes.heavySize20Text(redAccent)))
      ],
    );
  }
}
