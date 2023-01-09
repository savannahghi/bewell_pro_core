// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:intl/intl.dart';
import 'package:sghi_core/misc_utilities/misc.dart';
import 'package:sghi_core/misc_utilities/responsive_widget.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sghi_core/shared_themes/colors.dart';
import 'package:sghi_core/shared_themes/constants.dart';
import 'package:sghi_core/shared_themes/spaces.dart';
import 'package:sghi_core/shared_themes/text_themes.dart';
import 'package:sghi_core/ui_components/src/buttons.dart';
import 'package:sghi_core/ui_components/src/platform_loader.dart';

// Project imports:
import 'package:bewell_pro_core/application/core/graphql/mutations.dart';
import 'package:bewell_pro_core/application/core/graphql/queries.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/domain/clinical/entities/condition.dart';
import 'package:bewell_pro_core/domain/clinical/entities/condition_edge.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_connection.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/generic_zero_state.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/problems/patient_records_empty.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/retire_helper.dart';

class PatientProblemTable extends StatefulWidget {
  @override
  _PatientProblemTableState createState() => _PatientProblemTableState();
}

class _PatientProblemTableState extends State<PatientProblemTable> {
  final BehaviorSubject<String> _deleteReason = BehaviorSubject<String>();
  late StreamController<dynamic> _problemsStreamController;
  late Stream<dynamic> _stream;

  @override
  void initState() {
    super.initState();

    _problemsStreamController = StreamController<dynamic>.broadcast();
    _stream = _problemsStreamController.stream;

    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) async {
      await genericFetchFunction(
          queryString: findPatientsExistingConditionsQuery,
          variables: findPatientsExistingConditionVariables(),
          logTitle: findPatientConditionLogTitle,
          context: context,
          streamController: _problemsStreamController);
    });

    final StreamView<dynamic> refreshController =
        StreamView<dynamic>(ExamChangeObject().onAddProblemListener.stream);
    refreshController.listen((dynamic value) async {
      if (value is bool && value == true) {
        await genericFetchFunction(
            queryString: findPatientsExistingConditionsQuery,
            variables: findPatientsExistingConditionVariables(),
            logTitle: findPatientConditionLogTitle,
            context: context,
            streamController: _problemsStreamController);
      }
    });
  }

  Future<void> retireCondition(String? recordedProblem, String? patientName,
      List<Condition?> conditions, int index) async {
    await createRetireModal(
      context: context,
      retireItemName: recordedProblem,
      section: SectionType.condition,
      patientName: patientName,
      onChangeReasonField: (String? value) => this._deleteReason.add(value!),
      onProblemRetireCallback: () async {
        Navigator.of(context, rootNavigator: true).pop();

        await genericFetchFunction(
          streamController: _problemsStreamController,
          context: context,
          queryString: updateProblemMutation,
          variables: updateProblemMutationVariables(
              Condition.fromJson(conditions[index]!.toJson()),
              _deleteReason.value),
          logTitle: 'Retire patient exam condition',
        );

        ExamChangeObject().onAddProblemListener.add(true);
        PrimaryBannerInfoObject().patientBannerChangeListener.add(true);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:
                Text(UserFeedBackTexts.getSuccessfulRetireMessage(problem)),
            duration: const Duration(seconds: kShortSnackBarDuration),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isLargeScreen = ResponsiveWidget.isLargeScreen(context);
    final TextTheme textTheme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: StreamBuilder<dynamic>(
          stream: _stream,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (!snapshot.hasData || snapshot.hasError) {
              return const GenericZeroStateWidget(
                title: zeroStateProblemTitle,
                subtitle: zeroStateProblemSubTitle,
              );
            }

            /// Show the loader when the data is still loading
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

            /// Render a zero state if conditionsEdges is null
            if (conditionsEdges == null) {
              return const GenericZeroStateWidget(
                title: zeroStateProblemTitle,
                subtitle: zeroStateProblemSubTitle,
              );
            }

            /// Loop through the conditions while filtering out the active ones
            final List<Condition?> _patientConditions = conditionsEdges
                .map((ConditionEdgeRelay? record) => record?.node)
                .toList()
                .where((Condition? element) {
              final bool isActive = element!.clinicalStatus!.text == activeText;
              final bool isCorrectCategory = element.category!.first!.text ==
                  ConditionCategory.problemListItem.name;

              if (isActive && isCorrectCategory) {
                return true;
              } else {
                return false;
              }
            }).toList();

            /// Check if the the patient records are empty
            if (_patientConditions.isEmpty) {
              return const EmptyProblemsContainer();
            }

            /// Enable view summary button
            ViewSummaryStore().viewSummaryButton.add(true);

            return ListView.builder(
              shrinkWrap: true,
              itemCount: _patientConditions.length,
              itemBuilder: (BuildContext context, int index) {
                final String clinicalStatus =
                    _patientConditions[index]?.clinicalStatus?.text ?? '';

                final PatientInfo _patientInfo = getPatientInfo();

                final String? patientName = _patientInfo.patientName;

                final String dateFormat =
                    _patientConditions[index]!.recordedDate.toString();
                final String recordedDate =
                    DateFormatter(dateFormat).parseDateValue();

                final String recordingDoctor =
                    _patientConditions[index]!.recorder!.display!;

                final String? recordedProblem =
                    _patientConditions[index]?.code?.text;

                return ListBody(
                  children: <Widget>[
                    if (isLargeScreen)
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 36, vertical: 12),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                flex: 5,
                                child: Text(
                                    toBeginningOfSentenceCase(recordedProblem
                                        .toString()
                                        .toLowerCase())!,
                                    style: textTheme.subtitle2!.copyWith(
                                        fontWeight: FontWeight.w400))),
                            Expanded(
                                flex: 2,
                                child: Text(clinicalStatus,
                                    style: textTheme.subtitle2)),
                            Expanded(
                                flex: 3,
                                child: Text(recordingDoctor,
                                    style: textTheme.subtitle2)),
                            Expanded(
                                flex: 3,
                                child: Text(recordedDate,
                                    style: textTheme.subtitle2)),
                            Flexible(
                              flex: 2,
                              child: SILSecondaryButton(
                                buttonKey:
                                    AppWidgetKeys.largeScreenRetireButton,
                                onPressed: () => retireCondition(
                                    recordedProblem,
                                    patientName,
                                    _patientConditions,
                                    index),
                                borderColor: redAccent,
                                text: retireText,
                                textColor: redAccent,
                              ),
                            )
                          ],
                        ),
                      )
                    else
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 20),
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.2),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                        ),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Flexible(
                                      flex: 3,
                                      child: Text(recordedProblem!,
                                          style: TextThemes.heavySize18Text(
                                              titleBlack))),

                                  /// Retire button
                                  Flexible(
                                    flex: 2,
                                    child: SILSecondaryButton(
                                      buttonKey:
                                          AppWidgetKeys.smallScreenRetireButton,
                                      onPressed: () => retireCondition(
                                          recordedProblem,
                                          patientName,
                                          _patientConditions,
                                          index),
                                      borderColor: redAccent,
                                      text: retireText,
                                      textColor: redAccent,
                                    ),
                                  )
                                ],
                              ),
                              size15VerticalSizedBox,
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(statusText,
                                            style: TextThemes.normalSize16Text(
                                                subtitleGrey)),
                                        Text(clinicalStatus,
                                            style:
                                                TextThemes.veryBoldSize18Text(
                                                    titleBlack)),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(date,
                                            style: TextThemes.normalSize16Text(
                                                subtitleGrey)),
                                        Text(recordedDate,
                                            style:
                                                TextThemes.veryBoldSize18Text(
                                                    titleBlack)),
                                      ],
                                    )
                                  ]),
                              size15VerticalSizedBox,
                              Text(doctor,
                                  style: TextThemes.normalSize16Text(
                                      subtitleGrey)),
                              Text(recordingDoctor,
                                  style: TextThemes.veryBoldSize18Text(
                                      titleBlack)),
                            ],
                          ),
                        ),
                      )
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
