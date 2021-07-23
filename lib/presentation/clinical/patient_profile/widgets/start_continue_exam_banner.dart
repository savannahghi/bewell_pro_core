import 'package:flutter/material.dart';
import 'package:bewell_pro_core/application/core/graphql/mutations.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';

import 'package:bewell_pro_core/domain/clinical/entities/current_episode.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/domain/core/value_objects/asset_strings.dart';
import 'package:bewell_pro_core/domain/core/value_objects/events.dart';
import 'package:bewell_pro_core/presentation/clinical/common/widgets/bewell_submit_dialog.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';

import 'package:misc_utilities/responsive_widget.dart';

import 'package:shared_themes/colors.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_ui_components/buttons.dart';
import 'package:shared_ui_components/platform_loader.dart';

class StartOrContinueExamBanner extends StatelessWidget {
  final bool isChecking;
  final bool shouldContinueExam;
  final String patientName;

  const StartOrContinueExamBanner(
      {required this.isChecking,
      required this.shouldContinueExam,
      required this.patientName});

  /// Starts or continues an exam based on the value of [shouldContinueExam]
  ///
  /// PARAMS
  /// [BuildContext context] - the build context of the current widget
  /// [bool shouldContinueExam] - whether to continue an exam or start a new
  /// one. This value is set to
  Future<void> startOrContinueExam(BuildContext context,
      {bool shouldContinueExam = false}) async {
    if (shouldContinueExam) {
      triggerEvent(continueVisitEvent, context);
      await triggerNavigationEvent(
          context: context, route: patientExamPageRoute);
      return;
    } else {
      final EpisodeOfCarePayload _episode =
          CurrentPatientInEpisode().episodeOfCarePayload.value;

      final Map<String, dynamic>? result =
          await showDialog<Map<String, dynamic>?>(
        useRootNavigator: false,
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return BewellSubmitDialog(
            data: <String, dynamic>{'episodeID': _episode.episodeOfCare?.id},
            query: startEncounterMutation,
          );
        },
      );

      if (result != null && result['startEncounter'] != null) {
        /// This result['startEncounter'] returns a string value which
        /// represents the encounter ID
        CurrentPatientInEpisode()
            .encounterID
            .add(result['startEncounter']?.toString());

        triggerEvent(startExamEvent, context);

        await triggerNavigationEvent(
            context: context, route: patientExamPageRoute);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> items = <Widget>[
      if (ResponsiveWidget.isLargeScreen(context))
        Row(
          children: <Widget>[
            Container(
              key: AppWidgetKeys.patientTimelineImageContainer,
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage(stethoscopeIconUrl)),
              ),
            ),
            size15HorizontalSizedBox,

            /// ExamBanner details
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '${shouldContinueExam ? 'Continue' : 'Start'} Patient Exam',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: healthcloudAccentColor),
                ),
                verySmallVerticalSizedBox,
                Text(
                  '${shouldContinueExam ? 'Continue' : 'Start a'} ${shouldContinueExam ? patientName : 'patient'}\'s'
                  ' exam by tapping on the ${shouldContinueExam ? 'Continue' : 'Start'} Exam button',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
          ],
        )
      else
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '${shouldContinueExam ? 'Continue' : 'Start'} Patient Exam',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontWeight: FontWeight.bold, color: healthcloudAccentColor),
            ),
            verySmallVerticalSizedBox,
            Text(
              '${shouldContinueExam ? 'Continue' : 'Start a'} ${shouldContinueExam ? patientName : 'patient'}\'s'
              ' exam by tapping on the ${shouldContinueExam ? 'Continue' : 'Start'} exam button',
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),

      /// Start/Continue exam button
      Align(
        alignment: Alignment.centerRight,
        child: SILSecondaryButton(
          buttonKey: AppWidgetKeys.startContinueExamWrapperButtonKey,
          onPressed: () => startOrContinueExam(context,
              shouldContinueExam: shouldContinueExam),
          text: shouldContinueExam ? 'Continue Exam' : 'Start Exam',
          textColor: healthcloudPrimaryColor,
          borderColor: healthcloudPrimaryColor,
        ),
      )
    ];

    return Container(
      padding: ResponsiveWidget.isSmallScreen(context)
          ? const EdgeInsets.symmetric(vertical: 10, horizontal: 15)
          : const EdgeInsets.all(20),
      margin: ResponsiveWidget.isSmallScreen(context)
          ? const EdgeInsets.symmetric(vertical: 5, horizontal: 8)
          : const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: grey.withOpacity(0.4))),
      child: isChecking == false
          ? Wrap(children: items)
          : const SILPlatformLoader(),
    );
  }
}
