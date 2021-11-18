// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

/// Estimate of the potential clinical harm, or seriousness, of a reaction
///  to the identified substance.
enum AllergyIntoleranceCriticalityEnum {
  @JsonValue('low')
  low,
  @JsonValue('high')
  high,
  @JsonValue('unable_to_assess')
  unable_to_assess
}
