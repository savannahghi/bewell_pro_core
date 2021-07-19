import 'dart:async';

import 'package:flutter/material.dart';
import 'package:bewell_pro_core/application/core/graphql/queries.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';

import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';

import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_exam_titles/patient_exam_card_title.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/summary/summary_utils.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/summary/widgets/sign_off_exam.dart';

import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/summary/summary_medications.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/summary/summary_tests.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/generic_zero_state.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/bewell_primary_patient_banner.dart';
import 'package:bewell_pro_core/presentation/core/home/models/bottom_navigation_bar_items.dart';
import 'package:bewell_pro_core/presentation/core/widgets/app_scaffold.dart';
import 'package:misc_utilities/misc.dart';

import 'package:misc_utilities/responsive_widget.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_ui_components/platform_loader.dart';

/// PatientExamSummary
/// Rendered on View Summary which has a summary of the recorded patient info,
/// and sign off button
class PatientExamSummary extends StatefulWidget {
  @override
  _PatientExamSummaryState createState() => _PatientExamSummaryState();
}

class _PatientExamSummaryState extends State<PatientExamSummary> {
  bool isActiveTile = false;

  late Stream<dynamic> _summaryStream;
  late StreamController<dynamic> _summaryStreamController;

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance!.addPostFrameCallback((Duration timeStamp) async {
      genericFetchFunction(
          queryString: fetchVisitSummaryQuery,
          variables: fetchVisitSummaryVariables(),
          context: context,
          logTitle: 'Fetch patient exam summary',
          streamController: _summaryStreamController);
    });

    final StreamView<dynamic> refreshController =
        StreamView<dynamic>(ExamChangeObject().onAddMedicationListener.stream);
    refreshController.listen((dynamic value) async {
      if (value is bool && value == true) {
        genericFetchFunction(
            queryString: fetchVisitSummaryQuery,
            variables: fetchVisitSummaryVariables(),
            logTitle: 'Fetch patient exam summary',
            context: context,
            streamController: _summaryStreamController);
      }
    });
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    this._summaryStreamController = StreamController<dynamic>.broadcast();
    this._summaryStream = this._summaryStreamController.stream;
    ViewSummaryStore().viewSummaryButton.listen((bool value) {
      setState(() {
        isActiveTile = value;
      });
    });
  }

  /// Filters the provided list of tests, based on the diagnosis provided
  ///
  /// Returns a list of tests for a specific diagnosis or an empty list if
  /// there are none
  List<dynamic> testForADiagnosis(
      {required List<dynamic> serviceRequests, required String diagnosisID}) {
    final List<dynamic> testsForThisDiagnosis =
        serviceRequests.where((dynamic element) {
      return element['supportingInfo'][0]['id'] == diagnosisID;
    }).toList();
    return testsForThisDiagnosis;
  }

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = SILResponsiveWidget.isSmallScreen(context);
    return AppScaffold(
      currentBottomNavIndex: BottomNavIndex.patients.index,
      body: ListView(
        children: <Widget>[
          //Patient Banner
          BeWellPrimaryPatientBanner(),

          /// Action buttons at the top. Contains the [Previous] button and the
          /// [Sign off on Exam] button
          SignOffExam(),

          Container(
            margin: EdgeInsets.symmetric(horizontal: isSmallScreen ? 0 : 20),
            child: StreamBuilder<dynamic>(
              stream: _summaryStream,
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (!snapshot.hasData) {
                  const GenericZeroStateWidget(
                    title: 'Summary',
                    subtitle:
                        'The entire summary for this exam. Test and Medications',
                  );
                }

                //show the loader before data is displayed
                if (snapshot.data is Map<String, dynamic> &&
                    snapshot.data['loading'] != null &&
                    snapshot.data['loading'] == true) {
                  return Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: const SILPlatformLoader());
                }

                if (snapshot.data is Map &&
                    snapshot.data['visitSummary'] != null) {
                  /// filter conditions that belongs to current encounter of type 'encounter-diagnosis'
                  final List<dynamic> conditions = snapshot.data['visitSummary']
                      ['Condition'] as List<dynamic>;

                  final String? encounterReference =
                      getPatientInfo().encounterReference;

                  final List<dynamic> encounterConditions =
                      conditions.where((dynamic element) {
                    return element['encounter']['reference'] ==
                            encounterReference &&
                        element['category'][0]['coding'][0]['code'] ==
                            'encounter-diagnosis' &&
                        element['clinicalStatus']['text'] == 'Active';
                  }).toList();

                  if (encounterConditions.isNotEmpty) {
                    return SizedBox(
                      width: double.infinity,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: encounterConditions.length,
                        itemBuilder: (BuildContext context, int index) {
                          /// Extract the following from the data returned
                          ///   1. The [diagnosisID] that will be used to filter the problems or medications
                          ///   2. The [serviceRequests] which is a list of all tests for this
                          ///       encounter
                          ///   3. The [medicationRequests] which is a list of all medications for this
                          ///      encounter
                          final String diagnosisID =
                              encounterConditions[index]['id'].toString();
                          final List<dynamic> serviceRequests =
                              snapshot.data['visitSummary']['ServiceRequest']
                                  as List<dynamic>;
                          final List<dynamic> medicationRequests =
                              snapshot.data['visitSummary']['MedicationRequest']
                                  as List<dynamic>;

                          return ExpansionTile(
                            initiallyExpanded: isActiveTile,
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Flexible(
                                  child: PatientExamCardTitle(
                                    title: encounterConditions[index]['code']
                                            ['coding'][0]['display']
                                        .toString(),
                                  ),
                                ),
                              ],
                            ),
                            children: <Widget>[
                              mediumVerticalSizedBox,

                              /// Exam summary tests widget
                              Card(
                                elevation: 0,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: ExamSummaryTests(
                                  examTests: testForADiagnosis(
                                      diagnosisID: diagnosisID,
                                      serviceRequests: serviceRequests),
                                ),
                              ),
                              largeVerticalSizedBox,

                              /// Exam summary medications widget
                              Card(
                                elevation: 0,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: ExamSummaryMedications(
                                  examMedications: medicationsForADiagnosis(
                                      diagnosisID: diagnosisID,
                                      serviceRequests: medicationRequests),
                                ),
                              ),
                              largeVerticalSizedBox,
                            ],
                          );
                        },
                      ),
                    );
                  }

                  return Container(
                    padding: const EdgeInsets.only(top: 12, bottom: 24),
                    child: const Center(
                      child: GenericZeroStateWidget(
                          title: 'Patient\'s Condition',
                          subtitle: 'No condition added yet '),
                    ),
                  );
                }

                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
