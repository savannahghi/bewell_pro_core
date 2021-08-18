import 'dart:async';
import 'package:bewell_pro_core/application/clinical/patient_registration/validator_mixin.dart';
import 'package:bewell_pro_core/application/core/graphql/queries.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_connection.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/exception_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';
import 'package:misc_utilities/misc.dart';
import 'package:app_wrapper/app_wrapper.dart';

class NextOfKinFormManager with Validator {
  final BehaviorSubject<String> _phoneNumber = BehaviorSubject<String>();
  Stream<String> get phoneNumber =>
      _phoneNumber.stream.transform(validatePhoneNumbers);
  Sink<String> get inPhoneNumber => _phoneNumber.sink;

  final BehaviorSubject<NextOfKinPhoneState> _potentialNextOfKin =
      BehaviorSubject<NextOfKinPhoneState>();
  Stream<NextOfKinPhoneState> get potentialNextOfKin =>
      _potentialNextOfKin.stream;
  EventSink<NextOfKinPhoneState> get inPotentialNextOfKin =>
      _potentialNextOfKin.sink;

  final BehaviorSubject<bool> _isNextOfKinFound =
      BehaviorSubject<bool>.seeded(false);
  Sink<bool> get inIsNextOfKinFound => _isNextOfKinFound.sink;

  Stream<bool> get isFormValid => CombineLatestStream.list(<Stream<dynamic>>[
        _phoneNumber,
      ]).map<bool>(
        (List<dynamic> values) {
          final String phoneNumber = values[0] as String;
          return Validator.isValidPhone(phoneNumber);
        },
      );

  Future<void> fetchPotentialNextOfKin(
      {required String phoneNumber, required BuildContext context}) async {
    inPotentialNextOfKin.add(NextOfKinPhoneState(loading: true));

    final String phone = _phoneNumber.valueOrNull!;

    final IGraphQlClient _client = AppWrapperBase.of(context)!.graphQLClient;

    final Map<String, dynamic> _variables =
        searchRelatedPersonVariables(<String, dynamic>{'param': phone});

    /// fetch the data from the api
    final http.Response response = await _client.query(
      searchRelatedPersonByMSISDN,
      _variables,
    );

    final Map<String, dynamic> payLoad = _client.toMap(response);
    final String? error = parseError(payLoad);

    if (error != null) {
      await captureException(
        errorFetchingPotentialNextOfKin,
        query: searchRelatedPersonByMSISDN,
        error: error,
        response: payLoad,
      );
      inPotentialNextOfKin.addError(
          NextOfKinPhoneState(loading: false, error: noPatientsFoundText));
      return;
    }

    if (payLoad['data']['findPatients'] != null) {
      final PatientConnection patientConnectionData =
          PatientConnection.fromJson(
              payLoad['data']['findPatients'] as Map<String, dynamic>);
      inPotentialNextOfKin.add(
          NextOfKinPhoneState(loading: false, data: patientConnectionData));
      inIsNextOfKinFound.add(true);
    } else {
      inPotentialNextOfKin.addError(
          NextOfKinPhoneState(loading: false, error: noPatientsFoundText));
    }
  }
}

class NextOfKinPhoneState {
  final bool loading;
  final String? error;
  final PatientConnection? data;

  NextOfKinPhoneState({bool? loading, this.data, this.error})
      : this.loading = loading ?? false;
}
