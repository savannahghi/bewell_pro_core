// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:sghi_core/misc_utilities/enums.dart';
import 'package:sghi_core/misc_utilities/number_constants.dart';
import 'package:sghi_core/misc_utilities/responsive_widget.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/actions/user_state_actions/logout_action.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/onboarding/profile/widgets/profile_detail.dart';
import 'package:bewell_pro_core/presentation/onboarding/profile/widgets/profile_master_detail.dart';

class UserProfilePage extends StatelessWidget {
  final ReduxAction<CoreState> logoutAction;

  UserProfilePage({
    Key? key,
    ReduxAction<CoreState>? logoutAction,
  })  : logoutAction = logoutAction ?? LogoutAction(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProfileSubject profileSubject = ProfileSubject();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            if (ResponsiveWidget.deviceType(context) !=
                DeviceScreensType.Mobile) ...<Widget>{
              /// [Tablet] Widgets
              IntrinsicHeight(
                child: Row(
                  key: AppWidgetKeys.profileMasterDetailRowKey,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    /// [Main] Content
                    SizedBox(
                      width: !ResponsiveWidget.isLandscape(context: context)
                          ? number300
                          : number400,
                      child: ProfileMasterDetail(
                        selection: profileSubject.selection.value,
                        logoutAction: logoutAction,
                      ),
                    ),
                    const VerticalDivider(
                      width: 0,
                      color: Colors.grey,
                    ),

                    /// [Detail] Content
                    ProfileDetail(selection: profileSubject.selection.value)
                  ],
                ),
              ),
            } else ...<Widget>{
              /// [Mobile] Widgets
              ProfileMasterDetail(
                selection: profileSubject.selection.value,
                logoutAction: logoutAction,
              ),
            }
          ],
        ),
      ),
    );
  }
}
