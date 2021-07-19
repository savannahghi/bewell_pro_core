// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'condition_edge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ConditionRelayConnection _$_$_ConditionRelayConnectionFromJson(
    Map<String, dynamic> json) {
  return _$_ConditionRelayConnection(
    edges: (json['edges'] as List<dynamic>?)
        ?.map((e) => e == null
            ? null
            : ConditionEdgeRelay.fromJson(e as Map<String, dynamic>))
        .toList(),
    pageInfo: json['pageInfo'] == null
        ? null
        : PageInfo.fromJson(json['pageInfo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_ConditionRelayConnectionToJson(
        _$_ConditionRelayConnection instance) =>
    <String, dynamic>{
      'edges': instance.edges?.map((e) => e?.toJson()).toList(),
      'pageInfo': instance.pageInfo?.toJson(),
    };

_$_ConditionEdgeRelay _$_$_ConditionEdgeRelayFromJson(
    Map<String, dynamic> json) {
  return _$_ConditionEdgeRelay(
    cursor: json['cursor'] as String?,
    node: json['node'] == null
        ? null
        : Condition.fromJson(json['node'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_ConditionEdgeRelayToJson(
        _$_ConditionEdgeRelay instance) =>
    <String, dynamic>{
      'cursor': instance.cursor,
      'node': instance.node?.toJson(),
    };
