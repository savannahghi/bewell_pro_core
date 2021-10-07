// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:misc_utilities/misc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/constants.dart';
import 'package:shared_ui_components/buttons.dart';

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

class SaveReviewOfSystemsButton extends StatelessWidget {
  /// The object in the exam composition singleton which is to be updated
  /// with the new data
  final BehaviorSubject<String?> examCompositionObject;

  /// The data to be added to the [examCompositionObject] above
  final Map<String, dynamic> compositionData;

  const SaveReviewOfSystemsButton(
      {required this.examCompositionObject, required this.compositionData});

  Future<void> updateOrCreateComposition(BuildContext context) async {
    /// get the patient's information and append it to the composition
    final PatientInfo _patientInfo = getPatientInfo();

    ExamCompositionObject()
      ..patientRef.add(_patientInfo.patientReference)
      ..patientName.add(_patientInfo.patientName)
      ..encounterRef.add(_patientInfo.encounterReference)
      ..dateRecorded.add(DateTime.now().toIso8601String().split('T')[0])
      ..recordingDoctor.add(getRecordingDoctor(context))

      /// encode the composition data from the filled form passed in in the form of [compositionData],
      /// which is a [Map<String, dynamic>]
      ..compositionTitle.add(CompositionTypeTitle.reviewOfSystems);

    examCompositionObject.add(json.encode(compositionData));

    /// Access the composition ID if exists. This composition ID is used in the variables to
    /// notify the backend about the query to run... either [update] or [create]
    final String? compositionID =
        ExamCompositionObject().reviewCompositionID.valueOrNull;

    /// check if the composition ID exists so that we can decide which query
    /// to pass to [BewellSubmitDialog]... either [update] or [create]
    ExamCompositionObject().id.add(compositionID);

    /// Run an update query if the composition ID exists
    if (compositionID?.isNotEmpty == true) {
      final dynamic result = await showDialog(
        context: context,
        useRootNavigator: false,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return BewellSubmitDialog(
            data: createCompositionVariables(ExamCompositionObject().data,
                isUpdatingFHIRComposition: true),
            query: updateCompositionMutation,
          );
        },
      );

      if (result != null && result['updateFHIRComposition'] != null) {
        ExamChangeObject().reviewOfSystemsChangeListener.add(true);
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(reviewSavedSuccessMsg),
            duration: Duration(seconds: kShortSnackBarDuration),
          ),
        );
      }

      if (result['error'] != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(unableToAddCondition),
            duration: Duration(seconds: kShortSnackBarDuration),
          ),
        );
        Navigator.of(context).pop();
      }

      /// Run a create query if the composition ID does not exist.
      /// then set the composition ID so that it is available the next
      /// time it is asked for
    } else {
      final dynamic result = await showDialog(
          context: context,
          useRootNavigator: false,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return BewellSubmitDialog(
              data: createCompositionVariables(ExamCompositionObject().data),
              query: createCompositionMutation,
            );
          });

      if (result != null && result['createFHIRComposition'] != null) {
        /// Update the review composition ID, so that in the future if it is accessed form
        /// [compositionID] above, it will be available
        ExamCompositionObject()
            .reviewCompositionID
            .add(result['createFHIRComposition']['resource']['ID'].toString());

        // Notify the user of successful operation
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text(reviewCreatedSuccessMsg),
            duration: const Duration(seconds: kShortSnackBarDuration),
            action: dismissSnackBar('close', white, context),
          ),
        );

        // Notify the [onAddPatientExaminationListener] that the state of the data has changed
        /// so any subscribers to this Stream<dynamic> are notified so they can rebuild the UI
        ExamChangeObject().reviewOfSystemsChangeListener.add(true);

        /// Close the drawer
        Navigator.of(context).pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      color: patientExamDrawerColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SILSecondaryButton(
            buttonKey: AppWidgetKeys.silSecondaryButton,
            onPressed: () => Navigator.of(context).pop(),
            borderColor: Colors.transparent,
            text: 'Cancel',
            textColor: healthcloudAccentColor,
          ),
          DrawerSaveButton(
            callback: () async => updateOrCreateComposition(context),
          ),
        ],
      ),
    );
  }
}
