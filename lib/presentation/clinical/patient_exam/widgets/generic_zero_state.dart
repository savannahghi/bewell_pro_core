// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:shared_themes/colors.dart';

// Project imports:
import 'package:bewell_pro_core/domain/core/value_objects/asset_strings.dart';

/// shows information that the patient has no records of past visits
class GenericZeroStateWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? imagePath;

  const GenericZeroStateWidget(
      {required this.title, required this.subtitle, this.imagePath});

  @override
  Widget build(BuildContext context) {
    final double subtitleWidth = MediaQuery.of(context).size.width * 0.7;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          imagePath ?? patientExamZeroStateIconUrl,
          height: 72,
          width: 72,
        ),
        Container(
          padding: const EdgeInsets.all(12),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ),
        SizedBox(
          width: subtitleWidth,
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style:
                Theme.of(context).textTheme.subtitle2!.copyWith(color: black54),
          ),
        ),
      ],
    );
  }
}
