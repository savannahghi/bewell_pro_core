import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';
import 'package:bewell_pro_core/application/redux/view_model_factories/patient_exam/otp_box_view_model_factory.dart';
import 'package:bewell_pro_core/application/redux/view_models/clinical/patient_exam/otp_box_view_model.dart';
import 'package:quiver/async.dart';

import 'otp_box.dart';

class OtpBoxConnector extends StatelessWidget {
  const OtpBoxConnector({
    Key? key,
    this.countdownTimer,
  }) : super(key: key);

  final CountdownTimer? countdownTimer;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, OtpBoxViewModel>(
      vm: () => OtpBoxViewModelFactory(),
      builder: (BuildContext context, OtpBoxViewModel vm) {
        return OtpBox(
          phoneNumber: vm.phoneNumber,
          resendOtp: vm.resendOtp,
          showError: vm.showErr,
          endVisit: vm.endVisit,
          endingExam: vm.endingExam,
          countdownTimer: countdownTimer,
        );
      },
    );
  }
}
