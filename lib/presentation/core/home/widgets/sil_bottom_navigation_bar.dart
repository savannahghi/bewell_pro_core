// Flutter imports:
// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/actions/navigation_actions/navigation_action.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/application/redux/view_models/core_state_view_model.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:domain_objects/entities.dart';
import 'package:flutter/material.dart';

class SILBottomNavigatorBar extends StatefulWidget {
  const SILBottomNavigatorBar({this.navigationItems});

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
    return StoreConnector<CoreState, CoreStateViewModel>(
        converter: (Store<CoreState> store) =>
            CoreStateViewModel.fromStore(store),
        builder: (BuildContext context, CoreStateViewModel vm) {
          final List<NavigationItem> navigationItems =
              vm.state.navigationState!.primaryActions!;
          final int bottomBarIndex =
              vm.state.navigationState!.bottomBarSelectedIndex;
          final int drawerSelectedIndex =
              vm.state.navigationState!.drawerSelectedIndex;
          return BottomNavigationBar(
            currentIndex: bottomBarIndex,
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Theme.of(context).primaryColor,
            unselectedItemColor: Colors.black45,
            onTap: (int index) async {
              // navigate only if the current selected bottom nav item is not the same as the one being tapped
              // or if an item in app darwer has been tapped
              if (index != bottomBarIndex || drawerSelectedIndex >= 0) {
                await StoreProvider.dispatch<CoreState>(
                  context,
                  NavigationAction(
                    drawerSelectedIndex: -1,
                    bottomBarSelectedIndex: index,
                  ),
                );

                if (navigationItems[index].route != null &&
                    navigationItems[index].route!.isNotEmpty) {
                  // navigate to the desired page
                  await Navigator.pushReplacementNamed(
                      context, navigationItems[index].route!);
                } else {
                  // navigate to the coming soon page, if the route is not found
                  await Navigator.pushNamed(
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
                        Icons.circle,
                        color: Theme.of(context).primaryColor,
                        size: 25,
                      ),
                    ),
                    activeIcon: CachedNetworkImage(
                      color: Theme.of(context).primaryColor,
                      imageUrl: navItem.icon!.iconUrl!,
                      height: 25,
                      width: 25,
                      placeholder: (BuildContext context, String url) => Icon(
                        Icons.circle,
                        color: Colors.grey.withOpacity(0.6),
                        size: 25,
                      ),
                    ),
                    label: navItem.title,
                  ),
                )
                .toList(),
          );
        });
  }
}
