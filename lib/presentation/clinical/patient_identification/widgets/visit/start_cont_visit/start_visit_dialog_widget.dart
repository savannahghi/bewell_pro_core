// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:shared_ui_components/buttons.dart';

// Project imports:
import 'package:bewell_pro_core/domain/clinical/value_objects/start_visit_type_enum.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';

/// Dialog for starting a visit by emergency override or request access
class StartVisitDialogWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text(requestAccess),
      titleTextStyle: TextThemes.boldSize18Text(healthcloudPrimaryColor),
      contentPadding: const EdgeInsets.all(20),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      children: <Widget>[
        SizedBox(
          height: 48,
          child: SILSecondaryButton(
            buttonKey: AppWidgetKeys.emergencyOverrideKey,
            onPressed: () {
              // start visit via emergency override
              Navigator.pop(context, StartVisitType.emergencyOverride);
            },
            buttonColor: healthcloudPrimaryColor,
            text: emergencyOverrideTitle,
            borderColor: healthcloudPrimaryColor,
          ),
        ),
        smallVerticalSizedBox,
        SizedBox(
          height: 48,
          child: SILPrimaryButton(
            buttonKey: AppWidgetKeys.requestAccessKey,
            onPressed: () {
              // start visit via request access
              Navigator.pop(context, StartVisitType.requestAccess);
            },
            buttonColor: healthcloudPrimaryColor,
            text: requestAccessTitle,
            borderColor: healthcloudPrimaryColor,
          ),
        )
      ],
    );
  }
}
