// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_connection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PatientEdge _$$_PatientEdgeFromJson(Map<String, dynamic> json) =>
    _$_PatientEdge(
      cursor: json['cursor'] as String?,
      node: json['node'] == null
          ? null
          : Patient.fromJson(json['node'] as Map<String, dynamic>),
      hasOpenEpisodes: json['hasOpenEpisodes'] as bool?,
    );

Map<String, dynamic> _$$_PatientEdgeToJson(_$_PatientEdge instance) =>
    <String, dynamic>{
      'cursor': instance.cursor,
      'node': instance.node?.toJson(),
      'hasOpenEpisodes': instance.hasOpenEpisodes,
    };

_$_PatientConnection _$$_PatientConnectionFromJson(Map<String, dynamic> json) =>
    _$_PatientConnection(
      edges: (json['edges'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : PatientEdge.fromJson(e as Map<String, dynamic>))
          .toList(),
      pageInfo: json['pageInfo'] == null
          ? null
          : PageInfo.fromJson(json['pageInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PatientConnectionToJson(
        _$_PatientConnection instance) =>
    <String, dynamic>{
      'edges': instance.edges?.map((e) => e?.toJson()).toList(),
      'pageInfo': instance.pageInfo?.toJson(),
    };

_$_PatientInfo _$$_PatientInfoFromJson(Map<String, dynamic> json) =>
    _$_PatientInfo(
      patientId: json['patientId'] as String?,
      patientReference: json['patientReference'] as String?,
      patientName: json['patientName'] as String?,
      encounterId: json['encounterId'] as String?,
      encounterReference: json['encounterReference'] as String?,
    );

Map<String, dynamic> _$$_PatientInfoToJson(_$_PatientInfo instance) =>
    <String, dynamic>{
      'patientId': instance.patientId,
      'patientReference': instance.patientReference,
      'patientName': instance.patientName,
      'encounterId': instance.encounterId,
      'encounterReference': instance.encounterReference,
    };
