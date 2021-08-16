import 'dart:async';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/core/graphql/mutations.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/application/redux/actions/user_state_actions/logout_action.dart';
import 'package:bewell_pro_core/application/redux/flags/flags.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/exception_strings.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:misc_utilities/misc.dart';

class ChangeUserPinAction extends ReduxAction<CoreState> {
  ChangeUserPinAction({
    required this.pin,
    required this.context,
    this.logoutAction,
  });

  final BuildContext context;
  final String pin;
  ReduxAction<CoreState>? logoutAction;

  @override
  void after() {
    dispatch(WaitAction<CoreState>.remove(changePinFlag));
  }

  @override
  void before() {
    dispatch(WaitAction<CoreState>.add(changePinFlag));
  }

  @override
  Future<CoreState> reduce() async {
    final IGraphQlClient graphQlClient =
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
      dispatch(logoutAction ?? LogoutAction());
      return state;
    }

    ScaffoldMessenger.of(context)
        .showSnackBar(snackbar(content: changePinErrorMessage));
    return state;
  }
}
