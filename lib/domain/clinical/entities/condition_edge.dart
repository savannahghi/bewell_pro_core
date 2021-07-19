import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bewell_pro_core/domain/clinical/entities/condition.dart';
import 'package:bewell_pro_core/domain/clinical/entities/page_info.dart';

part 'condition_edge.freezed.dart';
part 'condition_edge.g.dart';

/// Relay connection for Condition
@freezed
class ConditionRelayConnection with _$ConditionRelayConnection {
  factory ConditionRelayConnection({
    @JsonKey(name: 'edges') List<ConditionEdgeRelay?>? edges,
    @JsonKey(name: 'pageInfo') PageInfo? pageInfo,
  }) = _ConditionRelayConnection;

  factory ConditionRelayConnection.fromJson(Map<String, dynamic> json) =>
      _$ConditionRelayConnectionFromJson(json);
}

/// Relay edge for Condition
@freezed
class ConditionEdgeRelay with _$ConditionEdgeRelay {
  factory ConditionEdgeRelay({
    @JsonKey(name: 'cursor') String? cursor,
    @JsonKey(name: 'node') Condition? node,
  }) = _ConditionEdgeRelay;

  factory ConditionEdgeRelay.fromJson(Map<String, dynamic> json) =>
      _$ConditionEdgeRelayFromJson(json);
}
