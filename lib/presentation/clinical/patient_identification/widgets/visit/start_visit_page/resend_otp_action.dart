import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/core/graphql/mutations.dart';
import 'package:bewell_pro_core/application/redux/flags/flags.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:flutter_graphql_client/graph_event_bus.dart';

/// Action to resend otp to user
class ResendOtpAction extends ReduxAction<AppState> {
  final String? phoneNumber;
  final int step;
  final ISILGraphQlClient? client;

  ResendOtpAction({
    required this.phoneNumber,
    required this.step,
    required this.client,
  });

  @override
  void before() {
    dispatch(WaitAction<AppState>.add(isResendingOTPFlag));
    dispatch(WaitAction<AppState>.add(hasCompletedEnteringOTPFlag));
  }

  @override
  Future<AppState?> reduce() async {
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

    /// save logs to firebase
    SaveTraceLog(
            query: generateRetryOTPQuery,
            data: variables,
            response: data,
            client: client!,
            title: 'Resend OTP',
            description: 'Resend OTP')
        .saveLog();

    final String? parseError = client!.parseError(data);

    if (parseError != null) {
      throw UserException('Error resending OTP to $phoneNumber, retry later');
    }

    return null;
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(isResendingOTPFlag));
    dispatch(WaitAction<AppState>.remove(hasCompletedEnteringOTPFlag));
  }
}
