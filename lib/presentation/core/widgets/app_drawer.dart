// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:sghi_core/domain_objects/entities/navigation_item.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/presentation/core/home/widgets/drawer_app_bar.dart';
import 'package:bewell_pro_core/presentation/core/widgets/nav_drawer_content.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({required this.permanentlyDisplay});

  final bool permanentlyDisplay;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).primaryColor,
        child: DefaultTabController(
            length: 2,
            child: StoreConnector<CoreState, List<NavigationItem>>(
              converter: (Store<CoreState> store) =>
                  store.state.navigationState!.secondaryActions!,
              builder: (BuildContext context,
                      List<NavigationItem> secondaryNavigationItem) =>
                  SafeArea(
                child: Column(
                  children: <Widget>[
                    DrawerAppBar(),
                    Expanded(
                      child: TabBarView(
                        children: <Widget>[
                          /// [All items]
                          NavDrawerContent(
                            drawerItems: secondaryNavigationItem,
                            favouriteDrawer: false,
                          ),

                          /// [Favorite]
                          NavDrawerContent(
                            drawerItems: secondaryNavigationItem
                                .where((NavigationItem navigationItem) =>
                                    navigationItem.isFavourite == true)
                                .toList(),
                            favouriteDrawer: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
