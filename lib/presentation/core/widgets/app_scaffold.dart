import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/actions/user_state_actions/logout_action.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/numbers_constants.dart';
import 'package:bewell_pro_core/presentation/core/home/widgets/sil_app_bar.dart';
import 'package:bewell_pro_core/presentation/core/home/widgets/sil_bottom_navigation_bar.dart';
import 'package:bewell_pro_core/presentation/core/widgets/app_drawer.dart';
import 'package:domain_objects/entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:misc_utilities/enums.dart';
import 'package:misc_utilities/responsive_widget.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:shared_ui_components/buttons.dart';

class AppScaffold extends StatelessWidget {
  AppScaffold({
    Key? key,
    ReduxAction<CoreState>? logoutAction,
    this.currentBottomNavIndex,
    required this.body,
    this.scaffoldKey,
    this.endDrawer,
    this.floatingActionButton,
    this.backgroundColor,
  })  : logoutAction = logoutAction ?? LogoutAction(),
        super(key: key);

  final Widget body;
  final int? currentBottomNavIndex;
  final Widget? endDrawer;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final Widget? floatingActionButton;
  final Color? backgroundColor;
  final ReduxAction<CoreState> logoutAction;

  @override
  Widget build(BuildContext context) {
    // enable drawerEnableOpenDragGesture for mobile devices but disable on Tablets
    bool shouldOpenDrawer = true;
    final List<NavigationItem> secondaryActions =
        StoreProvider.state<CoreState>(context)!
            .navigationState!
            .secondaryActions!;
    final int drawerSelectedIndex = StoreProvider.state<CoreState>(context)!
        .navigationState!
        .drawerSelectedIndex;

    if (ResponsiveWidget.deviceType(context) != DeviceScreensType.Mobile ||
        secondaryActions.isEmpty ||
        drawerSelectedIndex >= 0) {
      shouldOpenDrawer = false;
    }

    /// A callback to veto attempts by the user to dismiss the enclosing view
    /// triggers [onWillPopScope] callback to ask for user's confirmation on weather or not to stay on the app
    Future<bool> willPopCallback() async {
      showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Container(
              decoration: const BoxDecoration(color: Colors.white),
              constraints: const BoxConstraints(maxWidth: 420),
              padding: EdgeInsets.symmetric(
                horizontal: ResponsiveWidget.preferredPaddingOnStretchedScreens(
                  context: context,
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    mediumVerticalSizedBox,
                    Text(
                      confirmExitPrompt,
                      style: TextThemes.normalSize18Text(Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    size40VerticalSizedBox,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        SizedBox(
                          width: double.infinity,
                          height: number48,
                          child: SILSecondaryButton(
                              onPressed: () => SystemChannels.platform
                                  .invokeMethod('SystemNavigator.pop'),
                              text: exitBtnText),
                        ),
                        mediumVerticalSizedBox,
                        SizedBox(
                          width: double.infinity,
                          height: number48,
                          child: SILPrimaryButton(
                              onPressed: () => Navigator.pop(context),
                              text: stayBtnText),
                        ),
                      ],
                    ),
                    size40VerticalSizedBox,
                  ],
                ),
              ),
            ),
          );
        },
      );
      return true;
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        /// render navigation drawer permanently on [Tablet]
        if (ResponsiveWidget.deviceType(context) != DeviceScreensType.Mobile &&
            secondaryActions.isNotEmpty)
          const AppDrawer(permanentlyDisplay: true),

        const VerticalDivider(width: 0, color: Colors.grey),

        /// render Scaffold with detail layout on [Tablet] and [Mobile]
        Expanded(
          child: Scaffold(
              key: scaffoldKey,
              backgroundColor: backgroundColor,
              appBar: SilAppBar(
                logoutAction: logoutAction,
              ),
              endDrawer: endDrawer,
              floatingActionButton: floatingActionButton,
              drawerEnableOpenDragGesture: shouldOpenDrawer,
              drawer: const AppDrawer(permanentlyDisplay: false),
              bottomNavigationBar: const SILBottomNavigatorBar(),
              body: WillPopScope(onWillPop: willPopCallback, child: body)),
        ),
      ],
    );
  }
}
