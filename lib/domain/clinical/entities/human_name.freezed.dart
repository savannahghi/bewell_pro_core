// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'human_name.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HumanName _$HumanNameFromJson(Map<String, dynamic> json) {
  return _HumanName.fromJson(json);
}

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
      _$HumanNameCopyWithImpl<$Res, HumanName>;
  @useResult
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
class _$HumanNameCopyWithImpl<$Res, $Val extends HumanName>
    implements $HumanNameCopyWith<$Res> {
  _$HumanNameCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
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
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      use: freezed == use
          ? _value.use
          : use // ignore: cast_nullable_to_non_nullable
              as HumanNameUseEnum?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      family: freezed == family
          ? _value.family
          : family // ignore: cast_nullable_to_non_nullable
              as String?,
      given: freezed == given
          ? _value.given
          : given // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      prefix: freezed == prefix
          ? _value.prefix
          : prefix // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      suffix: freezed == suffix
          ? _value.suffix
          : suffix // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
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
abstract class _$$_HumanNameCopyWith<$Res> implements $HumanNameCopyWith<$Res> {
  factory _$$_HumanNameCopyWith(
          _$_HumanName value, $Res Function(_$_HumanName) then) =
      __$$_HumanNameCopyWithImpl<$Res>;
  @override
  @useResult
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
class __$$_HumanNameCopyWithImpl<$Res>
    extends _$HumanNameCopyWithImpl<$Res, _$_HumanName>
    implements _$$_HumanNameCopyWith<$Res> {
  __$$_HumanNameCopyWithImpl(
      _$_HumanName _value, $Res Function(_$_HumanName) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
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
    return _then(_$_HumanName(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      use: freezed == use
          ? _value.use
          : use // ignore: cast_nullable_to_non_nullable
              as HumanNameUseEnum?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      family: freezed == family
          ? _value.family
          : family // ignore: cast_nullable_to_non_nullable
              as String?,
      given: freezed == given
          ? _value._given
          : given // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      prefix: freezed == prefix
          ? _value._prefix
          : prefix // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      suffix: freezed == suffix
          ? _value._suffix
          : suffix // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      period: freezed == period
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
          final List<String?>? given,
      @JsonKey(name: 'Prefix')
          final List<String?>? prefix,
      @JsonKey(name: 'Suffix')
          final List<String?>? suffix,
      @JsonKey(name: 'Period')
          this.period})
      : _given = given,
        _prefix = prefix,
        _suffix = suffix;

  factory _$_HumanName.fromJson(Map<String, dynamic> json) =>
      _$$_HumanNameFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? id;

  /// Identifies the purpose for this name
  @override
  @JsonKey(name: 'Use', unknownEnumValue: HumanNameUseEnum.official)
  final HumanNameUseEnum? use;

  /// Specifies the entire name as it should be displayed e.g. on an application UI.
  /// This may be provided instead of or as well as the specific parts
  @override
  @JsonKey(name: 'Text')
  final String? text;

  /// The part of a name that links to the genealogy.
  /// In some cultures (e.g. Eritrea) the family name of a son is the
  /// first name of his father.
  @override
  @JsonKey(name: 'Family')
  final String? family;

  /// Given name.
  final List<String?>? _given;

  /// Given name.
  @override
  @JsonKey(name: 'Given')
  List<String?>? get given {
    final value = _given;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Part of the name that is acquired as a title due to academic,
  ///  legal, employment or nobility status, etc. and that appears
  ///  at the start of the name.
  final List<String?>? _prefix;

  /// Part of the name that is acquired as a title due to academic,
  ///  legal, employment or nobility status, etc. and that appears
  ///  at the start of the name.
  @override
  @JsonKey(name: 'Prefix')
  List<String?>? get prefix {
    final value = _prefix;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Part of the name that is acquired as a title due to academic,
  ///  legal, employment or nobility status, etc. and that appears
  ///  at the end of the name.
  final List<String?>? _suffix;

  /// Part of the name that is acquired as a title due to academic,
  ///  legal, employment or nobility status, etc. and that appears
  ///  at the end of the name.
  @override
  @JsonKey(name: 'Suffix')
  List<String?>? get suffix {
    final value = _suffix;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Indicates the period of time when this name was valid for the named person
  @override
  @JsonKey(name: 'Period')
  final Period? period;

  @override
  String toString() {
    return 'HumanName(id: $id, use: $use, text: $text, family: $family, given: $given, prefix: $prefix, suffix: $suffix, period: $period)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HumanName &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.use, use) || other.use == use) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.family, family) || other.family == family) &&
            const DeepCollectionEquality().equals(other._given, _given) &&
            const DeepCollectionEquality().equals(other._prefix, _prefix) &&
            const DeepCollectionEquality().equals(other._suffix, _suffix) &&
            (identical(other.period, period) || other.period == period));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      use,
      text,
      family,
      const DeepCollectionEquality().hash(_given),
      const DeepCollectionEquality().hash(_prefix),
      const DeepCollectionEquality().hash(_suffix),
      period);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HumanNameCopyWith<_$_HumanName> get copyWith =>
      __$$_HumanNameCopyWithImpl<_$_HumanName>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HumanNameToJson(
      this,
    );
  }
}

abstract class _HumanName implements HumanName {
  factory _HumanName(
      {@JsonKey(name: 'ID')
          final String? id,
      @JsonKey(name: 'Use', unknownEnumValue: HumanNameUseEnum.official)
          final HumanNameUseEnum? use,
      @JsonKey(name: 'Text')
          final String? text,
      @JsonKey(name: 'Family')
          final String? family,
      @JsonKey(name: 'Given')
          final List<String?>? given,
      @JsonKey(name: 'Prefix')
          final List<String?>? prefix,
      @JsonKey(name: 'Suffix')
          final List<String?>? suffix,
      @JsonKey(name: 'Period')
          final Period? period}) = _$_HumanName;

  factory _HumanName.fromJson(Map<String, dynamic> json) =
      _$_HumanName.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id;
  @override

  /// Identifies the purpose for this name
  @JsonKey(name: 'Use', unknownEnumValue: HumanNameUseEnum.official)
  HumanNameUseEnum? get use;
  @override

  /// Specifies the entire name as it should be displayed e.g. on an application UI.
  /// This may be provided instead of or as well as the specific parts
  @JsonKey(name: 'Text')
  String? get text;
  @override

  /// The part of a name that links to the genealogy.
  /// In some cultures (e.g. Eritrea) the family name of a son is the
  /// first name of his father.
  @JsonKey(name: 'Family')
  String? get family;
  @override

  /// Given name.
  @JsonKey(name: 'Given')
  List<String?>? get given;
  @override

  /// Part of the name that is acquired as a title due to academic,
  ///  legal, employment or nobility status, etc. and that appears
  ///  at the start of the name.
  @JsonKey(name: 'Prefix')
  List<String?>? get prefix;
  @override

  /// Part of the name that is acquired as a title due to academic,
  ///  legal, employment or nobility status, etc. and that appears
  ///  at the end of the name.
  @JsonKey(name: 'Suffix')
  List<String?>? get suffix;
  @override

  /// Indicates the period of time when this name was valid for the named person
  @JsonKey(name: 'Period')
  Period? get period;
  @override
  @JsonKey(ignore: true)
  _$$_HumanNameCopyWith<_$_HumanName> get copyWith =>
      throw _privateConstructorUsedError;
}
