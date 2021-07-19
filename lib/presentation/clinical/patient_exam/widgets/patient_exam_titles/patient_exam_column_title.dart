import 'package:flutter/material.dart';
import 'package:shared_themes/colors.dart';

class PatientExamColumnTitle extends StatelessWidget {
  final String title;
  const PatientExamColumnTitle({required this.title});
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.subtitle2!.copyWith(color: black54),
    );
  }
}
