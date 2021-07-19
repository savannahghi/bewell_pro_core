import 'dart:async';
import 'package:flutter/material.dart';
import 'package:bewell_pro_core/application/core/graphql/mutations.dart';
import 'package:bewell_pro_core/domain/clinical/entities/current_episode.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/common/widgets/bewell_submit_dialog.dart';
import 'package:misc_utilities/responsive_widget.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_ui_components/buttons.dart';

//End Visit button dialog

class EndVisitDialogueContent extends StatefulWidget {
  final String name;
  const EndVisitDialogueContent({required this.name});

  @override
  _EndVisitDialogueContentState createState() =>
      _EndVisitDialogueContentState();
}

class _EndVisitDialogueContentState extends State<EndVisitDialogueContent> {
  Future<void> confirmAndEndVisit() async {
    late bool endEpisode;

    // get the patient's episode ID
    final EpisodeOfCarePayload _episode =
        CurrentPatientInEpisode().episodeOfCarePayload.value;
    final String episodeID = _episode.episodeOfCare!.id!;

    // show loading progress indicator
    final Map<String, dynamic>? result = await showDialog<Map<String, dynamic>>(
      context: context,
      useRootNavigator: false,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return BewellSubmitDialog(
          data: endVisitMutationVariables(episodeID),
          query: endVisitMutation,
        );
      },
    );

    if (result!['endEpisode'] != null && result['endEpisode'] == true) {
      endEpisode = result['endEpisode'] as bool;
    } else {
      endEpisode = false;
    }

    await Future<void>.delayed(Duration.zero).then((_) => Navigator.of(context)
        .pop(endEpisode ? confirmEndVisit : failedEndVisit));
  }

  @override
  Widget build(BuildContext context) {
    final bool isSmall = SILResponsiveWidget.isSmallScreen(context);
    final List<Widget> children2 = <Widget>[
      // cancel button
      SILSecondaryButton(
        buttonKey: AppWidgetKeys.cancelEndVisitKey,
        onPressed: () => Navigator.of(context).pop(cancelledEndVisit),
        buttonColor: white,
        textColor: Theme.of(context).primaryColor,
        borderColor: healthcloudPrimaryColor,
        text: silButtonCancel,
      ),
      if (isSmall) verySmallHorizontalSizedBox else mediumHorizontalSizedBox,
      SILPrimaryButton(
        buttonKey: AppWidgetKeys.confirmEndVisitKey,
        onPressed: () => confirmAndEndVisit(),
        text: confirmBtnText,
        buttonColor: healthcloudPrimaryColor,
      ),
    ];
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: isSmall ? 15 : 20, horizontal: isSmall ? 20 : 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            endVisitText,
            style:
                Theme.of(context).textTheme.subtitle1!.copyWith(color: black),
          ),
          if (isSmall) smallVerticalSizedBox else mediumVerticalSizedBox,
          const Divider(color: Colors.black38, thickness: 0.5),
          if (isSmall) smallVerticalSizedBox else mediumVerticalSizedBox,
          RichText(
            text: TextSpan(
                style: isSmall
                    ? Theme.of(context).textTheme.bodyText1
                    : Theme.of(context).textTheme.subtitle2,
                children: <TextSpan>[
                  const TextSpan(text: endVisitTitle),
                  TextSpan(
                      text: widget.name,
                      style: const TextStyle(fontWeight: FontWeight.w700)),
                  const TextSpan(text: endVisitSubTitle),
                ]),
          ),
          mediumVerticalSizedBox,
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: children2)
        ],
      ),
    );
  }
}
