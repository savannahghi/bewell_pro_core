import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bewell_pro_core/domain/clinical/entities/period.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/episode_of_care_status_enum.dart';

part 'episodeofcare_status_history.freezed.dart';
part 'episodeofcare_status_history.g.dart';

/// The history of statuses that the EpisodeOfCare has been through
///
/// without requiring processing the history of the resource.
@freezed
class EpisodeofcareStatusHistory with _$EpisodeofcareStatusHistory {
  factory EpisodeofcareStatusHistory({
    @JsonKey(name: 'ID') String? id,
    @JsonKey(name: 'Status', unknownEnumValue: EpisodeOfCareStatusEnum.waitlist)
        EpisodeOfCareStatusEnum? status,

    /// The period during this EpisodeOfCare that the specific status applied.
    @JsonKey(name: 'Period') Period? period,
  }) = _EpisodeofcareStatusHistory;

  factory EpisodeofcareStatusHistory.fromJson(Map<String, dynamic> json) =>
      _$EpisodeofcareStatusHistoryFromJson(json);
}
