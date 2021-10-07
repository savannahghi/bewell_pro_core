// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:shared_themes/colors.dart';
import 'package:shared_ui_components/buttons.dart';

// Project imports:
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawers/drawer_utils/drawer_save_button.dart';

/// Save and or cancel buttons bottom banner on drawers
class DrawerBottomBar extends StatelessWidget {
  const DrawerBottomBar({required this.saveButtonCallback});

  /// A [Function] to be executed when the save button is tapped.
  ///
  /// The reason the cancel button is not required is because the cancel button
  /// always closes the drawer and is the same for all drawers
  final Function saveButtonCallback;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      color: patientExamDrawerColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SILSecondaryButton(
              buttonKey: AppWidgetKeys.silSecondaryButton,
              onPressed: () => Navigator.of(context).pop(),
              text: silButtonCancel,
              addBorder: true,
              textColor: healthcloudAccentColor,
              borderColor: healthcloudAccentColor),
          DrawerSaveButton(
            callback: () => saveButtonCallback(),
          ),
        ],
      ),
    );
  }
}
