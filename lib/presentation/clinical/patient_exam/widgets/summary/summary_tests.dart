import 'package:flutter/material.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/patient_timeline_divider_widget.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_exam_titles/patient_exam_card_title.dart';
import 'package:intl/intl.dart';
import 'package:misc_utilities/responsive_widget.dart';
import 'package:shared_themes/spaces.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/generic_zero_state.dart';

class ExamSummaryTests extends StatelessWidget {
  final List<dynamic> examTests;
  const ExamSummaryTests({Key? key, required this.examTests}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = ResponsiveWidget.isSmallScreen(context);
    return this.examTests.isEmpty
        ? Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Card(
              elevation: 0,
              margin: EdgeInsets.all(isSmallScreen ? 10 : 20),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.fromLTRB(22, 0, 42, 15),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const <Widget>[
                            PatientExamCardTitle(title: testTitle),
                          ],
                        ),
                        PatientTimelineDividerWidget(),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: GenericZeroStateWidget(
                            title: testTitle,
                            subtitle: noTestsAdded,
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
                  padding: EdgeInsets.all(isSmallScreen ? 10 : 20),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const <Widget>[
                          PatientExamCardTitle(title: testTitle),
                        ],
                      ),
                      verySmallVerticalSizedBox,
                      PatientTimelineDividerWidget(),
                    ],
                  ),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: examTests.length,
                    itemBuilder: (BuildContext context, int index) {
                      final String testName =
                          examTests[index]['code']['text'].toString();
                      final String testType =
                          examTests[index]['category'][0]['text'].toString();

                      final String recodingDoctor =
                          examTests[index]['requester']['display'].toString();

                      final List<Widget> testWidgets = <Widget>[
                        if (isSmallScreen)
                          Container(
                            padding: EdgeInsets.only(
                              bottom: isSmallScreen ? 4 : 0,
                            ),
                            child: Text(
                              toBeginningOfSentenceCase(testName)!,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          )
                        else
                          Expanded(
                            flex: 4,
                            child: Text(
                              toBeginningOfSentenceCase(testName)!,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                        if (isSmallScreen)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 4),
                            child: Text(testType,
                                style: Theme.of(context).textTheme.bodyText1),
                          )
                        else
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                testType,
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ),
                          ),
                        if (isSmallScreen)
                          Text.rich(
                            TextSpan(
                              children: <InlineSpan>[
                                TextSpan(
                                    text: 'Ordered by: ',
                                    style:
                                        Theme.of(context).textTheme.bodyText2),
                                TextSpan(
                                    text: recodingDoctor,
                                    style:
                                        Theme.of(context).textTheme.bodyText2),
                              ],
                            ),
                          )
                        else
                          Expanded(
                            flex: 3,
                            child: Text.rich(
                              TextSpan(
                                children: <InlineSpan>[
                                  TextSpan(
                                      text: 'Ordered by: ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(
                                              fontWeight: FontWeight.bold)),
                                  TextSpan(
                                    text: recodingDoctor,
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                  ),
                                ],
                              ),
                            ),
                          )
                      ];
                      return Card(
                        elevation: 0,
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: isSmallScreen
                            //small portrait
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: testWidgets)
                            //large screen
                            : Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                padding: const EdgeInsets.only(top: 4),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: testWidgets)),
                      );
                    }),
              ],
            ),
          );
  }
}
