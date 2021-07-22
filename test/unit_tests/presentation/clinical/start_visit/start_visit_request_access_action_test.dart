import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/flags/flags.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';
import 'package:bewell_pro_core/domain/clinical/entities/OTP_episode_creation_input.dart';
import 'package:bewell_pro_core/domain/clinical/entities/codeable_concept.dart';
import 'package:bewell_pro_core/domain/clinical/entities/current_episode.dart';
import 'package:bewell_pro_core/domain/clinical/entities/identifier.dart';
import 'package:bewell_pro_core/domain/clinical/entities/period.dart';
import 'package:bewell_pro_core/domain/clinical/entities/reference.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/episode_of_care_status_enum.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/visit/start_visit_page/start_visit_request_access_action.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:test/test.dart';

import '../../../../mocks/mocks.dart';

void main() {
  group('start visit by request access:', () {
    test('happy case', () async {
      final EpisodeOfCarePayload episodeOfCarePayload = EpisodeOfCarePayload(
        totalVisits: 1,
        episodeOfCare: EpisodeOfCare(
            id: 'some_unique_id_for_episode_of_care',
            status: EpisodeOfCareStatusEnum.active,
            period: Period(start: '1990-12-29'),
            managingOrganization:
                Reference(display: 'modern hospitals international'),
            patient: Reference(
                identifier: Identifier(value: 'patient001'),
                display: 'patient001'),
            type: <CodeableConcept>[CodeableConcept(text: 'referral')]),
      );

      final IGraphQlClient client = MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
            json.encode(
              <String, dynamic>{
                'data': <String, dynamic>{
                  'startEpisodeByOTP': episodeOfCarePayload.toJson()
                }
              },
            ),
            200),
      );

      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());
      final StoreTester<AppState> storeTester = StoreTester<AppState>.from(
        store,
        // this suppresses the verbose logs in the terminal
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );

      final OTPEpisodeCreationInput otpEpisodeCreationInput =
          OTPEpisodeCreationInput(
              patientID: 'patientID',
              providerCode: 'providerCode',
              msisdn: 'msisdn',
              otp: 'otp',
              fullAccess: false);

      storeTester.dispatch(StartVisitByRequestAccessAction(
          client: client, otpEpisodeCreationInput: otpEpisodeCreationInput));

      final TestInfoList<AppState> infos = await storeTester.waitAll(<Type>[
        StartVisitByRequestAccessAction,
        WaitAction,
        NavigateAction,
        WaitAction
      ]);

      expect(
          infos
              .get(WaitAction, 1)
              ?.state
              .wait
              ?.isWaitingFor(isWaitingStartVisit),
          true);
      expect(
          infos
              .get(WaitAction, 2)
              ?.state
              .wait
              ?.isWaitingFor(isWaitingStartVisit),
          false);

      expect(
          infos
              .get(StartVisitByRequestAccessAction)
              ?.state
              .clinicalState
              ?.currentEpisodeOfCare,
          episodeOfCarePayload.episodeOfCare);

      // remove this after the refactor patient profile to stop using singletons
      final CurrentPatientInEpisode currentPatientInEpisode =
          CurrentPatientInEpisode();

      expect(currentPatientInEpisode.episodeOfCarePayload.valueOrNull,
          episodeOfCarePayload);
    });

    test('when client is null', () async {
      final StoreTester<AppState> storeTester = StoreTester<AppState>(
        initialState: AppState.initial(),
        // this suppresses the verbose logs in the terminal
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );

      final OTPEpisodeCreationInput otpEpisodeCreationInput =
          OTPEpisodeCreationInput(
              patientID: 'patientID',
              providerCode: 'providerCode',
              msisdn: 'msisdn',
              otp: 'otp',
              fullAccess: false);

      storeTester.dispatch(StartVisitByRequestAccessAction(
          client: null, otpEpisodeCreationInput: otpEpisodeCreationInput));

      final TestInfo<AppState> infos = await storeTester.waitAllGetLast(
          <Type>[StartVisitByRequestAccessAction, WaitAction, WaitAction]);

      expect(infos.errors.removeFirst().msg, 'cannot start a visit');
    });

    test('when status code not 200', () async {
      final StoreTester<AppState> storeTester = StoreTester<AppState>(
        initialState: AppState.initial(),
        // this suppresses the verbose logs in the terminal
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );

      final IGraphQlClient client = MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
            json.encode(
              <String, dynamic>{
                'data': <String, dynamic>{
                  'startEpisodeByOTP': <String, dynamic>{}
                }
              },
            ),
            404),
      );

      final OTPEpisodeCreationInput otpEpisodeCreationInput =
          OTPEpisodeCreationInput(
              patientID: 'patientID',
              providerCode: 'providerCode',
              msisdn: 'msisdn',
              otp: 'otp',
              fullAccess: false);

      storeTester.dispatch(StartVisitByRequestAccessAction(
          client: client, otpEpisodeCreationInput: otpEpisodeCreationInput));

      final TestInfo<AppState> infos = await storeTester.waitAllGetLast(
          <Type>[StartVisitByRequestAccessAction, WaitAction, WaitAction]);

      expect(infos.errors.removeFirst().msg,
          'Failed to start a visit, check internet connection');
    });

    test('when server returns errors', () async {
      final StoreTester<AppState> storeTester = StoreTester<AppState>(
        initialState: AppState.initial(),
        // this suppresses the verbose logs in the terminal
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );

      final IGraphQlClient client = MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
            json.encode(
              <String, dynamic>{
                'errors': <dynamic>[
                  <String, dynamic>{'message': 'not provided'},
                ]
              },
            ),
            200),
      );

      final OTPEpisodeCreationInput otpEpisodeCreationInput =
          OTPEpisodeCreationInput(
              patientID: 'patientID',
              providerCode: 'providerCode',
              msisdn: 'msisdn',
              otp: 'otp',
              fullAccess: false);

      storeTester.dispatch(StartVisitByRequestAccessAction(
          client: client, otpEpisodeCreationInput: otpEpisodeCreationInput));

      final TestInfo<AppState> infos = await storeTester.waitAllGetLast(
          <Type>[StartVisitByRequestAccessAction, WaitAction, WaitAction]);

      expect(infos.errors.removeFirst().msg,
          'Failed to start a visit, unexpected error occurred');
    });

    test('when server returns errors that contains "invalid phone"', () async {
      final StoreTester<AppState> storeTester = StoreTester<AppState>(
        initialState: AppState.initial(),
        // this suppresses the verbose logs in the terminal
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );

      final IGraphQlClient client = MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
            json.encode(
              <String, String>{
                'errors': 'invalid phone',
              },
            ),
            200),
      );

      final OTPEpisodeCreationInput otpEpisodeCreationInput =
          OTPEpisodeCreationInput(
              patientID: 'patientID',
              providerCode: 'providerCode',
              msisdn: 'msisdn',
              otp: 'otp',
              fullAccess: false);

      storeTester.dispatch(StartVisitByRequestAccessAction(
          client: client, otpEpisodeCreationInput: otpEpisodeCreationInput));

      final TestInfo<AppState> info = await storeTester.waitAllGetLast(
          <Type>[StartVisitByRequestAccessAction, WaitAction, WaitAction]);

      expect(info.state.miscState?.invalidPin, true);
      expect(info.state.miscState?.isResendingOTP, false);
    });
  });
}
