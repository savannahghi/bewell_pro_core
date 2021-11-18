// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:misc_utilities/misc.dart';
import 'package:misc_utilities/responsive_widget.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/constants.dart';
import 'package:shared_themes/spaces.dart';

// Project imports:
import 'package:bewell_pro_core/application/core/graphql/mutations.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_connection.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/common/widgets/bewell_submit_dialog.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/models/exam_composition.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawers/drawer_utils/drawer_save_button.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_history/history_form_input.dart';

enum HistoryPayloadType { presenting, medical, family }

class PatientHistoryForm extends StatelessWidget {
  PatientHistoryForm({this.patientHistoryPayload});

  final List<Function> callbacks = <Function>[];
  final ExamCompositionObject compositionObject = ExamCompositionObject();
  final Map<String, dynamic> historyPayload = Map<String, dynamic>();

  final PatientHistoryData? patientHistoryPayload;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Function _updatePayload(HistoryPayloadType type, String? value) {
    return () {
      switch (type) {
        case HistoryPayloadType.presenting:
          historyPayload.addAll(<String, dynamic>{'presenting': value!});
          break;
        case HistoryPayloadType.medical:
          historyPayload.addAll(<String, dynamic>{'medical': value});
          break;
        default:
          historyPayload.addAll(<String, dynamic>{'family': value});
      }
    };
  }

  Future<void> saveHistory(BuildContext context) async {
    final PatientInfo _patientInfo = getPatientInfo();

    compositionObject
      ..recordingDoctor.add(getRecordingDoctor(context))
      ..compositionTitle.add(CompositionTypeTitle.patientHistory)
      ..patientName.add(_patientInfo.patientName)
      ..encounterRef.add(_patientInfo.encounterReference)
      ..dateRecorded.add(DateTime.now().toIso8601String().split('T')[0])
      ..patientRef.add(_patientInfo.patientReference)

      /// Serialize the history data into a string
      ..patientHistory.add(json.encode(historyPayload));

    /// Check if the composition ID exists
    final String compositionID =
        ExamCompositionObject().patientHistoryCompositionID.valueOrNull ?? '';

    if (compositionID.isNotEmpty) {
      ExamCompositionObject().id.add(compositionID);
    }

    /// Updating
    if (compositionID.isNotEmpty) {
      final dynamic result = await showDialog(
        context: context,
        useRootNavigator: false,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return BewellSubmitDialog(
            data: createCompositionVariables(compositionObject.data,
                isUpdatingFHIRComposition: true),
            query: updateCompositionMutation,
          );
        },
      );

      if (result['updateFHIRComposition'] != null) {
        ExamChangeObject().onAddPatientHistoryListener.add(true);

        /// Notify the user of successful operation
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Patient history updated successfully'),
            duration: const Duration(seconds: kShortSnackBarDuration),
            action: dismissSnackBar('close', white, context),
          ),
        );
      }
    } else {
      final dynamic result = await showDialog(
          context: context,
          useRootNavigator: false,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return BewellSubmitDialog(
              data: createCompositionVariables(compositionObject.data),
              query: createCompositionMutation,
            );
          });

      if (result['createFHIRComposition'] != null) {
        ExamChangeObject().onAddPatientHistoryListener.add(true);

        /// Update the review composition ID, so that in the future if it is accessed form
        /// [compositionID] above, it will be available
        ExamCompositionObject()
            .generalExamData
            .add(result['createFHIRComposition']['resource']['ID']?.toString());

        /// Notify the user patient history was created/updated
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text(patientHistorySuccessMsg),
            duration: const Duration(seconds: kShortSnackBarDuration),
            action: dismissSnackBar('close', white, context),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isLargeScreen = ResponsiveWidget.isLargeScreen(context);
    final bool isSaved = patientHistoryPayload != null;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isLargeScreen ? 30 : 0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: white,
          border: Border.all(color: grey.withOpacity(0.3)),
        ),
        child: Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: <Widget>[
              /// Used to add description of presenting illness's history
              HistoryFormInput(
                inputKey: AppWidgetKeys.illnessHistoryDescriptionTextKey,
                isRequired: true,
                title: patientHistoryFormTitle,
                type: HistoryPayloadType.presenting,
                callbackRegister: callbacks,
                initialInputData:
                    patientHistoryPayload?.historyOfPresentingIllness,
                updateInputDataFunction: _updatePayload,
              ),
              mediumVerticalSizedBox,

              /// The medical & Surgical history input
              HistoryFormInput(
                inputKey: AppWidgetKeys.medicalHistoryDescriptionTextKey,
                isRequired: false,
                title: patientMedicalHistoryTitle,
                type: HistoryPayloadType.medical,
                callbackRegister: callbacks,
                initialInputData:
                    patientHistoryPayload?.medicalAndSurgicalHistory,
                updateInputDataFunction: _updatePayload,
              ),
              mediumVerticalSizedBox,

              /// The family and social history input
              HistoryFormInput(
                inputKey: AppWidgetKeys.familyHistoryDescriptionTextKey,
                isRequired: false,
                title: patientFamilyTitle,
                type: HistoryPayloadType.family,
                callbackRegister: callbacks,
                initialInputData: patientHistoryPayload?.familyAndSocialHistory,
                updateInputDataFunction: _updatePayload,
              ),
              mediumVerticalSizedBox,

              /// Save button: Used to create/update patient history details
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: ResponsiveWidget.isSmallScreen(context)
                      ? double.infinity
                      : 212,
                  child: DrawerSaveButton(
                    callback: () async {
                      if (_formKey.currentState!.validate()) {
                        callbacks.map((Function func) => func()).toList();
                        await saveHistory(context);
                      }
                    },
                    buttonText:
                        isSaved ? updateHistoryBtnTxt : saveHistoryBtnTxt,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
