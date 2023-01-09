// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sghi_core/domain_objects/value_objects/unknown.dart';

part 'user_feed_state.freezed.dart';
part 'user_feed_state.g.dart';

@freezed
class UserFeedState with _$UserFeedState {
  factory UserFeedState({
    String? userFeed,
  }) = _UserFeedState;

  factory UserFeedState.fromJson(Map<String, dynamic> json) =>
      _$UserFeedStateFromJson(json);

  factory UserFeedState.initial() => UserFeedState(userFeed: UNKNOWN);
}
