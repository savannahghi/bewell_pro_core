// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'address.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Address _$AddressFromJson(Map<String, dynamic> json) {
  return _Address.fromJson(json);
}

/// @nodoc
class _$AddressTearOff {
  const _$AddressTearOff();

  _Address call(
      {@JsonKey(name: 'id')
          String? id,
      @JsonKey(name: 'type', unknownEnumValue: AddressTypeEnum.both)
          AddressTypeEnum? type,
      @JsonKey(name: 'use', unknownEnumValue: AddressUseEnum.home)
          AddressUseEnum? use,
      @JsonKey(name: 'text')
          String? text,
      @JsonKey(name: 'line')
          List<String?>? line,
      @JsonKey(name: 'city')
          String? city,
      @JsonKey(name: 'district')
          String? district,
      @JsonKey(name: 'state')
          String? state,
      @JsonKey(name: 'postalCode')
          String? postalCode,
      @JsonKey(name: 'country')
          String? country,
      @JsonKey(name: 'period')
          Period? period}) {
    return _Address(
      id: id,
      type: type,
      use: use,
      text: text,
      line: line,
      city: city,
      district: district,
      state: state,
      postalCode: postalCode,
      country: country,
      period: period,
    );
  }

  Address fromJson(Map<String, Object> json) {
    return Address.fromJson(json);
  }
}

/// @nodoc
const $Address = _$AddressTearOff();

/// @nodoc
mixin _$Address {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;

  /// Distinguishes between physical addresses (those you can visit)
  ///  and mailing addresses (e.g. PO Boxes and care-of addresses).
  ///  Most addresses are both.
  @JsonKey(name: 'type', unknownEnumValue: AddressTypeEnum.both)
  AddressTypeEnum? get type => throw _privateConstructorUsedError;

  /// The purpose of this address.
  @JsonKey(name: 'use', unknownEnumValue: AddressUseEnum.home)
  AddressUseEnum? get use => throw _privateConstructorUsedError;

  /// Specifies the entire address as it should be displayed
  ///  e.g. on a postal label. This may be provided instead of or as well
  ///  as the specific parts.
  @JsonKey(name: 'text')
  String? get text => throw _privateConstructorUsedError;

  /// This component contains the house number, apartment number,
  ///  street name, street direction, P.O. Box number, delivery hints,
  ///  and similar address information.
  @JsonKey(name: 'line')
  List<String?>? get line => throw _privateConstructorUsedError;

  /// The name of the city, town, suburb, village or other community or
  ///  delivery center.
  @JsonKey(name: 'city')
  String? get city => throw _privateConstructorUsedError;

  /// The name of the administrative area (county).
  @JsonKey(name: 'district')
  String? get district => throw _privateConstructorUsedError;

  /// Sub-unit of a country with limited sovereignty in a federally organized
  ///  country. A code may be used if codes are in common use
  ///  (e.g. US 2 letter state codes).
  @JsonKey(name: 'state')
  String? get state => throw _privateConstructorUsedError;

  /// A postal code designating a region defined by the postal service.
  @JsonKey(name: 'postalCode')
  String? get postalCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'country')
  String? get country => throw _privateConstructorUsedError;

  /// Time period when address was/is in use.
  @JsonKey(name: 'period')
  Period? get period => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddressCopyWith<Address> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressCopyWith<$Res> {
  factory $AddressCopyWith(Address value, $Res Function(Address) then) =
      _$AddressCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id')
          String? id,
      @JsonKey(name: 'type', unknownEnumValue: AddressTypeEnum.both)
          AddressTypeEnum? type,
      @JsonKey(name: 'use', unknownEnumValue: AddressUseEnum.home)
          AddressUseEnum? use,
      @JsonKey(name: 'text')
          String? text,
      @JsonKey(name: 'line')
          List<String?>? line,
      @JsonKey(name: 'city')
          String? city,
      @JsonKey(name: 'district')
          String? district,
      @JsonKey(name: 'state')
          String? state,
      @JsonKey(name: 'postalCode')
          String? postalCode,
      @JsonKey(name: 'country')
          String? country,
      @JsonKey(name: 'period')
          Period? period});

  $PeriodCopyWith<$Res>? get period;
}

/// @nodoc
class _$AddressCopyWithImpl<$Res> implements $AddressCopyWith<$Res> {
  _$AddressCopyWithImpl(this._value, this._then);

  final Address _value;
  // ignore: unused_field
  final $Res Function(Address) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? use = freezed,
    Object? text = freezed,
    Object? line = freezed,
    Object? city = freezed,
    Object? district = freezed,
    Object? state = freezed,
    Object? postalCode = freezed,
    Object? country = freezed,
    Object? period = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AddressTypeEnum?,
      use: use == freezed
          ? _value.use
          : use // ignore: cast_nullable_to_non_nullable
              as AddressUseEnum?,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      line: line == freezed
          ? _value.line
          : line // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      district: district == freezed
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as String?,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: postalCode == freezed
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      period: period == freezed
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as Period?,
    ));
  }

  @override
  $PeriodCopyWith<$Res>? get period {
    if (_value.period == null) {
      return null;
    }

    return $PeriodCopyWith<$Res>(_value.period!, (value) {
      return _then(_value.copyWith(period: value));
    });
  }
}

/// @nodoc
abstract class _$AddressCopyWith<$Res> implements $AddressCopyWith<$Res> {
  factory _$AddressCopyWith(_Address value, $Res Function(_Address) then) =
      __$AddressCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id')
          String? id,
      @JsonKey(name: 'type', unknownEnumValue: AddressTypeEnum.both)
          AddressTypeEnum? type,
      @JsonKey(name: 'use', unknownEnumValue: AddressUseEnum.home)
          AddressUseEnum? use,
      @JsonKey(name: 'text')
          String? text,
      @JsonKey(name: 'line')
          List<String?>? line,
      @JsonKey(name: 'city')
          String? city,
      @JsonKey(name: 'district')
          String? district,
      @JsonKey(name: 'state')
          String? state,
      @JsonKey(name: 'postalCode')
          String? postalCode,
      @JsonKey(name: 'country')
          String? country,
      @JsonKey(name: 'period')
          Period? period});

  @override
  $PeriodCopyWith<$Res>? get period;
}

/// @nodoc
class __$AddressCopyWithImpl<$Res> extends _$AddressCopyWithImpl<$Res>
    implements _$AddressCopyWith<$Res> {
  __$AddressCopyWithImpl(_Address _value, $Res Function(_Address) _then)
      : super(_value, (v) => _then(v as _Address));

  @override
  _Address get _value => super._value as _Address;

  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? use = freezed,
    Object? text = freezed,
    Object? line = freezed,
    Object? city = freezed,
    Object? district = freezed,
    Object? state = freezed,
    Object? postalCode = freezed,
    Object? country = freezed,
    Object? period = freezed,
  }) {
    return _then(_Address(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AddressTypeEnum?,
      use: use == freezed
          ? _value.use
          : use // ignore: cast_nullable_to_non_nullable
              as AddressUseEnum?,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      line: line == freezed
          ? _value.line
          : line // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      district: district == freezed
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as String?,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: postalCode == freezed
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      period: period == freezed
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as Period?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Address implements _Address {
  _$_Address(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'type', unknownEnumValue: AddressTypeEnum.both) this.type,
      @JsonKey(name: 'use', unknownEnumValue: AddressUseEnum.home) this.use,
      @JsonKey(name: 'text') this.text,
      @JsonKey(name: 'line') this.line,
      @JsonKey(name: 'city') this.city,
      @JsonKey(name: 'district') this.district,
      @JsonKey(name: 'state') this.state,
      @JsonKey(name: 'postalCode') this.postalCode,
      @JsonKey(name: 'country') this.country,
      @JsonKey(name: 'period') this.period});

  factory _$_Address.fromJson(Map<String, dynamic> json) =>
      _$_$_AddressFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override

  /// Distinguishes between physical addresses (those you can visit)
  ///  and mailing addresses (e.g. PO Boxes and care-of addresses).
  ///  Most addresses are both.
  @JsonKey(name: 'type', unknownEnumValue: AddressTypeEnum.both)
  final AddressTypeEnum? type;
  @override

  /// The purpose of this address.
  @JsonKey(name: 'use', unknownEnumValue: AddressUseEnum.home)
  final AddressUseEnum? use;
  @override

  /// Specifies the entire address as it should be displayed
  ///  e.g. on a postal label. This may be provided instead of or as well
  ///  as the specific parts.
  @JsonKey(name: 'text')
  final String? text;
  @override

  /// This component contains the house number, apartment number,
  ///  street name, street direction, P.O. Box number, delivery hints,
  ///  and similar address information.
  @JsonKey(name: 'line')
  final List<String?>? line;
  @override

  /// The name of the city, town, suburb, village or other community or
  ///  delivery center.
  @JsonKey(name: 'city')
  final String? city;
  @override

  /// The name of the administrative area (county).
  @JsonKey(name: 'district')
  final String? district;
  @override

  /// Sub-unit of a country with limited sovereignty in a federally organized
  ///  country. A code may be used if codes are in common use
  ///  (e.g. US 2 letter state codes).
  @JsonKey(name: 'state')
  final String? state;
  @override

  /// A postal code designating a region defined by the postal service.
  @JsonKey(name: 'postalCode')
  final String? postalCode;
  @override
  @JsonKey(name: 'country')
  final String? country;
  @override

  /// Time period when address was/is in use.
  @JsonKey(name: 'period')
  final Period? period;

  @override
  String toString() {
    return 'Address(id: $id, type: $type, use: $use, text: $text, line: $line, city: $city, district: $district, state: $state, postalCode: $postalCode, country: $country, period: $period)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Address &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.use, use) ||
                const DeepCollectionEquality().equals(other.use, use)) &&
            (identical(other.text, text) ||
                const DeepCollectionEquality().equals(other.text, text)) &&
            (identical(other.line, line) ||
                const DeepCollectionEquality().equals(other.line, line)) &&
            (identical(other.city, city) ||
                const DeepCollectionEquality().equals(other.city, city)) &&
            (identical(other.district, district) ||
                const DeepCollectionEquality()
                    .equals(other.district, district)) &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)) &&
            (identical(other.postalCode, postalCode) ||
                const DeepCollectionEquality()
                    .equals(other.postalCode, postalCode)) &&
            (identical(other.country, country) ||
                const DeepCollectionEquality()
                    .equals(other.country, country)) &&
            (identical(other.period, period) ||
                const DeepCollectionEquality().equals(other.period, period)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(use) ^
      const DeepCollectionEquality().hash(text) ^
      const DeepCollectionEquality().hash(line) ^
      const DeepCollectionEquality().hash(city) ^
      const DeepCollectionEquality().hash(district) ^
      const DeepCollectionEquality().hash(state) ^
      const DeepCollectionEquality().hash(postalCode) ^
      const DeepCollectionEquality().hash(country) ^
      const DeepCollectionEquality().hash(period);

  @JsonKey(ignore: true)
  @override
  _$AddressCopyWith<_Address> get copyWith =>
      __$AddressCopyWithImpl<_Address>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AddressToJson(this);
  }
}

abstract class _Address implements Address {
  factory _Address(
      {@JsonKey(name: 'id')
          String? id,
      @JsonKey(name: 'type', unknownEnumValue: AddressTypeEnum.both)
          AddressTypeEnum? type,
      @JsonKey(name: 'use', unknownEnumValue: AddressUseEnum.home)
          AddressUseEnum? use,
      @JsonKey(name: 'text')
          String? text,
      @JsonKey(name: 'line')
          List<String?>? line,
      @JsonKey(name: 'city')
          String? city,
      @JsonKey(name: 'district')
          String? district,
      @JsonKey(name: 'state')
          String? state,
      @JsonKey(name: 'postalCode')
          String? postalCode,
      @JsonKey(name: 'country')
          String? country,
      @JsonKey(name: 'period')
          Period? period}) = _$_Address;

  factory _Address.fromJson(Map<String, dynamic> json) = _$_Address.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @override

  /// Distinguishes between physical addresses (those you can visit)
  ///  and mailing addresses (e.g. PO Boxes and care-of addresses).
  ///  Most addresses are both.
  @JsonKey(name: 'type', unknownEnumValue: AddressTypeEnum.both)
  AddressTypeEnum? get type => throw _privateConstructorUsedError;
  @override

  /// The purpose of this address.
  @JsonKey(name: 'use', unknownEnumValue: AddressUseEnum.home)
  AddressUseEnum? get use => throw _privateConstructorUsedError;
  @override

  /// Specifies the entire address as it should be displayed
  ///  e.g. on a postal label. This may be provided instead of or as well
  ///  as the specific parts.
  @JsonKey(name: 'text')
  String? get text => throw _privateConstructorUsedError;
  @override

  /// This component contains the house number, apartment number,
  ///  street name, street direction, P.O. Box number, delivery hints,
  ///  and similar address information.
  @JsonKey(name: 'line')
  List<String?>? get line => throw _privateConstructorUsedError;
  @override

  /// The name of the city, town, suburb, village or other community or
  ///  delivery center.
  @JsonKey(name: 'city')
  String? get city => throw _privateConstructorUsedError;
  @override

  /// The name of the administrative area (county).
  @JsonKey(name: 'district')
  String? get district => throw _privateConstructorUsedError;
  @override

  /// Sub-unit of a country with limited sovereignty in a federally organized
  ///  country. A code may be used if codes are in common use
  ///  (e.g. US 2 letter state codes).
  @JsonKey(name: 'state')
  String? get state => throw _privateConstructorUsedError;
  @override

  /// A postal code designating a region defined by the postal service.
  @JsonKey(name: 'postalCode')
  String? get postalCode => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'country')
  String? get country => throw _privateConstructorUsedError;
  @override

  /// Time period when address was/is in use.
  @JsonKey(name: 'period')
  Period? get period => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AddressCopyWith<_Address> get copyWith =>
      throw _privateConstructorUsedError;
}
