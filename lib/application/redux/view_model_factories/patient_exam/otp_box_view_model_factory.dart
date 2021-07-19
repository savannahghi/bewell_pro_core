import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:bewell_pro_core/application/redux/actions/patient_exam/end_exam_action.dart';
import 'package:bewell_pro_core/application/redux/flags/flags.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';
import 'package:bewell_pro_core/application/redux/view_models/clinical/patient_exam/otp_box_view_model.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/summary/widgets/otp_box_connector.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/visit/start_visit_page/resend_otp_action.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:flutter_graphql_client/graph_client.dart';

class OtpBoxViewModelFactory extends VmFactory<AppState, OtpBoxConnector> {
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

    final ISILGraphQlClient? client = AppWrapperBase.of(context)?.graphQLClient;

    if (phoneNumber != null) {
      dispatch(ResendOtpAction(
          phoneNumber: phoneNumber, client: client, step: step));
    }
  }

  void endVisit(BuildContext context, String otp) {
    final ISILGraphQlClient client = AppWrapperBase.of(context)!.graphQLClient;

    dispatch(EndExamAction(client: client));
  }
}
