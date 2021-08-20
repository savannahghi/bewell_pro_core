import 'dart:async';

import 'package:flutter/material.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/summary/quick_access_item.dart';

import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';

import 'package:bewell_pro_core/application/core/graphql/mutations.dart';
import 'package:bewell_pro_core/application/core/graphql/queries.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_connection.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/common/widgets/bewell_submit_dialog.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_diagnosis_tabs.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/quick_access_item_modal.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/generic_zero_state.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/retire_helper.dart';

import 'package:misc_utilities/misc.dart';
import 'package:misc_utilities/responsive_widget.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/constants.dart';
import 'package:shared_ui_components/buttons.dart';
import 'package:shared_ui_components/platform_loader.dart';
import 'package:shared_themes/text_themes.dart';

class PatientDiagnosisTable extends StatefulWidget {
  const PatientDiagnosisTable({this.isExpanded = true});

  final bool isExpanded;

  @override
  _PatientDiagnosisTableState createState() => _PatientDiagnosisTableState();
}

class _PatientDiagnosisTableState extends State<PatientDiagnosisTable> {
  late bool isExpanded;

  final BehaviorSubject<String?> _deleteReason = BehaviorSubject<String>();
  late Stream<dynamic> _diagnosisStream;
  late StreamController<dynamic> _diagnosisStreamController;

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance!.addPostFrameCallback((Duration timeStamp) async {
      genericFetchFunction(
        queryString: findPatientsExistingConditionsQuery,
        variables: findPatientsExistingConditionVariables(),
        context: context,
        streamController: _diagnosisStreamController,
        logTitle: 'Fetch patient diagnosis',
      );
    });

    final StreamView<dynamic> refreshController = StreamView<dynamic>(
        ExamChangeObject().onDiagnosisChangeListener.stream);
    refreshController.listen((dynamic value) async {
      if (value is bool && value == true) {
        genericFetchFunction(
          queryString: findPatientsExistingConditionsQuery,
          variables: findPatientsExistingConditionVariables(),
          context: context,
          logTitle: 'Fetch patient diagnosis',
          streamController: _diagnosisStreamController,
        );
      }
    });
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    isExpanded = widget.isExpanded;

    _diagnosisStreamController = StreamController<dynamic>.broadcast();
    _diagnosisStream = _diagnosisStreamController.stream;
  }

  Future<void> _retireDiagnosis(List<dynamic> patientDiagnosis,
      String recordedDiagnosis, String patientName, int index) async {
    /// Retire a diagnosis using the ID
    /// Update the status of the diagnosis to inactive then
    /// run the update query
    patientDiagnosis[index]['ClinicalStatus']['Text'] = 'Inactive';
    patientDiagnosis[index]['Encounter']['Display'] = 'Remove';

    final Map<String, dynamic> _variables = <String, dynamic>{
      'input': patientDiagnosis[index]
    };

    await createRetireModal(
      context: context,
      retireItemName: recordedDiagnosis,
      section: SectionType.diagnosis,
      patientName: patientName,
      onChangeReasonField: (String? v) {
        this._deleteReason.add(v);
      },
      onDiagnosisRetireCallback: () async {
        Navigator.of(context, rootNavigator: true).pop();

        final dynamic result = await showDialog(
          context: context,
          useRootNavigator: false,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return BewellSubmitDialog(
                data: _variables, query: updateProblemMutation);
          },
        );

        if (result != null && result['updateFHIRCondition'] != null) {
          ExamChangeObject().onDiagnosisChangeListener.add(true);
          //todo: add event log

          /// notify the user of the success action
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Text(diagnosisRetired),
            duration: const Duration(seconds: kShortSnackBarDuration),
            action: dismissSnackBar('close', white, context),
          ));
        } else {
          /// notify the user of the success action
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(UserFeedBackTexts.getErrorMessage()),
            duration: const Duration(seconds: kShortSnackBarDuration),
            action: dismissSnackBar('close', white, context),
          ));
        }
      },
    );
  }

  Future<void> _onExpansionChanged(bool val) async => setState(() {
        isExpanded = val;
      });

  @override
  Widget build(BuildContext context) {
    final EdgeInsets recordedDiagnosisPadding =
        ResponsiveWidget.isSmallScreen(context)
            ? const EdgeInsets.symmetric(vertical: 16)
            : const EdgeInsets.all(16);
    const EdgeInsets recordedDiagnosisRetireButton =
        EdgeInsets.symmetric(horizontal: 20, vertical: 7);
    const EdgeInsets zeroStatePadding =
        EdgeInsets.symmetric(vertical: 20, horizontal: 20);
    final TextTheme textTheme = Theme.of(context).textTheme;

    return StreamBuilder<dynamic>(
      stream: _diagnosisStream,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.data == null) {
          return const SILPlatformLoader();
        }

        /// Show the loader before data is displayed
        if (snapshot.data is Map<String, dynamic> &&
            snapshot.data['loading'] != null &&
            snapshot.data['loading'] == true) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: const SILPlatformLoader(),
          );
        }

        final List<dynamic>? patientRecords =
            snapshot.data['searchFHIRCondition']['edges'] as List<dynamic>?;

        if (patientRecords == null) {
          return SizedBox(
            width: double.infinity,
            child: Padding(
              padding: zeroStatePadding,
              child: Column(
                children: <Widget>[
                  const Text(quickAccess),
                  Wrap(
                    alignment: WrapAlignment.center,
                    children: <Widget>[
                      ...quickAccessItemDiagnoses
                          .map((QuickAccessItem e) => QuickAccessItemModal(
                                test: e,
                                diagnosisID: e.code,
                                diagnosisName: e.name,
                                type: QuickAccessType.diagnosis,
                              )),
                    ],
                  ),
                  mediumVerticalSizedBox,
                  const GenericZeroStateWidget(
                    title: addPatientDiagnosis,
                    subtitle: whatDoesThePatientHave,
                  ),
                ],
              ),
            ),
          );
        }
        final List<dynamic> patientDiagnosis = patientRecords
            .map((dynamic e) => e['node'])
            .toList()
            .where((dynamic element) {
          return element['ClinicalStatus']['Text'] == 'Active' &&
              element['Category'][0]['Coding'][0]['Code'] ==
                  'encounter-diagnosis';
        }).toList();

        /// Check if the Stream<dynamic> has error in data
        if (patientDiagnosis.isEmpty) {
          return SizedBox(
            width: double.infinity,
            child: Padding(
              padding: zeroStatePadding,
              child: Column(
                children: <Widget>[
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(quickAccess),
                  ),
                  Wrap(
                    children: <Widget>[
                      ...quickAccessItemDiagnoses
                          .map((QuickAccessItem e) => QuickAccessItemModal(
                                test: e,
                                diagnosisID: e.code,
                                diagnosisName: e.name,
                                type: QuickAccessType.diagnosis,
                              )),
                    ],
                  ),
                  const Padding(
                    padding: zeroStatePadding,
                    child: GenericZeroStateWidget(
                      title: addPatientDiagnosis,
                      subtitle: whatDoesThePatientHave,
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        /// Enable view summary button
        ViewSummaryStore().viewSummaryButton.add(true);

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: patientDiagnosis.length,
          itemBuilder: (BuildContext context, int index) {
            final String recordedDiagnosis =
                patientDiagnosis[index]['Code']['Text']!.toString();

            final String recordedDiagnosisID =
                patientDiagnosis[index]['ID']!.toString();

            final PatientConnection _patientConn =
                CurrentPatientInEpisode().patientConnection.value;

            final String? patientName =
                _patientConn.edges!.first!.node!.name!.first!.text;

            return ListBody(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border:
                              Border.all(color: patientIDLightGrey, width: 0.5),
                        ),
                        margin: EdgeInsets.symmetric(
                            horizontal: ResponsiveWidget.isSmallScreen(context)
                                ? 0
                                : 20.0),
                        child: ExpansionTile(
                          initiallyExpanded: isExpanded,
                          onExpansionChanged: _onExpansionChanged,
                          title: Container(
                            padding: recordedDiagnosisPadding,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Flexible(
                                      child: Text(
                                        toBeginningOfSentenceCase(
                                            recordedDiagnosis)!,
                                        style: TextThemes.veryBoldSize20Text(
                                            titleBlack),
                                      ),
                                    ),
                                    // Retire Diagnosis button
                                    SILSecondaryButton(
                                      buttonKey: AppWidgetKeys
                                          .retirePatientExamDiagnosisKey,
                                      customPadding:
                                          recordedDiagnosisRetireButton,
                                      borderColor: red,
                                      onPressed: () => _retireDiagnosis(
                                        patientDiagnosis,
                                        recordedDiagnosis,
                                        patientName!,
                                        index,
                                      ),
                                      text: retireText,
                                      buttonColor: white,
                                      textColor: redAccent,
                                    ),
                                  ],
                                ),
                                if (isExpanded)
                                  Row(
                                    children: <Widget>[
                                      Flexible(
                                        child: Text(
                                          tapToViewLess,
                                          style: textTheme.subtitle2!.copyWith(
                                              color: black.withOpacity(0.6)),
                                        ),
                                      ),
                                    ],
                                  )
                                else
                                  Row(
                                    children: <Widget>[
                                      Flexible(
                                        child: Text(
                                          tapToOrderTests,
                                          style: textTheme.subtitle2!.copyWith(
                                              color: black.withOpacity(0.6)),
                                        ),
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                          children: <Widget>[
                            PatientTabs(
                                recordedDiagnosis: recordedDiagnosis,
                                recordedDiagnosisID: recordedDiagnosisID),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
