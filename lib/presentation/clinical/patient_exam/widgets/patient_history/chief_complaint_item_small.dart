import 'package:flutter/material.dart';

import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:shared_ui_components/buttons.dart';

class ChiefComplaintItemSmall extends StatelessWidget {
  const ChiefComplaintItemSmall({
    Key? key,
    required this.problemName,
    required this.recorder,
    required this.recordedDate,
    required this.clinicalStatus,
    required this.retireCompositionFunction,
  }) : super(key: key);

  final String clinicalStatus;
  final String problemName;
  final String recordedDate;
  final String recorder;
  final void Function() retireCompositionFunction;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(problemName, style: TextThemes.veryBoldSize18Text(titleBlack)),
            smallVerticalSizedBox,
            Text(
              recorder,
              style: TextThemes.normalSize16Text(subtitleGrey),
            )
          ],
        ),
        size15VerticalSizedBox,
        Text(
          'Date: $recordedDate',
          style: TextThemes.normalSize16Text(subtitleGrey),
        ),
        size15VerticalSizedBox,
        Row(
          children: <Widget>[
            Text(
              statusText,
              style: TextThemes.normalSize16Text(subtitleGrey),
            ),
            Text(
              clinicalStatus,
              style: TextThemes.normalSize16Text(subtitleGrey),
            )
          ],
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 1),
            child: SILSecondaryButton(
              buttonKey: AppWidgetKeys.retireChiefComplaintSmallButtonKey,
              onPressed: () => retireCompositionFunction(),
              borderColor: redAccent,
              text: retireText,
              textColor: redAccent,
            ),
          ),
        ),
      ],
    );
  }
}
