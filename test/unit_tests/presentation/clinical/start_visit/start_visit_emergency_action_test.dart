// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart' as http;
import 'package:test/test.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/clinical/entities/break_glass_episode_creation_input.dart';
import 'package:bewell_pro_core/domain/clinical/entities/codeable_concept.dart';
import 'package:bewell_pro_core/domain/clinical/entities/current_episode.dart';
import 'package:bewell_pro_core/domain/clinical/entities/identifier.dart';
import 'package:bewell_pro_core/domain/clinical/entities/period.dart';
import 'package:bewell_pro_core/domain/clinical/entities/reference.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/episode_of_care_status_enum.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/visit/start_visit_page/start_visit_emergency_action.dart';
import '../../../../mocks/mocks.dart';

void main() {
  group('start visit by emergency action', () {
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
                  'startEpisodeByBreakGlass': episodeOfCarePayload.toJson()
                }
              },
            ),
            200),
      );

      final Store<CoreState> store =
          Store<CoreState>(initialState: CoreState.initial());
      final StoreTester<CoreState> storeTester = StoreTester<CoreState>.from(
        store,
        // this suppresses the verbose logs in the terminal
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );

      final BreakGlassEpisodeCreationInput breakGlassEpisodeCreationInput =
          BreakGlassEpisodeCreationInput(
              patientID: 'patientID',
              providerCode: 'providerCode',
              practitionerUID: 'practionerUID',
              providerPhone: 'providerPhone',
              otp: 'otp',
              fullAccess: false,
              patientPhone: 'patientPhone');

      // remove this after the refactor patient profile to stop using singletons
      final CurrentPatientInEpisode currentPatientInEpisode =
          CurrentPatientInEpisode();

      currentPatientInEpisode.reset();

      storeTester.dispatch(StartVisitEmergencyAction(
          client: client,
          breakGlassEpisodeCreationInput: breakGlassEpisodeCreationInput));

      final TestInfoList<CoreState> infos = await storeTester.waitAll(<Type>[
        StartVisitEmergencyAction,
        WaitAction,
        NavigateAction,
        WaitAction,
      ]);

      expect(
          infos
              .get(StartVisitEmergencyAction)
              ?.state
              .clinicalState
              ?.currentEpisodeOfCare,
          episodeOfCarePayload.episodeOfCare);

      expect(currentPatientInEpisode.episodeOfCarePayload.valueOrNull,
          episodeOfCarePayload);
    });

    test('when response status is 404', () async {
      final IGraphQlClient client = MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
            json.encode(
              <String, dynamic>{'data': <String, dynamic>{}},
            ),
            404),
      );

      final Store<CoreState> store =
          Store<CoreState>(initialState: CoreState.initial());
      final StoreTester<CoreState> storeTester = StoreTester<CoreState>.from(
        store,
        // this suppresses the verbose logs in the terminal
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );

      final BreakGlassEpisodeCreationInput breakGlassEpisodeCreationInput =
          BreakGlassEpisodeCreationInput(
              patientID: 'patientID',
              providerCode: 'providerCode',
              practitionerUID: 'practionerUID',
              providerPhone: 'providerPhone',
              otp: 'otp',
              fullAccess: false,
              patientPhone: 'patientPhone');

      storeTester.dispatch(StartVisitEmergencyAction(
          client: client,
          breakGlassEpisodeCreationInput: breakGlassEpisodeCreationInput));

      final TestInfo<CoreState> infos = await storeTester.waitAllGetLast(
          <Type>[StartVisitEmergencyAction, WaitAction, WaitAction]);

      expect(infos.errors.removeFirst().msg,
          'Failed to start a visit, check internet connection');
    });

    test('when client is null', () async {
      final Store<CoreState> store =
          Store<CoreState>(initialState: CoreState.initial());
      final StoreTester<CoreState> storeTester = StoreTester<CoreState>.from(
        store,
        // this suppresses the verbose logs in the terminal
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );

      final BreakGlassEpisodeCreationInput breakGlassEpisodeCreationInput =
          BreakGlassEpisodeCreationInput(
              patientID: 'patientID',
              providerCode: 'providerCode',
              practitionerUID: 'practionerUID',
              providerPhone: 'providerPhone',
              otp: 'otp',
              fullAccess: false,
              patientPhone: 'patientPhone');

      storeTester.dispatch(StartVisitEmergencyAction(
          client: null,
          breakGlassEpisodeCreationInput: breakGlassEpisodeCreationInput));

      final TestInfo<CoreState> infos = await storeTester.waitAllGetLast(
          <Type>[StartVisitEmergencyAction, WaitAction, WaitAction]);

      expect(infos.errors.removeFirst().msg, 'cannot start a visit');
    });

    test('when server returns error response', () async {
      final StoreTester<CoreState> storeTester = StoreTester<CoreState>(
        initialState: CoreState.initial(),
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

      final BreakGlassEpisodeCreationInput breakGlassEpisodeCreationInput =
          BreakGlassEpisodeCreationInput(
              patientID: 'patientID',
              providerCode: 'providerCode',
              practitionerUID: 'practionerUID',
              providerPhone: 'providerPhone',
              otp: 'otp',
              fullAccess: false,
              patientPhone: 'patientPhone');

      storeTester.dispatch(StartVisitEmergencyAction(
          client: client,
          breakGlassEpisodeCreationInput: breakGlassEpisodeCreationInput));

      final TestInfo<CoreState> infos = await storeTester.waitAllGetLast(
          <Type>[StartVisitEmergencyAction, WaitAction, WaitAction]);

      expect(infos.errors.removeFirst().msg,
          'Failed to start a visit, unexpected error occurred');
    });
  });
}
