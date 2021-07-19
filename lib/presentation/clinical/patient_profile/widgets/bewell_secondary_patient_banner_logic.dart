import 'dart:async';

import 'package:flutter/material.dart';
import 'package:bewell_pro_core/application/core/graphql/queries.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/domain/clinical/entities/allergy.dart';
import 'package:bewell_pro_core/domain/clinical/entities/allergy_intolerance_relay_connection.dart';
import 'package:bewell_pro_core/domain/clinical/entities/allergy_intolerance_relay_edge.dart';
import 'package:bewell_pro_core/domain/clinical/entities/condition_edge.dart';
import 'package:bewell_pro_core/domain/clinical/entities/medication_edge.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart' as http;

/// logic used in class [BeWellSecondaryPatientBanner]
class BeWellSecondaryPatientBannerLogic {
// fetch from the network
  static Future<void> secondaryBannerCommonFetchFunction({
    required StreamController<dynamic> streamController,
    required String queryString,
    required BuildContext context,
  }) async {
    final SecondaryBannerInfoObject secondaryBannerInfoObject =
        SecondaryBannerInfoObject();

    final ISILGraphQlClient _client = AppWrapperBase.of(context)!.graphQLClient;

    final Map<String, dynamic> _variables = <String, dynamic>{
      'params': <String, dynamic>{
        'patient': getPatientInfo().patientId,
      }
    };

    // toggle loading indicator
    streamController.add(<String, dynamic>{'loading': true});

    final http.Response result = await _client.query(queryString, _variables);
    final Map<String, dynamic> payLoad = _client.toMap(result);
    //check first for errors
    if (_client.parseError(payLoad) != null) {
      streamController
          .addError(<String, dynamic>{'error': _client.parseError(payLoad)});
      return;
    }

    if (payLoad['data'] != null) {
      if (queryString == findPatientsExistingConditionsQuery) {
        // the payload as a data object
        final ConditionRelayConnection conditionRelayConnection =
            ConditionRelayConnection.fromJson(
                payLoad['data']['searchFHIRCondition'] as Map<String, dynamic>);

        final List<ConditionEdgeRelay?>? conditionEdgesRelays =
            conditionRelayConnection.edges;

        secondaryBannerInfoObject.problemsList.add(conditionEdgesRelays);
      } else if (queryString == findPatientExistingAllergiesQuery) {
        // the payload as data class object
        final AllergyIntoleranceRelayConnection
            allergyIntoleranceRelayConnection =
            AllergyIntoleranceRelayConnection.fromJson(payLoad['data']
                ['searchFHIRAllergyIntolerance'] as Map<String, dynamic>);

        final List<AllergyIntoleranceRelayEdge?>? allergyIntoleranceRelayEdges =
            allergyIntoleranceRelayConnection.edges;

        secondaryBannerInfoObject.allergiesList
            .add(allergyIntoleranceRelayEdges);
      } else if (queryString == findPatientExistingMedicationQuery) {
        // the payload as data class object
        final MedicationRelayConnection medicationRelayConnection =
            MedicationRelayConnection.fromJson(payLoad['data']
                ['searchFHIRMedicationRequest'] as Map<String, dynamic>);

        final List<MedicationEdgeRelay?>? medicationrelayEdges =
            medicationRelayConnection.edges;

        secondaryBannerInfoObject.medicationsList.add(medicationrelayEdges);
      }
      return streamController.add(payLoad['data']);
    }
    return streamController.add(null);
  }

  // active allergy intolerance records
  static List<AllergyIntolerance> activeAllergy(
      List<AllergyIntoleranceRelayEdge?>? allergies) {
    final List<AllergyIntolerance> activeAllergyIntolerance =
        List<AllergyIntolerance>.empty(growable: true);

    // no active allergy intolerance record
    if (allergies == null) return activeAllergyIntolerance;

    for (int i = 0; i < allergies.length; ++i) {
      final AllergyIntolerance? allergyIntolerance = allergies[i]?.node;

      if (allergyIntolerance == null) return activeAllergyIntolerance;

      if (allergyIntolerance.clinicalStatus?.text == 'Active') {
        activeAllergyIntolerance.add(allergyIntolerance);
      }
    }
    return activeAllergyIntolerance;
  }

// returns the active allergy intolerance in the patient's current encounter record
  static List<AllergyIntolerance> activeAllergyIntoleranceInEncounter(
      List<AllergyIntoleranceRelayEdge?>? allergies) {
    // get allergy intolerance that are active
    final List<AllergyIntolerance> activeAllergyIntolerance =
        activeAllergy(allergies);

    // the allergy intolerance in the encounter
    final List<AllergyIntolerance> activeAllergyIntoleranceInEncounter =
        List<AllergyIntolerance>.empty(growable: true);

    if (activeAllergyIntolerance.isEmpty) return activeAllergyIntolerance;

    for (int i = 0; i < activeAllergyIntolerance.length; ++i) {
      final AllergyIntolerance allergyIntolerance = activeAllergyIntolerance[i];

      if (allergyIntolerance.encounter?.reference ==
          getPatientInfo().encounterReference) {
        activeAllergyIntoleranceInEncounter.add(allergyIntolerance);
      }
    }
    return activeAllergyIntoleranceInEncounter;
  }
}
