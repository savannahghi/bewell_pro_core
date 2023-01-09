// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:sghi_core/domain_objects/entities/navigation_item.dart';
import 'package:sghi_core/misc_utilities/enums.dart';
import 'package:sghi_core/misc_utilities/number_constants.dart';
import 'package:sghi_core/misc_utilities/responsive_widget.dart';
import 'package:sghi_core/shared_themes/spaces.dart';
import 'package:sghi_core/shared_themes/text_themes.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/core/help_center/widgets/faq_wrapper.dart';
import 'package:bewell_pro_core/presentation/core/help_center/widgets/help_center_channels.dart';
import 'package:bewell_pro_core/presentation/core/home/models/bottom_navigation_bar_items.dart';
import 'package:bewell_pro_core/presentation/core/widgets/app_scaffold.dart';

class HelpCenterPage extends StatelessWidget {
  final ReduxAction<CoreState>? logoutAction;

  final String? title;

  const HelpCenterPage({
    this.logoutAction,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    final List<NavigationItem> secondaryActions =
        StoreProvider.state<CoreState>(context)!
            .navigationState!
            .secondaryActions!;

    final double padding;
    if (ResponsiveWidget.deviceType(context) != DeviceScreensType.Mobile &&
        secondaryActions.isNotEmpty) {
      padding = number20;
    } else {
      padding =
          ResponsiveWidget.preferredPaddingOnStretchedScreens(context: context);
    }

    return AppScaffold(
      logoutAction: logoutAction,
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
                      this.title ?? faqTitle,
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
