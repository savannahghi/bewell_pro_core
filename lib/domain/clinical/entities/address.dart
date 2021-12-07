// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:bewell_pro_core/domain/clinical/entities/period.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/address_type_enum.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/address_use_enum.dart';

part 'address.freezed.dart';
part 'address.g.dart';

/// FHIRAddress definition: an address expressed using postal conventions
/// (as opposed to gps or other location definition formats).
/// this data type may be used to convey addresses for use in delivering mail
///  as well as for visiting locations which might not be valid for mail
///  delivery. there are a variety of postal address formats defined around the
///  world
@freezed
class Address with _$Address {
  factory Address({
    @JsonKey(name: 'id') String? id,

    /// Distinguishes between physical addresses (those you can visit)
    ///  and mailing addresses (e.g. PO Boxes and care-of addresses).
    ///  Most addresses are both.

    @JsonKey(name: 'type', unknownEnumValue: AddressTypeEnum.both)
        AddressTypeEnum? type,

    /// The purpose of this address.
    @JsonKey(name: 'use', unknownEnumValue: AddressUseEnum.home)
        AddressUseEnum? use,

    /// Specifies the entire address as it should be displayed
    ///  e.g. on a postal label. This may be provided instead of or as well
    ///  as the specific parts.
    @JsonKey(name: 'text') String? text,

    /// This component contains the house number, apartment number,
    ///  street name, street direction, P.O. Box number, delivery hints,
    ///  and similar address information.
    @JsonKey(name: 'line') List<String?>? line,

    /// The name of the city, town, suburb, village or other community or
    ///  delivery center.
    @JsonKey(name: 'city') String? city,

    /// The name of the administrative area (county).
    @JsonKey(name: 'district') String? district,

    /// Sub-unit of a country with limited sovereignty in a federally organized
    ///  country. A code may be used if codes are in common use
    ///  (e.g. US 2 letter state codes).
    @JsonKey(name: 'state') String? state,

    /// A postal code designating a region defined by the postal service.
    @JsonKey(name: 'postalCode') String? postalCode,
    @JsonKey(name: 'country') String? country,

    /// Time period when address was/is in use.
    @JsonKey(name: 'period') Period? period,
  }) = _Address;
  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}
