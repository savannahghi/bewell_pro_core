import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:async_redux/async_redux.dart';

import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/end_visit_dialogue_content.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';

import 'package:misc_utilities/misc.dart';
import 'package:misc_utilities/responsive_widget.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/constants.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:shared_ui_components/buttons.dart';

class PatientBannerBioInfo extends StatelessWidget {
  final String patientName;
  final String patientDOB;
  final String patientAge;
  final String patientGender;
  final String patientPhoneNumber;

  const PatientBannerBioInfo({
    required this.patientName,
    required this.patientDOB,
    required this.patientAge,
    required this.patientGender,
    required this.patientPhoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = SILResponsiveWidget.isSmallScreen(context);
    final bool isLargeScreen = SILResponsiveWidget.isLargeScreen(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            if (isSmallScreen)
              Flexible(
                child: Text(
                  toBeginningOfSentenceCase(patientName)!,
                  style: TextThemes.heavySize16Text(titleColor),
                ),
              )
            else
              Text(toBeginningOfSentenceCase(patientName)!,
                  style: TextThemes.heavySize20Text(titleColor)),

            // end visit button
            SILPrimaryButton(
              buttonKey: AppWidgetKeys.endVisitDialogue,
              onPressed: () => endVisitDialogue(
                  context, toBeginningOfSentenceCase(patientName)!),
              text: endVisitText,
              buttonColor: redAccent,
              borderColor: Colors.transparent,
              textColor: white,
              customPadding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            )
          ],
        ),
        if (isSmallScreen) const SizedBox() else mediumVerticalSizedBox,
        Row(
          children: <Widget>[
            if (isLargeScreen)
              Text(
                  '$dateOfBirthInitials $patientDOB (${patientAge.toString()} yrs)',
                  style: TextThemes.veryBoldSize15Text(textBodyColor))
            else
              Text('Age: ${patientAge.toString()} yrs',
                  style: TextThemes.veryBoldSize15Text(textBodyColor)),
            if (isLargeScreen)
              size15HorizontalSizedBox
            else
              smallHorizontalSizedBox,
            Text(patientGender.capitalize(),
                style: TextThemes.veryBoldSize15Text(textBodyColor)),
            if (isLargeScreen)
              size15HorizontalSizedBox
            else
              smallHorizontalSizedBox,
            Text(patientPhoneNumber,
                style: TextThemes.veryBoldSize15Text(textBodyColor)),
          ],
        ),
      ],
    );
  }

  Future<void> endVisitDialogue(
      BuildContext context, String patientName) async {
    final dynamic endVisit = await showDialog(
        context: context,
        useRootNavigator: false,
        builder: (BuildContext context) {
          return SimpleDialog(
            backgroundColor: white,
            elevation: 0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            titlePadding: EdgeInsets.zero,
            children: <Widget>[EndVisitDialogueContent(name: patientName)],
          );
        });

    if (endVisit == 'confirm_end_visit') {
      final TimelineInfoObject timelineInfoObject = TimelineInfoObject();
      timelineInfoObject.showAll.add(false);
      timelineInfoObject.visits.add(<dynamic>[]);

      final AppState state = StoreProvider.state<AppState>(context)!;
      final String currentVisitCount = state.miscState!.visitCount!;

      /// check if the current visit count is [postSurveyVisitAskCount]
      if (currentVisitCount == kPostSurveyVisitAskCount) {
        // reset all the the patient's objects
        resetPatientData();

        await triggerNavigationEvent(
          context: context,
          namedRoute: postVisitSurveyPageRoute,
        );
        return;
      } else {
        Navigator.of(context).pushNamedAndRemoveUntil(
            patientsPageRoute, (Route<dynamic> route) => false);

        // reset all the the patient's objects
        resetPatientData();
        return;
      }
    } else if (endVisit == 'failed_end_visit') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(UserFeedBackTexts.getErrorMessage(endingVisit)),
        duration: const Duration(seconds: kShortSnackBarDuration),
        action: dismissSnackBar(closeBtnText, white, context),
      ));
      return;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text(endVisitCancel),
        duration: const Duration(seconds: kShortSnackBarDuration),
        action: dismissSnackBar(closeBtnText, white, context),
      ));
      return;
    }
  }
}
