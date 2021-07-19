import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/application/core/graphql/mutations.dart';
import 'package:bewell_pro_core/application/core/services/input_validators.dart';
import 'package:bewell_pro_core/presentation/clinical/common/widgets/bewell_submit_dialog.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawers/drawer_utils/drawer_bottom_bar.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/medications/bewell_select_input.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/patient_timeline_divider_widget.dart';

import 'package:shared_themes/constants.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:shared_ui_components/inputs.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_ui_components/buttons.dart';

/// Used to add prescription details on a selected medication
class MedicationPrescriptionForm extends StatefulWidget {
  const MedicationPrescriptionForm({Key? key, required this.onMedicationCancel})
      : super(key: key);

  /// Called when a user cancels a medication selection
  final Function onMedicationCancel;

  @override
  _MedicationPrescriptionFormState createState() =>
      _MedicationPrescriptionFormState();
}

class _MedicationPrescriptionFormState
    extends State<MedicationPrescriptionForm> {
  final AddMedicationObject addMedicationObject = AddMedicationObject();

  final GlobalKey<FormState> _medicationFormKey = GlobalKey<FormState>();

  final List<String> routeOptions = <String>[
    'Capsules',
    'Oral',
    'Injection',
    'Sublingual',
    'Nasal',
    'ml',
    'mg'
  ];

  final List<String> takeDurationOptions = const <String>[
    'Hours',
    'Days',
    'Weeks',
    'Months'
  ];

  Future<void> _saveMedication(BuildContext context) async {
    this.addMedicationObject.recordingDoctor.add(getRecordingDoctor(context));
    final dynamic result = await showDialog(
      context: context,
      useRootNavigator: false,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return BewellSubmitDialog(
          data: this.addMedicationObject.data,
          query: addMedicationMutation,
        );
      },
    );

    if (result['createFHIRMedicationRequest'] != null) {
      ExamChangeObject().onAddMedicationListener.add(true);
      //todo: add event log
      // close drawer
      Navigator.pop(context);

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(const SnackBar(
          content: Text('Medication added'),
          duration: Duration(seconds: kShortSnackBarDuration),
        ));
      return;
    } else {
      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: red,
          content: Text(
            UserFeedBackTexts.getErrorMessage(),
            style: TextThemes.normalSize14Text(white),
          ),
          duration: const Duration(seconds: kLongSnackBarDuration),
        ),
      );
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Selected Medication', style: textTheme.subtitle2),
          smallVerticalSizedBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                child: Text(
                    toBeginningOfSentenceCase(
                      AddMedicationObject().medicationName.value!.toLowerCase(),
                    )!,
                    overflow: TextOverflow.clip,
                    style: textTheme.bodyText1!
                        .copyWith(fontWeight: FontWeight.w700)),
              ),
              Flexible(
                child: SILSecondaryButton(
                  buttonKey: AppWidgetKeys.addMedicationCancelBtnKey,
                  onPressed: widget.onMedicationCancel,
                  borderColor: redAccent,
                  text: silButtonCancel,
                  textColor: redAccent,
                ),
              ),
            ],
          ),

          // medication form here
          mediumVerticalSizedBox,
          Container(
            padding: const EdgeInsets.all(20.0),
            decoration:
                BoxDecoration(border: Border.all(color: grey.withOpacity(0.3))),
            child: Form(
              key: _medicationFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(prescriptionTitle, style: textTheme.subtitle2),

                  smallVerticalSizedBox,

                  // row here
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'RX',
                        style: textTheme.bodyText2!
                            .copyWith(color: healthcloudAccentColor),
                      ),
                      PatientTimelineDividerWidget(),
                      smallVerticalSizedBox,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: SILFormTextField(
                              key: AppWidgetKeys.rxKey,
                              onChanged: (String val) {
                                addMedicationObject.rx.add(val);
                              },
                              validator: (String? v) =>
                                  InputValidators.validateGenericInput(
                                      v, medications),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          mediumHorizontalSizedBox,
                          Expanded(
                            child: BeWellSelectInput(
                              options: routeOptions,
                              value: routeOptions.first,
                              dropDownInputKey:
                                  Key('${routeOptions.first}_key'),
                              onChanged: (String? v) {
                                addMedicationObject.route.add(v);
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  mediumVerticalSizedBox,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        freqTitle,
                        style: textTheme.bodyText2!
                            .copyWith(color: healthcloudAccentColor),
                      ),
                      PatientTimelineDividerWidget(),
                      smallVerticalSizedBox,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: SILFormTextField(
                              key: AppWidgetKeys.takeEveryKey,
                              onChanged: (String val) {
                                addMedicationObject.takeEvery.add(val);
                              },
                              validator: (String? v) =>
                                  InputValidators.validateGenericInput(
                                      v, 'Time'),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          mediumHorizontalSizedBox,
                          Expanded(
                            child: BeWellSelectInput(
                              options: takeDurationOptions,
                              value: takeDurationOptions.first,
                              dropDownInputKey:
                                  Key('${takeDurationOptions.first}_key'),
                              onChanged: (String? v) {
                                addMedicationObject.takeEveryFrequency.add(v);
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // row here
                  mediumVerticalSizedBox,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        periodTitle,
                        style: textTheme.bodyText2!
                            .copyWith(color: healthcloudAccentColor),
                      ),
                      PatientTimelineDividerWidget(),
                      smallVerticalSizedBox,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: SILFormTextField(
                              key: AppWidgetKeys.periodKey,
                              onChanged: (String val) {
                                addMedicationObject.forValue.add(val);
                              },
                              validator: (String? v) =>
                                  InputValidators.validateGenericInput(
                                      v, 'Time'),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          mediumHorizontalSizedBox,
                          Expanded(
                            child: BeWellSelectInput(
                              options: takeDurationOptions,
                              value: takeDurationOptions.first,
                              dropDownInputKey:
                                  Key('${takeDurationOptions.first}_key'),
                              onChanged: (String? v) {
                                addMedicationObject.forDuration.add(v);
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // row here
                  mediumVerticalSizedBox,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        extraNotesTitle,
                        style: textTheme.bodyText2!
                            .copyWith(color: healthcloudAccentColor),
                      ),
                      PatientTimelineDividerWidget(),
                      smallVerticalSizedBox,
                      SILFormTextField(
                        key: AppWidgetKeys.noteKey,
                        maxLines: 5,
                        onChanged: (String val) {
                          addMedicationObject.note.add(val);
                        },
                        hintText: notesHint,
                        validator: (String? v) {
                          if (v.toString().isEmpty) {
                            return noteRequired;
                          }
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).viewInsets.bottom,
                      ),
                    ],
                  ),
                  // save button
                  mediumVerticalSizedBox,
                  DrawerBottomBar(
                    saveButtonCallback: () async {
                      // save medication form validation
                      if (_medicationFormKey.currentState!.validate()) {
                        await _saveMedication(context);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
