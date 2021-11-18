// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:bewell_pro_core/domain/clinical/entities/codeable_concept.dart';

part 'medication_request_substitution.freezed.dart';
part 'medication_request_substitution.g.dart';

///This class indicates whether or not substitution can or should be part of the dispense.
/// In some cases, substitution must happen, in other cases substitution must not happen.

@freezed
class MedicationRequestSubstitution with _$MedicationRequestSubstitution {
  factory MedicationRequestSubstitution({
    @JsonKey(name: 'ID') String? id,

    //if substitution is allowed
    @JsonKey(name: 'AllowedBoolean') bool? allowedBoolean,
    @JsonKey(name: 'AllowedCodeableConcept')
        CodeableConcept? allowedCodeableConcept,

    //why it should or should not be substituted
    @JsonKey(name: 'Reason') CodeableConcept? reason,
  }) = _MedicationRequestSubstitution;

  factory MedicationRequestSubstitution.fromJson(Map<String, dynamic> json) =>
      _$MedicationRequestSubstitutionFromJson(json);
}
