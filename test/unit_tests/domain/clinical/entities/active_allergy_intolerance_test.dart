import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/domain/clinical/entities/allergy.dart';
import 'package:bewell_pro_core/domain/clinical/entities/allergy_intolerance_relay_connection.dart';
import 'package:bewell_pro_core/domain/clinical/entities/allergy_intolerance_relay_edge.dart';
import 'package:bewell_pro_core/domain/clinical/entities/codeable_concept.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/bewell_secondary_patient_banner_logic.dart';

import '../../../../mocks/allergy_intolerance_mock_data.dart';
import '../../../../mocks/mocks.dart';
import '../../../../mocks/patient_connection_mocked_data.dart';

void main() {
  group('check active allergy intolerance', () {
    test('happy case', () {
      final List<AllergyIntoleranceRelayEdge?>? allergies =
          AllergyIntoleranceRelayConnection.fromJson(
                  allergyIntoleranceRelayConnectionMockedData)
              .edges;

      final List<AllergyIntolerance> allergyIntolerance =
          BeWellSecondaryPatientBannerLogic.activeAllergy(allergies);

      expect(allergyIntolerance.isEmpty, false);
    });

    test('pass zero active records', () {
      AllergyIntolerance inActive =
          AllergyIntoleranceMockData.allergyIntolerance;
      inActive =
          inActive.copyWith(clinicalStatus: CodeableConcept(text: 'inactive'));

      final List<AllergyIntoleranceRelayEdge> allergyIntoleranceRelayEdges =
          <AllergyIntoleranceRelayEdge>[
        AllergyIntoleranceRelayEdge(node: inActive)
      ];

      final List<AllergyIntolerance> allergyIntolerance =
          BeWellSecondaryPatientBannerLogic.activeAllergy(
              allergyIntoleranceRelayEdges);

      expect(allergyIntolerance.isEmpty, true);
    });

    test('pass null data', () {
      AllergyIntolerance inActive =
          AllergyIntoleranceMockData.allergyIntolerance;
      inActive =
          inActive.copyWith(clinicalStatus: CodeableConcept(text: 'inactive'));

      final List<AllergyIntolerance> allergyIntolerance =
          BeWellSecondaryPatientBannerLogic.activeAllergy(null);

      expect(allergyIntolerance.isEmpty, true);
    });
  });

  group('check active allergy intolerance in current Encounter', () {
    test('happy case', () {
      AllergyIntoleranceRelayConnection allergyIntoleranceRelayConnection =
          AllergyIntoleranceMockData.allergyIntoleranceRelayConnectionMock;

      // make copy of the data to avoid race conditions incase another test uses
      //  same data and changes some variables
      allergyIntoleranceRelayConnection =
          allergyIntoleranceRelayConnection.copyWith();

      // create an episode of care and attach it to a patient

      // create an episode of care and
      CurrentPatientInEpisode()
          .patientConnection
          .add(PatientConnectionMockedData.patientConnection);

      // publish an encounterID to the stream
      CurrentPatientInEpisode()
          .encounterID
          .add('fe9d2aa7-5b64-4c75-a145-d4a855a9a523');

      final List<AllergyIntolerance> activeAllergyIntoleranceInEncounter =
          BeWellSecondaryPatientBannerLogic.activeAllergyIntoleranceInEncounter(
              allergyIntoleranceRelayConnection.edges);

      expect(activeAllergyIntoleranceInEncounter.isEmpty, false);
    });
    test('Pass unMatching Encounter ID', () {
      final AllergyIntoleranceRelayConnection
          allergyIntoleranceRelayConnection =
          AllergyIntoleranceMockData.allergyIntoleranceRelayConnectionMock;

      // create an episode of care and attach it to a patient

      // create an episode of care and
      CurrentPatientInEpisode()
          .patientConnection
          .add(PatientConnectionMockedData.patientConnection);

      // publish an encounterID to the stream
      CurrentPatientInEpisode()
          .encounterID
          .add('fe9d2aa7-5b64-4c75-a145-d4a855a9a522');

      final List<AllergyIntolerance> activeAllergyIntoleranceInEncounter =
          BeWellSecondaryPatientBannerLogic.activeAllergyIntoleranceInEncounter(
              allergyIntoleranceRelayConnection.edges);

      expect(activeAllergyIntoleranceInEncounter.isEmpty, true);
    });
  });
}
