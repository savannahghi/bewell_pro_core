import 'package:freezed_annotation/freezed_annotation.dart';

/// Distinguishes between physical addresses (those you can visit) and
///  mailing addresses (e.g. PO Boxes and care-of addresses).
///  Most addresses are both.
enum AddressTypeEnum {
  @JsonValue('postal')
  postal,
  @JsonValue('physical')
  physical,
  @JsonValue('both')
  both,
}
