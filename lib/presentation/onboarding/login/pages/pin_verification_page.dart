import 'package:async_redux/async_redux.dart';

import 'package:flutter/material.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/domain/core/value_objects/enums.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/widgets/onboarding_scaffold.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/widgets/verify_pin.dart';

import 'package:intl/intl.dart';
import 'package:domain_objects/entities.dart';

import 'package:shared_themes/text_themes.dart';

class PinVerificationPage extends StatelessWidget {
  const PinVerificationPage({
    Key? key,
    required this.pinVerificationType,
    this.shouldPop = false,
    this.logoutAction,
  }) : super(key: key);

  final PinVerificationType pinVerificationType;
  final bool shouldPop;
  final ReduxAction<CoreState>? logoutAction;

  @override
  Widget build(BuildContext context) {
    const double dimension = 0;
    final CoreState state = StoreProvider.state<CoreState>(context)!;
    final UserProfile? userProfile = state.userState!.userProfile;
    final String loggedInUserName = toBeginningOfSentenceCase(
        userProfile!.userBioData!.firstName!.getValue().toLowerCase())!;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: OnboardingScaffold(
        dimension: dimension,
        title: 'Hey, ${toBeginningOfSentenceCase(loggedInUserName)} ',
        msg: enterPin,
        icon: Icons.security,
        child: Column(
          children: <Widget>[
            VerifyPin(pinVerificationType: pinVerificationType),
            TextButton(
              key: AppWidgetKeys.logoutButton,
              onPressed: () async {
                if (shouldPop) {
                  Navigator.of(context).pop();
                } else {
                  await logoutUser(context, logoutAction: logoutAction);
                }
              },
              child: Text(
                logoutText,
                style: TextThemes.boldSize16Text(Colors.red[400]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
