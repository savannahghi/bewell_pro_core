// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:http/http.dart' as http;

// Project imports:
import 'package:bewell_pro_core/application/core/graphql/queries.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/domain/clinical/entities/composition_edge.dart';
import 'package:bewell_pro_core/domain/clinical/entities/composition_edge_relay.dart';
import 'package:bewell_pro_core/domain/clinical/entities/fhir.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_connection.dart';
import 'package:bewell_pro_core/domain/core/value_objects/exception_strings.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/models/exam_composition.dart';

enum PatientExamUpdateType { patientHistory, generalExam, reviewOfSystem }

/// Fetches all the compositions for this patient's encounter from the backend,
/// and updates the relevant passed in stream controller
Future<void> fetchCompositionData({
  required CompositionTypeTitle compositionTitle,
  required StreamController<dynamic> streamController,
  required BuildContext context,
}) async {
  final IGraphQlClient _client = AppWrapperBase.of(context)!.graphQLClient;

  final PatientInfo patientInfo = getPatientInfo();

  final Map<String, dynamic> _variables = <String, dynamic>{
    'params': <String, dynamic>{
      'patient': patientInfo.patientReference,
      'encounter': patientInfo.encounterReference
    }
  };

  // toggle loading indicator
  streamController.add(<String, dynamic>{'loading': true});

  final http.Response result =
      await _client.query(searchCompositionQuery, _variables);

  final Map<String, dynamic> payload = _client.toMap(result);

  // check first for errors
  if (_client.parseError(payload) != null) {
    await captureException(
      errorFetchingCompositionData,
      query: searchCompositionQuery,
      error: _client.parseError(payload),
      response: payload,
      variables: _variables,
    );
    return streamController
        .addError(<String, dynamic>{'error': _client.parseError(payload)});
  }

  if (payload['data'] != null) {
    if (payload['data']['searchFHIRComposition'] != null) {
      final CompositionRelayConnection compositionRelayConnection =
          CompositionRelayConnection.fromJson(
              payload['data']['searchFHIRComposition'] as Map<String, dynamic>);

      final List<CompositionEdgeRelay?>? _relayEdges =
          compositionRelayConnection.edges;

      if (_relayEdges != null && _relayEdges.isNotEmpty) {
        // filter out the data from the composition based on whether it is
        // a general exam composition or  review of system composition
        // it expects only one

        final List<Composition?> _examComposition = _relayEdges
            .map((CompositionEdgeRelay? e) => e?.node)
            .toList()
            .where(
              (Composition? element) => element?.title == compositionTitle.name,
            )
            .toList();

        final Composition? _compositionData =
            _examComposition.isEmpty ? null : _examComposition.first;

        return streamController.add(_compositionData);
      } else {
        // the data has no edges so we cleanup the stream controller
        return streamController.add(null);
      }
    }
    return streamController.add(null);
  }

  // the data returned is null
  return streamController.add(null);
}
