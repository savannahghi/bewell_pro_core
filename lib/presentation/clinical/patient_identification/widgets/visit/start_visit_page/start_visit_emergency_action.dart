import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/core/graphql/mutations.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/application/redux/flags/flags.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/application/redux/states/clinical_state.dart';
import 'package:bewell_pro_core/domain/clinical/entities/break_glass_episode_creation_input.dart';
import 'package:bewell_pro_core/domain/clinical/entities/current_episode.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_connection.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/exception_strings.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_graphql_client/graph_client.dart';

class StartVisitEmergencyAction extends ReduxAction<CoreState> {
  StartVisitEmergencyAction({
    required this.client,
    required this.breakGlassEpisodeCreationInput,
  });
  final IGraphQlClient? client;
  final BreakGlassEpisodeCreationInput? breakGlassEpisodeCreationInput;

  @override
  void before() {
    // show a loading indicator
    dispatch(WaitAction<CoreState>.add(isWaitingStartVisit));
  }

  @override
  Future<CoreState?> reduce() async {
    if (client == null) {
      throw const UserException('cannot start a visit');
    }

    final Map<String, dynamic> input = <String, dynamic>{
      'input': <String, dynamic>{
        'patientID': breakGlassEpisodeCreationInput?.patientID,
        'providerCode': breakGlassEpisodeCreationInput?.providerCode,
        'practitionerUID': breakGlassEpisodeCreationInput?.practitionerUID,
        'providerPhone': breakGlassEpisodeCreationInput?.providerPhone,
        'otp': breakGlassEpisodeCreationInput?.otp,
        'fullAccess': false,
        'patientPhone': breakGlassEpisodeCreationInput?.patientPhone,
      }
    };

    final http.Response result =
        await client!.query(startBreakGlassVisitMutation, input);

    if (result.statusCode != 200) {
      throw const UserException(
          'Failed to start a visit, check internet connection');
    }
    final Map<String, dynamic> data = client!.toMap(result);

    client!.close();

    final String? error = client!.parseError(data);

    if (error != null) {
      await captureException(
        errorStartingVisitEmergency,
        query: startBreakGlassVisitMutation,
        error: error,
      );
      throw const UserException(
          'Failed to start a visit, unexpected error occurred'); // todo: create better messages
    }

    final EpisodeOfCarePayload episodeOfCarePayload =
        EpisodeOfCarePayload.fromJson(
            data['data']['startEpisodeByBreakGlass'] as Map<String, dynamic>);

    // save the open episode of care into the core state
    final ClinicalState? clinicalState = state.clinicalState?.copyWith
        .call(currentEpisodeOfCare: episodeOfCarePayload.episodeOfCare);
    final CoreState newState =
        state.copyWith.call(clinicalState: clinicalState);

    // for backward compatibility only
    // TODO: REMOVE AFTER REFACTORING PATIENT PROFILE
    final CurrentPatientInEpisode currentPatientInEpisode =
        CurrentPatientInEpisode();
    currentPatientInEpisode.fullAccess.add(false);
    currentPatientInEpisode.episodeOfCarePayload.add(episodeOfCarePayload);

    final PatientEdge patientEdge =
        PatientEdge(node: state.clinicalState?.patientPayload?.patientRecord);

    final List<PatientEdge?> list = List<PatientEdge?>.empty(growable: true);
    list.add(patientEdge);
    final PatientConnection patientConnection = PatientConnection(edges: list);
    currentPatientInEpisode.patientConnection.add(patientConnection);

    dispatch(
        NavigateAction<CoreState>.popAndPushNamed(patientProfilePageRoute));

    return newState;
  }

  @override
  void after() {
    // remove the loading indicator
    dispatch(WaitAction<CoreState>.remove(isWaitingStartVisit));
  }
}
