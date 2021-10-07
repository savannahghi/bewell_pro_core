// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:misc_utilities/responsive_widget.dart';
import 'package:shared_themes/colors.dart';

class PatientExamCardTitle extends StatelessWidget {
  final String title;

  const PatientExamCardTitle({required this.title});
  @override
  Widget build(BuildContext context) {
    final bool isLargeScreenDevice = ResponsiveWidget.isLargeScreen(context);
    return Text(
      title,
      style: isLargeScreenDevice
          ? Theme.of(context).textTheme.subtitle1!.copyWith(color: black)
          : Theme.of(context).textTheme.bodyText1!.copyWith(color: black),
    );
  }
}
