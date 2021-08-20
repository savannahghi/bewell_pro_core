import 'dart:async';

import 'package:flutter/material.dart';
import 'package:bewell_pro_core/application/core/graphql/mutations.dart';
import 'package:bewell_pro_core/application/core/graphql/queries.dart';
import 'package:bewell_pro_core/domain/clinical/entities/allergy.dart';
import 'package:bewell_pro_core/domain/clinical/entities/allergy_intolerance_relay_connection.dart';
import 'package:bewell_pro_core/domain/clinical/entities/allergy_intolerance_relay_edge.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_connection.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/generic_zero_state.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/bewell_secondary_patient_banner_logic.dart';

import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/retire_helper.dart';

import 'package:intl/intl.dart';
import 'package:rxdart/subjects.dart';
import 'package:misc_utilities/misc.dart';

import 'package:misc_utilities/responsive_widget.dart';

import 'package:shared_themes/colors.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/constants.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:shared_ui_components/buttons.dart';
import 'package:shared_ui_components/platform_loader.dart';

class ExamAllergiesTable extends StatefulWidget {
  @override
  _ExamAllergiesTableState createState() => _ExamAllergiesTableState();
}

class _ExamAllergiesTableState extends State<ExamAllergiesTable> {
  final BehaviorSubject<String> _deleteReason = BehaviorSubject<String>();
  late StreamController<dynamic> _allergiesStreamController;
  late Stream<dynamic> _allergiesStream;

  @override
  void didChangeDependencies() {
    context.dependOnInheritedWidgetOfExactType();
    super.didChangeDependencies();

    _allergiesStreamController = StreamController<dynamic>.broadcast();
    _allergiesStream = _allergiesStreamController.stream;

    WidgetsBinding.instance!.addPostFrameCallback(
      (Duration timeStamp) async {
        await genericFetchFunction(
            queryString: findPatientExistingAllergiesQuery,
            variables: findPatientExistingAllergiesVariables(),
            context: context,
            streamController: _allergiesStreamController,
            logTitle: 'Patient Existing Allergies');
      },
    );

    final StreamView<dynamic> refreshController =
        StreamView<dynamic>(ExamChangeObject().onAddAllergyListener.stream);

    refreshController.listen((dynamic value) async {
      if (value is bool && value == true) {
        await genericFetchFunction(
            queryString: findPatientExistingAllergiesQuery,
            variables: findPatientExistingAllergiesVariables(),
            logTitle: 'Fetch patient allergies',
            context: context,
            streamController: _allergiesStreamController);
      }
    });
  }

  Future<void> _retireAllergy(
    String recordedAllergy,
    String patientName,
    List<AllergyIntolerance> _processedRecords,
    int index,
  ) async {
    await createRetireModal(
      context: context,
      retireItemName: recordedAllergy,
      section: SectionType.allergy,
      patientName: patientName,
      onChangeReasonField: (String? value) => this._deleteReason.add(value!),
      onAllergiesRetireCallback: () async {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Allergy retired'),
            duration: const Duration(seconds: kShortSnackBarDuration),
            action: dismissSnackBar('close', white, context),
          ),
        );

        Navigator.of(context, rootNavigator: true).pop();

        await genericFetchFunction(
          streamController: _allergiesStreamController,
          context: context,
          queryString: updateAllergyMutation,
          variables: updateAllergyMutationVariables(
              _processedRecords[index], _deleteReason.value),
          logTitle: 'Retire patient exam allergy',
        );

        PrimaryBannerInfoObject().patientBannerChangeListener.add(true);

        ExamChangeObject().onAddAllergyListener.add(true);
      },
    );
  }

  final GenericZeroStateWidget _zeroStateWidget = const GenericZeroStateWidget(
    title: pExamAllergyZeroStateTitle,
    subtitle: pExamAllergyZeroStateSubtitle,
  );

  @override
  Widget build(BuildContext context) {
    final bool isLargeScreen = ResponsiveWidget.isLargeScreen(context);
    final TextTheme textTheme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: StreamBuilder<dynamic>(
          stream: _allergiesStream,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError || snapshot.data == null) {
              // check if the Stream<dynamic> has error in data
              return _zeroStateWidget;
            }

            if (snapshot.hasData) {
              //show the loader before data is displayed
              if (snapshot.data is Map<String, dynamic> &&
                  snapshot.data['loading'] != null &&
                  snapshot.data['loading'] == true) {
                return Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: const SILPlatformLoader());
              }

              if (snapshot.data['searchFHIRAllergyIntolerance'] == null) {
                return _zeroStateWidget;
              }

              final AllergyIntoleranceRelayConnection
                  allergyIntoleranceRelayConnection =
                  AllergyIntoleranceRelayConnection.fromJson(
                      snapshot.data['searchFHIRAllergyIntolerance']
                          as Map<String, dynamic>);

              final List<AllergyIntoleranceRelayEdge?>?
                  allergyIntoleranceRelayEdges =
                  allergyIntoleranceRelayConnection.edges;

              final List<AllergyIntolerance> _processedRecords =
                  BeWellSecondaryPatientBannerLogic
                      .activeAllergyIntoleranceInEncounter(
                          allergyIntoleranceRelayEdges);

              // check if the Stream<dynamic> has error in data
              if (_processedRecords.isEmpty) {
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: _zeroStateWidget,
                );
              }

              // enable view summary button
              ViewSummaryStore().viewSummaryButton.add(true);

              return ListView.builder(
                shrinkWrap: true,
                itemCount: _processedRecords.length,
                itemBuilder: (BuildContext context, int index) {
                  final AllergyIntolerance currentProcessedRecord =
                      _processedRecords[index];

                  final String? clinicalStatus =
                      currentProcessedRecord.clinicalStatus?.text;

                  final PatientConnection _patientConn =
                      CurrentPatientInEpisode().patientConnection.value;

                  final String patientName =
                      _patientConn.edges!.first!.node!.name!.first!.text!;

                  final String? dateFormat =
                      currentProcessedRecord.recordedDate;

                  // TODO: check for null and handle the null date
                  final String recordedDate =
                      DateFormatter(dateFormat!).parseDateValue();

                  final String? recordingDoctor =
                      currentProcessedRecord.recorder?.display;

                  final String? recordedAllergy =
                      currentProcessedRecord.reaction?.first?.substance?.text;

                  return ListBody(
                    children: <Widget>[
                      if (isLargeScreen)
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 34, vertical: 12),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex: 5,
                                  child: Text(
                                      toBeginningOfSentenceCase(recordedAllergy
                                          .toString()
                                          .toLowerCase())!,
                                      style: textTheme.subtitle2!.copyWith(
                                          fontWeight: FontWeight.w400))),
                              Expanded(
                                  flex: 2,
                                  child: Text(clinicalStatus ?? '',
                                      style: textTheme.subtitle2)),
                              Expanded(
                                  flex: 3,
                                  child: Text(recordingDoctor ?? '',
                                      style: textTheme.subtitle2)),
                              Expanded(
                                  flex: 3,
                                  child: Text(recordedDate,
                                      style: textTheme.subtitle2)),
                              Flexible(
                                flex: 2,
                                child: SILSecondaryButton(
                                  buttonKey: AppWidgetKeys
                                      .retireAllergyLargeScreenButtonKey,
                                  onPressed: () => _retireAllergy(
                                      recordedAllergy ?? '',
                                      patientName,
                                      _processedRecords,
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
                                //Allergies title
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Flexible(
                                      flex: 3,
                                      child: Text(
                                        recordedAllergy ?? '',
                                        style: TextThemes.heavySize18Text(
                                            titleBlack),
                                      ),
                                    ),
                                    //RetireButton
                                    Flexible(
                                      flex: 2,
                                      child: SILSecondaryButton(
                                        buttonKey: AppWidgetKeys
                                            .retireAllergySmallScreenButtonKey,
                                        onPressed: () => _retireAllergy(
                                            recordedAllergy ?? '',
                                            patientName,
                                            _processedRecords,
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
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            statusText,
                                            style: TextThemes.normalSize16Text(
                                                subtitleGrey),
                                          ),
                                          Text(
                                            clinicalStatus ?? '',
                                            style:
                                                TextThemes.veryBoldSize18Text(
                                                    titleBlack),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            dateTitle,
                                            style: TextThemes.normalSize16Text(
                                                subtitleGrey),
                                          ),
                                          Text(
                                            recordedDate,
                                            style:
                                                TextThemes.veryBoldSize18Text(
                                                    titleBlack),
                                          ),
                                        ],
                                      )
                                    ]),
                                size15VerticalSizedBox,
                                Text(
                                  doctorTitle,
                                  style:
                                      TextThemes.normalSize16Text(subtitleGrey),
                                ),
                                Text(
                                  recordingDoctor ?? '',
                                  style:
                                      TextThemes.veryBoldSize18Text(titleBlack),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  );
                },
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
