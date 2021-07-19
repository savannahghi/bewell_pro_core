import 'package:flutter/material.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/numbers_constants.dart';

/// [common] and [shared]
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/treatment_plan/patient_exam_medications.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/treatment_plan/patient_exam_tests.dart';
import 'package:shared_themes/colors.dart';

class PatientTabs extends StatelessWidget {
  const PatientTabs(
      {required this.recordedDiagnosisID, required this.recordedDiagnosis});
  final String recordedDiagnosisID;
  final String recordedDiagnosis;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: number480,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: white,
            elevation: 0,
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(0.0),
              child: TabBar(
                labelColor: black,
                tabs: <Tab>[
                  Tab(text: patientTestTabTitle),
                  Tab(text: patientMedicationTabTitle),
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              PatientExamTests(
                recordedDiagnosis: recordedDiagnosis,
                recordedDiagnosisID: recordedDiagnosisID,
              ),
              PatientExamMedications(
                recordedDiagnosisID: recordedDiagnosisID,
                recordedDiagnosis: recordedDiagnosis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
