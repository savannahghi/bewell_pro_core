// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/text_themes.dart';

class PatientExamActiveTitleIcon extends StatelessWidget {
  const PatientExamActiveTitleIcon({required this.iconText});

  final String iconText;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: healthcloudAccentColor,
      radius: 20,
      child: Text(
        iconText,
        style: TextThemes.normalSize14Text(white),
      ),
    );
  }
}
