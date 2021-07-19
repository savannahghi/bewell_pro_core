import 'package:domain_objects/entities.dart';
import 'package:flutter/material.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/presentation/core/home/models/bottom_navigation_bar_items.dart';
import 'package:bewell_pro_core/presentation/core/home/widgets/drawer_app_bar.dart';
import 'package:bewell_pro_core/presentation/core/widgets/nav_drawer_content.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({required this.permanentlyDisplay});

  final bool permanentlyDisplay;

  @override
  Widget build(BuildContext context) {
    final List<NavigationItem> drawerItems = defaultSecondaryNavItems;

    return Drawer(
      elevation: 0,
      child: Container(
        color: Colors.white,
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: DrawerAppBar(),
            body: TabBarView(
              children: <Widget>[
                /// [All items]
                NavDrawerContent(drawerItems: drawerItems),

                /// [Favorite]
                const Center(child: Text(navDrawerComingSoonText)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
