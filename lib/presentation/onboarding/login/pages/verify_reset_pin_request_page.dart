import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/widgets/onboarding_scaffold.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/pages/reset_pin_page.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:flutter_graphql_client/graph_utils.dart';
import 'package:shared_ui_components/platform_loader.dart';
import 'package:shared_ui_components/verify_phone_otp.dart';

class VerifyPinResetRequestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const double dimension = 0;

    final CoreState? state = StoreProvider.state<CoreState>(context);

    final String primaryPhoneNumber = state!.miscState!.phoneNumber!;

    final String otp = state.miscState!.otpCode!;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: OnboardingScaffold(
        dimension: dimension,
        title: verifyRequestTitle,
        msg: verifyRequestMsg(primaryPhoneNumber),
        icon: Icons.message_rounded,
        child: VerifyPhoneOtp(
          phoneNo: primaryPhoneNumber,
          otp: otp,
          successCallBack: ({
            required String otp,
            required Function toggleLoading,
          }) async {
            await Navigator.push(
              context,
              MaterialPageRoute<ReSetPinPage>(
                builder: (BuildContext context) => ReSetPinPage(),
              ),
            );
          },
          generateOtpFunc: GraphQlUtils().generateRetryOtp,
          client: AppWrapperBase.of(context)!.graphQLClient,
          retrySendOtpEndpoint: EndpointContext.retrySendOtpEndpoint,
          appWrapperContext: AppWrapperBase.of(context)!.appContexts,
          loader: const SILPlatformLoader(),
        ),
      ),
    );
  }
}
