// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:shared_themes/colors.dart';
import 'package:shared_ui_components/buttons.dart';

// Project imports:
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';

class NextTileButton extends StatefulWidget {
  const NextTileButton({
    required this.callback,
  });

  final Function callback;

  @override
  _NextTileButtonState createState() => _NextTileButtonState();
}

class _NextTileButtonState extends State<NextTileButton> {
  @override
  Widget build(BuildContext context) {
    return SILPrimaryButton(
      buttonKey: AppWidgetKeys.nextTileButtonKey,
      onPressed: () => widget.callback(),
      text: nextBtnText,
      buttonColor: healthcloudAccentColor.withOpacity(0.3),
      textColor: healthcloudAccentColor,
    );
  }
}
