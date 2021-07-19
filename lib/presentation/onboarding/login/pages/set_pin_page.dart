import 'package:async_redux/async_redux.dart';

import 'package:flutter/material.dart';
import 'package:bewell_pro_core/application/redux/flags/flags.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';

import 'package:bewell_pro_core/application/redux/view_models/app_state_view_model.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';

import 'package:bewell_pro_core/presentation/onboarding/login/widgets/onboarding_scaffold.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/widgets/set_and_confirm_pin_widget.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

/// Prompts user to set a pin for their new account and confirm
class SetPinPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const double dimension = 0;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: StoreConnector<AppState, AppStateViewModel>(
        converter: (Store<AppState> store) =>
            AppStateViewModel.fromStore(store),
        builder: (BuildContext context, AppStateViewModel vm) {
          return OnboardingScaffold(
            dimension: dimension,
            title: vm.state.miscState!.title!,
            msg: vm.state.miscState!.message,
            icon: MdiIcons.security,
            child: SetAndConfirmPinWidget(
              flag: createUserFlag,
              setPinStatus: SetPinStatus.IsSettingPin,
            ),
          );
        },
      ),
    );
  }
}
