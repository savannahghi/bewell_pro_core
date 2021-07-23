// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'core_errors_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CoreErrorsState _$CoreErrorsStateFromJson(Map<String, dynamic> json) {
  return _CoreErrorsState.fromJson(json);
}

/// @nodoc
class _$CoreErrorsStateTearOff {
  const _$CoreErrorsStateTearOff();

  _CoreErrorsState call({required String failure}) {
    return _CoreErrorsState(
      failure: failure,
    );
  }

  CoreErrorsState fromJson(Map<String, Object> json) {
    return CoreErrorsState.fromJson(json);
  }
}

/// @nodoc
const $CoreErrorsState = _$CoreErrorsStateTearOff();

/// @nodoc
mixin _$CoreErrorsState {
  String get failure => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CoreErrorsStateCopyWith<CoreErrorsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoreErrorsStateCopyWith<$Res> {
  factory $CoreErrorsStateCopyWith(
          CoreErrorsState value, $Res Function(CoreErrorsState) then) =
      _$CoreErrorsStateCopyWithImpl<$Res>;
  $Res call({String failure});
}

/// @nodoc
class _$CoreErrorsStateCopyWithImpl<$Res>
    implements $CoreErrorsStateCopyWith<$Res> {
  _$CoreErrorsStateCopyWithImpl(this._value, this._then);

  final CoreErrorsState _value;
  // ignore: unused_field
  final $Res Function(CoreErrorsState) _then;

  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(_value.copyWith(
      failure: failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$CoreErrorsStateCopyWith<$Res>
    implements $CoreErrorsStateCopyWith<$Res> {
  factory _$CoreErrorsStateCopyWith(
          _CoreErrorsState value, $Res Function(_CoreErrorsState) then) =
      __$CoreErrorsStateCopyWithImpl<$Res>;
  @override
  $Res call({String failure});
}

/// @nodoc
class __$CoreErrorsStateCopyWithImpl<$Res>
    extends _$CoreErrorsStateCopyWithImpl<$Res>
    implements _$CoreErrorsStateCopyWith<$Res> {
  __$CoreErrorsStateCopyWithImpl(
      _CoreErrorsState _value, $Res Function(_CoreErrorsState) _then)
      : super(_value, (v) => _then(v as _CoreErrorsState));

  @override
  _CoreErrorsState get _value => super._value as _CoreErrorsState;

  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(_CoreErrorsState(
      failure: failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CoreErrorsState implements _CoreErrorsState {
  _$_CoreErrorsState({required this.failure});

  factory _$_CoreErrorsState.fromJson(Map<String, dynamic> json) =>
      _$_$_CoreErrorsStateFromJson(json);

  @override
  final String failure;

  @override
  String toString() {
    return 'CoreErrorsState(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CoreErrorsState &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failure);

  @JsonKey(ignore: true)
  @override
  _$CoreErrorsStateCopyWith<_CoreErrorsState> get copyWith =>
      __$CoreErrorsStateCopyWithImpl<_CoreErrorsState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CoreErrorsStateToJson(this);
  }
}

abstract class _CoreErrorsState implements CoreErrorsState {
  factory _CoreErrorsState({required String failure}) = _$_CoreErrorsState;

  factory _CoreErrorsState.fromJson(Map<String, dynamic> json) =
      _$_CoreErrorsState.fromJson;

  @override
  String get failure => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CoreErrorsStateCopyWith<_CoreErrorsState> get copyWith =>
      throw _privateConstructorUsedError;
}
