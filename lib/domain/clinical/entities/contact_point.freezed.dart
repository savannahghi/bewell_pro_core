// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'contact_point.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ContactPoint _$ContactPointFromJson(Map<String, dynamic> json) {
  return _ContactPoint.fromJson(json);
}

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
      _$ContactPointCopyWithImpl<$Res, ContactPoint>;
  @useResult
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
class _$ContactPointCopyWithImpl<$Res, $Val extends ContactPoint>
    implements $ContactPointCopyWith<$Res> {
  _$ContactPointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
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
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      system: freezed == system
          ? _value.system
          : system // ignore: cast_nullable_to_non_nullable
              as ContactPointSystemEnum?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      use: freezed == use
          ? _value.use
          : use // ignore: cast_nullable_to_non_nullable
              as ContactPointUseEnum?,
      rank: freezed == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int?,
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
abstract class _$$_ContactPointCopyWith<$Res>
    implements $ContactPointCopyWith<$Res> {
  factory _$$_ContactPointCopyWith(
          _$_ContactPoint value, $Res Function(_$_ContactPoint) then) =
      __$$_ContactPointCopyWithImpl<$Res>;
  @override
  @useResult
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
class __$$_ContactPointCopyWithImpl<$Res>
    extends _$ContactPointCopyWithImpl<$Res, _$_ContactPoint>
    implements _$$_ContactPointCopyWith<$Res> {
  __$$_ContactPointCopyWithImpl(
      _$_ContactPoint _value, $Res Function(_$_ContactPoint) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? system = freezed,
    Object? value = freezed,
    Object? use = freezed,
    Object? rank = freezed,
    Object? period = freezed,
  }) {
    return _then(_$_ContactPoint(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      system: freezed == system
          ? _value.system
          : system // ignore: cast_nullable_to_non_nullable
              as ContactPointSystemEnum?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      use: freezed == use
          ? _value.use
          : use // ignore: cast_nullable_to_non_nullable
              as ContactPointUseEnum?,
      rank: freezed == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int?,
      period: freezed == period
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
      _$$_ContactPointFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? id;
  @override
  @JsonKey(name: 'System', unknownEnumValue: ContactPointSystemEnum.phone)
  final ContactPointSystemEnum? system;

  /// The actual contact point details, in a form that is meaningful to the
  ///  designated communication system (i.e. phone number or email address).
  @override
  @JsonKey(name: 'Value')
  final String? value;

  /// Identifies the purpose for the contact point.
  @override
  @JsonKey(name: 'Use', unknownEnumValue: ContactPointUseEnum.mobile)
  final ContactPointUseEnum? use;

  /// Specifies a preferred order in which to use a set of contacts.
  ///  ContactPoints with lower rank values are more preferred than those with higher rank values.
  @override
  @JsonKey(name: 'Rank')
  final int? rank;

  /// Time period when the contact point was/is in use
  @override
  @JsonKey(name: 'Period')
  final Period? period;

  @override
  String toString() {
    return 'ContactPoint(id: $id, system: $system, value: $value, use: $use, rank: $rank, period: $period)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ContactPoint &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.system, system) || other.system == system) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.use, use) || other.use == use) &&
            (identical(other.rank, rank) || other.rank == rank) &&
            (identical(other.period, period) || other.period == period));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, system, value, use, rank, period);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ContactPointCopyWith<_$_ContactPoint> get copyWith =>
      __$$_ContactPointCopyWithImpl<_$_ContactPoint>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ContactPointToJson(
      this,
    );
  }
}

abstract class _ContactPoint implements ContactPoint {
  factory _ContactPoint(
      {@JsonKey(name: 'ID')
          final String? id,
      @JsonKey(name: 'System', unknownEnumValue: ContactPointSystemEnum.phone)
          final ContactPointSystemEnum? system,
      @JsonKey(name: 'Value')
          final String? value,
      @JsonKey(name: 'Use', unknownEnumValue: ContactPointUseEnum.mobile)
          final ContactPointUseEnum? use,
      @JsonKey(name: 'Rank')
          final int? rank,
      @JsonKey(name: 'Period')
          final Period? period}) = _$_ContactPoint;

  factory _ContactPoint.fromJson(Map<String, dynamic> json) =
      _$_ContactPoint.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id;
  @override
  @JsonKey(name: 'System', unknownEnumValue: ContactPointSystemEnum.phone)
  ContactPointSystemEnum? get system;
  @override

  /// The actual contact point details, in a form that is meaningful to the
  ///  designated communication system (i.e. phone number or email address).
  @JsonKey(name: 'Value')
  String? get value;
  @override

  /// Identifies the purpose for the contact point.
  @JsonKey(name: 'Use', unknownEnumValue: ContactPointUseEnum.mobile)
  ContactPointUseEnum? get use;
  @override

  /// Specifies a preferred order in which to use a set of contacts.
  ///  ContactPoints with lower rank values are more preferred than those with higher rank values.
  @JsonKey(name: 'Rank')
  int? get rank;
  @override

  /// Time period when the contact point was/is in use
  @JsonKey(name: 'Period')
  Period? get period;
  @override
  @JsonKey(ignore: true)
  _$$_ContactPointCopyWith<_$_ContactPoint> get copyWith =>
      throw _privateConstructorUsedError;
}
