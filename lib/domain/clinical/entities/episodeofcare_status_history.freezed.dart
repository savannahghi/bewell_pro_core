// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'episodeofcare_status_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EpisodeofcareStatusHistory _$EpisodeofcareStatusHistoryFromJson(
    Map<String, dynamic> json) {
  return _EpisodeofcareStatusHistory.fromJson(json);
}

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
      _$EpisodeofcareStatusHistoryCopyWithImpl<$Res,
          EpisodeofcareStatusHistory>;
  @useResult
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
class _$EpisodeofcareStatusHistoryCopyWithImpl<$Res,
        $Val extends EpisodeofcareStatusHistory>
    implements $EpisodeofcareStatusHistoryCopyWith<$Res> {
  _$EpisodeofcareStatusHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? status = freezed,
    Object? period = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as EpisodeOfCareStatusEnum?,
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
abstract class _$$_EpisodeofcareStatusHistoryCopyWith<$Res>
    implements $EpisodeofcareStatusHistoryCopyWith<$Res> {
  factory _$$_EpisodeofcareStatusHistoryCopyWith(
          _$_EpisodeofcareStatusHistory value,
          $Res Function(_$_EpisodeofcareStatusHistory) then) =
      __$$_EpisodeofcareStatusHistoryCopyWithImpl<$Res>;
  @override
  @useResult
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
class __$$_EpisodeofcareStatusHistoryCopyWithImpl<$Res>
    extends _$EpisodeofcareStatusHistoryCopyWithImpl<$Res,
        _$_EpisodeofcareStatusHistory>
    implements _$$_EpisodeofcareStatusHistoryCopyWith<$Res> {
  __$$_EpisodeofcareStatusHistoryCopyWithImpl(
      _$_EpisodeofcareStatusHistory _value,
      $Res Function(_$_EpisodeofcareStatusHistory) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? status = freezed,
    Object? period = freezed,
  }) {
    return _then(_$_EpisodeofcareStatusHistory(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as EpisodeOfCareStatusEnum?,
      period: freezed == period
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
      _$$_EpisodeofcareStatusHistoryFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? id;
  @override
  @JsonKey(name: 'Status', unknownEnumValue: EpisodeOfCareStatusEnum.waitlist)
  final EpisodeOfCareStatusEnum? status;

  /// The period during this EpisodeOfCare that the specific status applied.
  @override
  @JsonKey(name: 'Period')
  final Period? period;

  @override
  String toString() {
    return 'EpisodeofcareStatusHistory(id: $id, status: $status, period: $period)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EpisodeofcareStatusHistory &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.period, period) || other.period == period));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, status, period);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EpisodeofcareStatusHistoryCopyWith<_$_EpisodeofcareStatusHistory>
      get copyWith => __$$_EpisodeofcareStatusHistoryCopyWithImpl<
          _$_EpisodeofcareStatusHistory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EpisodeofcareStatusHistoryToJson(
      this,
    );
  }
}

abstract class _EpisodeofcareStatusHistory
    implements EpisodeofcareStatusHistory {
  factory _EpisodeofcareStatusHistory(
      {@JsonKey(name: 'ID')
          final String? id,
      @JsonKey(name: 'Status', unknownEnumValue: EpisodeOfCareStatusEnum.waitlist)
          final EpisodeOfCareStatusEnum? status,
      @JsonKey(name: 'Period')
          final Period? period}) = _$_EpisodeofcareStatusHistory;

  factory _EpisodeofcareStatusHistory.fromJson(Map<String, dynamic> json) =
      _$_EpisodeofcareStatusHistory.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id;
  @override
  @JsonKey(name: 'Status', unknownEnumValue: EpisodeOfCareStatusEnum.waitlist)
  EpisodeOfCareStatusEnum? get status;
  @override

  /// The period during this EpisodeOfCare that the specific status applied.
  @JsonKey(name: 'Period')
  Period? get period;
  @override
  @JsonKey(ignore: true)
  _$$_EpisodeofcareStatusHistoryCopyWith<_$_EpisodeofcareStatusHistory>
      get copyWith => throw _privateConstructorUsedError;
}
