// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:bewell_pro_core/domain/clinical/entities/current_episode.dart';
import 'package:bewell_pro_core/domain/clinical/entities/narrative.dart';
import 'package:bewell_pro_core/domain/clinical/entities/narrative_status.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/episode_of_care_status_enum.dart';

void main() {
  group('Current Episode and EpisodeofCarePayload should create valid objects',
      () {
    test('Current Episode should create a valid object', () {
      final EpisodeOfCare _currentEpisode = EpisodeOfCare(
        id: 'some id',
        text: Narrative(
          id: 'narrative id',
          status: NarrativeStatusEnum.generated,
          div: 'some narrative here',
        ),
        status: EpisodeOfCareStatusEnum.waitlist,
      );

      final Map<String, dynamic> _currentEpisodeObject =
          _currentEpisode.toJson();
      expect(_currentEpisodeObject.containsKey('ID'), true);
      expect(_currentEpisodeObject.containsKey('Text'), true);
      expect(_currentEpisodeObject.containsKey('Status'), true);

      final Map<String, dynamic> _currentEpisodeData = <String, dynamic>{
        'ID': 'some id',
        'Text': <String, dynamic>{'Div': 'some text'},
        'Status': EpisodeOfCareStatusEnum.waitlist,
      };
      final EpisodeOfCare _serializedEpisode =
          EpisodeOfCare.fromJson(_currentEpisodeData);

      expect(_serializedEpisode.id, 'some id');
      expect(_serializedEpisode.text!.div, 'some text');
      expect(_serializedEpisode.status, EpisodeOfCareStatusEnum.waitlist);
    });

    test('EpisodeOfCarePayload should create a valid object', () {
      final EpisodeOfCarePayload _episodeofCarePayload = EpisodeOfCarePayload(
        episodeOfCare: EpisodeOfCare(
          id: 'some id',
          text: Narrative(
            id: 'narrative id',
            status: NarrativeStatusEnum.generated,
            div: 'some narrative here',
          ),
          status: EpisodeOfCareStatusEnum.waitlist,
        ),
      );

      final Map<String, dynamic> _episodeOfcarePayloadObject =
          _episodeofCarePayload.toJson();
      expect(_episodeOfcarePayloadObject.containsKey('episodeOfCare'), true);

      final Map<String, dynamic> _episodeOfcarePayloadData = <String, dynamic>{
        'episodeOfCare': <String, dynamic>{
          'ID': 'some id',
          'Text': <String, dynamic>{'Div': 'some text'},
          'Status': EpisodeOfCareStatusEnum.waitlist,
        }
      };

      final EpisodeOfCarePayload _serializedEpisodePayload =
          EpisodeOfCarePayload.fromJson(_episodeOfcarePayloadData);

      expect(_serializedEpisodePayload.episodeOfCare!.text!.div, 'some text');
      expect(_serializedEpisodePayload.episodeOfCare!.status,
          EpisodeOfCareStatusEnum.waitlist);
    });
  });
}
