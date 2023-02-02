// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ServiceRequestConnection _$$_ServiceRequestConnectionFromJson(
        Map<String, dynamic> json) =>
    _$_ServiceRequestConnection(
      edges: (json['edges'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : ServiceRequestEdge.fromJson(e as Map<String, dynamic>))
          .toList(),
      pageInfo: json['pageInfo'] == null
          ? null
          : PageInfo.fromJson(json['pageInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ServiceRequestConnectionToJson(
        _$_ServiceRequestConnection instance) =>
    <String, dynamic>{
      'edges': instance.edges?.map((e) => e?.toJson()).toList(),
      'pageInfo': instance.pageInfo?.toJson(),
    };

_$_ServiceRequestEdge _$$_ServiceRequestEdgeFromJson(
        Map<String, dynamic> json) =>
    _$_ServiceRequestEdge(
      cursor: json['cursor'] as String?,
      node: json['node'] == null
          ? null
          : ServiceRequest.fromJson(json['node'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ServiceRequestEdgeToJson(
        _$_ServiceRequestEdge instance) =>
    <String, dynamic>{
      'cursor': instance.cursor,
      'node': instance.node?.toJson(),
    };

_$_ServiceRequest _$$_ServiceRequestFromJson(Map<String, dynamic> json) =>
    _$_ServiceRequest(
      id: json['ID'] as String?,
      status: json['Status'] as String?,
      text: json['Text'] == null
          ? null
          : Narrative.fromJson(json['Text'] as Map<String, dynamic>),
      identifier: (json['Identifier'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Identifier.fromJson(e as Map<String, dynamic>))
          .toList(),
      category: (json['Category'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : CodeableConcept.fromJson(e as Map<String, dynamic>))
          .toList(),
      requester: json['Requester'] == null
          ? null
          : Reference.fromJson(json['Requester'] as Map<String, dynamic>),
      code: json['Code'] == null
          ? null
          : CodeableConcept.fromJson(json['Code'] as Map<String, dynamic>),
      intent: $enumDecodeNullable(
          _$ServiceRequestIntentEnumEnumMap, json['Intent'],
          unknownValue: ServiceRequestIntentEnum.proposal),
      priority: json['Priority'] as String?,
      subject: json['Subject'] == null
          ? null
          : Reference.fromJson(json['Subject'] as Map<String, dynamic>),
      encounter: json['Encounter'] == null
          ? null
          : Reference.fromJson(json['Encounter'] as Map<String, dynamic>),
      supportingInfo: (json['SupportingInfo'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Reference.fromJson(e as Map<String, dynamic>))
          .toList(),
      note: (json['Note'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Annotation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ServiceRequestToJson(_$_ServiceRequest instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Status': instance.status,
      'Text': instance.text?.toJson(),
      'Identifier': instance.identifier?.map((e) => e?.toJson()).toList(),
      'Category': instance.category?.map((e) => e?.toJson()).toList(),
      'Requester': instance.requester?.toJson(),
      'Code': instance.code?.toJson(),
      'Intent': _$ServiceRequestIntentEnumEnumMap[instance.intent],
      'Priority': instance.priority,
      'Subject': instance.subject?.toJson(),
      'Encounter': instance.encounter?.toJson(),
      'SupportingInfo':
          instance.supportingInfo?.map((e) => e?.toJson()).toList(),
      'Note': instance.note?.map((e) => e?.toJson()).toList(),
    };

const _$ServiceRequestIntentEnumEnumMap = {
  ServiceRequestIntentEnum.proposal: 'proposal',
  ServiceRequestIntentEnum.plan: 'plan',
  ServiceRequestIntentEnum.original: 'original',
  ServiceRequestIntentEnum.reflex: 'reflex',
};
