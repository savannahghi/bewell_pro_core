import 'package:flutter/material.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/widgets/onboarding_scaffold.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/widgets/user_names_form.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SetUserNamesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const double dimension = 0;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: OnboardingScaffold(
        dimension: dimension,
        title: tellUsWhoYouAreString,
        msg: tellUsWhoYouAreMessage,
        icon: MdiIcons.account,
        child: UserNamesForm(),
      ),
    );
  }
}
