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
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/entities/processed_response.dart';
import 'package:bewell_pro_core/domain/core/value_objects/exception_strings.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';

class RequestPinResetAction extends ReduxAction<CoreState> {
  RequestPinResetAction({required this.context, required this.phoneNumber});

  final BuildContext context;
  final String phoneNumber;

  @override
  void after() {
    dispatch(WaitAction<CoreState>.remove(requestPinResetFlag));
  }

  @override
  void before() {
    dispatch(WaitAction<CoreState>.add(requestPinResetFlag));
  }

  @override
  Future<CoreState?> reduce() async {
    final String endpoint =
        AppWrapperBase.of(context)!.customContext?.pinResetEndpoint ??
            EndpointContext.resetPinResetEndpoint(
                AppWrapperBase.of(context)!.appContexts);

    final IGraphQlClient client = AppWrapperBase.of(context)!.graphQLClient;

    final Map<String, String> payload = <String, String>{
      'phoneNumber': phoneNumber,
    };

    final ProcessedResponse processedResponse = processResponse(
      await SimpleCall.callRestAPI(
          endpoint: endpoint,
          method: AppRequestTypes.POST.name,
          graphClient: client,
          raw: true,
          variables: payload) as Response,
      context,
    );

    if (processedResponse.ok) {
      dispatch(
        BatchUpdateMiscStateAction(
          otpCode:
              json.decode(processedResponse.response.body)!['otp']?.toString(),
        ),
      );

      await Navigator.of(context)
          .pushReplacementNamed(verifyPinResetRequestRoute);
    } else {
      await captureException(
        errorResettingPIN,
        error: processedResponse.message,
        response: processedResponse.response.body,
      );
      throw UserException(processedResponse.message);
    }
    return null;
  }

  @override
  Object? wrapError(dynamic error) {
    if (error.runtimeType == UserException) {
      ScaffoldMessenger.of(context)
          .showSnackBar(snackbar(content: (error as UserException).msg));
    }

    return error;
  }
}
