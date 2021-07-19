import 'dart:async';

import 'package:flutter/material.dart';
import 'package:bewell_pro_core/application/core/graphql/mutations.dart';
import 'package:bewell_pro_core/application/core/graphql/queries.dart';

import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/domain/clinical/entities/service_request.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/presentation/clinical/common/widgets/bewell_submit_dialog.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_exam_buttons/exam_item_add_button.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_exam_titles/patient_exam_card_title.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/treatment_plan/patient_exam_item_large.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/treatment_plan/patient_exam_test_item_small.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/treatment_plan/patient_test_zero_state.dart';

import 'package:rxdart/rxdart.dart';

import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/retire_helper.dart';

import 'package:misc_utilities/responsive_widget.dart';
import 'package:misc_utilities/misc.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/spaces.dart';

import 'package:shared_themes/constants.dart';
import 'package:shared_ui_components/platform_loader.dart';

class PatientExamTests extends StatefulWidget {
  const PatientExamTests({
    required this.recordedDiagnosisID,
    required this.recordedDiagnosis,
  });

  final String recordedDiagnosis;
  final String recordedDiagnosisID;

  @override
  _PatientExamTestsState createState() => _PatientExamTestsState();
}

class _PatientExamTestsState extends State<PatientExamTests> {
  final List<dynamic> testsList = <dynamic>[];

  final BehaviorSubject<String> _retireReason = BehaviorSubject<String>();
  late Stream<dynamic> _testsStream;
  late StreamController<dynamic> _testsStreamController;

  @override
  void didChangeDependencies() {
    final StreamView<dynamic> refreshController =
        StreamView<dynamic>(ExamChangeObject().onAddTestListener.stream);
    refreshController.listen((dynamic value) async {
      if (value is bool && value == true) {
        await genericFetchFunction(
            queryString: searchFHIRServiceRequest,
            variables: searchFHIRServiceRequestVariables(),
            context: context,
            logTitle: 'Fetch patient exam tests',
            streamController: _testsStreamController);
      }
    });

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _testsStreamController.close();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _testsStreamController = StreamController<dynamic>.broadcast();
    _testsStream = _testsStreamController.stream;

    WidgetsBinding.instance!.addPostFrameCallback((Duration timeStamp) async {
      genericFetchFunction(
          queryString: searchFHIRServiceRequest,
          variables: searchFHIRServiceRequestVariables(),
          context: context,
          logTitle: 'Fetch patient exam tests',
          streamController: _testsStreamController);
    });
  }

  Future<void> retireTest({
    required String testId,
    required String testName,
    required String patientName,
    required BuildContext context,
  }) async {
    final Map<String, dynamic> _variables = <String, dynamic>{'id': testId};

    await createRetireModal(
      context: context,
      retireItemName: testName,
      section: SectionType.test,
      patientName: patientName,
      onChangeReasonField: (dynamic v) {
        this._retireReason.add(v.toString());
      },
      onTestRetireCallback: () async {
        final dynamic result = await showDialog(
            context: context,
            useRootNavigator: false,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return BewellSubmitDialog(
                data: _variables,
                query: retireTestMutation,
              );
            });

        if (result['deleteFHIRServiceRequest'] != null &&
            result['deleteFHIRServiceRequest'] == true) {
          ExamChangeObject().onAddTestListener.add(true);

          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(UserFeedBackTexts.getSuccessfulRetireMessage('Test')),
            duration: const Duration(seconds: kShortSnackBarDuration),
          ));
        }
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = SILResponsiveWidget.isSmallScreen(context);
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        //Test Title and Add Button
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const PatientExamCardTitle(title: testTitle),
              ExamItemAddButton(
                buttonText: addTests,
                drawerType: DrawerType.test,
                diagnosisName: widget.recordedDiagnosis,
                diagnosisID: widget.recordedDiagnosisID,
              ),
            ],
          ),
        ),

        //Single Test Card
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: isSmallScreen ? 5 : 20, vertical: 10),
          width: double.infinity,
          child: StreamBuilder<dynamic>(
            stream: _testsStream,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                //show the loader before data is displayed
                if (snapshot.data is Map<String, dynamic> &&
                    snapshot.data['loading'] != null &&
                    snapshot.data['loading'] == true) {
                  return const SILPlatformLoader();
                }

                if (snapshot.data['searchFHIRServiceRequest'] != null) {
                  final ServiceRequestConnection _testConnection =
                      ServiceRequestConnection.fromJson(
                          snapshot.data['searchFHIRServiceRequest']
                              as Map<String, dynamic>);

                  final List<ServiceRequestEdge?>? _patientRecordEdges =
                      _testConnection.edges;

                  if (_patientRecordEdges == null ||
                      _patientRecordEdges.isEmpty == true) {
                    return PatientTestZeroState(
                      recordedDiagnosis: widget.recordedDiagnosis,
                      recordedDiagnosisID: widget.recordedDiagnosisID,
                    );
                  }

                  final String? encounterReference =
                      getPatientInfo().encounterReference;

                  final List<ServiceRequest?> _patientRecords =
                      _patientRecordEdges
                          .map((ServiceRequestEdge? e) => e!.node)
                          .toList()
                          .where(
                    (ServiceRequest? element) {
                      if (element!.supportingInfo != null) {
                        return element.encounter!.reference ==
                                encounterReference &&
                            element.supportingInfo!.first!.display ==
                                widget.recordedDiagnosis &&
                            element.supportingInfo!.first!.id ==
                                widget.recordedDiagnosisID;
                      }
                      return false;
                    },
                  ).toList();

                  if (_patientRecords.isEmpty) {
                    return PatientTestZeroState(
                      recordedDiagnosis: widget.recordedDiagnosis,
                      recordedDiagnosisID: widget.recordedDiagnosisID,
                    );
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _patientRecords.length,
                    itemBuilder: (BuildContext context, int index) {
                      final ServiceRequest _currentTestItem =
                          _patientRecords[index]!;

                      final String testName =
                          _currentTestItem.code!.coding!.first!.display ?? '';

                      final String patientName = getPatientInfo().patientName!;

                      final String testStatus = _currentTestItem.status!;

                      final String requestingDoctor =
                          _currentTestItem.requester!.display!;

                      final String recordDate =
                          _currentTestItem.encounter!.display!;

                      final String recordedDate =
                          DateFormatter(recordDate).parseDateValue();

                      return ListBody(
                        children: <Widget>[
                          smallVerticalSizedBox,
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: isSmallScreen ? 0 : 15),
                            child: Container(
                              color: white,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: !isSmallScreen
                                      ? const EdgeInsets.all(15.0)
                                      : const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 15),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: isSmallScreen ? 0 : 20,
                                        vertical: 15),
                                    child: isSmallScreen
                                        ? PatientExamTestItemSmall(
                                            testName: testName,
                                            testStatus: testStatus,
                                            patientName: patientName,
                                            requestingDoctor: requestingDoctor,
                                            recordedDate: recordedDate,
                                            onRetireTestCallback: () async {
                                              await retireTest(
                                                testId: _currentTestItem.id!,
                                                testName: testName,
                                                patientName: patientName,
                                                context: context,
                                              );
                                            },
                                          )
                                        : PatientExamTestItemLarge(
                                            testName: testName,
                                            testStatus: testStatus,
                                            patientName: patientName,
                                            requestingDoctor: requestingDoctor,
                                            recordedDate: recordedDate,
                                            onRetireTestCallback: () async {
                                              await retireTest(
                                                  testId: _currentTestItem.id!,
                                                  testName: testName,
                                                  patientName: patientName,
                                                  context: context);
                                            },
                                          ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                }
              }

              return const SizedBox();
            },
          ),
        )
      ],
    );
  }
}
