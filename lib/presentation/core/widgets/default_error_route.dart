// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:sghi_core/shared_themes/colors.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/shared_themes/text_themes.dart';
import 'package:sghi_core/ui_components/src/buttons.dart';

// Project imports:
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';

class DefaultErrorRoute extends StatelessWidget {
  const DefaultErrorRoute(
      {required this.whereToUrl, this.whereToText = goBack});

  final String whereToUrl;
  final String whereToText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                      color: white,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.greenAccent),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: grey.withOpacity(0.03), spreadRadius: 10),
                      ]),
                  child: const Center(
                    child: Icon(Icons.priority_high, size: 100, color: red),
                  ),
                ),
                veryLargeVerticalSizedBox,
                Text(
                  errorOccurred,
                  style: TextThemes.normalSize20Text(),
                ),
                smallVerticalSizedBox,
                const Text(errorFindingResults),
              ],
            ),
            SILSecondaryButton(
              buttonKey: AppWidgetKeys.goBackButtonKey,
              onPressed: () async => triggerNavigationEvent(
                  context: context, route: whereToUrl, shouldReplace: true),
              text: goBack,
              customChild: Text(
                whereToText,
                style: TextThemes.boldSize16Text(healthcloudPrimaryColor),
              ),
              borderColor: healthcloudPrimaryColor,
            )
          ],
        ),
      ),
    );
  }
}
