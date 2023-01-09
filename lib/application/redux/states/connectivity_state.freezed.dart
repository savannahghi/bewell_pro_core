// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'connectivity_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ConnectivityState _$ConnectivityStateFromJson(Map<String, dynamic> json) {
  return _ConnectivityState.fromJson(json);
}

/// @nodoc
mixin _$ConnectivityState {
  bool get isConnected => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConnectivityStateCopyWith<ConnectivityState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectivityStateCopyWith<$Res> {
  factory $ConnectivityStateCopyWith(
          ConnectivityState value, $Res Function(ConnectivityState) then) =
      _$ConnectivityStateCopyWithImpl<$Res, ConnectivityState>;
  @useResult
  $Res call({bool isConnected});
}

/// @nodoc
class _$ConnectivityStateCopyWithImpl<$Res, $Val extends ConnectivityState>
    implements $ConnectivityStateCopyWith<$Res> {
  _$ConnectivityStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isConnected = null,
  }) {
    return _then(_value.copyWith(
      isConnected: null == isConnected
          ? _value.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ConnectivityStateCopyWith<$Res>
    implements $ConnectivityStateCopyWith<$Res> {
  factory _$$_ConnectivityStateCopyWith(_$_ConnectivityState value,
          $Res Function(_$_ConnectivityState) then) =
      __$$_ConnectivityStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isConnected});
}

/// @nodoc
class __$$_ConnectivityStateCopyWithImpl<$Res>
    extends _$ConnectivityStateCopyWithImpl<$Res, _$_ConnectivityState>
    implements _$$_ConnectivityStateCopyWith<$Res> {
  __$$_ConnectivityStateCopyWithImpl(
      _$_ConnectivityState _value, $Res Function(_$_ConnectivityState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isConnected = null,
  }) {
    return _then(_$_ConnectivityState(
      isConnected: null == isConnected
          ? _value.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ConnectivityState
    with DiagnosticableTreeMixin
    implements _ConnectivityState {
  _$_ConnectivityState({required this.isConnected});

  factory _$_ConnectivityState.fromJson(Map<String, dynamic> json) =>
      _$$_ConnectivityStateFromJson(json);

  @override
  final bool isConnected;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ConnectivityState(isConnected: $isConnected)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ConnectivityState'))
      ..add(DiagnosticsProperty('isConnected', isConnected));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConnectivityState &&
            (identical(other.isConnected, isConnected) ||
                other.isConnected == isConnected));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isConnected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ConnectivityStateCopyWith<_$_ConnectivityState> get copyWith =>
      __$$_ConnectivityStateCopyWithImpl<_$_ConnectivityState>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ConnectivityStateToJson(
      this,
    );
  }
}

abstract class _ConnectivityState implements ConnectivityState {
  factory _ConnectivityState({required final bool isConnected}) =
      _$_ConnectivityState;

  factory _ConnectivityState.fromJson(Map<String, dynamic> json) =
      _$_ConnectivityState.fromJson;

  @override
  bool get isConnected;
  @override
  @JsonKey(ignore: true)
  _$$_ConnectivityStateCopyWith<_$_ConnectivityState> get copyWith =>
      throw _privateConstructorUsedError;
}
