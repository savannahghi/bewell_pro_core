// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PatientPayload _$$_PatientPayloadFromJson(Map<String, dynamic> json) =>
    _$_PatientPayload(
      patientRecord: json['patientRecord'] == null
          ? null
          : Patient.fromJson(json['patientRecord'] as Map<String, dynamic>),
      hasOpenEpisodes: json['hasOpenEpisodes'] as bool?,
      openEpisodes: (json['openEpisodes'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : EpisodeOfCare.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PatientPayloadToJson(_$_PatientPayload instance) =>
    <String, dynamic>{
      'patientRecord': instance.patientRecord?.toJson(),
      'hasOpenEpisodes': instance.hasOpenEpisodes,
      'openEpisodes': instance.openEpisodes?.map((e) => e?.toJson()).toList(),
    };
