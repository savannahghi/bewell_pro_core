// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_examination/general_systems_exam_widget.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_examination/review_of_systems.dart';

/// This is the widget for step 3 of the patient examination process
///
/// It should not be confused with the [PatientExam] widget which combines
/// all the steps into one widget
///
class PatientExamination extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        /// General Examination widget
        GeneralSystemsExamWidget(),

        /// Review of System widget
        ReviewOfSystems(),
      ],
    );
  }
}
