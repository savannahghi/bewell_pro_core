// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

/// Identification of the underlying physiological mechanism for a reaction risk.
enum AllergyIntoleranceTypeEnum {
  @JsonValue('allergy')
  allergy,
  @JsonValue('intolerance')
  intolerance
}
