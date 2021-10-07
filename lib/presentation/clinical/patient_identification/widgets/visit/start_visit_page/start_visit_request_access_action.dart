// Dart imports:
import 'dart:async';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart' as http;

// Project imports:
import 'package:bewell_pro_core/application/core/graphql/mutations.dart';
import 'package:bewell_pro_core/application/redux/flags/flags.dart';
import 'package:bewell_pro_core/application/redux/states/clinical_state.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/application/redux/states/misc_state.dart';
import 'package:bewell_pro_core/domain/clinical/entities/OTP_episode_creation_input.dart';
import 'package:bewell_pro_core/domain/clinical/entities/current_episode.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_connection.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';

/// starts a patient visit
class StartVisitByRequestAccessAction extends ReduxAction<CoreState> {
  StartVisitByRequestAccessAction({
    required this.client,
    required this.otpEpisodeCreationInput,
  });

  final IGraphQlClient? client;
  final OTPEpisodeCreationInput otpEpisodeCreationInput;

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
        'patientID': otpEpisodeCreationInput.patientID,
        'providerCode': otpEpisodeCreationInput.providerCode,
        'otp': otpEpisodeCreationInput.otp,
        'fullAccess': false,
        'msisdn': otpEpisodeCreationInput.msisdn,
      }
    };
    final http.Response result = await client!.query(startVisitMutation, input);

    if (result.statusCode != 200) {
      throw const UserException(
          'Failed to start a visit, check internet connection');
    }

    final Map<String, dynamic> data = client!.toMap(result);

    client!.close();

    final String? parseError = client!.parseError(data);
    if (parseError != null) {
      if (parseError.contains('invalid phone')) {
        final MiscState? newMiscState = state.miscState?.copyWith
            .call(invalidPin: true, isResendingOTP: false);

        return state.copyWith.call(miscState: newMiscState);
      } else {
        throw const UserException(
            'Failed to start a visit, unexpected error occurred'); // todo: create better messages
      }
    }

    final EpisodeOfCarePayload episodeOfCarePayload =
        EpisodeOfCarePayload.fromJson(
            data['data']['startEpisodeByOTP'] as Map<String, dynamic>);

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
