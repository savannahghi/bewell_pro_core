// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:intl/intl.dart';
import 'package:sghi_core/misc_utilities/responsive_widget.dart';
import 'package:sghi_core/shared_themes/colors.dart';
import 'package:sghi_core/shared_themes/spaces.dart';

// Project imports:
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/generic_zero_state.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_exam_titles/patient_exam_card_title.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/patient_timeline_divider_widget.dart';

class ExamSummaryMedications extends StatelessWidget {
  final List<dynamic> examMedications;
  const ExamSummaryMedications({required this.examMedications});

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = ResponsiveWidget.isSmallScreen(context);

    return this.examMedications.isEmpty
        ? Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Card(
              elevation: 0,
              margin: const EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.fromLTRB(22, 0, 42, 15),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const <Widget>[
                            /// exam summary
                            PatientExamCardTitle(title: medicationTitle),
                          ],
                        ),
                        PatientTimelineDividerWidget(),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: GenericZeroStateWidget(
                            title: medicationTitle,
                            subtitle: noMedicationsAdded,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ))
        : Card(
            elevation: 0,
            margin: isSmallScreen
                ? const EdgeInsets.all(10)
                : const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const <Widget>[
                          PatientExamCardTitle(title: medicationTitle),
                        ],
                      ),
                      verySmallHorizontalSizedBox,
                      PatientTimelineDividerWidget(),
                    ],
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: examMedications.length,
                  itemBuilder: (BuildContext context, int index) {
                    final dynamic record = examMedications[index];
                    final String name =
                        record['medicationCodeableConcept']['text'].toString();
                    final String requester =
                        record['requester']['display'].toString();
                    final String date = record['authoredOn'].toString();
                    final String prescription =
                        record['dosageInstruction'][0]['text'].toString();

                    final List<Widget> medicationWidgets = <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          toBeginningOfSentenceCase(
                              name.toString().toLowerCase())!,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),

                      /// Ordered By: Doctor
                      Padding(
                        padding: isSmallScreen
                            ? const EdgeInsets.only(bottom: 5.0)
                            : const EdgeInsets.only(),
                        child: Text.rich(
                          TextSpan(
                            children: <InlineSpan>[
                              TextSpan(
                                text: orderedByText,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                        fontWeight: !isSmallScreen
                                            ? FontWeight.bold
                                            : FontWeight.normal),
                              ),
                              TextSpan(
                                text: requester,
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                            ],
                          ),
                        ),
                      ),

                      /// Ordered On: Date
                      Padding(
                        padding: isSmallScreen
                            ? const EdgeInsets.only(bottom: 10.0)
                            : const EdgeInsets.only(),
                        child: Text.rich(
                          TextSpan(
                            children: <InlineSpan>[
                              TextSpan(
                                text: orderedOnText,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                        fontWeight: !isSmallScreen
                                            ? FontWeight.bold
                                            : FontWeight.normal),
                              ),
                              TextSpan(
                                text: date,
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (isSmallScreen)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            prescription,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    color: grey, fontWeight: FontWeight.w600),
                          ),
                        )
                      else
                        Text(
                          prescription,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  color: grey, fontWeight: FontWeight.w600),
                        ),
                    ];
                    return Card(
                      elevation: 0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: !isSmallScreen

                          /// Large screen
                          ? Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              width: double.infinity,
                              padding: const EdgeInsets.only(top: 4),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Flexible(
                                    flex: 8,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Wrap(
                                            children: medicationWidgets.sublist(
                                                0, 3)),
                                        smallVerticalSizedBox,

                                        /// Prescription
                                        ...medicationWidgets.sublist(3, 4)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          // small screen
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: medicationWidgets,
                            ),
                    );
                  },
                )
              ],
            ),
          );
  }
}
