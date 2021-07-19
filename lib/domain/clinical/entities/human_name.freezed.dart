// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'human_name.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HumanName _$HumanNameFromJson(Map<String, dynamic> json) {
  return _HumanName.fromJson(json);
}

/// @nodoc
class _$HumanNameTearOff {
  const _$HumanNameTearOff();

  _HumanName call(
      {@JsonKey(name: 'ID')
          String? id,
      @JsonKey(name: 'Use', unknownEnumValue: HumanNameUseEnum.official)
          HumanNameUseEnum? use,
      @JsonKey(name: 'Text')
          String? text,
      @JsonKey(name: 'Family')
          String? family,
      @JsonKey(name: 'Given')
          List<String?>? given,
      @JsonKey(name: 'Prefix')
          List<String?>? prefix,
      @JsonKey(name: 'Suffix')
          List<String?>? suffix,
      @JsonKey(name: 'Period')
          Period? period}) {
    return _HumanName(
      id: id,
      use: use,
      text: text,
      family: family,
      given: given,
      prefix: prefix,
      suffix: suffix,
      period: period,
    );
  }

  HumanName fromJson(Map<String, Object> json) {
    return HumanName.fromJson(json);
  }
}

/// @nodoc
const $HumanName = _$HumanNameTearOff();

/// @nodoc
mixin _$HumanName {
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;

  /// Identifies the purpose for this name
  @JsonKey(name: 'Use', unknownEnumValue: HumanNameUseEnum.official)
  HumanNameUseEnum? get use => throw _privateConstructorUsedError;

  /// Specifies the entire name as it should be displayed e.g. on an application UI.
  /// This may be provided instead of or as well as the specific parts
  @JsonKey(name: 'Text')
  String? get text => throw _privateConstructorUsedError;

  /// The part of a name that links to the genealogy.
  /// In some cultures (e.g. Eritrea) the family name of a son is the
  /// first name of his father.
  @JsonKey(name: 'Family')
  String? get family => throw _privateConstructorUsedError;

  /// Given name.
  @JsonKey(name: 'Given')
  List<String?>? get given => throw _privateConstructorUsedError;

  /// Part of the name that is acquired as a title due to academic,
  ///  legal, employment or nobility status, etc. and that appears
  ///  at the start of the name.
  @JsonKey(name: 'Prefix')
  List<String?>? get prefix => throw _privateConstructorUsedError;

  /// Part of the name that is acquired as a title due to academic,
  ///  legal, employment or nobility status, etc. and that appears
  ///  at the end of the name.
  @JsonKey(name: 'Suffix')
  List<String?>? get suffix => throw _privateConstructorUsedError;

  /// Indicates the period of time when this name was valid for the named person
  @JsonKey(name: 'Period')
  Period? get period => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HumanNameCopyWith<HumanName> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HumanNameCopyWith<$Res> {
  factory $HumanNameCopyWith(HumanName value, $Res Function(HumanName) then) =
      _$HumanNameCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'ID')
          String? id,
      @JsonKey(name: 'Use', unknownEnumValue: HumanNameUseEnum.official)
          HumanNameUseEnum? use,
      @JsonKey(name: 'Text')
          String? text,
      @JsonKey(name: 'Family')
          String? family,
      @JsonKey(name: 'Given')
          List<String?>? given,
      @JsonKey(name: 'Prefix')
          List<String?>? prefix,
      @JsonKey(name: 'Suffix')
          List<String?>? suffix,
      @JsonKey(name: 'Period')
          Period? period});

  $PeriodCopyWith<$Res>? get period;
}

/// @nodoc
class _$HumanNameCopyWithImpl<$Res> implements $HumanNameCopyWith<$Res> {
  _$HumanNameCopyWithImpl(this._value, this._then);

  final HumanName _value;
  // ignore: unused_field
  final $Res Function(HumanName) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? use = freezed,
    Object? text = freezed,
    Object? family = freezed,
    Object? given = freezed,
    Object? prefix = freezed,
    Object? suffix = freezed,
    Object? period = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      use: use == freezed
          ? _value.use
          : use // ignore: cast_nullable_to_non_nullable
              as HumanNameUseEnum?,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      family: family == freezed
          ? _value.family
          : family // ignore: cast_nullable_to_non_nullable
              as String?,
      given: given == freezed
          ? _value.given
          : given // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      prefix: prefix == freezed
          ? _value.prefix
          : prefix // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      suffix: suffix == freezed
          ? _value.suffix
          : suffix // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
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
abstract class _$HumanNameCopyWith<$Res> implements $HumanNameCopyWith<$Res> {
  factory _$HumanNameCopyWith(
          _HumanName value, $Res Function(_HumanName) then) =
      __$HumanNameCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'ID')
          String? id,
      @JsonKey(name: 'Use', unknownEnumValue: HumanNameUseEnum.official)
          HumanNameUseEnum? use,
      @JsonKey(name: 'Text')
          String? text,
      @JsonKey(name: 'Family')
          String? family,
      @JsonKey(name: 'Given')
          List<String?>? given,
      @JsonKey(name: 'Prefix')
          List<String?>? prefix,
      @JsonKey(name: 'Suffix')
          List<String?>? suffix,
      @JsonKey(name: 'Period')
          Period? period});

  @override
  $PeriodCopyWith<$Res>? get period;
}

/// @nodoc
class __$HumanNameCopyWithImpl<$Res> extends _$HumanNameCopyWithImpl<$Res>
    implements _$HumanNameCopyWith<$Res> {
  __$HumanNameCopyWithImpl(_HumanName _value, $Res Function(_HumanName) _then)
      : super(_value, (v) => _then(v as _HumanName));

  @override
  _HumanName get _value => super._value as _HumanName;

  @override
  $Res call({
    Object? id = freezed,
    Object? use = freezed,
    Object? text = freezed,
    Object? family = freezed,
    Object? given = freezed,
    Object? prefix = freezed,
    Object? suffix = freezed,
    Object? period = freezed,
  }) {
    return _then(_HumanName(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      use: use == freezed
          ? _value.use
          : use // ignore: cast_nullable_to_non_nullable
              as HumanNameUseEnum?,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      family: family == freezed
          ? _value.family
          : family // ignore: cast_nullable_to_non_nullable
              as String?,
      given: given == freezed
          ? _value.given
          : given // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      prefix: prefix == freezed
          ? _value.prefix
          : prefix // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      suffix: suffix == freezed
          ? _value.suffix
          : suffix // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      period: period == freezed
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as Period?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HumanName implements _HumanName {
  _$_HumanName(
      {@JsonKey(name: 'ID')
          this.id,
      @JsonKey(name: 'Use', unknownEnumValue: HumanNameUseEnum.official)
          this.use,
      @JsonKey(name: 'Text')
          this.text,
      @JsonKey(name: 'Family')
          this.family,
      @JsonKey(name: 'Given')
          this.given,
      @JsonKey(name: 'Prefix')
          this.prefix,
      @JsonKey(name: 'Suffix')
          this.suffix,
      @JsonKey(name: 'Period')
          this.period});

  factory _$_HumanName.fromJson(Map<String, dynamic> json) =>
      _$_$_HumanNameFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? id;
  @override

  /// Identifies the purpose for this name
  @JsonKey(name: 'Use', unknownEnumValue: HumanNameUseEnum.official)
  final HumanNameUseEnum? use;
  @override

  /// Specifies the entire name as it should be displayed e.g. on an application UI.
  /// This may be provided instead of or as well as the specific parts
  @JsonKey(name: 'Text')
  final String? text;
  @override

  /// The part of a name that links to the genealogy.
  /// In some cultures (e.g. Eritrea) the family name of a son is the
  /// first name of his father.
  @JsonKey(name: 'Family')
  final String? family;
  @override

  /// Given name.
  @JsonKey(name: 'Given')
  final List<String?>? given;
  @override

  /// Part of the name that is acquired as a title due to academic,
  ///  legal, employment or nobility status, etc. and that appears
  ///  at the start of the name.
  @JsonKey(name: 'Prefix')
  final List<String?>? prefix;
  @override

  /// Part of the name that is acquired as a title due to academic,
  ///  legal, employment or nobility status, etc. and that appears
  ///  at the end of the name.
  @JsonKey(name: 'Suffix')
  final List<String?>? suffix;
  @override

  /// Indicates the period of time when this name was valid for the named person
  @JsonKey(name: 'Period')
  final Period? period;

  @override
  String toString() {
    return 'HumanName(id: $id, use: $use, text: $text, family: $family, given: $given, prefix: $prefix, suffix: $suffix, period: $period)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HumanName &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.use, use) ||
                const DeepCollectionEquality().equals(other.use, use)) &&
            (identical(other.text, text) ||
                const DeepCollectionEquality().equals(other.text, text)) &&
            (identical(other.family, family) ||
                const DeepCollectionEquality().equals(other.family, family)) &&
            (identical(other.given, given) ||
                const DeepCollectionEquality().equals(other.given, given)) &&
            (identical(other.prefix, prefix) ||
                const DeepCollectionEquality().equals(other.prefix, prefix)) &&
            (identical(other.suffix, suffix) ||
                const DeepCollectionEquality().equals(other.suffix, suffix)) &&
            (identical(other.period, period) ||
                const DeepCollectionEquality().equals(other.period, period)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(use) ^
      const DeepCollectionEquality().hash(text) ^
      const DeepCollectionEquality().hash(family) ^
      const DeepCollectionEquality().hash(given) ^
      const DeepCollectionEquality().hash(prefix) ^
      const DeepCollectionEquality().hash(suffix) ^
      const DeepCollectionEquality().hash(period);

  @JsonKey(ignore: true)
  @override
  _$HumanNameCopyWith<_HumanName> get copyWith =>
      __$HumanNameCopyWithImpl<_HumanName>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_HumanNameToJson(this);
  }
}

abstract class _HumanName implements HumanName {
  factory _HumanName(
      {@JsonKey(name: 'ID')
          String? id,
      @JsonKey(name: 'Use', unknownEnumValue: HumanNameUseEnum.official)
          HumanNameUseEnum? use,
      @JsonKey(name: 'Text')
          String? text,
      @JsonKey(name: 'Family')
          String? family,
      @JsonKey(name: 'Given')
          List<String?>? given,
      @JsonKey(name: 'Prefix')
          List<String?>? prefix,
      @JsonKey(name: 'Suffix')
          List<String?>? suffix,
      @JsonKey(name: 'Period')
          Period? period}) = _$_HumanName;

  factory _HumanName.fromJson(Map<String, dynamic> json) =
      _$_HumanName.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;
  @override

  /// Identifies the purpose for this name
  @JsonKey(name: 'Use', unknownEnumValue: HumanNameUseEnum.official)
  HumanNameUseEnum? get use => throw _privateConstructorUsedError;
  @override

  /// Specifies the entire name as it should be displayed e.g. on an application UI.
  /// This may be provided instead of or as well as the specific parts
  @JsonKey(name: 'Text')
  String? get text => throw _privateConstructorUsedError;
  @override

  /// The part of a name that links to the genealogy.
  /// In some cultures (e.g. Eritrea) the family name of a son is the
  /// first name of his father.
  @JsonKey(name: 'Family')
  String? get family => throw _privateConstructorUsedError;
  @override

  /// Given name.
  @JsonKey(name: 'Given')
  List<String?>? get given => throw _privateConstructorUsedError;
  @override

  /// Part of the name that is acquired as a title due to academic,
  ///  legal, employment or nobility status, etc. and that appears
  ///  at the start of the name.
  @JsonKey(name: 'Prefix')
  List<String?>? get prefix => throw _privateConstructorUsedError;
  @override

  /// Part of the name that is acquired as a title due to academic,
  ///  legal, employment or nobility status, etc. and that appears
  ///  at the end of the name.
  @JsonKey(name: 'Suffix')
  List<String?>? get suffix => throw _privateConstructorUsedError;
  @override

  /// Indicates the period of time when this name was valid for the named person
  @JsonKey(name: 'Period')
  Period? get period => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$HumanNameCopyWith<_HumanName> get copyWith =>
      throw _privateConstructorUsedError;
}
