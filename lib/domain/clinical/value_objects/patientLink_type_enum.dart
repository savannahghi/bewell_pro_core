// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

/// The type of link between this patient resource and another patient resource.
enum PatientLinkTypeEnum {
  @JsonValue('replaced_by')
  replaced_by,
  @JsonValue('replaces')
  replaces,
  @JsonValue('refer')
  refer,
  @JsonValue('seealso')
  seealso,
}
