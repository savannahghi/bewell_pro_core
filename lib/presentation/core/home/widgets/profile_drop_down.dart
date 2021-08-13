import 'package:flutter/material.dart';
import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/actions/user_state_actions/logout_action.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/domain/core/value_objects/events.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/application/redux/view_models/user_state_view_model.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/domain/core/value_objects/login_constants.dart';
import 'package:domain_objects/entities.dart';
import 'package:misc_utilities/misc.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/constants.dart';
import 'package:shared_themes/text_themes.dart';

class ProfileDropDown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      key: AppWidgetKeys.popupMenuButtonKey,
      onSelected: (int result) async {
        switch (result) {
          case 1:

            /// Notify the user he is about to be logged out
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: const Text(logoutMessage),
              duration: const Duration(seconds: kLongSnackBarDuration),
              action: dismissSnackBar('close', white, context),
            ));

            StoreProvider.dispatch<CoreState>(context, LogoutAction());
            break;
          case 2:
            triggerEvent(navigationEvent, context, route: userProfileRoute);

            await Navigator.of(context, rootNavigator: true).pushNamed(
              userProfileRoute,
            );
            break;
          default:
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
        PopupMenuItem<int>(
          key: AppWidgetKeys.profilePopMenuItemKeyKey,
          value: 2,
          child: Text(
            userProfile,
            style: TextThemes.heavySize14Text(black),
          ),
        ),
        PopupMenuItem<int>(
          key: AppWidgetKeys.logoutPopMenuItemKeyKey,
          value: 1,
          child: Text(logoutText, style: TextThemes.heavySize14Text(black)),
        ),
      ],
      child: Container(
        height: 50,
        width: 47,
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).accentColor.withOpacity(0.5),
          ),
          shape: BoxShape.circle,
        ),
        child: StoreConnector<CoreState, UserStateViewModel>(
            converter: (Store<CoreState> store) =>
                UserStateViewModel.fromStore(store),
            builder: (BuildContext context, UserStateViewModel vm) {
              final UserProfile? userProfile = vm.userState.userProfile;
              return Center(
                child: vm.userState.userProfile!.userBioData!.firstName!
                            .getValue() ==
                        ''
                    ? Text(
                        'BW',
                        style: TextThemes.boldSize18Text(
                            Theme.of(context).accentColor),
                      )
                    : Text(
                        extractNamesInitials(
                            name: getDisplayName(userProfile!)),
                        style: TextThemes.boldSize18Text(
                            Theme.of(context).accentColor),
                      ),
              );
            }),
      ),
    );
  }
}

String getDisplayName(UserProfile userProfile) {
  final String firstName = userProfile.userBioData!.firstName!.getValue();
  final String lastName = userProfile.userBioData!.lastName!.getValue();
  final String initialFirstName = firstName.trim();
  final String initialLastName = lastName.trim();
  return '$initialFirstName $initialLastName';
}
