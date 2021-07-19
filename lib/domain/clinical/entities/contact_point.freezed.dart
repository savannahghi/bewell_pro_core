// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'contact_point.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ContactPoint _$ContactPointFromJson(Map<String, dynamic> json) {
  return _ContactPoint.fromJson(json);
}

/// @nodoc
class _$ContactPointTearOff {
  const _$ContactPointTearOff();

  _ContactPoint call(
      {@JsonKey(name: 'ID')
          String? id,
      @JsonKey(name: 'System', unknownEnumValue: ContactPointSystemEnum.phone)
          ContactPointSystemEnum? system,
      @JsonKey(name: 'Value')
          String? value,
      @JsonKey(name: 'Use', unknownEnumValue: ContactPointUseEnum.mobile)
          ContactPointUseEnum? use,
      @JsonKey(name: 'Rank')
          int? rank,
      @JsonKey(name: 'Period')
          Period? period}) {
    return _ContactPoint(
      id: id,
      system: system,
      value: value,
      use: use,
      rank: rank,
      period: period,
    );
  }

  ContactPoint fromJson(Map<String, Object> json) {
    return ContactPoint.fromJson(json);
  }
}

/// @nodoc
const $ContactPoint = _$ContactPointTearOff();

/// @nodoc
mixin _$ContactPoint {
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'System', unknownEnumValue: ContactPointSystemEnum.phone)
  ContactPointSystemEnum? get system => throw _privateConstructorUsedError;

  /// The actual contact point details, in a form that is meaningful to the
  ///  designated communication system (i.e. phone number or email address).
  @JsonKey(name: 'Value')
  String? get value => throw _privateConstructorUsedError;

  /// Identifies the purpose for the contact point.
  @JsonKey(name: 'Use', unknownEnumValue: ContactPointUseEnum.mobile)
  ContactPointUseEnum? get use => throw _privateConstructorUsedError;

  /// Specifies a preferred order in which to use a set of contacts.
  ///  ContactPoints with lower rank values are more preferred than those with higher rank values.
  @JsonKey(name: 'Rank')
  int? get rank => throw _privateConstructorUsedError;

  /// Time period when the contact point was/is in use
  @JsonKey(name: 'Period')
  Period? get period => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContactPointCopyWith<ContactPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactPointCopyWith<$Res> {
  factory $ContactPointCopyWith(
          ContactPoint value, $Res Function(ContactPoint) then) =
      _$ContactPointCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'ID')
          String? id,
      @JsonKey(name: 'System', unknownEnumValue: ContactPointSystemEnum.phone)
          ContactPointSystemEnum? system,
      @JsonKey(name: 'Value')
          String? value,
      @JsonKey(name: 'Use', unknownEnumValue: ContactPointUseEnum.mobile)
          ContactPointUseEnum? use,
      @JsonKey(name: 'Rank')
          int? rank,
      @JsonKey(name: 'Period')
          Period? period});

  $PeriodCopyWith<$Res>? get period;
}

/// @nodoc
class _$ContactPointCopyWithImpl<$Res> implements $ContactPointCopyWith<$Res> {
  _$ContactPointCopyWithImpl(this._value, this._then);

  final ContactPoint _value;
  // ignore: unused_field
  final $Res Function(ContactPoint) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? system = freezed,
    Object? value = freezed,
    Object? use = freezed,
    Object? rank = freezed,
    Object? period = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      system: system == freezed
          ? _value.system
          : system // ignore: cast_nullable_to_non_nullable
              as ContactPointSystemEnum?,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      use: use == freezed
          ? _value.use
          : use // ignore: cast_nullable_to_non_nullable
              as ContactPointUseEnum?,
      rank: rank == freezed
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int?,
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
abstract class _$ContactPointCopyWith<$Res>
    implements $ContactPointCopyWith<$Res> {
  factory _$ContactPointCopyWith(
          _ContactPoint value, $Res Function(_ContactPoint) then) =
      __$ContactPointCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'ID')
          String? id,
      @JsonKey(name: 'System', unknownEnumValue: ContactPointSystemEnum.phone)
          ContactPointSystemEnum? system,
      @JsonKey(name: 'Value')
          String? value,
      @JsonKey(name: 'Use', unknownEnumValue: ContactPointUseEnum.mobile)
          ContactPointUseEnum? use,
      @JsonKey(name: 'Rank')
          int? rank,
      @JsonKey(name: 'Period')
          Period? period});

  @override
  $PeriodCopyWith<$Res>? get period;
}

/// @nodoc
class __$ContactPointCopyWithImpl<$Res> extends _$ContactPointCopyWithImpl<$Res>
    implements _$ContactPointCopyWith<$Res> {
  __$ContactPointCopyWithImpl(
      _ContactPoint _value, $Res Function(_ContactPoint) _then)
      : super(_value, (v) => _then(v as _ContactPoint));

  @override
  _ContactPoint get _value => super._value as _ContactPoint;

  @override
  $Res call({
    Object? id = freezed,
    Object? system = freezed,
    Object? value = freezed,
    Object? use = freezed,
    Object? rank = freezed,
    Object? period = freezed,
  }) {
    return _then(_ContactPoint(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      system: system == freezed
          ? _value.system
          : system // ignore: cast_nullable_to_non_nullable
              as ContactPointSystemEnum?,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      use: use == freezed
          ? _value.use
          : use // ignore: cast_nullable_to_non_nullable
              as ContactPointUseEnum?,
      rank: rank == freezed
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int?,
      period: period == freezed
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as Period?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ContactPoint implements _ContactPoint {
  _$_ContactPoint(
      {@JsonKey(name: 'ID')
          this.id,
      @JsonKey(name: 'System', unknownEnumValue: ContactPointSystemEnum.phone)
          this.system,
      @JsonKey(name: 'Value')
          this.value,
      @JsonKey(name: 'Use', unknownEnumValue: ContactPointUseEnum.mobile)
          this.use,
      @JsonKey(name: 'Rank')
          this.rank,
      @JsonKey(name: 'Period')
          this.period});

  factory _$_ContactPoint.fromJson(Map<String, dynamic> json) =>
      _$_$_ContactPointFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? id;
  @override
  @JsonKey(name: 'System', unknownEnumValue: ContactPointSystemEnum.phone)
  final ContactPointSystemEnum? system;
  @override

  /// The actual contact point details, in a form that is meaningful to the
  ///  designated communication system (i.e. phone number or email address).
  @JsonKey(name: 'Value')
  final String? value;
  @override

  /// Identifies the purpose for the contact point.
  @JsonKey(name: 'Use', unknownEnumValue: ContactPointUseEnum.mobile)
  final ContactPointUseEnum? use;
  @override

  /// Specifies a preferred order in which to use a set of contacts.
  ///  ContactPoints with lower rank values are more preferred than those with higher rank values.
  @JsonKey(name: 'Rank')
  final int? rank;
  @override

  /// Time period when the contact point was/is in use
  @JsonKey(name: 'Period')
  final Period? period;

  @override
  String toString() {
    return 'ContactPoint(id: $id, system: $system, value: $value, use: $use, rank: $rank, period: $period)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ContactPoint &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.system, system) ||
                const DeepCollectionEquality().equals(other.system, system)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)) &&
            (identical(other.use, use) ||
                const DeepCollectionEquality().equals(other.use, use)) &&
            (identical(other.rank, rank) ||
                const DeepCollectionEquality().equals(other.rank, rank)) &&
            (identical(other.period, period) ||
                const DeepCollectionEquality().equals(other.period, period)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(system) ^
      const DeepCollectionEquality().hash(value) ^
      const DeepCollectionEquality().hash(use) ^
      const DeepCollectionEquality().hash(rank) ^
      const DeepCollectionEquality().hash(period);

  @JsonKey(ignore: true)
  @override
  _$ContactPointCopyWith<_ContactPoint> get copyWith =>
      __$ContactPointCopyWithImpl<_ContactPoint>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ContactPointToJson(this);
  }
}

abstract class _ContactPoint implements ContactPoint {
  factory _ContactPoint(
      {@JsonKey(name: 'ID')
          String? id,
      @JsonKey(name: 'System', unknownEnumValue: ContactPointSystemEnum.phone)
          ContactPointSystemEnum? system,
      @JsonKey(name: 'Value')
          String? value,
      @JsonKey(name: 'Use', unknownEnumValue: ContactPointUseEnum.mobile)
          ContactPointUseEnum? use,
      @JsonKey(name: 'Rank')
          int? rank,
      @JsonKey(name: 'Period')
          Period? period}) = _$_ContactPoint;

  factory _ContactPoint.fromJson(Map<String, dynamic> json) =
      _$_ContactPoint.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'System', unknownEnumValue: ContactPointSystemEnum.phone)
  ContactPointSystemEnum? get system => throw _privateConstructorUsedError;
  @override

  /// The actual contact point details, in a form that is meaningful to the
  ///  designated communication system (i.e. phone number or email address).
  @JsonKey(name: 'Value')
  String? get value => throw _privateConstructorUsedError;
  @override

  /// Identifies the purpose for the contact point.
  @JsonKey(name: 'Use', unknownEnumValue: ContactPointUseEnum.mobile)
  ContactPointUseEnum? get use => throw _privateConstructorUsedError;
  @override

  /// Specifies a preferred order in which to use a set of contacts.
  ///  ContactPoints with lower rank values are more preferred than those with higher rank values.
  @JsonKey(name: 'Rank')
  int? get rank => throw _privateConstructorUsedError;
  @override

  /// Time period when the contact point was/is in use
  @JsonKey(name: 'Period')
  Period? get period => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ContactPointCopyWith<_ContactPoint> get copyWith =>
      throw _privateConstructorUsedError;
}
