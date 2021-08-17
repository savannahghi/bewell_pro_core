import 'package:flutter/material.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/application/redux/flags/flags.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/widgets/onboarding_scaffold.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/widgets/set_and_confirm_pin_widget.dart';
import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';

class ProfileChangePin extends StatelessWidget {
  final ReduxAction<CoreState>? logoutAction;

  const ProfileChangePin({Key? key, this.logoutAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool? isChangePin =
        StoreProvider.state<CoreState>(context)!.userState!.auth!.isChangePin;

    return Scaffold(
      body: OnboardingScaffold(
        dimension: 20,
        icon: Icons.edit_attributes_sharp,
        title: changePinTitle,
        msg: changePinMessage,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SetAndConfirmPinWidget(
                  flag: changePinFlag,
                  setPinStatus: SetPinStatus.IsChangingPin,
                  logoutAction: logoutAction,
                ),
                largeVerticalSizedBox,
                if (isChangePin != null && !isChangePin)
                  GestureDetector(
                    onTap: () async => triggerNavigationEvent(
                        context: context, route: userProfileRoute),
                    child: SizedBox(
                      height: 48,
                      child: Text(
                        verificationCancelText,
                        textAlign: TextAlign.center,
                        style: TextThemes.boldSize16Text(Colors.red),
                      ),
                    ),
                  ),
                mediumVerticalSizedBox,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
