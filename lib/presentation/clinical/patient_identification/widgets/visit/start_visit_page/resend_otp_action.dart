// Dart imports:
import 'dart:async';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart' as http;

// Project imports:
import 'package:bewell_pro_core/application/core/graphql/mutations.dart';
import 'package:bewell_pro_core/application/redux/flags/flags.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';

/// Action to resend otp to user
class ResendOtpAction extends ReduxAction<CoreState> {
  final String? phoneNumber;
  final int step;
  final IGraphQlClient? client;

  ResendOtpAction({
    required this.phoneNumber,
    required this.step,
    required this.client,
  });

  @override
  void before() {
    dispatch(WaitAction<CoreState>.add(isResendingOTPFlag));
    dispatch(WaitAction<CoreState>.add(hasCompletedEnteringOTPFlag));
  }

  @override
  Future<CoreState?> reduce() async {
    if (phoneNumber == null) {
      throw const UserException('Error resending OTP, phone number not found');
    }

    if (client == null) {
      throw UserException('cannot resend OTP to $phoneNumber, retry later');
    }

    final Map<String, dynamic> variables = <String, dynamic>{
      'msisdn': phoneNumber,
      'step': step
    };

    final http.Response result =
        await client!.query(generateRetryOTPQuery, variables);

    final Map<String, dynamic> data = client!.toMap(result);

    final String? parseError = client!.parseError(data);

    if (parseError != null) {
      throw UserException('Error resending OTP to $phoneNumber, retry later');
    }

    return null;
  }

  @override
  void after() {
    dispatch(WaitAction<CoreState>.remove(isResendingOTPFlag));
    dispatch(WaitAction<CoreState>.remove(hasCompletedEnteringOTPFlag));
  }
}
