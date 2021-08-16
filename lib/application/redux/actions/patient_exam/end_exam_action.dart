import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/core/graphql/mutations.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/application/redux/flags/flags.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_connection.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/exception_strings.dart';
import 'package:http/http.dart';
import 'package:flutter_graphql_client/graph_client.dart';

class EndExamAction extends ReduxAction<CoreState> {
  EndExamAction({required this.client});

  final IGraphQlClient client;

  @override
  void after() {
    dispatch(WaitAction<CoreState>.remove(hasCompletedEnteringOTPFlag));
    dispatch(WaitAction<CoreState>.remove(endingExamFlag));
  }

  @override
  void before() {
    dispatch(WaitAction<CoreState>.add(hasCompletedEnteringOTPFlag));
    dispatch(WaitAction<CoreState>.add(endingExamFlag));
  }

  /// End exam here and go back to timeline
  @override
  Future<CoreState?> reduce() async {
    final PatientInfo patientInfo = getPatientInfo();

    final String? id = patientInfo.encounterId;

    if (id!.isNotEmpty && id != 'null') {
      final Map<String, String> input = <String, String>{
        'encounterID': id,
      };

      final Response result = await client.query(endExamMutation, input);
      final Map<String, dynamic> data = client.toMap(result);

      if (client.parseError(data) != null) {
        dispatch(WaitAction<CoreState>.add(showErrorFlag));
      }

      if (data['data'] != null) {
        final bool endEncounter = data['data']['endEncounter'] as bool;
        if (endEncounter) {
          dispatch(WaitAction<CoreState>.remove(showErrorFlag));
          ViewSummaryStore().viewSummaryButton.add(false);
          dispatch(
              NavigateAction<CoreState>.pop(<String, dynamic>{'status': true}));
        }
      }
    } else {
      await captureException(
        errorEndingExam,
        query: endExamMutation,
        error: 'patient encounter ID is not available',
        variables: <String, dynamic>{
          'encounterID': id,
          'currentPatient': patientInfo
        },
      );
      throw const UserException(errorEndingExam);
    }

    return null;
  }
}
