import 'package:flutter/material.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';

import 'package:intl/intl.dart';

import 'package:shared_themes/colors.dart';
import 'package:shared_themes/spaces.dart';
import 'package:bewell_pro_core/presentation/clinical/theme/healthcloud_styles.dart';

import 'package:shared_ui_components/badge.dart';
import 'package:shared_ui_components/buttons.dart';

class PatientExamTestItemSmall extends StatelessWidget {
  const PatientExamTestItemSmall({
    required this.testName,
    required this.testStatus,
    required this.patientName,
    required this.requestingDoctor,
    required this.recordedDate,
    required this.onRetireTestCallback,
  });

  final String testName;
  final String testStatus;
  final String patientName;
  final String requestingDoctor;
  final String recordedDate;
  final Function onRetireTestCallback;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // test name
                  SizedBox(
                    width: 230,
                    child: Wrap(children: <Widget>[
                      Text(
                          toBeginningOfSentenceCase(
                              testName.toString().toLowerCase())!,
                          style: HCStyles.testTitle),
                    ]),
                  ),
                  smallVerticalSizedBox,

                  // test status
                  Row(
                    children: <Widget>[
                      Text('Status: ', style: HCStyles.resultsTextStyle),
                      smallHorizontalSizedBox,
                      SILBadge(text: toBeginningOfSentenceCase(testStatus)!),
                    ],
                  ),
                ],
              ),
            ),
            smallHorizontalSizedBox,
            Flexible(
              child: SILSecondaryButton(
                buttonKey:
                    AppWidgetKeys.patientExamTestsRetireSmallScreenButtonKey,
                borderColor: redAccent,
                textColor: redAccent,
                onPressed: () => onRetireTestCallback(),
                text: retireText,
              ),
            ),
          ],
        ),
        smallVerticalSizedBox,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Verified by:', style: HCStyles.resultsTextStyle),
                const SizedBox(width: 70),
                Text(
                  requestingDoctor,
                  style: HCStyles.resultsTextStyleDark,
                ),
              ],
            ),
            smallVerticalSizedBox,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Date added:', style: HCStyles.resultsTextStyle),
                smallHorizontalSizedBox,
                Text(
                  recordedDate,
                  style: HCStyles.resultsTextStyleDark,
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
