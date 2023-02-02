// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:sghi_core/misc_utilities/responsive_widget.dart';
import 'package:sghi_core/ui_components/src/buttons.dart';

// Project imports:
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';

/// - [LandingActions] which provides navigation buttons to user that lead to:
///   - 1 => phoneSignupRoute - Prompts user to signup/register
///   - 2 => phoneLoginRoute - Prompts user to login
class LandingActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = ResponsiveWidget.isSmallScreen(context);
    return Wrap(
      runSpacing: 20,
      spacing: 20,
      children: <Widget>[
        SizedBox(
          width: isSmallScreen ? double.infinity : 212,
          height: 50,
          child: SILPrimaryButton(
            buttonKey: AppWidgetKeys.signInKey,
            buttonColor: Theme.of(context).primaryColor,
            borderColor: Colors.transparent,
            text: landingSignIn,
            onPressed: () async => triggerNavigationEvent(
                context: context, route: phoneLoginRoute),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 30),
          width: isSmallScreen ? double.infinity : 212,
          height: 50,
          child: SILSecondaryButton(
            buttonKey: AppWidgetKeys.createAccountKey,
            text: createAccount,
            textColor: Theme.of(context).primaryColor,
            borderColor: Theme.of(context).primaryColor,
            onPressed: () async => triggerNavigationEvent(
                context: context, route: phoneSignupRoute),
          ),
        ),
      ],
    );
  }
}
