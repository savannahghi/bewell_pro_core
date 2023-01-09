// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:http/http.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:sghi_core/app_wrapper/endpoints_context.dart';
import 'package:sghi_core/app_wrapper/enums.dart';
import 'package:sghi_core/flutter_graphql_client/flutter_graphql_utils.dart';
import 'package:sghi_core/ui_components/src/platform_loader.dart';
import 'package:sghi_core/ui_components/src/verify_phone_otp.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/pages/reset_pin_page.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/widgets/onboarding_scaffold.dart';

class VerifyPinResetRequestPage extends StatelessWidget {
  final Client? httpClient;

  const VerifyPinResetRequestPage({Key? key, this.httpClient})
      : super(key: key);
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
          httpClient: httpClient,
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
        ),
      ),
    );
  }
}
