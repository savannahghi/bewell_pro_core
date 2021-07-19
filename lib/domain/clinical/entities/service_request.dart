import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bewell_pro_core/domain/clinical/entities/annotation.dart';
import 'package:bewell_pro_core/domain/clinical/entities/codeable_concept.dart';
import 'package:bewell_pro_core/domain/clinical/entities/identifier.dart';
import 'package:bewell_pro_core/domain/clinical/entities/narrative.dart';
import 'package:bewell_pro_core/domain/clinical/entities/page_info.dart';
import 'package:bewell_pro_core/domain/clinical/entities/reference.dart';

part 'service_request.freezed.dart';
part 'service_request.g.dart';

@freezed
class ServiceRequestConnection with _$ServiceRequestConnection {
  factory ServiceRequestConnection({
    @JsonKey(name: 'edges') List<ServiceRequestEdge?>? edges,
    @JsonKey(name: 'pageInfo') PageInfo? pageInfo,
  }) = _ServiceRequestConnection;

  factory ServiceRequestConnection.fromJson(Map<String, dynamic> json) =>
      _$ServiceRequestConnectionFromJson(json);
}

@freezed
class ServiceRequestEdge with _$ServiceRequestEdge {
  factory ServiceRequestEdge({
    @JsonKey(name: 'cursor') String? cursor,
    @JsonKey(name: 'node') ServiceRequest? node,
  }) = _ServiceRequestEdge;

  factory ServiceRequestEdge.fromJson(Map<String, dynamic> json) =>
      _$ServiceRequestEdgeFromJson(json);
}

/// A clinical condition, problem, diagnosis, or other event, situation, issue,
///  or clinical concept that has risen to a level of concern.
@freezed
class ServiceRequest with _$ServiceRequest {
  factory ServiceRequest({
    /// The logical id of the resource, as used in the URL for the resource.
    /// Once assigned, this value never changes.
    @JsonKey(name: 'ID') String? id,

    /// The status of the order.
    @JsonKey(name: 'Status') String? status,

    /// A human-readable narrative that contains a summary of the resource
    ///  and can be used to represent the content of the resource to a human.
    @JsonKey(name: 'Text') Narrative? text,

    /// Business identifiers assigned to this AllergyIntolerance by
    ///  the performer or other systems which remain constant as the resource
    ///  is updated and propagates from server to server.
    @JsonKey(name: 'Identifier') List<Identifier?>? identifier,

    /// A code that classifies the service for searching, sorting and display
    /// purposes (e.g. "Surgical Procedure").
    @JsonKey(name: 'Category') List<CodeableConcept?>? category,

    /// The individual who initiated the request and has responsibility
    ///  for its activation.
    @JsonKey(name: 'Requester') Reference? requester,

    //A code that identifies a particular service (i.e., procedure,
    //diagnostic investigation, or panel of investigations)
    //that have been requested.
    @JsonKey(name: 'Code') CodeableConcept? code,

    /// Whether the request is a proposal, plan, an original order
    /// or a reflex order.
    @JsonKey(name: 'Intent', unknownEnumValue: ServiceRequestIntentEnum.proposal)
        ServiceRequestIntentEnum? intent,

    /// Indicates how quickly the ServiceRequest should be addressed with
    /// respect to other requests.
    @JsonKey(name: 'Priority') String? priority,

    /// On whom or what the service is to be performed. This is usually a human
    ///  patient, but can also be requested on animals, groups of humans
    ///  or animals, devices such as dialysis machines, or even locations
    /// (typically for environmental scans).
    @JsonKey(name: 'Subject') Reference? subject,

    /// An encounter that provides additional information about the healthcare
    ///  context in which this request is made.
    @JsonKey(name: 'Encounter') Reference? encounter,

    /// Additional clinical information about the patient or specimen that may
    ///  influence the services or their interpretations.
    @JsonKey(name: 'SupportingInfo') List<Reference?>? supportingInfo,

    /// Any other notes and comments made about the service request.
    ///  For example, internal billing notes.
    @JsonKey(name: 'Note') List<Annotation?>? note,
  }) = _ServiceRequest;
  factory ServiceRequest.fromJson(Map<String, dynamic> json) =>
      _$ServiceRequestFromJson(json);
}

/// Whether the request is a proposal, plan, an original order or a reflex order.
enum ServiceRequestIntentEnum {
  @JsonValue('proposal')
  proposal,
  @JsonValue('plan')
  plan,
  @JsonValue('original')
  original,
  @JsonValue('reflex')
  reflex,
}
