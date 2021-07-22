import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/application/redux/actions/misc_state_actions/batch_update_misc_state_action.dart';

import 'package:bewell_pro_core/application/redux/states/app_state.dart';
import 'package:bewell_pro_core/application/redux/view_models/app_state_view_model.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';

import 'package:bewell_pro_core/presentation/onboarding/signup/enter_signup_phone_number.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';

import 'package:app_wrapper/app_wrapper.dart';

import 'package:domain_objects/value_objects.dart';
import 'package:flutter_graphql_client/graph_utils.dart';
import 'package:misc_utilities/misc.dart';
import 'package:shared_ui_components/platform_loader.dart';
import 'package:shared_ui_components/verify_phone_otp.dart';

/// [PhoneSignUp] conditionally renders [EnterSignUpPhoneNo] or [VerifyPhoneOtp],
/// depending on whether or not the otp was sent to the user
class PhoneSignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppStateViewModel>(
      converter: (Store<AppState> store) => AppStateViewModel.fromStore(store),
      builder: (BuildContext context, AppStateViewModel vm) {
        return Container(
          child: vm.state.miscState!.otpCode! == UNKNOWN
              ? EnterSignUpPhoneNo()
              : VerifyPhoneOtp(
                  changeNumberCallback: () => StoreProvider.dispatch<AppState>(
                      context,
                      BatchUpdateMiscStateAction(
                          phoneNumber: UNKNOWN,
                          otpCode: UNKNOWN,
                          acceptedTerms: false,
                          title: createAcc,
                          message: createAccDesc)),
                  phoneNo: vm.state.miscState!.phoneNumber!,
                  otp: vm.state.miscState!.otpCode!,
                  generateOtpFunc: GraphQlUtils().generateRetryOtp,
                  client: AppWrapperBase.of(context)!.graphQLClient,
                  retrySendOtpEndpoint: EndpointContext.retrySendOtpEndpoint,
                  appWrapperContext: AppWrapperBase.of(context)!.appContexts,
                  loader: const SILPlatformLoader(),
                  successCallBack: ({
                    required String otp,
                    required Function toggleLoading,
                  }) async {
                    /// Ensure that the most current otp is set to state
                    StoreProvider.dispatch<AppState>(
                      context,
                      BatchUpdateMiscStateAction(
                        phoneNumber: vm.state.miscState!.phoneNumber,
                        otpCode: otp,
                        title: verifyPhone,
                        message: verifyDesc(
                          formatPhoneNumber(
                              phoneNumber: vm.state.miscState!.phoneNumber!,
                              countryCode: ''),
                        ),
                      ),
                    );

                    /// Set page title and description
                    StoreProvider.dispatch<AppState>(
                      context,
                      BatchUpdateMiscStateAction(
                        title: createPin,
                        message: secureAccount,
                      ),
                    );

                    await triggerNavigationEvent(
                        context: context, namedRoute: setPinRoute);
                  },
                ),
        );
      },
    );
  }
}
