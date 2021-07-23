import 'package:flutter/material.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/domain/core/value_objects/asset_strings.dart';
import 'package:bewell_pro_core/presentation/core/home/widgets/sil_bottom_navigation_bar.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';
import 'package:misc_utilities/responsive_widget.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_ui_components/buttons.dart';

class ConfirmSurveyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = ResponsiveWidget.isSmallScreen(context);
    return Scaffold(
      bottomNavigationBar: const SILBottomNavigatorBar(),
      body: Card(
        margin: const EdgeInsets.all(20),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        elevation: 0,
        child: Container(
          margin: EdgeInsets.only(
              left: 20, right: 20, bottom: 20, top: isSmallScreen ? 20 : 0),
          child: Column(
            children: <Widget>[
              Expanded(child: Image.asset(surveyIconUrl)),
              Expanded(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: isSmallScreen ? 0 : 200),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(feedbackText,
                          style: Theme.of(context).textTheme.headline6),
                      Text(takeSurveyInfoText,
                          textAlign: TextAlign.justify,
                          style: Theme.of(context).textTheme.bodyText1)
                    ],
                  ),
                ),
              ),
              if (isSmallScreen)
                mediumVerticalSizedBox
              else
                size40VerticalSizedBox,
              Expanded(
                flex: isSmallScreen ? 0 : 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // skip survey button
                    SILSecondaryButton(
                      buttonKey: AppWidgetKeys.skipSurveyButtonKey,
                      onPressed: () async => triggerNavigationEvent(
                          context: context, route: patientsPageRoute),
                      text: skipText,
                    ),

                    // go to post visit survey button
                    SILPrimaryButton(
                      buttonKey: AppWidgetKeys.takeSurveyButtonKey,
                      onPressed: () => Navigator.of(context)
                          .pushNamed(postVisitSurveyPageRoute),
                      text: takeSurveyText,
                      textColor: white,
                      buttonColor: healthcloudAccentColor,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
