import 'package:freezed_annotation/freezed_annotation.dart';

/// Category of the identified substance.
enum AllergyIntoleranceCategoryEnum {
  @JsonValue('food')
  food,
  @JsonValue('medication')
  medication,
  @JsonValue('environment')
  environment,
  @JsonValue('biological')
  biological
}
