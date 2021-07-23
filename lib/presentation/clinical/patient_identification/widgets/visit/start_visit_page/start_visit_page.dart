import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:bewell_pro_core/application/redux/actions/misc_state_actions/batch_update_misc_state_action.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/visit/start_visit_page/start_visit_connector.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/widgets/onboarding_scaffold.dart';
import 'package:unicons/unicons.dart';

/// Page for starting a visit.
///
/// send an OTP and use the OTP input to start a visit
class StartVisitPage extends StatelessWidget {
  const StartVisitPage();

  @override
  Widget build(BuildContext context) {
    StoreProvider.dispatch<CoreState>(
      context,
      BatchUpdateMiscStateAction(
        hasCompletedEnteringOTP: false,
        isResendingOTP: false,
        invalidPin: false,
      ),
    );
    return Scaffold(
      body: OnboardingScaffold(
        dimension: 0,
        title: startVisitText,
        icon: UniconsLine.file_shield_alt,
        child: UserExceptionDialog<CoreState>(
          child: const StartVisitConnector(),
        ),
      ),
    );
  }
}
