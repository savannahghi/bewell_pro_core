// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

/// The purpose of an address.
enum AddressUseEnum {
  @JsonValue('home')
  home,
  @JsonValue('work')
  work,
  @JsonValue('temp')
  temp,
  @JsonValue('old')
  old,
  @JsonValue('billing')
  billing
}
