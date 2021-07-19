import 'package:flutter/material.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';

import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';

import 'package:misc_utilities/responsive_widget.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/constants.dart';
import 'package:shared_ui_components/buttons.dart';

class NoPatientFound extends StatelessWidget {
  final String searchString;
  final Function? recoverCallback;
  final String? titleText;
  final String? bodyText;
  final bool isError;

  const NoPatientFound(
      {required this.searchString,
      this.recoverCallback,
      this.titleText,
      this.bodyText,
      this.isError = false});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
            horizontal: SILResponsiveWidget.isSmallScreen(context) ? 15 : 30,
            vertical: SILResponsiveWidget.isSmallScreen(context) ? 20 : 50),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Color(0xfff7f7f9),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text.rich(
              TextSpan(
                children: <InlineSpan>[
                  TextSpan(
                      text: titleText ?? noMatch,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(color: black, fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: searchString,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(color: healthcloudTextColorPurple))
                ],
              ),
            ),
            smallVerticalSizedBox,
            Text.rich(
              TextSpan(
                children: <InlineSpan>[
                  TextSpan(
                      text: bodyText ?? patientNoGuide,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(height: 1.5)),
                  TextSpan(
                      text: isError ? kBewellSupportPhoneNumber : '*552#',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(color: healthcloudTextColorPurple))
                ],
              ),
            ),
            smallVerticalSizedBox,
            const Divider(),
            smallVerticalSizedBox,
            Align(
              alignment: Alignment.centerRight,
              child: SILPrimaryButton(
                buttonKey: AppWidgetKeys.silPrimaryButtonKey,
                onPressed: () {
                  recoverCallback != null
                      ? recoverCallback!.call()
                      : triggerNavigationEvent(
                          context: context, namedRoute: addPatientRoute);
                },
                text: isError ? searchAgain : regPatient,
                buttonColor: healthcloudAccentColor,
                textColor: white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
