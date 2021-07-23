import 'package:async_redux/async_redux.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:domain_objects/entities.dart';
import 'package:flutter/material.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/application/redux/actions/navigation_actions/navigation_action.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';
import 'package:bewell_pro_core/presentation/core/home/models/bottom_navigation_bar_items.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';

class SILBottomNavigatorBar extends StatefulWidget {
  const SILBottomNavigatorBar({Key? key, this.navigationItems})
      : super(key: key);

  final List<NavigationItem>? navigationItems;

  @override
  _SILBottomNavigatorBarState createState() => _SILBottomNavigatorBarState();
}

class _SILBottomNavigatorBarState extends State<SILBottomNavigatorBar>
    with SingleTickerProviderStateMixin {
  /// stores the current state of the more options menu option
  bool openMoreOptions = false;
  final int priorityItemsCount = 2;

  @override
  Widget build(BuildContext context) {
    final List<NavigationItem> navigationItems =
        widget.navigationItems ?? defaultNavItems;

    final int bottomBarIndex = StoreProvider.state<AppState>(context)!
        .navigationState!
        .bottomBarSelectedIndex;

    return BottomNavigationBar(
      currentIndex: bottomBarIndex,
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Theme.of(context).primaryColor,
      unselectedItemColor: Colors.black45,
      onTap: (int index) async {
        if (index != bottomBarIndex || index == 0) {
          StoreProvider.dispatch<AppState>(
            context,
            NavigationAction(
              drawerSelectedIndex: -1,
              bottomBarSelectedIndex: index,
            ),
          );

          if (navigationItems[index].route != null &&
              navigationItems[index].route!.isNotEmpty) {
            await triggerNavigationEvent(
              context: context,
              route: navigationItems[index].route!,
            );
          } else {
            Navigator.pushNamed(
              context,
              comingSoon,
              arguments: navigationItems[index].title,
            );
          }
        }
      },
      items: navigationItems
          .map(
            (NavigationItem navItem) => BottomNavigationBarItem(
              icon: CachedNetworkImage(
                color: Colors.black45,
                imageUrl: navItem.icon!.iconUrl!,
                height: 25,
                width: 25,
                placeholder: (BuildContext context, String url) => Icon(
                  Icons.cloud_off,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              activeIcon: CachedNetworkImage(
                color: Theme.of(context).primaryColor,
                imageUrl: navItem.icon!.iconUrl!,
                height: 25,
                width: 25,
                placeholder: (BuildContext context, String url) => Icon(
                  Icons.cloud_off,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              label: navItem.title,
            ),
          )
          .toList(),
    );
  }
}
