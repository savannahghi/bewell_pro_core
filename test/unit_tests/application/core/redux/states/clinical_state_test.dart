// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/states/clinical_state.dart';
import 'package:bewell_pro_core/domain/clinical/entities/current_episode.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_payload.dart';

void main() {
  group('ClinicalState:', () {
    test('should convert state from/to json', () async {
      final ClinicalState state = ClinicalState.initial();
      final Map<String, dynamic> clinicalStateJson = <String, dynamic>{
        'patientPayload': <String, dynamic>{
          'hasOpenEpisodes': false,
          'patientRecord': <String, dynamic>{'ID': 'some-id'}
        },
      };

      // test whether the event state can be updated
      expect(state.currentEpisodeOfCare, EpisodeOfCare());
      expect(state.patientSearchFound, false);

      final ClinicalState state2 = state.copyWith.call(
        patientPayload: PatientPayload(
            hasOpenEpisodes: true,
            openEpisodes: <EpisodeOfCare>[EpisodeOfCare(id: 'some-id')]),
      );

      expect(state2.patientPayload!.hasOpenEpisodes, true);
      expect(state2.patientPayload!.openEpisodes, isNotEmpty);

      final ClinicalState state3 = ClinicalState.fromJson(clinicalStateJson);
      expect(state3, isA<ClinicalState>());

      expect(state3.patientPayload!.hasOpenEpisodes, false);
      expect(state3.patientPayload!.patientRecord!.id, 'some-id');
    });
  });
}
