// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

enum HumanNameUseEnum {
  @JsonValue('usual')
  usual,
  @JsonValue('official')
  official,
  @JsonValue('temp')
  temp,
  @JsonValue('nickname')
  nickname,
  @JsonValue('anonymous')
  anonymous,
  @JsonValue('old')
  old,
  @JsonValue('maiden')
  maiden,
}
