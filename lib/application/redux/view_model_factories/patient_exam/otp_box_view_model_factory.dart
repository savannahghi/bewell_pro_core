// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:async_redux/async_redux.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/actions/patient_exam/end_exam_action.dart';
import 'package:bewell_pro_core/application/redux/flags/flags.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/application/redux/view_models/clinical/patient_exam/otp_box_view_model.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/summary/widgets/otp_box_connector.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/visit/start_visit_page/resend_otp_action.dart';

class OtpBoxViewModelFactory extends VmFactory<CoreState, OtpBoxConnector> {
  @override
  Vm fromStore() {
    return OtpBoxViewModel(
      completed: state.wait?.isWaitingFor(hasCompletedEnteringOTPFlag) ?? false,
      endingExam: state.wait?.isWaitingFor(endingExamFlag) ?? false,
      showErr: state.wait?.isWaitingFor(showErrorFlag) ?? false,
      resendOtp: this.resendOtp,
      phoneNumber: state.userState?.userProfile?.primaryPhoneNumber?.getValue(),
      endVisit: this.endVisit,
    );
  }

  void resendOtp(BuildContext context, int step) {
    final String? phoneNumber =
        state.userState?.userProfile?.primaryPhoneNumber?.getValue();

    final IGraphQlClient? client = AppWrapperBase.of(context)?.graphQLClient;

    if (phoneNumber != null) {
      dispatch(ResendOtpAction(
          phoneNumber: phoneNumber, client: client, step: step));
    }
  }

  void endVisit(BuildContext context, String otp) {
    final IGraphQlClient client = AppWrapperBase.of(context)!.graphQLClient;

    dispatch(EndExamAction(client: client));
  }
}
