// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:sghi_core/domain_objects/entities/navigation_item.dart';
import 'package:sghi_core/misc_utilities/enums.dart';
import 'package:sghi_core/misc_utilities/responsive_widget.dart';
import 'package:sghi_core/shared_themes/spaces.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/actions/navigation_actions/navigation_action.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/core/home/widgets/profile_drop_down.dart';
import 'package:bewell_pro_core/presentation/onboarding/common/widgets/brand_logo.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';

class SilAppBar extends StatelessWidget implements PreferredSizeWidget {
  final ReduxAction<CoreState> logoutAction;

  const SilAppBar({Key? key, required this.logoutAction}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(100.0);

  @override
  Widget build(BuildContext context) {
    final List<NavigationItem> secondaryActions =
        StoreProvider.state<CoreState>(context)!
            .navigationState!
            .secondaryActions!;
    final List<NavigationItem> primaryActions =
        StoreProvider.state<CoreState>(context)!
            .navigationState!
            .primaryActions!;
    final int drawerSelectedIndex = StoreProvider.state<CoreState>(context)!
        .navigationState!
        .drawerSelectedIndex;
    final int bottomSelectedIndex = StoreProvider.state<CoreState>(context)!
        .navigationState!
        .bottomBarSelectedIndex;

    String? route = primaryActions[bottomSelectedIndex].route;
    final String? title = primaryActions[bottomSelectedIndex].title;

    if (route == null || route.isEmpty) {
      route = comingSoon;
    }
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              blurRadius: 5,
              spreadRadius: 1,
              offset: const Offset(0.35, 0),
              color: Colors.grey.withOpacity(0.2),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                smallHorizontalSizedBox,
                // render hamburger icon only on mobile devices
                // render hamburger icon only on mobile devices
                if (ResponsiveWidget.deviceType(context) ==
                        DeviceScreensType.Mobile &&
                    secondaryActions.isNotEmpty &&
                    drawerSelectedIndex < 0)
                  IconButton(
                      key: AppWidgetKeys.navDrawerMenuKey,
                      icon: const Icon(Icons.menu),
                      onPressed: () => Scaffold.of(context).openDrawer()),

                if (secondaryActions.isNotEmpty && drawerSelectedIndex >= 0)
                  IconButton(
                      key: AppWidgetKeys.navDrawerBackKey,
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        StoreProvider.dispatch<CoreState>(
                          context,
                          NavigationAction(
                            drawerSelectedIndex: -1,
                          ),
                        );
                        Navigator.pushNamed(context, route!, arguments: title);
                      }),
                BrandLogo(),
                smallHorizontalSizedBox,
              ],
            ),
            Row(
              children: <Widget>[
                smallHorizontalSizedBox,
                ProfileDropDown(
                  logoutAction: logoutAction,
                ),
                smallHorizontalSizedBox,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
