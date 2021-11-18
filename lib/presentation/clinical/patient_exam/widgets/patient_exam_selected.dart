// Flutter imports:
import 'package:flutter/widgets.dart';

// Project imports:
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_exams_title_icons/patient_exam_active_title_icon.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_exams_title_icons/patient_exam_inactive_title_icon.dart';

class PatientExamSelected extends StatelessWidget {
  const PatientExamSelected(
      {Key? key, required this.index, required this.selected})
      : super(key: key);

  final int index;
  final int selected;

  @override
  Widget build(BuildContext context) {
    if (index != selected) {
      return PatientExamInActiveTitleIcon(iconText: '${index + 1}');
    } else {
      return PatientExamActiveTitleIcon(iconText: '${index + 1}');
    }
  }
}
