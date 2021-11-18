// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:misc_utilities/misc.dart';

// Project imports:
import 'package:bewell_pro_core/application/core/graphql/queries.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/application/core/services/onboarding.dart';
import 'package:bewell_pro_core/application/redux/actions/misc_state_actions/batch_update_misc_state_action.dart';
import 'package:bewell_pro_core/application/redux/flags/flags.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/entities/onboarding_path_config.dart';
import 'package:bewell_pro_core/domain/core/value_objects/exception_strings.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';

/// Verifies the PIN entered by the user
///
/// @params
/// [isChangingPin] a bool indicating whether the user is changing their PIN
/// [String] the PIN that has been entered by the user
class VerifyPinAction extends ReduxAction<CoreState> {
  final BuildContext context;
  final bool isChangingPin;
  final String pin;

  VerifyPinAction(
      {required this.context, required this.isChangingPin, required this.pin});

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
    final IGraphQlClient _client = AppWrapperBase.of(context)!.graphQLClient;

    final Map<String, dynamic> _variables = <String, dynamic>{'pin': pin};

    final Response result = await _client.query(resumeWithPinQuery, _variables);

    final Map<String, dynamic> body = _client.toMap(result);

    // Check first for errors
    if (_client.parseError(body) != null || body['data'] == null) {
      await captureException(
        errorVerifyingPIN,
        query: resumeWithPinQuery,
        error: _client.parseError(body),
        response: body,
      );
      showErrorSnackbar(context);
      return null;
    }

    if (body['data']['resumeWithPIN'] as bool == true) {
      final OnboardingPathConfig path = onboardingPath(state: state);

      dispatch(
        BatchUpdateMiscStateAction(pinCode: UNKNOWN, invalidPin: false),
      );

      if (isChangingPin) {
        await triggerNavigationEvent(
            context: context, route: profileChangePinRoute);
      } else {
        await triggerNavigationEvent(context: context, route: path.route);
      }
    } else {
      dispatch(
        BatchUpdateMiscStateAction(pinCode: UNKNOWN, invalidPin: true),
      );
      await HapticFeedback.vibrate();

      // return the state unchanged
      return null;
    }
  }
}
