import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/application/redux/actions/user_state_actions/logout_action.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/domain/core/value_objects/login_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/numbers_constants.dart';
import 'package:bewell_pro_core/presentation/core/global_search/sil_search.dart';
import 'package:bewell_pro_core/presentation/core/home/models/bottom_navigation_bar_items.dart';
import 'package:bewell_pro_core/presentation/core/home/widgets/feed_component_wrapper.dart';
import 'package:bewell_pro_core/presentation/core/home/widgets/session_timeout.dart';
import 'package:bewell_pro_core/presentation/core/widgets/app_scaffold.dart';
import 'package:misc_utilities/enums.dart';
import 'package:misc_utilities/responsive_widget.dart';
import 'package:shared_themes/spaces.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    int? sessionTimeout,
    int? modalCountdown,
  })  : sessionTimeout = sessionTimeout ?? kTimeOutAfter,
        modalCountdown = modalCountdown ?? kModalCountDown;

  final int modalCountdown;
  final int sessionTimeout;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Timer timer;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    timer = startTimeout(widget.sessionTimeout);
  }

  Timer startTimeout(int seconds) {
    return Timer(Duration(seconds: seconds), handleTimeout);
  }

  /// Logs out a user from the app after they have selected 'logout' from
  /// the session timeout dialog or the timeout dialog countdown ends
  Future<void> logout() async {
    /// Cancels the timer
    timer.cancel();

    /// Log user out
    StoreProvider.dispatch<AppState>(context, LogoutAction());
  }

  /// LOGOUT SESSION
  /// Logout session is triggered after a user successfully logs in.
  /// `kTimeOutAfter` is the app idle time that triggers the automatic logout
  /// which kicks in after the modal countdown time elapses
  /// shows a dialog to alert the user that their session is about to timeout
  Future<void> handleTimeout() async {
    final dynamic result = await showModalBottomSheet(
      context: _scaffoldKey.currentContext!,
      isDismissible: false,
      useRootNavigator: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        final String? recordingDoctorSurName =
            getRecordingDoctor(context)?.split(' ').last;

        return SessionTimeoutAlert(
          modalCountdown: widget.modalCountdown,
          recordingDoctorSurName: recordingDoctorSurName,
        );
      },
    );

    if (result == 'stay') {
      timer = startTimeout(kTimeOutAfter);
      // Returns route
      final String route = await getInitialRoute(context: context);

      await triggerNavigationEvent(context: context, route: route);
    } else {
      logout();
    }
  }

  @override
  Widget build(BuildContext context) {
    final double padding;

    final DeviceScreensType deviceType =
        SILResponsiveWidget.deviceType(context);

    if (deviceType != DeviceScreensType.Mobile) {
      padding = SILResponsiveWidget.preferredPaddingOnStretchedScreens(
        context: context,
      );
    } else {
      padding = number0;
    }

    return AppScaffold(
      scaffoldKey: _scaffoldKey,
      backgroundColor: Colors.white,
      body: GestureDetector(
        key: AppWidgetKeys.homePageGestureDetectorKey,
        behavior: HitTestBehavior.translucent,
        onTapDown: (TapDownDetails tapDown) {
          timer.cancel();
          timer = startTimeout(kTimeOutAfter);
        },
        child: RefreshIndicator(
          onRefresh: () async => UserFeedStore().refreshFeed.add(true),
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            children: <Widget>[
              mediumVerticalSizedBox,
              SILSearch(),
              smallVerticalSizedBox,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: padding),
                child: FeedComponentWrapper(),
              ),
            ],
          ),
        ),
      ),
      currentBottomNavIndex: BottomNavIndex.home.index,
    );
  }
}
