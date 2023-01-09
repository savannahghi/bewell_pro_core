// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'event_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EventState _$EventStateFromJson(Map<String, dynamic> json) {
  return _EventState.fromJson(json);
}

/// @nodoc
mixin _$EventState {
  String? get eventName => throw _privateConstructorUsedError;
  String? get eventPayload => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventStateCopyWith<EventState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventStateCopyWith<$Res> {
  factory $EventStateCopyWith(
          EventState value, $Res Function(EventState) then) =
      _$EventStateCopyWithImpl<$Res, EventState>;
  @useResult
  $Res call({String? eventName, String? eventPayload});
}

/// @nodoc
class _$EventStateCopyWithImpl<$Res, $Val extends EventState>
    implements $EventStateCopyWith<$Res> {
  _$EventStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventName = freezed,
    Object? eventPayload = freezed,
  }) {
    return _then(_value.copyWith(
      eventName: freezed == eventName
          ? _value.eventName
          : eventName // ignore: cast_nullable_to_non_nullable
              as String?,
      eventPayload: freezed == eventPayload
          ? _value.eventPayload
          : eventPayload // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EventStateCopyWith<$Res>
    implements $EventStateCopyWith<$Res> {
  factory _$$_EventStateCopyWith(
          _$_EventState value, $Res Function(_$_EventState) then) =
      __$$_EventStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? eventName, String? eventPayload});
}

/// @nodoc
class __$$_EventStateCopyWithImpl<$Res>
    extends _$EventStateCopyWithImpl<$Res, _$_EventState>
    implements _$$_EventStateCopyWith<$Res> {
  __$$_EventStateCopyWithImpl(
      _$_EventState _value, $Res Function(_$_EventState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventName = freezed,
    Object? eventPayload = freezed,
  }) {
    return _then(_$_EventState(
      eventName: freezed == eventName
          ? _value.eventName
          : eventName // ignore: cast_nullable_to_non_nullable
              as String?,
      eventPayload: freezed == eventPayload
          ? _value.eventPayload
          : eventPayload // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EventState implements _EventState {
  _$_EventState({this.eventName, this.eventPayload});

  factory _$_EventState.fromJson(Map<String, dynamic> json) =>
      _$$_EventStateFromJson(json);

  @override
  final String? eventName;
  @override
  final String? eventPayload;

  @override
  String toString() {
    return 'EventState(eventName: $eventName, eventPayload: $eventPayload)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EventState &&
            (identical(other.eventName, eventName) ||
                other.eventName == eventName) &&
            (identical(other.eventPayload, eventPayload) ||
                other.eventPayload == eventPayload));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eventName, eventPayload);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EventStateCopyWith<_$_EventState> get copyWith =>
      __$$_EventStateCopyWithImpl<_$_EventState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EventStateToJson(
      this,
    );
  }
}

abstract class _EventState implements EventState {
  factory _EventState({final String? eventName, final String? eventPayload}) =
      _$_EventState;

  factory _EventState.fromJson(Map<String, dynamic> json) =
      _$_EventState.fromJson;

  @override
  String? get eventName;
  @override
  String? get eventPayload;
  @override
  @JsonKey(ignore: true)
  _$$_EventStateCopyWith<_$_EventState> get copyWith =>
      throw _privateConstructorUsedError;
}
