// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:intl/intl.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:shared_ui_components/badge.dart';
import 'package:shared_ui_components/buttons.dart';

// Project imports:
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';

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
                          style: TextThemes.veryBoldSize18Text(titleBlack)),
                    ]),
                  ),
                  smallVerticalSizedBox,

                  // test status
                  Row(
                    children: <Widget>[
                      Text('Status: ',
                          style: TextThemes.veryBoldSize18Text(
                              patientIDLightGrey)),
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
                Text('Verified by:',
                    style: TextThemes.veryBoldSize18Text(patientIDLightGrey)),
                const SizedBox(width: 70),
                Text(
                  requestingDoctor,
                  style: TextThemes.veryBoldSize18Text(patientIDLightGrey),
                ),
              ],
            ),
            smallVerticalSizedBox,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Date added:',
                    style: TextThemes.veryBoldSize18Text(patientIDLightGrey)),
                smallHorizontalSizedBox,
                Text(
                  recordedDate,
                  style: TextThemes.veryBoldSize18Text(patientIDLightGrey),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
