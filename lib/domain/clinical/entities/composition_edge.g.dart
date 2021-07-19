// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'composition_edge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CompositionRelayConnection _$_$_CompositionRelayConnectionFromJson(
    Map<String, dynamic> json) {
  return _$_CompositionRelayConnection(
    pageInfo: json['pageInfo'] == null
        ? null
        : PageInfo.fromJson(json['pageInfo'] as Map<String, dynamic>),
    edges: (json['edges'] as List<dynamic>?)
        ?.map((e) => e == null
            ? null
            : CompositionEdgeRelay.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_CompositionRelayConnectionToJson(
        _$_CompositionRelayConnection instance) =>
    <String, dynamic>{
      'pageInfo': instance.pageInfo?.toJson(),
      'edges': instance.edges?.map((e) => e?.toJson()).toList(),
    };
