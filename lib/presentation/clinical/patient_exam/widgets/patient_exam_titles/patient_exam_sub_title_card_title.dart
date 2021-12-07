// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:shared_themes/colors.dart';

class PatientExamSubTitleCardTitle extends StatelessWidget {
  final String title;

  const PatientExamSubTitleCardTitle({required this.title});
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.subtitle2!.copyWith(color: black),
    );
  }
}
