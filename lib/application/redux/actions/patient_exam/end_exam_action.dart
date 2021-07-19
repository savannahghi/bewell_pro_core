import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/core/graphql/mutations.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/application/redux/flags/flags.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/exception_strings.dart';
import 'package:http/http.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:flutter_graphql_client/graph_event_bus.dart';

class EndExamAction extends ReduxAction<AppState> {
  EndExamAction({required this.client});

  final ISILGraphQlClient client;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(hasCompletedEnteringOTPFlag));
    dispatch(WaitAction<AppState>.remove(endingExamFlag));
  }

  @override
  void before() {
    dispatch(WaitAction<AppState>.add(hasCompletedEnteringOTPFlag));
    dispatch(WaitAction<AppState>.add(endingExamFlag));
  }

  @override
  Future<AppState?> reduce() async {
    /// End exam here and go back to timeline
    final Patient? patientRecord =
        store.state.clinicalState?.patientPayload?.patientRecord;

    final String? id = patientRecord?.id;

    if (id != null) {
      final Map<String, String> input = <String, String>{
        'encounterID': id,
      };

      final Response result = await client.query(endExamMutation, input);
      final Map<String, dynamic> data = client.toMap(result);

      SaveTraceLog(
              client: client,
              query: endExamMutation,
              data: input,
              response: data,
              title: 'Patient exam summary',
              description: 'Patient exam summary : End exam')
          .saveLog();

      if (client.parseError(data) != null) {
        dispatch(WaitAction<AppState>.add(showErrorFlag));
      }

      if (data['data'] != null) {
        final bool endEncounter = data['data']['endEncounter'] as bool;
        if (endEncounter) {
          dispatch(WaitAction<AppState>.remove(showErrorFlag));
          ViewSummaryStore().viewSummaryButton.add(false);
          dispatch(
              NavigateAction<AppState>.pop(<String, dynamic>{'status': true}));
        }
      }
    } else {
      await captureException(
        errorEndingExam,
        query: endExamMutation,
        error: 'patient encounter ID is not available',
        variables: <String, dynamic>{
          'encounterID': id,
          'currentPatient': patientRecord
        },
      );
      throw const UserException(errorEndingExam);
    }

    return null;
  }
}
