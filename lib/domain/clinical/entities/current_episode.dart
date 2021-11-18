// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:bewell_pro_core/domain/clinical/entities/codeable_concept.dart';
import 'package:bewell_pro_core/domain/clinical/entities/episodeofcare_diagnosis.dart';
import 'package:bewell_pro_core/domain/clinical/entities/episodeofcare_status_history.dart';
import 'package:bewell_pro_core/domain/clinical/entities/identifier.dart';
import 'package:bewell_pro_core/domain/clinical/entities/narrative.dart';
import 'package:bewell_pro_core/domain/clinical/entities/period.dart';
import 'package:bewell_pro_core/domain/clinical/entities/reference.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/episode_of_care_status_enum.dart';

part 'current_episode.freezed.dart';
part 'current_episode.g.dart';

/// An association between a patient and an organization / healthcare provider(s) during which time encounters may occur.
///
/// The managing organization assumes a level of responsibility for the patient during this time.
@freezed
class EpisodeOfCare with _$EpisodeOfCare {
  factory EpisodeOfCare({
    @JsonKey(name: 'ID') String? id,

    /// A human-readable narrative that contains a summary of the resource and can be used to represent the content of the resource to a human.
    ///
    /// The narrative need not encode all the structured data, but is required to contain sufficient detail to make it "clinically safe" for a human to just read the narrative.
    /// Resource definitions may define what content should be represented in the narrative to ensure clinical safety.
    @JsonKey(name: 'Text') Narrative? text,

    /// The EpisodeOfCare may be known by different identifiers for different contexts of use, such as when an external agency is tracking the Episode for funding purposes.
    @JsonKey(name: 'Identifier') List<Identifier?>? identifier,
    @JsonKey(name: 'Status', unknownEnumValue: EpisodeOfCareStatusEnum.waitlist)
        EpisodeOfCareStatusEnum? status,

    /// The history of statuses that the EpisodeOfCare has been through
    /// without requiring processing the history of the resource
    @JsonKey(name: 'StatusHistory')
        List<EpisodeofcareStatusHistory?>? statusHistory,

    /// A classification of the type of episode of care; e.g. specialist referral, disease management, type of funded care.
    @JsonKey(name: 'Type') List<CodeableConcept?>? type,

    ///The list of diagnosis relevant to this episode of care.
    @JsonKey(name: 'Diagnosis') List<EpisodeofcareDiagnosis?>? diagnosis,

    /// The patient who is the focus of this episode of care.
    @JsonKey(name: 'Patient') Reference? patient,

    /// The organization that has assumed the specific responsibilities for the specified duration.
    @JsonKey(name: 'ManagingOrganization') Reference? managingOrganization,

    /// The interval during which the managing organization assumes the defined responsibility.
    @JsonKey(name: 'Period') Period? period,

    /// Referral Request(s) that are fulfilled by this EpisodeOfCare, incoming referrals.
    @JsonKey(name: 'ReferralRequest') List<Reference?>? referralRequest,

    /// The practitioner that is the care manager/care coordinator for this patient.
    @JsonKey(name: 'CareManager') Reference? careManager,

    /// The list of practitioners that may be facilitating this episode of care for specific purposes.
    @JsonKey(name: 'Team') List<Reference?>? team,

    /// The set of accounts that may be used for billing for this EpisodeOfCare.
    @JsonKey(name: 'Account') List<Reference?>? account,
  }) = _EpisodeOfCare;

  factory EpisodeOfCare.fromJson(Map<String, dynamic> json) =>
      _$EpisodeOfCareFromJson(json);
}

@freezed
class EpisodeOfCarePayload with _$EpisodeOfCarePayload {
  factory EpisodeOfCarePayload({
    @JsonKey(name: 'totalVisits') int? totalVisits,
    @JsonKey(name: 'episodeOfCare') EpisodeOfCare? episodeOfCare,
  }) = _EpisodeOfCarePayload;

  factory EpisodeOfCarePayload.fromJson(Map<String, dynamic> json) =>
      _$EpisodeOfCarePayloadFromJson(json);
}
