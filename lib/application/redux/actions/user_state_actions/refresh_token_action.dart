// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:async_redux/async_redux.dart';
import 'package:sghi_core/app_wrapper/endpoints_context.dart';
import 'package:sghi_core/domain_objects/entities/auth_credential_response.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';

// Project imports:
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/application/core/services/onboarding.dart';
import 'package:bewell_pro_core/application/redux/actions/user_state_actions/batch_update_user_state_action.dart';
import 'package:bewell_pro_core/application/redux/actions/user_state_actions/logout_action.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/entities/processed_response.dart';
import 'package:bewell_pro_core/domain/core/value_objects/exception_strings.dart';
import 'package:bewell_pro_core/domain/core/value_objects/login_constants.dart';

/// [RefreshTokenAction] is used to refresh the Auth Token once it has expired
///
///
/// [context] is required to extract the necessary data to make the api call
class RefreshTokenAction extends ReduxAction<CoreState> {
  RefreshTokenAction({required this.context});

  final BuildContext context;

  @override
  Future<CoreState?> reduce() async {
    final IGraphQlClient _client = AppWrapperBase.of(context)!.graphQLClient;

    final String refreshTokenEndpoint =
        AppWrapperBase.of(context)!.customContext?.refreshTokenEndpoint ??
            EndpointContext.refreshTokenEndpoint(
                AppWrapperBase.of(context)!.appContexts);

    final Map<String, dynamic> refreshTokenVariables = <String, dynamic>{
      'refreshToken': store.state.userState!.auth!.refreshToken
    };

    final ProcessedResponse processedResponse = processResponse(
      await _client.callRESTAPI(
          endpoint: refreshTokenEndpoint,
          method: 'POST',
          variables: refreshTokenVariables),
      context,
    );

    if (processedResponse.ok) {
      final Map<String, dynamic> body =
          _client.toMap(processedResponse.response);

      final AuthCredentialResponse newAuth =
          AuthCredentialResponse.fromJson(body);

      // update user state
      dispatch(
        BatchUpdateUserStateAction(
          auth: newAuth,
          isSignedIn: true,
          inActivitySetInTime: DateTime.now().toIso8601String(),
          tokenExpiryTime: DateTime.now()
              .add(const Duration(seconds: kTokenExpiryDuration))
              .toIso8601String(),
        ),
      );

      return state;
    } else {
      await captureException(
        errorRefreshingToken,
        error: processedResponse.message,
        response: processedResponse.response.body,
        variables: refreshTokenVariables,
      );

      // logout the user if an error occurs
      dispatch(LogoutAction());

      return null;
    }
  }
}
