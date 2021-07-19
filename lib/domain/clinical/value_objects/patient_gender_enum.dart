import 'package:freezed_annotation/freezed_annotation.dart';

/// Administrative Gender - the gender that the patient is considered to have
///  for administration and record keeping purposes.
enum PatientGenderEnum {
  @JsonValue('male')
  male,
  @JsonValue('female')
  female,
  @JsonValue(other)
  other,
  @JsonValue('unknown')
  unknown,
}
