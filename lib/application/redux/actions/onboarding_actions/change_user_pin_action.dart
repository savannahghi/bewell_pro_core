import 'dart:async';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/core/graphql/mutations.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/application/redux/actions/user_state_actions/logout_action.dart';
import 'package:bewell_pro_core/application/redux/flags/flags.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/exception_strings.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:misc_utilities/misc.dart';

class ChangeUserPinAction extends ReduxAction<AppState> {
  ChangeUserPinAction({
    required this.pin,
    required this.context,
  });

  final BuildContext context;
  final String pin;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(changePinFlag));
  }

  @override
  void before() {
    dispatch(WaitAction<AppState>.add(changePinFlag));
  }

  @override
  Future<AppState> reduce() async {
    final ISILGraphQlClient graphQlClient =
        AppWrapperBase.of(context)!.graphQLClient;

    final Map<String, dynamic> _variables = <String, dynamic>{
      'pin': pin,
      'phone': state.userState!.userProfile!.primaryPhoneNumber,
    };

    final Response result =
        await graphQlClient.query(updateUserPinMutation, _variables);

    graphQlClient.close();

    final Map<String, dynamic> body = graphQlClient.toMap(result);

    //check first for errors
    if (graphQlClient.parseError(body) != null || body['data'] == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(snackbar(content: changePinErrorMessage));
      await captureException(
        errorChangingPIN,
        query: updateUserPinMutation,
        error: graphQlClient.parseError(body),
        response: body,
        variables: _variables,
      );
      return state;
    }

    if (body['data']['updateUserPIN'] as bool) {
      ScaffoldMessenger.of(context)
          .showSnackBar(snackbar(content: changePinSuccessMessage));
      dispatch(LogoutAction());
      return state;
    }

    ScaffoldMessenger.of(context)
        .showSnackBar(snackbar(content: changePinErrorMessage));
    return state;
  }
}
