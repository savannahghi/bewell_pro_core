// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:bewell_pro_core/domain/clinical/entities/codeable_concept.dart';
import 'package:bewell_pro_core/domain/clinical/entities/period.dart';
import 'package:bewell_pro_core/domain/clinical/entities/reference.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/identifier_use_enum.dart';

part 'identifier.freezed.dart';
part 'identifier.g.dart';

/// Identifies some entity uniquely and unambiguously.
///   typically this is used for business identifiers.
@freezed
class Identifier with _$Identifier {
  factory Identifier({
    @JsonKey(name: 'ID') String? id,

    /// The purpose of this identifier.
    @JsonKey(name: 'Use', unknownEnumValue: IdentifierUseEnum.official)
        IdentifierUseEnum? use,

    /// A coded type for the identifier that can be used to determine which
    ///  identifier to use for a specific purpose.
    @JsonKey(name: 'Type') CodeableConcept? type,

    /// Establishes the namespace for the value - that is, a URL that describes
    ///  a set values that are unique.
    @JsonKey(name: 'System') String? system,

    /// The portion of the identifier typically relevant to the user and which
    ///  is unique within the context of the system.
    @JsonKey(name: 'Value') String? value,
    @JsonKey(name: 'Period') Period? period,

    /// Organization that issued/manages the identifier.
    @JsonKey(name: 'Assigner') Reference? assigner,
  }) = _Identifier;

  factory Identifier.fromJson(Map<String, dynamic> json) =>
      _$IdentifierFromJson(json);
}
