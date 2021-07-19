import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/domain/core/value_objects/asset_strings.dart';

import 'package:shared_themes/colors.dart';
import 'package:shared_themes/constants.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:shared_ui_components/buttons.dart';

/// [GenericTimeoutWidget] is called when a timeout has occurred when fetching data from the
/// API. It's purpose is to communicate a specific message, the server could not return a response in time
class GenericTimeoutWidget extends StatelessWidget {
  const GenericTimeoutWidget({
    Key? key,
    required this.recoverRoute,
    this.payload,
    required this.action,
    this.recoverCallback,
    this.recoverActionText,
  }) : super(key: key);

  final String action;
  final Map<String, dynamic>? payload;
  final String? recoverActionText;
  final Function? recoverCallback;
  final String recoverRoute;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(emptyDataUrl, height: 100, width: 100),
            smallVerticalSizedBox,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              key: AppWidgetKeys.genericErrorTextKey,
              child: Text(UserFeedBackTexts.getErrorMessage(action),
                  textAlign: TextAlign.center,
                  style: TextThemes.normalSize14Text()),
            ),
            smallVerticalSizedBox,
            SILPrimaryButton(
              buttonKey: AppWidgetKeys.genericTimeOutKey,
              buttonColor: healthcloudPrimaryColor,
              borderColor: healthcloudPrimaryColor,
              onPressed: () {
                recoverCallback != null
                    ? recoverCallback?.call()
                    : triggerNavigationEvent(
                        context: context,
                        namedRoute: recoverRoute,
                        args: payload,
                      );
              },
              text: recoverActionText ?? 'Retry',
            ),
          ],
        ),
      ),
    );
  }
}
