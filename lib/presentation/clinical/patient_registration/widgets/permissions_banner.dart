import 'package:flutter/material.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';

import 'package:permission_handler/permission_handler.dart'
    as permission_handler;
import 'package:misc_utilities/responsive_widget.dart';

import 'package:shared_themes/spaces.dart';

import 'package:shared_themes/colors.dart';
import 'package:shared_ui_components/buttons.dart';

class PermissionsBanner extends StatelessWidget {
  final String message;

  const PermissionsBanner({required this.message});
  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = ResponsiveWidget.isSmallScreen(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      decoration: BoxDecoration(
          color: cautionColor.withOpacity(0.1),
          border: Border.all(color: cautionColor),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              message,
              style: isSmallScreen
                  ? Theme.of(context).textTheme.bodyText1
                  : Theme.of(context).textTheme.subtitle2,
            ),
          ),
          if (isSmallScreen) smallVerticalSizedBox else size15VerticalSizedBox,
          Divider(height: 1, color: grey.withOpacity(0.5)),
          if (isSmallScreen) smallVerticalSizedBox else size15VerticalSizedBox,
          Align(
            alignment: Alignment.centerRight,
            child: SILPrimaryButton(
              buttonKey: AppWidgetKeys.silPrimaryButtonKey,
              onPressed: () => permission_handler.openAppSettings(),
              buttonColor: healthcloudAccentColor,
              text: openSettings,
            ),
          )
        ],
      ),
    );
  }
}
