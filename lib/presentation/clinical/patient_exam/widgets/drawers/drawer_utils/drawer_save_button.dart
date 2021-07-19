import 'package:flutter/material.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';

import 'package:shared_themes/colors.dart';
import 'package:shared_ui_components/buttons.dart';

class DrawerSaveButton extends StatefulWidget {
  const DrawerSaveButton({required this.callback, this.buttonText});

  final String? buttonText;
  final Function callback;

  @override
  _DrawerSaveButtonState createState() => _DrawerSaveButtonState();
}

class _DrawerSaveButtonState extends State<DrawerSaveButton> {
  @override
  Widget build(BuildContext context) {
    return SILPrimaryButton(
      buttonKey: AppWidgetKeys.patientExamDrawerSaveButtonKey,
      onPressed: () async {
        await widget.callback();
        ViewSummaryStore().viewSummaryButton.add(true);
        setState(() {});
      },
      text: widget.buttonText ?? saveText,
      buttonColor: healthcloudAccentColor,
      textColor: white,
    );
  }
}
