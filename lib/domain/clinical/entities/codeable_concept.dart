import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bewell_pro_core/domain/clinical/entities/coding.dart';

part 'codeable_concept.freezed.dart';
part 'codeable_concept.g.dart';

/// A concept that may be defined by a formal reference to a terminology or
///  ontology or may be provided by text
@freezed
class CodeableConcept with _$CodeableConcept {
  factory CodeableConcept({
    /// Unique id for the element within a resource (for internal references).
    ///  This may be any string value that does not contain spaces.
    @JsonKey(name: 'ID') String? id,

    /// A reference to a code defined by a terminology system.
    @JsonKey(name: 'Coding') List<Coding?>? coding,

    /// A human language representation of the concept as seen/selected/uttered
    ///  by the user who entered the data and/or which represents the intended
    ///  meaning of the user.
    @JsonKey(name: 'Text') String? text,
  }) = _CodeableConcept;

  factory CodeableConcept.fromJson(Map<String, dynamic> json) =>
      _$CodeableConceptFromJson(json);
}
