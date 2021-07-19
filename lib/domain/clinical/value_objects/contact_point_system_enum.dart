import 'package:freezed_annotation/freezed_annotation.dart';

/// Telecommunications form for contact point -
///  what communications system is required to make use of the contact.
enum ContactPointSystemEnum {
  @JsonValue('phone')
  phone,
  @JsonValue('fax')
  fax,
  @JsonValue('email')
  email,
  @JsonValue('pager')
  pager,
  @JsonValue('url')
  url,
  @JsonValue('sms')
  sms,
  @JsonValue('other')
  other
}
