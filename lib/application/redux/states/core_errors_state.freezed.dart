// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'core_errors_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CoreErrorsState _$CoreErrorsStateFromJson(Map<String, dynamic> json) {
  return _CoreErrorsState.fromJson(json);
}

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
      _$CoreErrorsStateCopyWithImpl<$Res, CoreErrorsState>;
  @useResult
  $Res call({String failure});
}

/// @nodoc
class _$CoreErrorsStateCopyWithImpl<$Res, $Val extends CoreErrorsState>
    implements $CoreErrorsStateCopyWith<$Res> {
  _$CoreErrorsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_value.copyWith(
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CoreErrorsStateCopyWith<$Res>
    implements $CoreErrorsStateCopyWith<$Res> {
  factory _$$_CoreErrorsStateCopyWith(
          _$_CoreErrorsState value, $Res Function(_$_CoreErrorsState) then) =
      __$$_CoreErrorsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String failure});
}

/// @nodoc
class __$$_CoreErrorsStateCopyWithImpl<$Res>
    extends _$CoreErrorsStateCopyWithImpl<$Res, _$_CoreErrorsState>
    implements _$$_CoreErrorsStateCopyWith<$Res> {
  __$$_CoreErrorsStateCopyWithImpl(
      _$_CoreErrorsState _value, $Res Function(_$_CoreErrorsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$_CoreErrorsState(
      failure: null == failure
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
      _$$_CoreErrorsStateFromJson(json);

  @override
  final String failure;

  @override
  String toString() {
    return 'CoreErrorsState(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CoreErrorsState &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CoreErrorsStateCopyWith<_$_CoreErrorsState> get copyWith =>
      __$$_CoreErrorsStateCopyWithImpl<_$_CoreErrorsState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CoreErrorsStateToJson(
      this,
    );
  }
}

abstract class _CoreErrorsState implements CoreErrorsState {
  factory _CoreErrorsState({required final String failure}) =
      _$_CoreErrorsState;

  factory _CoreErrorsState.fromJson(Map<String, dynamic> json) =
      _$_CoreErrorsState.fromJson;

  @override
  String get failure;
  @override
  @JsonKey(ignore: true)
  _$$_CoreErrorsStateCopyWith<_$_CoreErrorsState> get copyWith =>
      throw _privateConstructorUsedError;
}
