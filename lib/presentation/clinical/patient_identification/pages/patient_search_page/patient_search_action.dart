import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/core/graphql/queries.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/application/redux/flags/flags.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_connection.dart';
import 'package:bewell_pro_core/domain/clinical/entities/sil_custom_exceptions.dart';
import 'package:bewell_pro_core/domain/core/value_objects/exception_strings.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/pages/patient_search_page/update_patient_found_action.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/pages/patient_search_page/update_patient_search_action.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/pages/patient_search_page/update_search_param_action.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_graphql_client/graph_client.dart';

/// Search for a patient using their phone number
class PatientSearchByPhoneAction extends ReduxAction<CoreState> {
  PatientSearchByPhoneAction({required this.client, required this.searchParam});

  final IGraphQlClient client;
  final String searchParam;

  @override
  void before() {
    // show a loading indicator
    dispatch(WaitAction<CoreState>.add(searchingPatientByPhoneNumberIsWaiting));
  }

  @override
  Future<CoreState?> reduce() async {
    // make the API request
    dispatch(UpdateSearchParamAction(phoneNumber: null));
    dispatch(UpdatePatientPatientFoundAction(searchFound: null));
    dispatch(UpdatePatientSearchAction(activeRecords: null));

    final String formattedPhoneNumber = formatKEPhoneNumber(searchParam);

    final Map<String, dynamic> _variables =
        findPatientsQueryVariables(formattedPhoneNumber);

    final http.Response response = await client.query(
      findPatientsQuery,
      _variables,
    );

    client.close();

    //  handle errors
    if (response.statusCode != 200) {
      throw const ErrorWhileSearchingException();
    }

    // check for error in the data
    final Map<String, dynamic> data = client.toMap(response);
    final String? error = client.parseError(data);

    if (error != null) {
      await captureException(
        errorSearchingPatientByPhone,
        query: findPatientsQuery,
        error: error,
        response: data,
        variables: _variables,
      );

      dispatch(UpdateSearchParamAction(phoneNumber: searchParam));
      dispatch(UpdatePatientPatientFoundAction(searchFound: false));
      throw const UserNotFoundException();
    }

    final Map<String, dynamic> patientConnectionMap =
        data['data']['findPatientsByMSISDN'] as Map<String, dynamic>;

    final PatientConnection patientConnection =
        PatientConnection.fromJson(patientConnectionMap);

    final List<PatientEdge?>? activePatientRecords = patientConnection.edges
        ?.where((PatientEdge? patientEdge) => patientEdge?.node?.active == true)
        .toList();

    if (activePatientRecords == null) {
      dispatch(UpdateSearchParamAction(phoneNumber: searchParam));
      dispatch(UpdatePatientPatientFoundAction(searchFound: false));
      throw const UserNotFoundException();
    }

    if (activePatientRecords.isEmpty) {
      dispatch(UpdateSearchParamAction(phoneNumber: searchParam));
      dispatch(UpdatePatientPatientFoundAction(searchFound: false));
      throw const UserNotFoundException();
    }

    dispatch(UpdateSearchParamAction(phoneNumber: searchParam));
    dispatch(UpdatePatientPatientFoundAction(searchFound: true));
    dispatch(UpdatePatientSearchAction(activeRecords: activePatientRecords));

    return null; // do not change state
  }

  @override
  void after() {
    // hide the loading indicator
    dispatch(
        WaitAction<CoreState>.remove(searchingPatientByPhoneNumberIsWaiting));
  }
}
