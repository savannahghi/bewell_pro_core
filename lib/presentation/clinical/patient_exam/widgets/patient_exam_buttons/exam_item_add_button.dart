// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:sghi_core/shared_themes/colors.dart';
import 'package:sghi_core/ui_components/src/buttons.dart';

// Project imports:
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/pages/patient_exam.dart';

class ExamItemAddButton extends StatelessWidget {
  final String buttonText;
  final String? diagnosisID;
  final String? diagnosisName;
  final DrawerType? drawerType;

  const ExamItemAddButton({
    required this.buttonText,
    this.drawerType,
    this.diagnosisName,
    this.diagnosisID,
  });

  void patientExamAddItemFunction(BuildContext context) {
    if (buttonText == addMedication) {
      AddMedicationObject().diagnosisName.add(this.diagnosisName);
      AddMedicationObject().diagnosisID.add(this.diagnosisID);
    } else {
      AddTestObject().diagnosisName.add(this.diagnosisName);
      AddTestObject().diagnosisID.add(this.diagnosisID);
    }

    /// we add the selected drawer (the drawer you want to open)
    /// to patient exam's [selectedDrawer] behaviorSubject
    context
        .findAncestorWidgetOfExactType<PatientExam>()
        ?.selectedDrawer
        .add(drawerType!);

    /// open the end drawer using the scaffold key
    context
        .findAncestorWidgetOfExactType<PatientExam>()
        ?.scaffoldKey
        .currentState
        ?.openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return SILPrimaryButton(
        buttonKey: AppWidgetKeys.examItemButtonKeyKey,
        onPressed: () => patientExamAddItemFunction(context),
        text: buttonText,
        buttonColor: healthcloudAccentColor.withOpacity(0.3),
        textColor: healthcloudAccentColor);
  }
}
