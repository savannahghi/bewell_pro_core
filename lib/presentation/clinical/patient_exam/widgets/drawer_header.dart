import 'package:flutter/material.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';

import 'package:misc_utilities/responsive_widget.dart';
import 'package:shared_themes/colors.dart';

class SILDrawerHeader extends StatelessWidget {
  const SILDrawerHeader({required this.title, this.closeIconCallback});

  final VoidCallback? closeIconCallback;
  final String title;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final bool smallScreen = ResponsiveWidget.isSmallScreen(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 6.0),
      padding: EdgeInsets.symmetric(horizontal: smallScreen ? 10 : 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: white,
        boxShadow: const <BoxShadow>[
          BoxShadow(
              color: healthcloudAccentColor,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 1.0),
        ],
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              title,
              style:
                  textTheme.headline6!.copyWith(color: healthcloudAccentColor),
            ),
          ),
          IconButton(
            alignment: Alignment.centerRight,
            key: AppWidgetKeys.closeDrawerButtonKey,
            icon: const Icon(Icons.close, color: healthcloudAccentColor),
            onPressed: () => closeIconCallback ?? Navigator.of(context).pop(),
          )
        ],
      ),
    );
  }
}
