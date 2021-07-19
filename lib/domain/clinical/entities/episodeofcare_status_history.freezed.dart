// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'episodeofcare_status_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EpisodeofcareStatusHistory _$EpisodeofcareStatusHistoryFromJson(
    Map<String, dynamic> json) {
  return _EpisodeofcareStatusHistory.fromJson(json);
}

/// @nodoc
class _$EpisodeofcareStatusHistoryTearOff {
  const _$EpisodeofcareStatusHistoryTearOff();

  _EpisodeofcareStatusHistory call(
      {@JsonKey(name: 'ID')
          String? id,
      @JsonKey(name: 'Status', unknownEnumValue: EpisodeOfCareStatusEnum.waitlist)
          EpisodeOfCareStatusEnum? status,
      @JsonKey(name: 'Period')
          Period? period}) {
    return _EpisodeofcareStatusHistory(
      id: id,
      status: status,
      period: period,
    );
  }

  EpisodeofcareStatusHistory fromJson(Map<String, Object> json) {
    return EpisodeofcareStatusHistory.fromJson(json);
  }
}

/// @nodoc
const $EpisodeofcareStatusHistory = _$EpisodeofcareStatusHistoryTearOff();

/// @nodoc
mixin _$EpisodeofcareStatusHistory {
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Status', unknownEnumValue: EpisodeOfCareStatusEnum.waitlist)
  EpisodeOfCareStatusEnum? get status => throw _privateConstructorUsedError;

  /// The period during this EpisodeOfCare that the specific status applied.
  @JsonKey(name: 'Period')
  Period? get period => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EpisodeofcareStatusHistoryCopyWith<EpisodeofcareStatusHistory>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EpisodeofcareStatusHistoryCopyWith<$Res> {
  factory $EpisodeofcareStatusHistoryCopyWith(EpisodeofcareStatusHistory value,
          $Res Function(EpisodeofcareStatusHistory) then) =
      _$EpisodeofcareStatusHistoryCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'ID')
          String? id,
      @JsonKey(name: 'Status', unknownEnumValue: EpisodeOfCareStatusEnum.waitlist)
          EpisodeOfCareStatusEnum? status,
      @JsonKey(name: 'Period')
          Period? period});

  $PeriodCopyWith<$Res>? get period;
}

/// @nodoc
class _$EpisodeofcareStatusHistoryCopyWithImpl<$Res>
    implements $EpisodeofcareStatusHistoryCopyWith<$Res> {
  _$EpisodeofcareStatusHistoryCopyWithImpl(this._value, this._then);

  final EpisodeofcareStatusHistory _value;
  // ignore: unused_field
  final $Res Function(EpisodeofcareStatusHistory) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? status = freezed,
    Object? period = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as EpisodeOfCareStatusEnum?,
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
abstract class _$EpisodeofcareStatusHistoryCopyWith<$Res>
    implements $EpisodeofcareStatusHistoryCopyWith<$Res> {
  factory _$EpisodeofcareStatusHistoryCopyWith(
          _EpisodeofcareStatusHistory value,
          $Res Function(_EpisodeofcareStatusHistory) then) =
      __$EpisodeofcareStatusHistoryCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'ID')
          String? id,
      @JsonKey(name: 'Status', unknownEnumValue: EpisodeOfCareStatusEnum.waitlist)
          EpisodeOfCareStatusEnum? status,
      @JsonKey(name: 'Period')
          Period? period});

  @override
  $PeriodCopyWith<$Res>? get period;
}

/// @nodoc
class __$EpisodeofcareStatusHistoryCopyWithImpl<$Res>
    extends _$EpisodeofcareStatusHistoryCopyWithImpl<$Res>
    implements _$EpisodeofcareStatusHistoryCopyWith<$Res> {
  __$EpisodeofcareStatusHistoryCopyWithImpl(_EpisodeofcareStatusHistory _value,
      $Res Function(_EpisodeofcareStatusHistory) _then)
      : super(_value, (v) => _then(v as _EpisodeofcareStatusHistory));

  @override
  _EpisodeofcareStatusHistory get _value =>
      super._value as _EpisodeofcareStatusHistory;

  @override
  $Res call({
    Object? id = freezed,
    Object? status = freezed,
    Object? period = freezed,
  }) {
    return _then(_EpisodeofcareStatusHistory(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as EpisodeOfCareStatusEnum?,
      period: period == freezed
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as Period?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EpisodeofcareStatusHistory implements _EpisodeofcareStatusHistory {
  _$_EpisodeofcareStatusHistory(
      {@JsonKey(name: 'ID')
          this.id,
      @JsonKey(name: 'Status', unknownEnumValue: EpisodeOfCareStatusEnum.waitlist)
          this.status,
      @JsonKey(name: 'Period')
          this.period});

  factory _$_EpisodeofcareStatusHistory.fromJson(Map<String, dynamic> json) =>
      _$_$_EpisodeofcareStatusHistoryFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? id;
  @override
  @JsonKey(name: 'Status', unknownEnumValue: EpisodeOfCareStatusEnum.waitlist)
  final EpisodeOfCareStatusEnum? status;
  @override

  /// The period during this EpisodeOfCare that the specific status applied.
  @JsonKey(name: 'Period')
  final Period? period;

  @override
  String toString() {
    return 'EpisodeofcareStatusHistory(id: $id, status: $status, period: $period)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _EpisodeofcareStatusHistory &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.period, period) ||
                const DeepCollectionEquality().equals(other.period, period)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(period);

  @JsonKey(ignore: true)
  @override
  _$EpisodeofcareStatusHistoryCopyWith<_EpisodeofcareStatusHistory>
      get copyWith => __$EpisodeofcareStatusHistoryCopyWithImpl<
          _EpisodeofcareStatusHistory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_EpisodeofcareStatusHistoryToJson(this);
  }
}

abstract class _EpisodeofcareStatusHistory
    implements EpisodeofcareStatusHistory {
  factory _EpisodeofcareStatusHistory(
      {@JsonKey(name: 'ID')
          String? id,
      @JsonKey(name: 'Status', unknownEnumValue: EpisodeOfCareStatusEnum.waitlist)
          EpisodeOfCareStatusEnum? status,
      @JsonKey(name: 'Period')
          Period? period}) = _$_EpisodeofcareStatusHistory;

  factory _EpisodeofcareStatusHistory.fromJson(Map<String, dynamic> json) =
      _$_EpisodeofcareStatusHistory.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Status', unknownEnumValue: EpisodeOfCareStatusEnum.waitlist)
  EpisodeOfCareStatusEnum? get status => throw _privateConstructorUsedError;
  @override

  /// The period during this EpisodeOfCare that the specific status applied.
  @JsonKey(name: 'Period')
  Period? get period => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$EpisodeofcareStatusHistoryCopyWith<_EpisodeofcareStatusHistory>
      get copyWith => throw _privateConstructorUsedError;
}
