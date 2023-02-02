// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'address.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Address _$AddressFromJson(Map<String, dynamic> json) {
  return _Address.fromJson(json);
}

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
      _$AddressCopyWithImpl<$Res, Address>;
  @useResult
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
class _$AddressCopyWithImpl<$Res, $Val extends Address>
    implements $AddressCopyWith<$Res> {
  _$AddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
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
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AddressTypeEnum?,
      use: freezed == use
          ? _value.use
          : use // ignore: cast_nullable_to_non_nullable
              as AddressUseEnum?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      line: freezed == line
          ? _value.line
          : line // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      district: freezed == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      period: freezed == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as Period?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PeriodCopyWith<$Res>? get period {
    if (_value.period == null) {
      return null;
    }

    return $PeriodCopyWith<$Res>(_value.period!, (value) {
      return _then(_value.copyWith(period: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AddressCopyWith<$Res> implements $AddressCopyWith<$Res> {
  factory _$$_AddressCopyWith(
          _$_Address value, $Res Function(_$_Address) then) =
      __$$_AddressCopyWithImpl<$Res>;
  @override
  @useResult
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
class __$$_AddressCopyWithImpl<$Res>
    extends _$AddressCopyWithImpl<$Res, _$_Address>
    implements _$$_AddressCopyWith<$Res> {
  __$$_AddressCopyWithImpl(_$_Address _value, $Res Function(_$_Address) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
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
    return _then(_$_Address(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AddressTypeEnum?,
      use: freezed == use
          ? _value.use
          : use // ignore: cast_nullable_to_non_nullable
              as AddressUseEnum?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      line: freezed == line
          ? _value._line
          : line // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      district: freezed == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      period: freezed == period
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
      @JsonKey(name: 'line') final List<String?>? line,
      @JsonKey(name: 'city') this.city,
      @JsonKey(name: 'district') this.district,
      @JsonKey(name: 'state') this.state,
      @JsonKey(name: 'postalCode') this.postalCode,
      @JsonKey(name: 'country') this.country,
      @JsonKey(name: 'period') this.period})
      : _line = line;

  factory _$_Address.fromJson(Map<String, dynamic> json) =>
      _$$_AddressFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;

  /// Distinguishes between physical addresses (those you can visit)
  ///  and mailing addresses (e.g. PO Boxes and care-of addresses).
  ///  Most addresses are both.
  @override
  @JsonKey(name: 'type', unknownEnumValue: AddressTypeEnum.both)
  final AddressTypeEnum? type;

  /// The purpose of this address.
  @override
  @JsonKey(name: 'use', unknownEnumValue: AddressUseEnum.home)
  final AddressUseEnum? use;

  /// Specifies the entire address as it should be displayed
  ///  e.g. on a postal label. This may be provided instead of or as well
  ///  as the specific parts.
  @override
  @JsonKey(name: 'text')
  final String? text;

  /// This component contains the house number, apartment number,
  ///  street name, street direction, P.O. Box number, delivery hints,
  ///  and similar address information.
  final List<String?>? _line;

  /// This component contains the house number, apartment number,
  ///  street name, street direction, P.O. Box number, delivery hints,
  ///  and similar address information.
  @override
  @JsonKey(name: 'line')
  List<String?>? get line {
    final value = _line;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// The name of the city, town, suburb, village or other community or
  ///  delivery center.
  @override
  @JsonKey(name: 'city')
  final String? city;

  /// The name of the administrative area (county).
  @override
  @JsonKey(name: 'district')
  final String? district;

  /// Sub-unit of a country with limited sovereignty in a federally organized
  ///  country. A code may be used if codes are in common use
  ///  (e.g. US 2 letter state codes).
  @override
  @JsonKey(name: 'state')
  final String? state;

  /// A postal code designating a region defined by the postal service.
  @override
  @JsonKey(name: 'postalCode')
  final String? postalCode;
  @override
  @JsonKey(name: 'country')
  final String? country;

  /// Time period when address was/is in use.
  @override
  @JsonKey(name: 'period')
  final Period? period;

  @override
  String toString() {
    return 'Address(id: $id, type: $type, use: $use, text: $text, line: $line, city: $city, district: $district, state: $state, postalCode: $postalCode, country: $country, period: $period)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Address &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.use, use) || other.use == use) &&
            (identical(other.text, text) || other.text == text) &&
            const DeepCollectionEquality().equals(other._line, _line) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.district, district) ||
                other.district == district) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.period, period) || other.period == period));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      type,
      use,
      text,
      const DeepCollectionEquality().hash(_line),
      city,
      district,
      state,
      postalCode,
      country,
      period);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddressCopyWith<_$_Address> get copyWith =>
      __$$_AddressCopyWithImpl<_$_Address>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddressToJson(
      this,
    );
  }
}

abstract class _Address implements Address {
  factory _Address(
      {@JsonKey(name: 'id')
          final String? id,
      @JsonKey(name: 'type', unknownEnumValue: AddressTypeEnum.both)
          final AddressTypeEnum? type,
      @JsonKey(name: 'use', unknownEnumValue: AddressUseEnum.home)
          final AddressUseEnum? use,
      @JsonKey(name: 'text')
          final String? text,
      @JsonKey(name: 'line')
          final List<String?>? line,
      @JsonKey(name: 'city')
          final String? city,
      @JsonKey(name: 'district')
          final String? district,
      @JsonKey(name: 'state')
          final String? state,
      @JsonKey(name: 'postalCode')
          final String? postalCode,
      @JsonKey(name: 'country')
          final String? country,
      @JsonKey(name: 'period')
          final Period? period}) = _$_Address;

  factory _Address.fromJson(Map<String, dynamic> json) = _$_Address.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override

  /// Distinguishes between physical addresses (those you can visit)
  ///  and mailing addresses (e.g. PO Boxes and care-of addresses).
  ///  Most addresses are both.
  @JsonKey(name: 'type', unknownEnumValue: AddressTypeEnum.both)
  AddressTypeEnum? get type;
  @override

  /// The purpose of this address.
  @JsonKey(name: 'use', unknownEnumValue: AddressUseEnum.home)
  AddressUseEnum? get use;
  @override

  /// Specifies the entire address as it should be displayed
  ///  e.g. on a postal label. This may be provided instead of or as well
  ///  as the specific parts.
  @JsonKey(name: 'text')
  String? get text;
  @override

  /// This component contains the house number, apartment number,
  ///  street name, street direction, P.O. Box number, delivery hints,
  ///  and similar address information.
  @JsonKey(name: 'line')
  List<String?>? get line;
  @override

  /// The name of the city, town, suburb, village or other community or
  ///  delivery center.
  @JsonKey(name: 'city')
  String? get city;
  @override

  /// The name of the administrative area (county).
  @JsonKey(name: 'district')
  String? get district;
  @override

  /// Sub-unit of a country with limited sovereignty in a federally organized
  ///  country. A code may be used if codes are in common use
  ///  (e.g. US 2 letter state codes).
  @JsonKey(name: 'state')
  String? get state;
  @override

  /// A postal code designating a region defined by the postal service.
  @JsonKey(name: 'postalCode')
  String? get postalCode;
  @override
  @JsonKey(name: 'country')
  String? get country;
  @override

  /// Time period when address was/is in use.
  @JsonKey(name: 'period')
  Period? get period;
  @override
  @JsonKey(ignore: true)
  _$$_AddressCopyWith<_$_Address> get copyWith =>
      throw _privateConstructorUsedError;
}
