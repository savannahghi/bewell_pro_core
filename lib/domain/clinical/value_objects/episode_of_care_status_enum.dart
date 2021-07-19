import 'package:freezed_annotation/freezed_annotation.dart';

/// The status of an episode of care
enum EpisodeOfCareStatusEnum {
  @JsonValue('planned')
  planned,
  @JsonValue('waitlist')
  waitlist,
  @JsonValue('active')
  active,
  @JsonValue('onhold')
  onhold,
  @JsonValue('finished')
  finished,
  @JsonValue('cancelled')
  cancelled,
  @JsonValue('entered_in_error')
  entered_in_error
}
