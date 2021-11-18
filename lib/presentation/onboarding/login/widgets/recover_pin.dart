// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

// Project imports:
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/pages/recover_pin_request_page.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/widgets/onboarding_scaffold.dart';

class RecoverPinPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const double dimension = 0;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: OnboardingScaffold(
        dimension: dimension,
        title: recoverTitle,
        msg: recoverMsg,
        icon: MdiIcons.security,
        child: RecoverPinRequest(),
      ),
    );
  }
}
