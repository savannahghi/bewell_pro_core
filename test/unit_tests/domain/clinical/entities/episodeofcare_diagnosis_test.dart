import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/domain/clinical/entities/codeable_concept.dart';
import 'package:bewell_pro_core/domain/clinical/entities/episodeofcare_diagnosis.dart';
import 'package:bewell_pro_core/domain/clinical/entities/reference.dart';

void main() {
  test('EpisodeofcareDiagnosis should create a valid object', () {
    final EpisodeofcareDiagnosis _episodeofcareDiagnosis =
        EpisodeofcareDiagnosis(
      id: 'some id',
      condition:
          Reference(reference: 'some reference', display: 'some display text'),
      role: CodeableConcept(text: 'some dummy text'),
      rank: 1,
    );

    final Map<String, dynamic> _episodeofcareDiagnosisObject =
        _episodeofcareDiagnosis.toJson();
    expect(_episodeofcareDiagnosisObject.containsKey('ID'), true);
    expect(_episodeofcareDiagnosisObject.containsKey('Condition'), true);
    expect(_episodeofcareDiagnosisObject.containsKey('Role'), true);
    expect(_episodeofcareDiagnosisObject.containsKey('Rank'), true);

    final Map<String, dynamic> _episodeofcareDiagnosisData = <String, dynamic>{
      'ID': 'some id',
      'Condition': <String, dynamic>{
        'ID': 'some dummy id',
        'Reference': 'some reference',
        'Display': 'some display text',
      },
      'Rank': 1,
    };
    final EpisodeofcareDiagnosis _serializedEpisode =
        EpisodeofcareDiagnosis.fromJson(_episodeofcareDiagnosisData);

    expect(_serializedEpisode.id, 'some id');
    expect(_serializedEpisode.condition!.display, 'some display text');
    expect(_serializedEpisode.rank, 1);
  });
}
