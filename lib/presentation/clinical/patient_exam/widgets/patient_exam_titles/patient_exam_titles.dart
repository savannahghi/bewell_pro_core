// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

class PatientExamTitles extends StatelessWidget {
  final String title;
  final String subtitle;

  const PatientExamTitles({required this.title, required this.subtitle});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(left: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: TextThemes.boldSize16Text(black),
            ),
            verySmallVerticalSizedBox,
            Text(
              subtitle,
              style: TextThemes.normalSize12Text(black54),
            ),
          ],
        ),
      ),
    );
  }
}
