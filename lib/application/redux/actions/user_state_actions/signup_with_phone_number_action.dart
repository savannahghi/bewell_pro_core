// Dart imports:
import 'dart:async';
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:async_redux/async_redux.dart';
import 'package:sghi_core/app_wrapper/endpoints_context.dart';
import 'package:sghi_core/flutter_graphql_client/flutter_graphql_client.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:http/http.dart';
import 'package:sghi_core/misc_utilities/misc.dart';

// Project imports:
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/application/core/services/onboarding.dart';
import 'package:bewell_pro_core/application/redux/actions/misc_state_actions/batch_update_misc_state_action.dart';
import 'package:bewell_pro_core/application/redux/flags/flags.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/application/redux/states/misc_state.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/entities/otp_response.dart';
import 'package:bewell_pro_core/domain/core/entities/processed_response.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/resources/outputs.dart';

/// Used to handle create account with phone number attempts.
/// Ensures valid phone number is provided and the user has accepted
/// use of their phone number for communications.
///
/// After all checks are verified, a Verification Code is sent to the
/// provided Phone Number
class SignupWithPhoneNumberAction extends ReduxAction<CoreState> {
  SignupWithPhoneNumberAction(
      {required this.phoneNumber, required this.context});

  final BuildContext context;
  final String phoneNumber;

  @override
  void after() {
    super.before();
    dispatch(WaitAction<CoreState>.remove(checkUserExistsFlag));
  }

  @override
  void before() {
    super.before();
    dispatch(WaitAction<CoreState>.add(checkUserExistsFlag));
  }

  @override
  Future<CoreState> reduce() async {
    final MiscState? miscState = state.miscState;

    final bool hasAcceptedTerms = miscState!.acceptedTerms!;

    if (phoneNumber.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(snackbar(content: signupPhoneNo));
      return state;
    }

    dispatch(BatchUpdateMiscStateAction(phoneNumber: phoneNumber));

    if (!hasAcceptedTerms) {
      ScaffoldMessenger.of(context)
          .showSnackBar(snackbar(content: allowPhoneComm));
      return state;
    }

    final String endpoint =
        AppWrapperBase.of(context)!.customContext?.verifyPhoneEndpoint ??
            EndpointContext.verifyPhoneEndpoint(
                AppWrapperBase.of(context)!.appContexts);

    final IGraphQlClient client = AppWrapperBase.of(context)!.graphQLClient;

    final Response response = await SimpleCall.callRestAPI(
      endpoint: endpoint,
      method: AppRequestTypes.POST.name,
      graphClient: client,
      variables: <String, String>{'phonenumber': phoneNumber},
      raw: true,
    ) as Response;

    final ProcessedResponse processedResponse =
        processResponse(response, context);

    if (processedResponse.ok) {
      final CanRegisterOutput canRegister = CanRegisterOutput(
          canRegister: true,
          response: OTPResponse.fromJson(
              json.decode(response.body) as Map<String, dynamic>));

      if (canRegister.canRegister) {
        dispatch(
          BatchUpdateMiscStateAction(
            phoneNumber: phoneNumber,
            otpCode: canRegister.response!.otp,
            title: verifyPhone,
            message: verifyDesc(
                formatPhoneNumber(phoneNumber: phoneNumber, countryCode: '')),
          ),
        );
      }
      return state;
    } else {
      showAlertSnackBar(context: context, message: processedResponse.message);
      return state;
    }
  }
}
