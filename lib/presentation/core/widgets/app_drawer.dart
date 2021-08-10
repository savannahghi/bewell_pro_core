import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/presentation/core/home/widgets/drawer_app_bar.dart';
import 'package:bewell_pro_core/presentation/core/widgets/nav_drawer_content.dart';
import 'package:domain_objects/entities.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({required this.permanentlyDisplay});

  final bool permanentlyDisplay;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Container(
        color: Colors.white,
        child: DefaultTabController(
            length: 2,
            child: StoreConnector<CoreState, List<NavigationItem>>(
              converter: (Store<CoreState> store) =>
                  store.state.navigationState!.secondaryActions!,
              builder: (BuildContext context,
                      List<NavigationItem> secondaryNavigationItem) =>
                  Scaffold(
                backgroundColor: Colors.white,
                appBar: DrawerAppBar(),
                body: TabBarView(
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
            )),
      ),
    );
  }
}
