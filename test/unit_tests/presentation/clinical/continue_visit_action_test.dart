// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart' as http;
import 'package:test/test.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/states/clinical_state.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/clinical/entities/current_episode.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_payload.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/visit/continue_visit_action.dart';
import '../../../mocks/mocks.dart';

void main() {
  group('continue visit action', () {
    test('should update state', () async {
      final EpisodeOfCare episodeOfCare = EpisodeOfCare(id: 'some_unique_id');

      final PatientPayload patientPayload = PatientPayload(
          hasOpenEpisodes: true, openEpisodes: <EpisodeOfCare>[episodeOfCare]);

      final IGraphQlClient client = MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
            json.encode(
              <String, dynamic>{
                'data': <String, dynamic>{'getPatient': patientPayload.toJson()}
              },
            ),
            200),
      );

      final CurrentPatientInEpisode currentPatientInEpisode =
          CurrentPatientInEpisode();
      currentPatientInEpisode.reset();

      final Store<CoreState> store = Store<CoreState>(
          initialState: CoreState(
              clinicalState: ClinicalState(
                  patientPayload:
                      PatientPayload(patientRecord: Patient(id: 'some_id')))));
      final StoreTester<CoreState> storeTester = StoreTester<CoreState>(
        initialState: store.state,
        // this suppresses the verbose logs in the terminal
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );

      storeTester.dispatch(ContinueVisitAction(client: client));

      final TestInfoList<CoreState> infos = await storeTester.waitAll(<Type>[
        ContinueVisitAction,
        WaitAction,
        NavigateAction,
        WaitAction,
      ]);

      expect(
          infos
              .get(ContinueVisitAction)
              ?.state
              .clinicalState
              ?.currentEpisodeOfCare,
          episodeOfCare);

      expect(currentPatientInEpisode.episodeOfCarePayload.value,
          EpisodeOfCarePayload(episodeOfCare: episodeOfCare));
      expect(currentPatientInEpisode.fullAccess.valueOrNull, false);
    });

    test('should fail to update state due to client error', () async {
      final IGraphQlClient client = MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
            json.encode(
              <String, dynamic>{
                'errors': <String, dynamic>{'error': 'some error'}
              },
            ),
            200),
      );

      final Store<CoreState> store = Store<CoreState>(
          initialState: CoreState(
              clinicalState: ClinicalState(
                  patientPayload:
                      PatientPayload(patientRecord: Patient(id: 'some_id')))));

      final StoreTester<CoreState> storeTester = StoreTester<CoreState>(
        initialState: store.state,
        // this suppresses the verbose logs in the terminal
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
        shouldThrowUserExceptions: true,
      );

      expect(
          () async =>
              await storeTester.dispatch(ContinueVisitAction(client: client)),
          throwsException);
    });
  });
}
