import 'dart:async';

import 'package:flutter/material.dart';

import 'package:bewell_pro_core/application/core/graphql/mutations.dart';
import 'package:bewell_pro_core/application/core/graphql/queries.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/domain/clinical/entities/condition.dart';
import 'package:bewell_pro_core/domain/clinical/entities/condition_edge.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_connection.dart';

/// [common] and [shared]
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_history/chief_complaint_item_large.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_history/chief_complaint_item_small.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_history/chief_complaint_zero_state.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/retire_helper.dart';
import 'package:misc_utilities/misc.dart';
import 'package:misc_utilities/responsive_widget.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/constants.dart';
import 'package:shared_ui_components/platform_loader.dart';

class ChiefComplaint extends StatefulWidget {
  @override
  _ChiefComplaintState createState() => _ChiefComplaintState();
}

class _ChiefComplaintState extends State<ChiefComplaint> {
  final BehaviorSubject<String> _deleteReason = BehaviorSubject<String>();
  late Stream<dynamic> _stream;
  late StreamController<dynamic> _streamController;

  @override
  void initState() {
    super.initState();

    _streamController = StreamController<dynamic>.broadcast();
    _stream = _streamController.stream;

    WidgetsBinding.instance!.addPostFrameCallback((Duration timeStamp) async {
      await _getCondition();
    });

    final StreamView<dynamic> refreshController = StreamView<dynamic>(
        ExamChangeObject().onAddPatientHistoryListener.stream);
    refreshController.listen((dynamic value) async {
      if (value is bool && value == true) await _getCondition();
    });
  }

  Future<void> _getCondition() async {
    await genericFetchFunction(
      streamController: _streamController,
      context: context,
      queryString: findPatientsExistingConditionsQuery,
      variables: findPatientsExistingConditionVariables(),
      logTitle: 'Find patient existing condition',
    );
  }

  Future<void> retireChiefComplaint({
    required String problemName,
    required String patientName,
    required Condition data,
  }) async {
    await createRetireModal(
      context: context,
      retireItemName: problemName,
      section: SectionType.condition,
      patientName: patientName,
      onChangeReasonField: (String? value) {
        this._deleteReason.add(value!);
      },
      onProblemRetireCallback: () async {
        Navigator.of(context, rootNavigator: true).pop();

        await genericFetchFunction(
          streamController: _streamController,
          context: context,
          queryString: updateProblemMutation,
          variables: updateProblemMutationVariables(data, _deleteReason.value),
          logTitle: 'Retire patient exam chief complaint',
        );

        ExamChangeObject().onAddPatientHistoryListener.add(true);

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            UserFeedBackTexts.getSuccessfulRetireMessage(chiefComplaint),
          ),
          duration: const Duration(seconds: kShortSnackBarDuration),
          action: dismissSnackBar(closeText, white, context),
        ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isLargeScreen = SILResponsiveWidget.isLargeScreen(context);

    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: isLargeScreen ? 30 : 0,
          vertical: isLargeScreen ? 30 : 10),
      decoration: BoxDecoration(
          color: white, border: Border.all(color: grey.withOpacity(0.3))),
      child: StreamBuilder<dynamic>(
        stream: _stream,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return SizedBox(
              width: double.infinity,
              height: 70,
              child: Center(
                child: Text(
                  errorOccurred,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: red),
                ),
              ),
            );
          }

          if (snapshot.hasData) {
            /// Show the loader before data is displayed
            if (snapshot.data is Map<String, dynamic> &&
                snapshot.data['loading'] != null &&
                snapshot.data['loading'] == true) {
              return Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: const SILPlatformLoader());
            }

            final ConditionRelayConnection conditionRelay =
                ConditionRelayConnection.fromJson(snapshot
                    .data['searchFHIRCondition'] as Map<String, dynamic>);

            final List<ConditionEdgeRelay?>? conditionsEdges =
                conditionRelay.edges;

            if (conditionsEdges == null || conditionsEdges.isEmpty) {
              return const ChiefComplaintZeroState();
            }

            final Condition? _patientChiefComplaint = conditionsEdges
                .map((ConditionEdgeRelay? relay) => relay!.node)
                .firstWhere(
              (Condition? condition) {
                return condition!.clinicalStatus!.text == activeText &&
                    condition.category!.first!.text ==
                        ConditionCategory.encounterDiagnosis.name;
              },
              orElse: () => null,
            );

            if (_patientChiefComplaint != null) {
              final String recorder = _patientChiefComplaint.recorder!.display!;
              final String recordedDate =
                  DateFormatter(_patientChiefComplaint.recordedDate!)
                      .parseDateValue();

              final PatientInfo _patientInfo = getPatientInfo();

              final String? patientName = _patientInfo.patientName;

              final String problemName = _patientChiefComplaint.code!.text!;
              final String clinicalStatus =
                  _patientChiefComplaint.clinicalStatus!.text!;

              return Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          chiefComplaint,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border:
                          Border(top: BorderSide(color: grey.withOpacity(0.3))),
                    ),
                    child: isLargeScreen
                        ? ChiefComplaintItemLarge(
                            problemName: problemName,
                            recorder: recorder,
                            recordedDate: recordedDate,
                            clinicalStatus: clinicalStatus,
                            retireCompositionFunction: () async =>
                                retireChiefComplaint(
                              patientName: patientName ?? ' No Name',
                              problemName: problemName,
                              data: _patientChiefComplaint,
                            ),
                          )

                        //Small Screen
                        : ChiefComplaintItemSmall(
                            problemName: problemName,
                            recorder: recorder,
                            recordedDate: recordedDate,
                            clinicalStatus: clinicalStatus,
                            retireCompositionFunction: () async =>
                                retireChiefComplaint(
                              patientName: patientName ?? ' No Name',
                              problemName: problemName,
                              data: _patientChiefComplaint,
                            ),
                          ),
                  ),
                ],
              );
            } else {
              return const ChiefComplaintZeroState();
            }

            /// means no chief complaint has been added
          } else {
            return const ChiefComplaintZeroState();
          }
        },
      ),
    );
  }
}
