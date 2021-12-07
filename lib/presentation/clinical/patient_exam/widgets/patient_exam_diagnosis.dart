// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:misc_utilities/responsive_widget.dart';
import 'package:shared_themes/colors.dart';

// Project imports:
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/diagnosis/patient_diagnosis_table.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_exam_buttons/exam_item_add_button.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_exam_titles/patient_exam_card_title.dart';

class PatientExamDiagnosis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool isLargeScreenDevice = ResponsiveWidget.isLargeScreen(context);
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: isLargeScreenDevice ? 32 : 1, vertical: 20),
      color: white,
      child: Column(
        children: <Widget>[
          Card(
            elevation: 0,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal:
                            ResponsiveWidget.isSmallScreen(context) ? 3 : 32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const <Widget>[
                        PatientExamCardTitle(title: 'Diagnoses'),
                        ExamItemAddButton(
                          drawerType: DrawerType.diagnosis,
                          buttonText: 'Add Diagnosis',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const PatientDiagnosisTable(),
        ],
      ),
    );
  }
}
