// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medication_edge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MedicationRelayConnection _$$_MedicationRelayConnectionFromJson(
        Map<String, dynamic> json) =>
    _$_MedicationRelayConnection(
      edges: (json['edges'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : MedicationEdgeRelay.fromJson(e as Map<String, dynamic>))
          .toList(),
      pageInfo: json['pageInfo'] == null
          ? null
          : PageInfo.fromJson(json['pageInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_MedicationRelayConnectionToJson(
        _$_MedicationRelayConnection instance) =>
    <String, dynamic>{
      'edges': instance.edges?.map((e) => e?.toJson()).toList(),
      'pageInfo': instance.pageInfo?.toJson(),
    };

_$_MedicationEdgeRelay _$$_MedicationEdgeRelayFromJson(
        Map<String, dynamic> json) =>
    _$_MedicationEdgeRelay(
      cursor: json['cursor'] as String?,
      node: json['node'] == null
          ? null
          : Medication.fromJson(json['node'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_MedicationEdgeRelayToJson(
        _$_MedicationEdgeRelay instance) =>
    <String, dynamic>{
      'cursor': instance.cursor,
      'node': instance.node?.toJson(),
    };
