// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:sghi_core/domain_objects/entities/navigation_item.dart';
import 'package:sghi_core/misc_utilities/enums.dart';
import 'package:sghi_core/misc_utilities/responsive_widget.dart';
import 'package:sghi_core/ui_components/src/coming_soon_page.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/actions/user_state_actions/logout_action.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/presentation/core/widgets/app_scaffold.dart';

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
