import 'package:flutter/material.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_history/chief_complaint.dart';

import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_history/patient_history_wrapper.dart';

/// [common] and [shared]

class PatientHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsetsDirectional.only(bottom: 20),
        child: Column(
          children: <Widget>[
            /// Chief Complaint widget
            /// Used to record patient's chief complaint
            ChiefComplaint(),

            /// Patient history wrapper widget widget
            ///
            /// Used to add patient's history details
            /// The details include:
            /// 1 => History of presenting illness
            /// 2 => Medical & Surgical history details
            /// 3 => Family & social history
            PatientHistoryWrapper(),
          ],
        ),
      ),
    );
  }
}
