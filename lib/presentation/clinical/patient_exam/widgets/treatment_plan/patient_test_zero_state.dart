import 'package:flutter/material.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/quick_access_item_modal.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/generic_zero_state.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/summary/quick_access_item.dart';
import 'package:shared_themes/spaces.dart';

class PatientTestZeroState extends StatelessWidget {
  const PatientTestZeroState(
      {required this.recordedDiagnosisID, required this.recordedDiagnosis});

  final String recordedDiagnosis;
  final String recordedDiagnosisID;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(quickAccessTitle,
                style: Theme.of(context).textTheme.bodyText1),
          ),
        ),

        /// show quick access items if the data is null
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Wrap(
            children: <Widget>[
              ...quickAccessItemTests
                  .map((QuickAccessItem test) => QuickAccessItemModal(
                        test: test,
                        diagnosisID: recordedDiagnosisID,
                        diagnosisName: recordedDiagnosis,
                        type: QuickAccessType.test,
                      )),
            ],
          ),
        ),
        smallVerticalSizedBox,
        const GenericZeroStateWidget(
          title: addPatientTestTitle,
          subtitle: addPatientTestSubtitle,
        ),
      ],
    );
  }
}
