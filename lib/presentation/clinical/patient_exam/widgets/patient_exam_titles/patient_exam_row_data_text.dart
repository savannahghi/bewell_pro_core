import 'package:flutter/material.dart';

class PatientExamRowDataText extends StatelessWidget {
  final String rowText;

  const PatientExamRowDataText({required this.rowText});
  @override
  Widget build(BuildContext context) {
    return Text(
      rowText,
      style: Theme.of(context).textTheme.subtitle2,
    );
  }
}
