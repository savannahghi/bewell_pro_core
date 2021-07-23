import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/core/graphql/queries.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/application/redux/flags/flags.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/application/redux/states/clinical_state.dart';
import 'package:bewell_pro_core/domain/clinical/entities/current_episode.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_connection.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_payload.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/exception_strings.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_graphql_client/graph_client.dart';

/// Continue a visit
class ContinueVisitAction extends ReduxAction<CoreState> {
  ContinueVisitAction({required this.client});

  final IGraphQlClient client;

  @override
  void before() {
    dispatch(WaitAction<CoreState>.add(continueVisitFlag));
  }

  // Continue a visit and navigate to the visit page
  @override
  Future<CoreState?> reduce() async {
    final String? patientID =
        state.clinicalState?.patientPayload?.patientRecord?.id;
    if (patientID == null) {
      throw const UserException(
          'Failed to continue visit, patient does not have an ID');
    }

    final Map<String, String> _variables = <String, String>{'id': patientID};

    final http.Response result =
        await client.query(getOpenEpisodesOfCare, _variables);

    if (result.statusCode != 200) {
      throw const UserException(
          'failed to start visit, problem connection to internet');
    }

    final Map<String, dynamic> data = client.toMap(result);
    final String? error = client.parseError(data);
    client.close();

    if (error != null || data['data'] == null) {
      await captureException(
        errorContinueVisit,
        query: getOpenEpisodesOfCare,
        error: error,
        response: data,
        variables: _variables,
      );
      throw const UserException('Failed to continue visit, error from server');
    }

    // for backward compatibility only
    // TODO: REMOVE AFTER REFACTORING PATIENT PROFILE

    final PatientPayload patientPayload = PatientPayload.fromJson(
        data['data']['getPatient'] as Map<String, dynamic>);

    // save the open episode of care into the core state
    final ClinicalState? clinicalState = state.clinicalState?.copyWith
        .call(currentEpisodeOfCare: patientPayload.openEpisodes?.first);

    final CoreState newState = state.copyWith.call(clinicalState: clinicalState);

    final CurrentPatientInEpisode current = CurrentPatientInEpisode();

    current.fullAccess.add(false);

    current.episodeOfCarePayload.add(EpisodeOfCarePayload(
        episodeOfCare: patientPayload.openEpisodes?.first));

    final CurrentPatientInEpisode currentPatientInEpisode =
        CurrentPatientInEpisode();

    final PatientEdge patientEdge =
        PatientEdge(node: state.clinicalState?.patientPayload?.patientRecord);

    final List<PatientEdge?> list = List<PatientEdge?>.empty(growable: true);
    list.add(patientEdge);
    final PatientConnection patientConnection = PatientConnection(edges: list);
    currentPatientInEpisode.patientConnection.add(patientConnection);

    dispatch(NavigateAction<CoreState>.pushNamed(patientProfilePageRoute));

    return newState;
  }

  @override
  void after() {
    dispatch(WaitAction<CoreState>.remove(continueVisitFlag));
  }
}
