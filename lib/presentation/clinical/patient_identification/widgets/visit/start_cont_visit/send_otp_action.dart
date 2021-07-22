import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/flags/flags.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:flutter_graphql_client/graph_event_bus.dart';
import 'package:user_profile/constants.dart';

class SendOTPAction extends ReduxAction<AppState> {
  SendOTPAction({required this.client, required this.phoneContact});

  final IGraphQlClient? client;
  final String phoneContact;

  @override
  void before() {
    // show a loading indicator
    dispatch(WaitAction<AppState>.add(isWaitingSendOTP));
  }

  @override
  Future<AppState?> reduce() async {
    if (client == null) {
      throw const UserException('failed to send OTP, retry again');
    }

    final Map<String, dynamic> queryVariables = <String, dynamic>{
      'msisdn': phoneContact
    };

    final http.Response response =
        await client!.query(generateOTPQuery, queryVariables);

    final Map<String, dynamic> data = client!.toMap(response);

    /// save logs to firebase
    SaveTraceLog(
            query: generateOTPQuery,
            data: queryVariables,
            client: client!,
            response: data,
            title: 'send otp code',
            description: 'otp code sent to user')
        .saveLog();

    client!.close();

    final String? parseError = client!.parseError(data);
    if (parseError != null) {
      throw const UserException('an error was encountered when sending OTP');
    }

    return null;
  }

  @override
  void after() {
    // remove the loading indicator
    dispatch(WaitAction<AppState>.remove(isWaitingSendOTP));
  }
}
