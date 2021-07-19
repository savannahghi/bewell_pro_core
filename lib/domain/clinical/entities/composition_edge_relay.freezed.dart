// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'composition_edge_relay.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CompositionEdgeRelay _$CompositionEdgeRelayFromJson(Map<String, dynamic> json) {
  return _CompositionEdgeRelay.fromJson(json);
}

/// @nodoc
class _$CompositionEdgeRelayTearOff {
  const _$CompositionEdgeRelayTearOff();

  _CompositionEdgeRelay call(
      {@JsonKey(name: 'cursor') String? cursor,
      @JsonKey(name: 'node') Composition? node}) {
    return _CompositionEdgeRelay(
      cursor: cursor,
      node: node,
    );
  }

  CompositionEdgeRelay fromJson(Map<String, Object> json) {
    return CompositionEdgeRelay.fromJson(json);
  }
}

/// @nodoc
const $CompositionEdgeRelay = _$CompositionEdgeRelayTearOff();

/// @nodoc
mixin _$CompositionEdgeRelay {
  @JsonKey(name: 'cursor')
  String? get cursor => throw _privateConstructorUsedError;
  @JsonKey(name: 'node')
  Composition? get node => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CompositionEdgeRelayCopyWith<CompositionEdgeRelay> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompositionEdgeRelayCopyWith<$Res> {
  factory $CompositionEdgeRelayCopyWith(CompositionEdgeRelay value,
          $Res Function(CompositionEdgeRelay) then) =
      _$CompositionEdgeRelayCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'cursor') String? cursor,
      @JsonKey(name: 'node') Composition? node});

  $CompositionCopyWith<$Res>? get node;
}

/// @nodoc
class _$CompositionEdgeRelayCopyWithImpl<$Res>
    implements $CompositionEdgeRelayCopyWith<$Res> {
  _$CompositionEdgeRelayCopyWithImpl(this._value, this._then);

  final CompositionEdgeRelay _value;
  // ignore: unused_field
  final $Res Function(CompositionEdgeRelay) _then;

  @override
  $Res call({
    Object? cursor = freezed,
    Object? node = freezed,
  }) {
    return _then(_value.copyWith(
      cursor: cursor == freezed
          ? _value.cursor
          : cursor // ignore: cast_nullable_to_non_nullable
              as String?,
      node: node == freezed
          ? _value.node
          : node // ignore: cast_nullable_to_non_nullable
              as Composition?,
    ));
  }

  @override
  $CompositionCopyWith<$Res>? get node {
    if (_value.node == null) {
      return null;
    }

    return $CompositionCopyWith<$Res>(_value.node!, (value) {
      return _then(_value.copyWith(node: value));
    });
  }
}

/// @nodoc
abstract class _$CompositionEdgeRelayCopyWith<$Res>
    implements $CompositionEdgeRelayCopyWith<$Res> {
  factory _$CompositionEdgeRelayCopyWith(_CompositionEdgeRelay value,
          $Res Function(_CompositionEdgeRelay) then) =
      __$CompositionEdgeRelayCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'cursor') String? cursor,
      @JsonKey(name: 'node') Composition? node});

  @override
  $CompositionCopyWith<$Res>? get node;
}

/// @nodoc
class __$CompositionEdgeRelayCopyWithImpl<$Res>
    extends _$CompositionEdgeRelayCopyWithImpl<$Res>
    implements _$CompositionEdgeRelayCopyWith<$Res> {
  __$CompositionEdgeRelayCopyWithImpl(
      _CompositionEdgeRelay _value, $Res Function(_CompositionEdgeRelay) _then)
      : super(_value, (v) => _then(v as _CompositionEdgeRelay));

  @override
  _CompositionEdgeRelay get _value => super._value as _CompositionEdgeRelay;

  @override
  $Res call({
    Object? cursor = freezed,
    Object? node = freezed,
  }) {
    return _then(_CompositionEdgeRelay(
      cursor: cursor == freezed
          ? _value.cursor
          : cursor // ignore: cast_nullable_to_non_nullable
              as String?,
      node: node == freezed
          ? _value.node
          : node // ignore: cast_nullable_to_non_nullable
              as Composition?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CompositionEdgeRelay implements _CompositionEdgeRelay {
  _$_CompositionEdgeRelay(
      {@JsonKey(name: 'cursor') this.cursor, @JsonKey(name: 'node') this.node});

  factory _$_CompositionEdgeRelay.fromJson(Map<String, dynamic> json) =>
      _$_$_CompositionEdgeRelayFromJson(json);

  @override
  @JsonKey(name: 'cursor')
  final String? cursor;
  @override
  @JsonKey(name: 'node')
  final Composition? node;

  @override
  String toString() {
    return 'CompositionEdgeRelay(cursor: $cursor, node: $node)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CompositionEdgeRelay &&
            (identical(other.cursor, cursor) ||
                const DeepCollectionEquality().equals(other.cursor, cursor)) &&
            (identical(other.node, node) ||
                const DeepCollectionEquality().equals(other.node, node)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(cursor) ^
      const DeepCollectionEquality().hash(node);

  @JsonKey(ignore: true)
  @override
  _$CompositionEdgeRelayCopyWith<_CompositionEdgeRelay> get copyWith =>
      __$CompositionEdgeRelayCopyWithImpl<_CompositionEdgeRelay>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CompositionEdgeRelayToJson(this);
  }
}

abstract class _CompositionEdgeRelay implements CompositionEdgeRelay {
  factory _CompositionEdgeRelay(
      {@JsonKey(name: 'cursor') String? cursor,
      @JsonKey(name: 'node') Composition? node}) = _$_CompositionEdgeRelay;

  factory _CompositionEdgeRelay.fromJson(Map<String, dynamic> json) =
      _$_CompositionEdgeRelay.fromJson;

  @override
  @JsonKey(name: 'cursor')
  String? get cursor => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'node')
  Composition? get node => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CompositionEdgeRelayCopyWith<_CompositionEdgeRelay> get copyWith =>
      throw _privateConstructorUsedError;
}
