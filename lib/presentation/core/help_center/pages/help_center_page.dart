import 'package:flutter/material.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/core/help_center/widgets/faq_wrapper.dart';
import 'package:bewell_pro_core/presentation/core/help_center/widgets/help_center_channels.dart';
import 'package:bewell_pro_core/presentation/core/home/models/bottom_navigation_bar_items.dart';
import 'package:bewell_pro_core/presentation/core/widgets/app_scaffold.dart';
import 'package:misc_utilities/enums.dart';
import 'package:misc_utilities/number_constants.dart';
import 'package:misc_utilities/responsive_widget.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

class HelpCenterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double padding;
    if (ResponsiveWidget.deviceType(context) != DeviceScreensType.Mobile &&
        defaultSecondaryNavItems.isNotEmpty) {
      padding = number20;
    } else {
      padding = ResponsiveWidget.preferredPaddingOnStretchedScreens(
          context: context);
    }

    return AppScaffold(
      currentBottomNavIndex: BottomNavIndex.help.index,
      body: ListView(
        shrinkWrap: true,
        key: AppWidgetKeys.helpCenterListViewKey,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    smallVerticalSizedBox,
                    Text(
                      faqTitle,
                      textAlign: TextAlign.center,
                      style: TextThemes.boldSize24Text(
                        Colors.black,
                      ),
                    ),
                    smallVerticalSizedBox,
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 45, vertical: 4),
                      child: Text(
                        faqSubtitle,
                        textAlign: TextAlign.center,
                        style: TextThemes.normalSize16Text(
                          Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
                largeVerticalSizedBox,
                const HelpCenterChannels(),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: padding),
            child: Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    mediumVerticalSizedBox,
                    Text(
                      faqTextTitle,
                      textAlign: TextAlign.center,
                      style: TextThemes.boldSize24Text(
                        Colors.black,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 35, vertical: 6),
                      child: Text(
                        faqTextSubtitle,
                        textAlign: TextAlign.center,
                        style: TextThemes.normalSize16Text(
                          Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
                mediumVerticalSizedBox,
                FAQWrapper(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
