// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

/// Clinical assessment of the severity of the reaction event as a whole,
///  potentially considering multiple different manifestations.
enum AllergyIntoleranceReactionSeverityEnum {
  @JsonValue('mild')
  mild,
  @JsonValue('moderate')
  moderate,
  @JsonValue('severe')
  severe,
}
