import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bewell_pro_core/domain/clinical/entities/identifier.dart';

part 'reference.freezed.dart';
part 'reference.g.dart';

/// A reference from one resource to another
@freezed
class Reference with _$Reference {
  factory Reference({
    @JsonKey(name: 'ID') String? id,

    /// A reference to a location at which the other resource is found.
    ///
    ///  The reference may be a relative reference, in which case it is
    ///  relative to the service base URL, or an absolute URL that resolves
    ///  to the location where the resource is found. The reference may be
    ///  version specific or not. If the reference is not to a FHIR RESTful
    ///  server, then it should be assumed to be version specific. Internal
    ///  fragment references (start with '#') refer to contained resources.
    @JsonKey(name: 'Reference') String? reference,

    /// The expected type of the target of the reference. If both Reference.type
    ///  and Reference.reference are populated and Reference.reference is a
    ///  FHIR URL, both SHALL be consistent.
    ///
    /// The type is the Canonical URL of Resource Definition that is the type
    ///  this reference refers to. References are URLs that are relative to
    ///  http://hl7.org/fhir/StructureDefinition/ e.g. "Patient" is a
    ///  reference to http://hl7.org/fhir/StructureDefinition/Patient.
    ///  Absolute URLs are only allowed for logical models
    ///  (and can only be used in references in logical models, not resources).

    @JsonKey(name: 'Type') String? type,

    /// An identifier for the target resource.
    ///  This is used when there is no way to reference the other resource directly,
    ///  either because the entity it represents is not available through a FHIR server,
    ///  or because there is no way for the author of the resource to convert a
    ///  known identifier to an actual location. There is no requirement that a
    ///  Reference.identifier point to something that is actually exposed as a FHIR
    ///  instance, but it SHALL point to a business concept that would be expected
    ///  to be exposed as a FHIR instance, and that instance would need to be of
    ///  a FHIR resource type allowed by the reference.
    @JsonKey(name: 'Identifier') Identifier? identifier,
    @JsonKey(name: 'Display') String? display,
  }) = _Reference;

  factory Reference.fromJson(Map<String, dynamic> json) =>
      _$ReferenceFromJson(json);
}
