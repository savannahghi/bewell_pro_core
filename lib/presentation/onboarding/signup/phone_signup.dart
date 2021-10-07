// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter_graphql_client/graph_utils.dart';
import 'package:http/http.dart';
import 'package:misc_utilities/misc.dart';
import 'package:shared_ui_components/platform_loader.dart';
import 'package:shared_ui_components/verify_phone_otp.dart';

// Project imports:
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/application/redux/actions/misc_state_actions/batch_update_misc_state_action.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/application/redux/view_models/misc_state_view_model.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/presentation/onboarding/signup/enter_signup_phone_number.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';

/// [PhoneSignUp] conditionally renders [EnterSignUpPhoneNo] or [VerifyPhoneOtp],
/// depending on whether or not the otp was sent to the user
class PhoneSignUp extends StatelessWidget {
  final Client? httpClient;

  const PhoneSignUp({Key? key, this.httpClient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<CoreState, MiscStateViewModel>(
      converter: (Store<CoreState> store) =>
          MiscStateViewModel.fromStore(store),
      builder: (BuildContext context, MiscStateViewModel vm) {
        return Container(
          child: vm.state!.otpCode! == UNKNOWN
              ? EnterSignUpPhoneNo()
              : VerifyPhoneOtp(
                  httpClient: httpClient,
                  changeNumberCallback: () => StoreProvider.dispatch<CoreState>(
                    context,
                    BatchUpdateMiscStateAction(
                        phoneNumber: UNKNOWN,
                        otpCode: UNKNOWN,
                        acceptedTerms: false,
                        title: createAcc,
                        message: createAccDesc),
                  ),
                  phoneNo: vm.state!.phoneNumber!,
                  otp: vm.state!.otpCode!,
                  generateOtpFunc: GraphQlUtils().generateRetryOtp,
                  client: AppWrapperBase.of(context)!.graphQLClient,
                  retrySendOtpEndpoint:
                      AppWrapperBase.of(context)!.customContext != null
                          ? (List<AppContext> contexts) {
                              return AppWrapperBase.of(context)!
                                  .customContext
                                  ?.retryResendOtpEndpoint;
                            }
                          : EndpointContext.retrySendOtpEndpoint,
                  appWrapperContext: AppWrapperBase.of(context)!.appContexts,
                  loader: const SILPlatformLoader(),
                  successCallBack: ({
                    required String otp,
                    required Function toggleLoading,
                  }) async {
                    /// Ensure that the most current otp is set to state
                    StoreProvider.dispatch<CoreState>(
                      context,
                      BatchUpdateMiscStateAction(
                        phoneNumber: vm.state!.phoneNumber,
                        otpCode: otp,
                        title: verifyPhone,
                        message: verifyDesc(
                          formatPhoneNumber(
                              phoneNumber: vm.state!.phoneNumber!,
                              countryCode: ''),
                        ),
                      ),
                    );

                    /// Set page title and description
                    StoreProvider.dispatch<CoreState>(
                      context,
                      BatchUpdateMiscStateAction(
                        title: createPin,
                        message: secureAccount,
                      ),
                    );

                    await triggerNavigationEvent(
                        context: context, route: setPinRoute);
                  },
                ),
        );
      },
    );
  }
}
