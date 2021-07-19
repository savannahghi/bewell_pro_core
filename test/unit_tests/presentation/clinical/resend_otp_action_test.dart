import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/flags/flags.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/visit/start_visit_page/resend_otp_action.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:test/test.dart';

import '../../../mocks/mocks.dart';

void main() {
  group('resend OTP action test', () {
    test('happy case', () async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());
      final StoreTester<AppState> storeTester = StoreTester<AppState>.from(
        store,
        // this suppresses the verbose logs in the terminal
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );

      final ISILGraphQlClient client = MockShortSILGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
            json.encode(
              <String, dynamic>{
                'data': <String, String>{
                  'generateRetryOTP': '123',
                }
              },
            ),
            200),
      );

      await storeTester
          .dispatch(ResendOtpAction(phoneNumber: '', step: 1, client: client));

      final TestInfoList<AppState> infos = await storeTester.waitAll(<Type>[
        ResendOtpAction,
        WaitAction,
        WaitAction,
        WaitAction,
        WaitAction,
      ]);

      // before the action
      expect(
          infos
              .get(WaitAction, 1)
              ?.state
              .wait
              ?.isWaitingFor(isResendingOTPFlag),
          true);
      expect(
          infos
              .get(WaitAction, 2)
              ?.state
              .wait
              ?.isWaitingFor(hasCompletedEnteringOTPFlag),
          true);

      // after the ResendOtpAction completes
      expect(
          infos
              .get(ResendOtpAction)
              ?.state
              .wait
              ?.isWaitingFor(hasCompletedEnteringOTPFlag),
          false);

      expect(
          infos
              .get(ResendOtpAction)
              ?.state
              .wait
              ?.isWaitingFor(isResendingOTPFlag),
          false);

      // after the action
      expect(
          infos
              .get(WaitAction, 3)
              ?.state
              .wait
              ?.isWaitingFor(isResendingOTPFlag),
          false);
      expect(
          infos
              .get(WaitAction, 4)
              ?.state
              .wait
              ?.isWaitingFor(hasCompletedEnteringOTPFlag),
          false);
    });

    test('when the client is null', () async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());
      final StoreTester<AppState> storeTester = StoreTester<AppState>.from(
        store,
        // this suppresses the verbose logs in the terminal
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );

      await storeTester.dispatch(
          ResendOtpAction(phoneNumber: '0712345678', step: 1, client: null));

      final TestInfo<AppState> info = await storeTester.waitAllGetLast(<Type>[
        ResendOtpAction,
        WaitAction,
        WaitAction,
        WaitAction,
        WaitAction,
      ]);

      expect(info.errors.removeFirst().msg,
          'cannot resend OTP to 0712345678, retry later');
    });

    test('when phone number is null', () async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());
      final StoreTester<AppState> storeTester = StoreTester<AppState>.from(
        store,
        // this suppresses the verbose logs in the terminal
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );

      final ISILGraphQlClient client = MockShortSILGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
            json.encode(
              <String, dynamic>{
                'data': <String, String>{
                  'generateRetryOTP': '123',
                }
              },
            ),
            200),
      );

      await storeTester.dispatch(
          ResendOtpAction(phoneNumber: null, step: 1, client: client));

      final TestInfo<AppState> info = await storeTester.waitAllGetLast(<Type>[
        ResendOtpAction,
        WaitAction,
        WaitAction,
        WaitAction,
        WaitAction,
      ]);

      expect(info.errors.removeFirst().msg,
          'Error resending OTP, phone number not found');
    });

    test('when server responds with error', () async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());
      final StoreTester<AppState> storeTester = StoreTester<AppState>.from(
        store,
        // this suppresses the verbose logs in the terminal
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );

      final ISILGraphQlClient client = MockShortSILGraphQlClient.withResponse(
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

      await storeTester.dispatch(
          ResendOtpAction(phoneNumber: '0712345678', step: 1, client: client));

      final TestInfo<AppState> info = await storeTester.waitAllGetLast(<Type>[
        ResendOtpAction,
        WaitAction,
        WaitAction,
        WaitAction,
        WaitAction,
      ]);

      expect(info.errors.removeFirst().msg,
          'Error resending OTP to 0712345678, retry later');
    });
  });
}
