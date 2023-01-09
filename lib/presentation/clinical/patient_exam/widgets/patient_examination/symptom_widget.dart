// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:sghi_core/shared_themes/colors.dart';

class SymptomWidget extends StatelessWidget {
  final String symptomText;
  final bool isNormal;

  const SymptomWidget({required this.symptomText, this.isNormal = false});
  @override
  Widget build(BuildContext context) {
    return isNormal
        ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              symptomText,
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(color: healthcloudPrimaryColor),
            ),
          )
        : Container(
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: BoxDecoration(
                color: healthcloudPrimaryColor,
                borderRadius: BorderRadius.circular(30)),
            child: Text(
              symptomText,
              style:
                  Theme.of(context).textTheme.subtitle2!.copyWith(color: white),
            ),
          );
  }
}
