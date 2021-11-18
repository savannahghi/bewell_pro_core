// Dart imports:
import 'dart:async';
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:intl/intl.dart';
import 'package:misc_utilities/misc.dart';
import 'package:misc_utilities/responsive_widget.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/constants.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:shared_ui_components/inputs.dart';
import 'package:shared_ui_components/platform_loader.dart';

// Project imports:
import 'package:bewell_pro_core/application/core/graphql/mutations.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/domain/clinical/entities/fhir.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_connection.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/common/widgets/bewell_submit_dialog.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/models/exam_composition.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawers/drawer_utils.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawers/drawer_utils/drawer_save_button.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_examination/review_of_system_title_bar.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_examination/symptom_widget.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_examination/utils/patient_exam_utils.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/retire_helper.dart';
import 'package:bewell_pro_core/presentation/core/widgets/generic_timeout_widget.dart';

/// This is the widget for step 3 of the patient examination process
///
/// It should not be confused with the [PatientExam] widget which combines
/// all the steps into one widget
class GeneralSystemsExamWidget extends StatefulWidget {
  const GeneralSystemsExamWidget({Key? key}) : super(key: key);

  @override
  _GeneralSystemsExamWidgetState createState() =>
      _GeneralSystemsExamWidgetState();
}

class _GeneralSystemsExamWidgetState extends State<GeneralSystemsExamWidget> {
  late StreamController<dynamic> _generalExamStreamController;
  late Stream<dynamic> _generalExamStream;

  final ExamCompositionObject examComposition = ExamCompositionObject();

  // the symptoms in a general exam
  List<String> generalSystemsSymptoms = <String>[
    'fever',
    'nausea',
    'rash',
    'fatigue',
    'weightGain',
    'weightLoss'
  ];

  final GeneralExamObject _generalExamObject = GeneralExamObject();

  @override
  void initState() {
    super.initState();

    this._generalExamStreamController = StreamController<dynamic>.broadcast();
    this._generalExamStream = this._generalExamStreamController.stream;

    // reset the general exam form values to false
    generalSystemsSymptoms.map((String element) {
      _generalExamObject.symptoms[element] = false;
    }).toList();

    _generalExamObject.description.add(null);
  }

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance!.addPostFrameCallback((Duration timeStamp) async {
      await fetchCompositionData(
        streamController: this._generalExamStreamController,
        context: context,
        compositionTitle: CompositionTypeTitle.generalExamination,
      );
    });

    final StreamView<dynamic> refreshController = StreamView<dynamic>(
        ExamChangeObject().generalExamChangeListener.stream);
    refreshController.listen((dynamic value) async {
      if (value is bool && value == true) {
        await fetchCompositionData(
          streamController: this._generalExamStreamController,
          context: context,
          compositionTitle: CompositionTypeTitle.generalExamination,
        );
      }
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final bool isLargeScreen = ResponsiveWidget.isLargeScreen(context);

    return Card(
      elevation: 0,
      margin: EdgeInsets.all(isLargeScreen ? 30 : 10),
      child: Container(
        padding: EdgeInsets.all(isLargeScreen ? 32 : 10),
        child: StreamBuilder<dynamic>(
          stream: _generalExamStream,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError) {
              return GenericTimeoutWidget(
                recoverRoute: '',
                action: 'getting the patient\'s general exam',
                recoverCallback: () async {
                  await fetchCompositionData(
                    streamController: this._generalExamStreamController,
                    context: context,
                    compositionTitle: CompositionTypeTitle.generalExamination,
                  );
                },
              );
            }
            if (snapshot.hasData) {
              if (snapshot.data is Map) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: SILPlatformLoader(),
                );
              }

              final Composition composition = snapshot.data as Composition;

              examComposition.generalCompositionID.add(composition.id);

              if (composition.section != null) {
                final List<Section?>? section = composition.section;

                final String? encodedDiv = section?.first?.text?.div;

                final Map<dynamic, dynamic> generalExamData =
                    json.decode(encodedDiv!) as Map<dynamic, dynamic>;

                /// Enables the view summary button
                ViewSummaryStore().viewSummaryButton.add(true);

                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ReviewOfSystemTitleBar(
                        title: generalExamTitle,
                        streamController: _generalExamStreamController,
                        compositionTitle: generalExamCompositionTitle,
                        isGeneralExam: true,
                        generalExamCallback: () async {
                          final PatientInfo _patientInfo = getPatientInfo();
                          await createRetireModal(
                            context: context,
                            retireItemName: null,
                            section: SectionType.generalExam,
                            patientName: _patientInfo.patientName,
                            onChangeReasonField: (dynamic v) {},
                            onRetireGeneralExamCallback: () async {
                              Navigator.of(context, rootNavigator: true).pop();
                              final dynamic result = await showDialog(
                                context: context,
                                useRootNavigator: false,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return BewellSubmitDialog(
                                    data: <String, dynamic>{
                                      'id': examComposition
                                          .generalCompositionID.value
                                    },
                                    query: deleteCompositionMutation,
                                  );
                                },
                              );

                              if (result['deleteFHIRComposition'] != null &&
                                  result['deleteFHIRComposition'] == true) {
                                ExamChangeObject()
                                    .generalExamChangeListener
                                    .add(true);

                                setState(() {
                                  examComposition.generalCompositionID
                                      .add(null);

                                  /// reset the general exam form values to false
                                  generalSystemsSymptoms.map((String element) {
                                    _generalExamObject.symptoms[element] =
                                        false;
                                  }).toList();
                                  _generalExamObject.description.add(null);
                                });

                                /// Show feedback to the user
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content:
                                      const Text(generalExamRemoveSuccessMsg),
                                  duration: const Duration(
                                      seconds: kLongSnackBarDuration),
                                  action: dismissSnackBar(
                                      closeBtnText, white, context),
                                ));
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content:
                                      Text(UserFeedBackTexts.getErrorMessage()),
                                  duration: const Duration(
                                      seconds: kLongSnackBarDuration),
                                  action: dismissSnackBar(
                                      closeBtnText, white, context),
                                ));
                              }
                            },
                          );
                        },
                      ),
                      smallVerticalSizedBox,

                      /// Displays only the symptoms that were checked when filling in
                      /// the general exam form
                      Wrap(
                        children: <Widget>[
                          ...generalExamData.keys
                              .where(
                                  (dynamic e) => generalExamData[e] == 'true')
                              .map(
                                (dynamic e) => SymptomWidget(
                                  symptomText: toBeginningOfSentenceCase(
                                      generalExamSymptoms[e]
                                          .toString()
                                          .toLowerCase())!,
                                ),
                              ),
                        ],
                      ),

                      size15VerticalSizedBox,

                      /// doctor's notes
                      Text(
                        doctorsNotes,
                        style: TextThemes.veryBoldSize20Text(titleBlack),
                      ),
                      size15VerticalSizedBox,
                      Text(
                          generalExamData['description']?.toString() ?? noNotes,
                          style: TextThemes.boldSize16Text(titleBlack))
                    ],
                  ),
                );
              }
            }

            /// If there is no composition data, we show the general exam form
            if (!snapshot.hasData) {
              return Wrap(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      generalExamTitle,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, right: 20),
                    child: Wrap(
                      children: <Widget>[
                        SILCheckbox(
                          checkboxKey: AppWidgetKeys.feverCheckBoxKey,
                          value: _generalExamObject.symptoms['fever'],
                          text: hasFeverText,
                          onChanged: (bool? v) {
                            setState(() {
                              _generalExamObject.symptoms['fever'] = v!;
                            });
                          },
                        ),
                        SILCheckbox(
                          checkboxKey: AppWidgetKeys.nauseaCheckBoxKey,
                          value: _generalExamObject.symptoms['nausea'],
                          text: hasNauseaText,
                          onChanged: (bool? v) {
                            setState(() {
                              _generalExamObject.symptoms['nausea'] = v!;
                            });
                          },
                        ),
                        SILCheckbox(
                          checkboxKey: AppWidgetKeys.rashCheckBoxKey,
                          value: _generalExamObject.symptoms['rash'],
                          text: hasRashText,
                          onChanged: (bool? v) {
                            setState(() {
                              _generalExamObject.symptoms['rash'] = v!;
                            });
                          },
                        ),
                        SILCheckbox(
                          checkboxKey: AppWidgetKeys.fatigueCheckBoxKey,
                          value: _generalExamObject.symptoms['fatigue'],
                          text: hasFatigueText,
                          onChanged: (bool? v) {
                            setState(() {
                              _generalExamObject.symptoms['fatigue'] = v!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),

                  smallVerticalSizedBox,

                  Padding(
                    padding: const EdgeInsets.only(top: 10, right: 20),
                    child: Wrap(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15),
                          child: Text(
                            weightStatus,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                        ),
                        Wrap(
                          children: <Widget>[
                            /// weight gain checkbox
                            SILCheckbox(
                              checkboxKey: AppWidgetKeys.weightGainCheckBoxKey,
                              value: _generalExamObject.symptoms['weightGain'],
                              text: weightGain,
                              onChanged: (bool? v) {
                                setState(() {
                                  _generalExamObject.symptoms['weightGain'] =
                                      v!;
                                  _generalExamObject.symptoms['weightLoss'] =
                                      !v;
                                });
                              },
                            ),

                            /// weight loss checkbox
                            SILCheckbox(
                              checkboxKey: AppWidgetKeys.weightLossCheckBoxKey,
                              value: _generalExamObject.symptoms['weightLoss'],
                              text: weightLoss,
                              onChanged: (bool? v) {
                                setState(() {
                                  _generalExamObject.symptoms['weightLoss'] =
                                      v!;
                                  _generalExamObject.symptoms['weightGain'] =
                                      !v;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  smallVerticalSizedBox,

                  // doctor's notes
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Notes',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(fontWeight: FontWeight.bold)),
                        smallVerticalSizedBox,
                        SILFormTextField(
                            key: AppWidgetKeys.genExamNotesKey,
                            labelText: notesTitle,
                            maxLines: 4,
                            onChanged: (String v) {
                              setState(() {
                                _generalExamObject.description.add(v);
                              });
                            }),
                        largeVerticalSizedBox,
                      ],
                    ),
                  ),
                  smallVerticalSizedBox,

                  /// the save button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: DrawerSaveButton(
                      callback: () async {
                        examComposition
                          ..recordingDoctor.add(getRecordingDoctor(context))

                          /// encode the composition data form the filled form passed in in the form of [compositionData]
                          ..compositionTitle
                              .add(CompositionTypeTitle.generalExamination)
                          ..generalExamData
                              .add(json.encode(_generalExamObject.data));

                        final String? compositionID =
                            examComposition.generalCompositionID.value;

                        /// get the patient's information and append it to the composition
                        /// the info from the patient's information to be added includes:
                        /// - their ID
                        /// - their name
                        /// - the encounter ID
                        final PatientInfo _patientInfo = getPatientInfo();

                        examComposition.patientRef
                            .add(_patientInfo.patientReference);

                        examComposition.patientName
                            .add(_patientInfo.patientName);

                        examComposition.encounterRef.add(
                          _patientInfo.encounterReference,
                        );

                        /// add the current date to the composition as the `Date Recorded`
                        examComposition.dateRecorded.add(
                            DateTime.now().toIso8601String().split('T')[0]);

                        if (compositionID?.isNotEmpty == true) {
                          examComposition.id.add(compositionID);
                          final dynamic result = await showDialog(
                            context: context,
                            useRootNavigator: false,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return BewellSubmitDialog(
                                data: createCompositionVariables(
                                    examComposition.data,
                                    isUpdatingFHIRComposition: true),
                                query: updateCompositionMutation,
                              );
                            },
                          );

                          if (result['updateFHIRComposition'] != null) {
                            _generalExamStreamController.add(null);
                            ExamChangeObject()
                                .generalExamChangeListener
                                .add(true);
                          }
                        } else {
                          /// if the composition ID does not exist, it means there is no composition created yet
                          ///
                          /// therefore, we do the following:
                          /// 1. we post the data and create the composition
                          /// 2. if the creation was successful, we update the composition ID with the composition ID
                          final dynamic result = await showDialog(
                            context: context,
                            useRootNavigator: false,
                            builder: (BuildContext context) {
                              return BewellSubmitDialog(
                                data: createCompositionVariables(
                                    examComposition.data),
                                query: createCompositionMutation,
                              );
                            },
                          );

                          if (result['createFHIRComposition'] != null) {
                            final String? compositionID =
                                result['createFHIRComposition']['resource']
                                        ['ID']
                                    ?.toString();

                            setState(() {
                              examComposition.generalCompositionID
                                  .add(compositionID);
                            });

                            _generalExamStreamController.add(null);

                            ExamChangeObject()
                                .generalExamChangeListener
                                .add(true);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(UserFeedBackTexts.getErrorMessage(
                                    savingGenExamText)),
                                duration: const Duration(
                                    seconds: kShortSnackBarDuration),
                              ),
                            );
                          }
                        }
                      },
                    ),
                  )
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
