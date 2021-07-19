import 'package:flutter/material.dart';
import 'package:bewell_pro_core/application/core/graphql/mutations.dart';

import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_connection.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/common/widgets/bewell_submit_dialog.dart';

import 'package:bewell_pro_core/presentation/clinical/patient_exam/models/exam_composition.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/retire_helper.dart';
import 'package:rxdart/rxdart.dart';

import 'package:misc_utilities/misc.dart';

import 'package:shared_themes/colors.dart';
import 'package:shared_themes/constants.dart';
import 'package:shared_ui_components/buttons.dart';

class RetireCompositionButton extends StatefulWidget {
  /// Used to get the correct property from [ExamCompositionObject] to update
  final String title;

  /// The [CompositionTypeTitle] is used to determine which type of composition
  /// to retire
  final String compositionTypeTitle;

  const RetireCompositionButton(
      {required this.title, required this.compositionTypeTitle});

  @override
  _RetireCompositionButtonState createState() =>
      _RetireCompositionButtonState();
}

class _RetireCompositionButtonState extends State<RetireCompositionButton> {
  final ExamCompositionObject examComposition = ExamCompositionObject();
  BehaviorSubject<String?>? getCompositionObject() {
    switch (widget.title.toLowerCase()) {
      case respiratory:
        return ExamCompositionObject().respiratory;

      case peripheral:
        return ExamCompositionObject().peripheral;

      case gastrointestinal:
        return ExamCompositionObject().gastrointestinal;

      case hematologic:
        return ExamCompositionObject().hematologic;

      case urinary:
        return ExamCompositionObject().urinary;

      case neurologic:
        return ExamCompositionObject().neurologic;

      case cardiac:
        return ExamCompositionObject().cardiac;

      case heent:
        return ExamCompositionObject().heent;

      case heentTwo:
        return ExamCompositionObject().heentTwo;

      case gi:
        return ExamCompositionObject().gi;

      case gu:
        return ExamCompositionObject().gu;

      case ms:
        return ExamCompositionObject().ms;

      case skin:
        return ExamCompositionObject().skin;

      case psychiatric:
        return ExamCompositionObject().psychiatric;
    }
  }

  Future<void> retireCompositionFunction() async {
    this.examComposition
      ..recordingDoctor.add(getRecordingDoctor(context))
      ..compositionTitle.add(CompositionTypeTitle.reviewOfSystems);

    final String? compositionID =
        this.examComposition.reviewCompositionID.value;

    final BehaviorSubject<String?>? compositionType = getCompositionObject();

    compositionType!.add(null);

    this.examComposition.id.add(compositionID);

    final PatientInfo _patientInfo = getPatientInfo();

    final String compositionTitle = titleCase(widget.title);

    await createRetireModal(
      context: context,
      retireItemName: widget.title,
      section: SectionType.reviewOfSystem,
      patientName: _patientInfo.patientName,
      onChangeReasonField: (dynamic v) {},
      onRetireReviewOfSystemCallback: () async {
        Navigator.of(context, rootNavigator: true).pop();

        if (compositionID != null) {
          final dynamic result = await showDialog(
            context: context,
            useRootNavigator: false,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return BewellSubmitDialog(
                data: createCompositionVariables(this.examComposition.data,
                    isUpdatingFHIRComposition: true),
                query: updateCompositionMutation,
              );
            },
          );

          if (result != null && result['updateFHIRComposition'] != null) {
            ExamChangeObject().reviewOfSystemsChangeListener.add(true);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('$compositionTitle review removed successfully'),
              duration: const Duration(seconds: kShortSnackBarDuration),
              action: dismissSnackBar(closeText, white, context),
            ));
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(UserFeedBackTexts.getErrorMessage()),
              duration: const Duration(seconds: kShortSnackBarDuration),
              action: dismissSnackBar(closeText, white, context),
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SILSecondaryButton(
        buttonKey: AppWidgetKeys.retireCompositionButtonKey,
        onPressed: () => retireCompositionFunction(),
        borderColor: redAccent,
        text: retireText,
        textColor: redAccent,
      ),
    );
  }
}
