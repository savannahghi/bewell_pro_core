// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_exam_buttons/next_tile_button.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_exam_buttons/previous_tile_button.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_exam_diagnosis.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_exam_review.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_exam_selected.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_exam_titles/patient_exam_titles.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_examination/patient_examination.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_history/patient_history.dart';

class PatientExamTiles extends StatefulWidget {
  @override
  _PatientExamTilesState createState() => _PatientExamTilesState();
}

class _PatientExamTilesState extends State<PatientExamTiles> {
  late int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: Key('builder ${selectedIndex.toString()}'),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: patientExamItems.length,
      itemBuilder: (BuildContext context, int index) {
        final PatientExamItem patientExamItem = patientExamItems[index];
        return ExpansionTile(
          key: Key(index.toString()),
          initiallyExpanded: index == selectedIndex,
          onExpansionChanged: (bool isExpanded) {
            if (isExpanded) {
              setState(() {
                selectedIndex = index;
              });
            } else {
              setState(() {
                selectedIndex = -1;
              });
            }
          },
          title: Row(
            children: <Widget>[
              PatientExamSelected(index: index, selected: selectedIndex),
              PatientExamTitles(
                title: patientExamItem.title,
                subtitle: patientExamItem.subtitle,
              ),
            ],
          ),
          children: <Widget>[
            patientExamItem.widget,
            Container(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  if (selectedIndex != 0) ...<Widget>[
                    PreviousTileButton(callback: () {
                      setState(() {
                        selectedIndex = index - 1;
                      });
                    }),
                    const SizedBox(width: 1),
                  ],
                  if (selectedIndex != 3) ...<Widget>[
                    const SizedBox(width: 1),
                    NextTileButton(callback: () {
                      setState(() {
                        selectedIndex = index + 1;
                      });
                    }),
                  ]
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

List<PatientExamItem> patientExamItems = <PatientExamItem>[
  PatientExamItem(
    title: 'Patient Review',
    subtitle: 'Conditions, Allergies and vitals',
    widget: PatientExamReview(),
  ),
  PatientExamItem(
    title: 'Patient History',
    subtitle: 'Chief complaint and patient history',
    widget: PatientHistory(),
  ),
  PatientExamItem(
    title: 'Patient Examination',
    subtitle: 'General exam and review of systems',
    widget: PatientExamination(),
  ),
  PatientExamItem(
    title: 'Treatment plan',
    subtitle: 'Diagnosis, tests and medications',
    widget: PatientExamDiagnosis(),
  ),
];

class PatientExamItem {
  final String title;
  final String subtitle;
  final Widget widget;

  PatientExamItem(
      {required this.title, required this.subtitle, required this.widget});
}
