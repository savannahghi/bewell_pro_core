import 'package:flutter/material.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/presentation/clinical/common/widgets/bewell_table_header.dart';
import 'package:bewell_pro_core/presentation/clinical/common/widgets/bewell_table_title_action.dart';
import 'package:bewell_pro_core/presentation/clinical/common/widgets/bewell_table_header_value.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/allergies/exam_allergies_table.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_exam_buttons/exam_item_add_button.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_exam_titles/patient_exam_card_title.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/problems/patient_exam_problems.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/vitals/vitals.dart';
import 'package:misc_utilities/responsive_widget.dart';

import 'package:shared_themes/colors.dart';

/// This is the first step of patient exam,
/// this widget is inserted into the widget tree after you Start an exam
///
/// It is an Expanded expansion tile by default.
/// It renders the following sections of patient exam;
/// 1 => [PatientProblemTable] Card which has Ongoing conditions
/// 2 => [ExamAllergiesTable] Card which has patient allergy records
/// 3 => [Vitals] Card which has the various stats on patient vitals
class PatientExamReview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool isLargeScreenDevice = SILResponsiveWidget.isLargeScreen(context);
    return Column(
      children: <Widget>[
        /// Problems Card
        Container(
          decoration: BoxDecoration(
              color: white, border: Border.all(color: grey.withOpacity(0.3))),
          margin: EdgeInsets.all(isLargeScreenDevice ? 20 : 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: isLargeScreenDevice ? 15 : 8),
                  child: Column(
                    children: <Widget>[
                      const BewellTableTitleAction(
                        title: ongoingConditionsText,
                        actionWidget: ExamItemAddButton(
                          buttonText: addConditionText,
                          drawerType: DrawerType.problem,
                        ),
                      ),
                      if (isLargeScreenDevice)
                        BewellTableHeader(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const <Widget>[
                              BewellTableHeaderValue(
                                  flex: 5, value: 'Condition'),
                              BewellTableHeaderValue(flex: 2, value: 'Status'),
                              BewellTableHeaderValue(flex: 3, value: 'Doctor'),
                              BewellTableHeaderValue(flex: 3, value: 'Date'),
                              BewellTableHeaderValue(flex: 2, value: 'Actions'),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: PatientProblemTable(),
                )
              ],
            ),
          ),
        ),

        /// Allergies Card
        Container(
          decoration: BoxDecoration(
              color: white, border: Border.all(color: grey.withOpacity(0.3))),
          margin: EdgeInsets.all(isLargeScreenDevice ? 20 : 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: isLargeScreenDevice ? 15 : 8),
                  child: Column(
                    children: <Widget>[
                      const BewellTableTitleAction(
                        title: 'Allergies',
                        actionWidget: ExamItemAddButton(
                          buttonText: 'Add Allergy',
                          drawerType: DrawerType.allergy,
                        ),
                      ),
                      if (isLargeScreenDevice)
                        BewellTableHeader(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const <Widget>[
                              BewellTableHeaderValue(flex: 5, value: 'Allergy'),
                              BewellTableHeaderValue(flex: 2, value: 'Status'),
                              BewellTableHeaderValue(flex: 3, value: 'Doctor'),
                              BewellTableHeaderValue(flex: 3, value: 'Date'),
                              BewellTableHeaderValue(flex: 2, value: 'Actions'),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: ExamAllergiesTable(),
                ),
              ],
            ),
          ),
        ),

        /// Vitals Card
        Container(
          margin: EdgeInsets.all(isLargeScreenDevice ? 20 : 10),
          decoration: BoxDecoration(
              color: white, border: Border.all(color: grey.withOpacity(0.3))),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(
                      top: 24.0, bottom: 15.0, left: 22.0, right: 42.0),
                  color: Colors.white,
                  child: const PatientExamCardTitle(title: 'Vitals'),
                ),
                Vitals()
              ],
            ),
          ),
        ),
      ],
    );
  }
}
