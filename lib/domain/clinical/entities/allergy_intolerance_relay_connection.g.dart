// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'allergy_intolerance_relay_connection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AllergyIntoleranceRelayConnection
    _$_$_AllergyIntoleranceRelayConnectionFromJson(Map<String, dynamic> json) {
  return _$_AllergyIntoleranceRelayConnection(
    edges: (json['edges'] as List<dynamic>?)
        ?.map((e) => e == null
            ? null
            : AllergyIntoleranceRelayEdge.fromJson(e as Map<String, dynamic>))
        .toList(),
    pageInfo: json['pageInfo'] == null
        ? null
        : PageInfo.fromJson(json['pageInfo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_AllergyIntoleranceRelayConnectionToJson(
        _$_AllergyIntoleranceRelayConnection instance) =>
    <String, dynamic>{
      'edges': instance.edges?.map((e) => e?.toJson()).toList(),
      'pageInfo': instance.pageInfo?.toJson(),
    };
