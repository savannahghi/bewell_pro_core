// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:sghi_core/shared_themes/colors.dart';
import 'package:sghi_core/ui_components/src/buttons.dart';

// Project imports:
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';

class PreviousTileButton extends StatefulWidget {
  const PreviousTileButton({required this.callback});

  final Function callback;

  @override
  _PreviousTileButtonState createState() => _PreviousTileButtonState();
}

class _PreviousTileButtonState extends State<PreviousTileButton> {
  @override
  Widget build(BuildContext context) {
    return SILSecondaryButton(
      buttonKey: AppWidgetKeys.previousTileButtonKey,
      onPressed: () => widget.callback(),
      text: previousBtnText,
      textColor: healthcloudAccentColor,
      borderColor: healthcloudAccentColor,
    );
  }
}
