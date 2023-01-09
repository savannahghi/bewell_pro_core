// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'allergy_intolerance_relay_edge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AllergyIntoleranceRelayEdge _$$_AllergyIntoleranceRelayEdgeFromJson(
        Map<String, dynamic> json) =>
    _$_AllergyIntoleranceRelayEdge(
      cursor: json['cursor'] as String?,
      node: json['node'] == null
          ? null
          : AllergyIntolerance.fromJson(json['node'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AllergyIntoleranceRelayEdgeToJson(
        _$_AllergyIntoleranceRelayEdge instance) =>
    <String, dynamic>{
      'cursor': instance.cursor,
      'node': instance.node?.toJson(),
    };
