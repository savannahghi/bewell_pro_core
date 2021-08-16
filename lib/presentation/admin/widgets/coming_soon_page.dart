import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/actions/user_state_actions/logout_action.dart';
import 'package:domain_objects/entities.dart';
import 'package:flutter/material.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/presentation/core/widgets/app_scaffold.dart';
import 'package:misc_utilities/enums.dart';
import 'package:misc_utilities/responsive_widget.dart';
import 'package:shared_ui_components/coming_soon_page.dart';

class ComingSoon extends StatelessWidget {
  final String title;

  const ComingSoon({required this.title});

  @override
  Widget build(BuildContext context) {
    bool isTabletWithDrawer;
    final List<NavigationItem> secondaryActions =
        StoreProvider.state<CoreState>(context)!
            .navigationState!
            .secondaryActions!;

    if (secondaryActions.isNotEmpty &&
        ResponsiveWidget.deviceType(context) != DeviceScreensType.Mobile) {
      isTabletWithDrawer = true;
    } else {
      isTabletWithDrawer = false;
    }

    return AppScaffold(
      logoutAction: LogoutAction(),
      body: SILComingSoonPage(
        title: title,
        description: 'Manage $title',
        comingSoonText: title,
        isTabletWithDrawer: isTabletWithDrawer,
      ),
    );
  }
}
