import 'package:freezed_annotation/freezed_annotation.dart';

/// Identifies the purpose for the contact point
enum ContactPointUseEnum {
  @JsonValue('home')
  home,
  @JsonValue('work')
  work,
  @JsonValue('temp')
  temp,
  @JsonValue('old')
  old,
  @JsonValue('mobile')
  mobile
}
