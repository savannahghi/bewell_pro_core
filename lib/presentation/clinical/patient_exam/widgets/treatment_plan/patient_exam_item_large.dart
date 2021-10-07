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

class PatientExamTestItemLarge extends StatelessWidget {
  const PatientExamTestItemLarge({
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Flexible(
          flex: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Test Name
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    flex: 7,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Flexible(
                            flex: 5,
                            child: Text(
                                toBeginningOfSentenceCase(
                                    testName.toString().toLowerCase())!,
                                style:
                                    TextThemes.veryBoldSize18Text(titleBlack)),
                          ),
                          size15HorizontalSizedBox,
                          Flexible(
                            child: SILBadge(
                                text: toBeginningOfSentenceCase(testStatus)!),
                          ),
                        ]),
                  ),
                  // Retire button
                  Flexible(
                    child: SILSecondaryButton(
                      buttonKey: AppWidgetKeys
                          .patientExamTestsRetireLargeScreenButtonKey,
                      onPressed: () => onRetireTestCallback(),
                      textColor: red,
                      text: retireText,
                      borderColor: red,
                    ),
                  ),
                ],
              ),
              smallVerticalSizedBox,
              Row(
                children: <Widget>[
                  Text('Verified by:',
                      style: TextThemes.veryBoldSize18Text(patientIDLightGrey)),
                  smallHorizontalSizedBox,
                  Text(
                    requestingDoctor,
                    style: TextThemes.veryBoldSize18Text(patientIDLightGrey),
                  ),
                ],
              ),
              smallVerticalSizedBox,
              Row(
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
          ),
        ),
      ],
    );
  }
}
