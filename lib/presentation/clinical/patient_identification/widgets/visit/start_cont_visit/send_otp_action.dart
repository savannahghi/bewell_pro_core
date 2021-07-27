import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/flags/flags.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:user_profile/constants.dart';

class SendOTPAction extends ReduxAction<CoreState> {
  SendOTPAction({required this.client, required this.phoneContact});

  final IGraphQlClient? client;
  final String phoneContact;

  @override
  void before() {
    // show a loading indicator
    dispatch(WaitAction<CoreState>.add(isWaitingSendOTP));
  }

  @override
  Future<CoreState?> reduce() async {
    if (client == null) {
      throw const UserException('failed to send OTP, retry again');
    }

    final Map<String, dynamic> queryVariables = <String, dynamic>{
      'msisdn': phoneContact
    };

    final http.Response response =
        await client!.query(generateOTPQuery, queryVariables);

    final Map<String, dynamic> data = client!.toMap(response);

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
    dispatch(WaitAction<CoreState>.remove(isWaitingSendOTP));
  }
}
