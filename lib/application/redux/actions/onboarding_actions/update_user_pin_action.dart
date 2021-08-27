import 'dart:async';

import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:bewell_pro_core/application/core/services/onboarding.dart';
import 'package:bewell_pro_core/application/redux/actions/misc_state_actions/batch_update_misc_state_action.dart';
import 'package:bewell_pro_core/application/redux/flags/flags.dart';
import 'package:bewell_pro_core/application/redux/states/misc_state.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/entities/processed_response.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';
import 'package:http/http.dart';
import 'package:misc_utilities/misc.dart';

/// Verifies the PIN entered by the user
///
/// @params
/// [isChangingPin] a bool indicating whether the user is changing their PIN
/// [String] the PIN that has been entered by the user
class UpdateUserPinAction extends ReduxAction<CoreState> {
  final BuildContext context;

  UpdateUserPinAction({required this.context});

  @override
  void after() {
    dispatch(WaitAction<CoreState>.remove(verifyPinFlag));
  }

  @override
  void before() {
    dispatch(WaitAction<CoreState>.add(verifyPinFlag));
  }

  @override
  Future<CoreState?> reduce() async {
    final String endEndpoint =
        AppWrapperBase.of(context)!.customContext?.updateUserPinEndpoint ??
            EndpointContext.updateUserPinEndpoint(
                AppWrapperBase.of(context)!.appContexts);

    final IGraphQlClient _client = AppWrapperBase.of(context)!.graphQLClient;

    final MiscState? miscState = state.miscState;

    final Map<String, String> payload = <String, String>{
      'phoneNumber': miscState!.phoneNumber!,
      'otp': miscState.otpCode!,
      'pin': miscState.pinCode!,
    };

    final ProcessedResponse processedResponse = processResponse(
      await SimpleCall.callRestAPI(
          endpoint: endEndpoint,
          method: AppRequestTypes.POST.name,
          graphClient: _client,
          raw: true,
          variables: payload) as Response,
      context,
    );

    if (processedResponse.ok) {
      dispatch(
        BatchUpdateMiscStateAction(
          otpCode: UNKNOWN,
          phoneNumber: UNKNOWN,
          unKnownPhoneNo: false,
        ),
      );

      ScaffoldMessenger.of(context)
          .showSnackBar(snackbar(content: snackBarSuccessfulMessage));

      await Navigator.of(context).pushReplacementNamed(phoneLoginRoute);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(snackbar(content: processedResponse.message));
      return null;
    }
  }
}
