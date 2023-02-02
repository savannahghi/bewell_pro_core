// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_episode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EpisodeOfCare _$$_EpisodeOfCareFromJson(Map<String, dynamic> json) =>
    _$_EpisodeOfCare(
      id: json['ID'] as String?,
      text: json['Text'] == null
          ? null
          : Narrative.fromJson(json['Text'] as Map<String, dynamic>),
      identifier: (json['Identifier'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Identifier.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: $enumDecodeNullable(
          _$EpisodeOfCareStatusEnumEnumMap, json['Status'],
          unknownValue: EpisodeOfCareStatusEnum.waitlist),
      statusHistory: (json['StatusHistory'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : EpisodeofcareStatusHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: (json['Type'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : CodeableConcept.fromJson(e as Map<String, dynamic>))
          .toList(),
      diagnosis: (json['Diagnosis'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : EpisodeofcareDiagnosis.fromJson(e as Map<String, dynamic>))
          .toList(),
      patient: json['Patient'] == null
          ? null
          : Reference.fromJson(json['Patient'] as Map<String, dynamic>),
      managingOrganization: json['ManagingOrganization'] == null
          ? null
          : Reference.fromJson(
              json['ManagingOrganization'] as Map<String, dynamic>),
      period: json['Period'] == null
          ? null
          : Period.fromJson(json['Period'] as Map<String, dynamic>),
      referralRequest: (json['ReferralRequest'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Reference.fromJson(e as Map<String, dynamic>))
          .toList(),
      careManager: json['CareManager'] == null
          ? null
          : Reference.fromJson(json['CareManager'] as Map<String, dynamic>),
      team: (json['Team'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Reference.fromJson(e as Map<String, dynamic>))
          .toList(),
      account: (json['Account'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Reference.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_EpisodeOfCareToJson(_$_EpisodeOfCare instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Text': instance.text?.toJson(),
      'Identifier': instance.identifier?.map((e) => e?.toJson()).toList(),
      'Status': _$EpisodeOfCareStatusEnumEnumMap[instance.status],
      'StatusHistory': instance.statusHistory?.map((e) => e?.toJson()).toList(),
      'Type': instance.type?.map((e) => e?.toJson()).toList(),
      'Diagnosis': instance.diagnosis?.map((e) => e?.toJson()).toList(),
      'Patient': instance.patient?.toJson(),
      'ManagingOrganization': instance.managingOrganization?.toJson(),
      'Period': instance.period?.toJson(),
      'ReferralRequest':
          instance.referralRequest?.map((e) => e?.toJson()).toList(),
      'CareManager': instance.careManager?.toJson(),
      'Team': instance.team?.map((e) => e?.toJson()).toList(),
      'Account': instance.account?.map((e) => e?.toJson()).toList(),
    };

const _$EpisodeOfCareStatusEnumEnumMap = {
  EpisodeOfCareStatusEnum.planned: 'planned',
  EpisodeOfCareStatusEnum.waitlist: 'waitlist',
  EpisodeOfCareStatusEnum.active: 'active',
  EpisodeOfCareStatusEnum.onhold: 'onhold',
  EpisodeOfCareStatusEnum.finished: 'finished',
  EpisodeOfCareStatusEnum.cancelled: 'cancelled',
  EpisodeOfCareStatusEnum.entered_in_error: 'entered_in_error',
};

_$_EpisodeOfCarePayload _$$_EpisodeOfCarePayloadFromJson(
        Map<String, dynamic> json) =>
    _$_EpisodeOfCarePayload(
      totalVisits: json['totalVisits'] as int?,
      episodeOfCare: json['episodeOfCare'] == null
          ? null
          : EpisodeOfCare.fromJson(
              json['episodeOfCare'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_EpisodeOfCarePayloadToJson(
        _$_EpisodeOfCarePayload instance) =>
    <String, dynamic>{
      'totalVisits': instance.totalVisits,
      'episodeOfCare': instance.episodeOfCare?.toJson(),
    };
