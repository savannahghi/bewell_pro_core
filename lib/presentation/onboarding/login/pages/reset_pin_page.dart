import 'package:flutter/material.dart';
import 'package:bewell_pro_core/application/redux/flags/flags.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';

import 'package:bewell_pro_core/presentation/onboarding/login/widgets/onboarding_scaffold.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/widgets/set_and_confirm_pin_widget.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ReSetPinPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const double dimension = 0;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: OnboardingScaffold(
        dimension: dimension,
        title: enterNewPinTitle,
        msg: enterNewPinMessage,
        icon: MdiIcons.security,
        child: SetAndConfirmPinWidget(
            setPinStatus: SetPinStatus.IsResettingPin, flag: resetPinFlag),
      ),
    );
  }
}
