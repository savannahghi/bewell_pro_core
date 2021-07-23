import 'package:app_wrapper/app_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:bewell_pro_core/application/core/graphql/mutations.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/common/widgets/bewell_submit_dialog.dart';
import 'package:bewell_pro_core/presentation/clinical/post_visit_survey/rating.dart';
import 'package:bewell_pro_core/presentation/core/home/widgets/sil_bottom_navigation_bar.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';
import 'package:misc_utilities/misc.dart';
import 'package:misc_utilities/responsive_widget.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/constants.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_ui_components/buttons.dart';
import 'package:shared_ui_components/inputs.dart';

class BeWellPostVisitSurveyPage extends StatefulWidget {
  @override
  BeWellPostVisitSurveyPageState createState() =>
      BeWellPostVisitSurveyPageState();
}

class BeWellPostVisitSurveyPageState extends State<BeWellPostVisitSurveyPage> {
  static String? feedback;

  String? comment;
  String criticism = '';
  int currentRating = 0;
  IconData iconFeedback = Icons.sentiment_neutral;
  bool isCompletePressed = false;
  bool isStarSelected = false;
  bool submitting = false;
  String suggestions = '';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void rateMessages(int currentRating, String appName) {
    if (currentRating <= 2) {
      feedback = lowRatingMessage;
    } else if ((currentRating > 2) && (currentRating < 4)) {
      feedback = mediumRatingMessage + appName;
    } else if (currentRating >= 4) {
      feedback = highRatingMessage;
    }
  }

  Future<void> _completeSurveyCallBack(BuildContext context) async {
    setState(() {
      isCompletePressed = true;
    });
    if (_formKey.currentState!.validate() &&
        isCompletePressed &&
        isStarSelected == true) {
      SnackBarListenersChangeObject().onPostVisitListener.add(true);

      /// - post the data
      final dynamic result = await showDialog(
          context: context,
          useRootNavigator: false,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return BewellSubmitDialog(
              data: postVisitSurveyMutationVariables(
                  this.currentRating.toInt(), this.criticism, this.suggestions),
              query: postVisitSurveyMutation,
            );
          });

      /// - check for successful posting
      if (result != null &&
          result['recordPostVisitSurvey'] != null &&
          result['recordPostVisitSurvey'] == true) {
        /// add bottom sheet here
        bottomSheet(context: context, builder: SurveyBottomSheet(context));

        /// - show feedback
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text(successfulSurveyCompletionText),
            duration: const Duration(seconds: kShortSnackBarDuration),
            action: dismissSnackBar(closeText, white, context),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:
                Text(UserFeedBackTexts.getErrorMessage(submittingDataText)),
            duration: const Duration(seconds: kShortSnackBarDuration),
            action: dismissSnackBar(closeText, white, context),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final bool isSmallScreen = ResponsiveWidget.isSmallScreen(context);
    final String appName = AppWrapperBase.of(context)!.appName;

    return Scaffold(
      bottomNavigationBar: const SILBottomNavigatorBar(),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: isSmallScreen
                ? const EdgeInsets.symmetric(vertical: 10, horizontal: 10)
                : const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  surveyDescription,
                  style: textTheme.subtitle2!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
              ),
              mediumVerticalSizedBox,
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: isSmallScreen ? 15 : 40, vertical: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: grey.withOpacity(0.3)),
                    borderRadius: const BorderRadius.all(Radius.circular(5))),
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    smallVerticalSizedBox,
                    Text(recommendationText + appName + colleagueText,
                        style: textTheme.subtitle2!
                            .copyWith(fontWeight: FontWeight.w400)),
                    mediumVerticalSizedBox,
                    Container(
                        decoration: isStarSelected == false &&
                                isCompletePressed == true
                            ? BoxDecoration(
                                border: Border.all(color: redAccent),
                                borderRadius: BorderRadius.circular(5))
                            : BoxDecoration(
                                border: Border.all(color: white, width: 0.1),
                                borderRadius: BorderRadius.circular(5)),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Rating(
                            onRatingChanged: (int rating) => setState(() {
                              this.currentRating = rating;

                              isStarSelected = true;

                              rateMessages(currentRating, appName);
                            }),
                            currentRating: currentRating,
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: !isStarSelected && isCompletePressed == true
                          ? Text(ratingText,
                              style: TextStyle(
                                  color: Colors.red[900], fontSize: 12))
                          : const SizedBox(),
                    ),
                    mediumVerticalSizedBox,
                    Text(missingItemText,
                        style: textTheme.subtitle2!
                            .copyWith(fontWeight: FontWeight.w400)),
                    smallVerticalSizedBox,
                    SILFormTextField(
                      key: const Key('criticism'),
                      hintText: missingTitle,
                      maxLines: isSmallScreen ? 2 : 3,
                      onChanged: (String value) {
                        setState(() {
                          criticism = value;
                        });
                      },
                    ),
                    mediumVerticalSizedBox,
                    Text(happinessMessage,
                        style: textTheme.subtitle2!
                            .copyWith(fontWeight: FontWeight.w400)),
                    smallVerticalSizedBox,
                    SILFormTextField(
                      key: const Key('suggestion'),
                      hintText: happinessHintText,
                      maxLines: isSmallScreen ? 2 : 3,
                      onChanged: (String value) {
                        setState(() {
                          suggestions = value.toString();
                        });
                      },
                    ),
                    mediumVerticalSizedBox,
                    const Divider(),
                    smallVerticalSizedBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        // skip survey button
                        SILSecondaryButton(
                          buttonKey: AppWidgetKeys.skipButtonKey,
                          onPressed: () => Navigator.of(context)
                              .pushNamed(patientsPageRoute),
                          buttonColor: white,
                          borderColor: healthcloudAccentColor,
                          text: skipText.toUpperCase(),
                        ),
                        smallHorizontalSizedBox,

                        // complete survey button
                        SILPrimaryButton(
                          buttonKey: AppWidgetKeys.completeButtonKey,
                          onPressed: () async {
                            await _completeSurveyCallBack(context);
                          },
                          buttonColor: healthcloudAccentColor,
                          text: completeText,
                          textColor: white,
                        ),
                      ],
                    ),
                    smallVerticalSizedBox,
                  ],
                ),
              ),
              largeVerticalSizedBox
            ],
          ),
        ),
      ),
    );
  }
}
