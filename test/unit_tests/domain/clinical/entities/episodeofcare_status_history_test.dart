// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:bewell_pro_core/domain/clinical/entities/episodeofcare_status_history.dart';
import 'package:bewell_pro_core/domain/clinical/entities/period.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/episode_of_care_status_enum.dart';

void main() {
  test('EpisodeofcareStatusHistory should create a valid object', () {
    final EpisodeofcareStatusHistory _episodeofcareStatusHistory =
        EpisodeofcareStatusHistory(
      id: 'some id',
      status: EpisodeOfCareStatusEnum.waitlist,
      period: Period(id: 'period id', start: 'start', end: 'end'),
    );

    final Map<String, dynamic> _episodeofcareStatusHistoryObject =
        _episodeofcareStatusHistory.toJson();
    expect(_episodeofcareStatusHistoryObject.containsKey('ID'), true);
    expect(_episodeofcareStatusHistoryObject.containsKey('Status'), true);
    expect(_episodeofcareStatusHistoryObject.containsKey('Period'), true);

    final Map<String, dynamic> _currentEpisodeData = <String, dynamic>{
      'ID': 'some id',
      'Status': EpisodeOfCareStatusEnum.waitlist,
      'Period': <String, dynamic>{
        'ID': 'period id',
        'Start': 'start',
        'end': 'end',
      }
    };
    final EpisodeofcareStatusHistory _serializedEpisode =
        EpisodeofcareStatusHistory.fromJson(_currentEpisodeData);

    expect(_serializedEpisode.id, 'some id');
    expect(_serializedEpisode.period!.start, 'start');
    expect(_serializedEpisode.status, EpisodeOfCareStatusEnum.waitlist);
  });
}
