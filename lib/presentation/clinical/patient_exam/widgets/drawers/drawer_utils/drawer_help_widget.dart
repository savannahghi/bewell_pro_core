import 'package:flutter/material.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/domain/core/value_objects/asset_strings.dart';

import 'package:misc_utilities/responsive_widget.dart';

import 'package:shared_themes/colors.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

class DrawerHelpWidget extends StatelessWidget {
  const DrawerHelpWidget({required this.helpString});

  final String helpString;

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = ResponsiveWidget.isSmallScreen(context);

    return Container(
      key: AppWidgetKeys.drawerHelpWidget,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Container(
              height: isSmallScreen ? 80 : 120,
              width: isSmallScreen ? 80 : 120,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: healthcloudAccentColor.withOpacity(0.2)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image(
                    image: const AssetImage(searchIconUrl),
                    height: isSmallScreen ? 35 : 60,
                    width: isSmallScreen ? 35 : 60,
                  ),
                ],
              ),
            ),
            mediumVerticalSizedBox,
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  style: Theme.of(context).textTheme.subtitle2,
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Search for a $helpString above and tap the '),
                    TextSpan(
                        text: 'Select', style: TextThemes.heavySize14Text()),
                    TextSpan(text: ' button then save to add a $helpString.'),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
