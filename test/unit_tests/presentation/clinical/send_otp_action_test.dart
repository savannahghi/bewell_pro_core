import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/flags/flags.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/visit/start_cont_visit/send_otp_action.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:test/test.dart';

import '../../../mocks/mocks.dart';

void main() {
  group('send OTP action test:', () {
    test('happy case', () async {
      final Store<CoreState> store =
          Store<CoreState>(initialState: CoreState.initial());
      final StoreTester<CoreState> storeTester = StoreTester<CoreState>.from(
        store,
        // this suppresses the verbose logs in the terminal
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );

      final IGraphQlClient client = MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
            json.encode(
              <String, dynamic>{
                'data': <String, String>{
                  'generateOTP': '123',
                }
              },
            ),
            200),
      );
      await storeTester
          .dispatch(SendOTPAction(client: client, phoneContact: '0712345678'));

      final TestInfoList<CoreState> infos = await storeTester.waitAll(<Type>[
        SendOTPAction,
        WaitAction,
        WaitAction,
      ]);

      expect(
          infos.get(WaitAction, 1)?.state.wait?.isWaitingFor(isWaitingSendOTP),
          true);
      expect(
          infos.get(WaitAction, 2)?.state.wait?.isWaitingFor(isWaitingSendOTP),
          false);
    });

    test('when client is null', () async {
      final Store<CoreState> store =
          Store<CoreState>(initialState: CoreState.initial());
      final StoreTester<CoreState> storeTester = StoreTester<CoreState>.from(
        store,
        // this suppresses the verbose logs in the terminal
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );

      await storeTester
          .dispatch(SendOTPAction(client: null, phoneContact: '0712345678'));

      final TestInfo<CoreState> info = await storeTester.waitAllGetLast(<Type>[
        SendOTPAction,
        WaitAction,
        WaitAction,
      ]);

      expect(info.errors.removeFirst().msg, 'failed to send OTP, retry again');
    });

    test('when server responds with error message', () async {
      final Store<CoreState> store =
          Store<CoreState>(initialState: CoreState.initial());
      final StoreTester<CoreState> storeTester = StoreTester<CoreState>.from(
        store,
        // this suppresses the verbose logs in the terminal
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );

      final IGraphQlClient client = MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
            json.encode(
              <String, String>{
                'errors': 'invalid request',
              },
            ),
            200),
      );
      await storeTester
          .dispatch(SendOTPAction(client: client, phoneContact: '0712345678'));

      final TestInfo<CoreState> info = await storeTester.waitAllGetLast(<Type>[
        SendOTPAction,
        WaitAction,
        WaitAction,
      ]);

      expect(info.errors.removeFirst().msg,
          'an error was encountered when sending OTP');
    });
  });
}
