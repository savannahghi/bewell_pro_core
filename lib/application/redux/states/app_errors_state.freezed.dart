// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'app_errors_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppErrorsState _$AppErrorsStateFromJson(Map<String, dynamic> json) {
  return _AppErrorsState.fromJson(json);
}

/// @nodoc
class _$AppErrorsStateTearOff {
  const _$AppErrorsStateTearOff();

  _AppErrorsState call({required String failure}) {
    return _AppErrorsState(
      failure: failure,
    );
  }

  AppErrorsState fromJson(Map<String, Object> json) {
    return AppErrorsState.fromJson(json);
  }
}

/// @nodoc
const $AppErrorsState = _$AppErrorsStateTearOff();

/// @nodoc
mixin _$AppErrorsState {
  String get failure => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppErrorsStateCopyWith<AppErrorsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppErrorsStateCopyWith<$Res> {
  factory $AppErrorsStateCopyWith(
          AppErrorsState value, $Res Function(AppErrorsState) then) =
      _$AppErrorsStateCopyWithImpl<$Res>;
  $Res call({String failure});
}

/// @nodoc
class _$AppErrorsStateCopyWithImpl<$Res>
    implements $AppErrorsStateCopyWith<$Res> {
  _$AppErrorsStateCopyWithImpl(this._value, this._then);

  final AppErrorsState _value;
  // ignore: unused_field
  final $Res Function(AppErrorsState) _then;

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
abstract class _$AppErrorsStateCopyWith<$Res>
    implements $AppErrorsStateCopyWith<$Res> {
  factory _$AppErrorsStateCopyWith(
          _AppErrorsState value, $Res Function(_AppErrorsState) then) =
      __$AppErrorsStateCopyWithImpl<$Res>;
  @override
  $Res call({String failure});
}

/// @nodoc
class __$AppErrorsStateCopyWithImpl<$Res>
    extends _$AppErrorsStateCopyWithImpl<$Res>
    implements _$AppErrorsStateCopyWith<$Res> {
  __$AppErrorsStateCopyWithImpl(
      _AppErrorsState _value, $Res Function(_AppErrorsState) _then)
      : super(_value, (v) => _then(v as _AppErrorsState));

  @override
  _AppErrorsState get _value => super._value as _AppErrorsState;

  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(_AppErrorsState(
      failure: failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppErrorsState implements _AppErrorsState {
  _$_AppErrorsState({required this.failure});

  factory _$_AppErrorsState.fromJson(Map<String, dynamic> json) =>
      _$_$_AppErrorsStateFromJson(json);

  @override
  final String failure;

  @override
  String toString() {
    return 'AppErrorsState(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AppErrorsState &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failure);

  @JsonKey(ignore: true)
  @override
  _$AppErrorsStateCopyWith<_AppErrorsState> get copyWith =>
      __$AppErrorsStateCopyWithImpl<_AppErrorsState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AppErrorsStateToJson(this);
  }
}

abstract class _AppErrorsState implements AppErrorsState {
  factory _AppErrorsState({required String failure}) = _$_AppErrorsState;

  factory _AppErrorsState.fromJson(Map<String, dynamic> json) =
      _$_AppErrorsState.fromJson;

  @override
  String get failure => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AppErrorsStateCopyWith<_AppErrorsState> get copyWith =>
      throw _privateConstructorUsedError;
}
