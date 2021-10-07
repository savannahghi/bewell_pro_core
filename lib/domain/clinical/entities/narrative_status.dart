// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

enum NarrativeStatusEnum {
  @JsonValue('generated')
  generated,
  @JsonValue('extensions')
  extensions,
  @JsonValue('additional')
  additional,
  @JsonValue('empty')
  empty
}
