// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:quiver/async.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/visit/start_visit_page/start_visit_factory.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/visit/start_visit_page/start_visit_viewModel.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/visit/start_visit_page/start_visit_widget.dart';

/// Connector for [StartVisitWidget]
class StartVisitConnector extends StatelessWidget {
  const StartVisitConnector({this.countdownTimer});

  final CountdownTimer? countdownTimer;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<CoreState, StartVisitViewModel>(
      vm: () => StartVisitViewModelFactory(this),
      builder: (BuildContext context, StartVisitViewModel vm) {
        return StartVisitWidget(
          showError: vm.showError,
          startVisit: vm.startVisit,
          phoneNumber: vm.phoneNumber,
          hasCompletedEnteringOTP: vm.hasCompletedEnteringOtp,
          isResendingOTP: vm.isResendingOtp,
          resendOtp: vm.resendOtp,
          startVisitType: vm.startVisitType,
          countdownTimer: countdownTimer,
        );
      },
    );
  }
}
