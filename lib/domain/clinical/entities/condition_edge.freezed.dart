// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'condition_edge.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ConditionRelayConnection _$ConditionRelayConnectionFromJson(
    Map<String, dynamic> json) {
  return _ConditionRelayConnection.fromJson(json);
}

/// @nodoc
class _$ConditionRelayConnectionTearOff {
  const _$ConditionRelayConnectionTearOff();

  _ConditionRelayConnection call(
      {@JsonKey(name: 'edges') List<ConditionEdgeRelay?>? edges,
      @JsonKey(name: 'pageInfo') PageInfo? pageInfo}) {
    return _ConditionRelayConnection(
      edges: edges,
      pageInfo: pageInfo,
    );
  }

  ConditionRelayConnection fromJson(Map<String, Object> json) {
    return ConditionRelayConnection.fromJson(json);
  }
}

/// @nodoc
const $ConditionRelayConnection = _$ConditionRelayConnectionTearOff();

/// @nodoc
mixin _$ConditionRelayConnection {
  @JsonKey(name: 'edges')
  List<ConditionEdgeRelay?>? get edges => throw _privateConstructorUsedError;
  @JsonKey(name: 'pageInfo')
  PageInfo? get pageInfo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConditionRelayConnectionCopyWith<ConditionRelayConnection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConditionRelayConnectionCopyWith<$Res> {
  factory $ConditionRelayConnectionCopyWith(ConditionRelayConnection value,
          $Res Function(ConditionRelayConnection) then) =
      _$ConditionRelayConnectionCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'edges') List<ConditionEdgeRelay?>? edges,
      @JsonKey(name: 'pageInfo') PageInfo? pageInfo});

  $PageInfoCopyWith<$Res>? get pageInfo;
}

/// @nodoc
class _$ConditionRelayConnectionCopyWithImpl<$Res>
    implements $ConditionRelayConnectionCopyWith<$Res> {
  _$ConditionRelayConnectionCopyWithImpl(this._value, this._then);

  final ConditionRelayConnection _value;
  // ignore: unused_field
  final $Res Function(ConditionRelayConnection) _then;

  @override
  $Res call({
    Object? edges = freezed,
    Object? pageInfo = freezed,
  }) {
    return _then(_value.copyWith(
      edges: edges == freezed
          ? _value.edges
          : edges // ignore: cast_nullable_to_non_nullable
              as List<ConditionEdgeRelay?>?,
      pageInfo: pageInfo == freezed
          ? _value.pageInfo
          : pageInfo // ignore: cast_nullable_to_non_nullable
              as PageInfo?,
    ));
  }

  @override
  $PageInfoCopyWith<$Res>? get pageInfo {
    if (_value.pageInfo == null) {
      return null;
    }

    return $PageInfoCopyWith<$Res>(_value.pageInfo!, (value) {
      return _then(_value.copyWith(pageInfo: value));
    });
  }
}

/// @nodoc
abstract class _$ConditionRelayConnectionCopyWith<$Res>
    implements $ConditionRelayConnectionCopyWith<$Res> {
  factory _$ConditionRelayConnectionCopyWith(_ConditionRelayConnection value,
          $Res Function(_ConditionRelayConnection) then) =
      __$ConditionRelayConnectionCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'edges') List<ConditionEdgeRelay?>? edges,
      @JsonKey(name: 'pageInfo') PageInfo? pageInfo});

  @override
  $PageInfoCopyWith<$Res>? get pageInfo;
}

/// @nodoc
class __$ConditionRelayConnectionCopyWithImpl<$Res>
    extends _$ConditionRelayConnectionCopyWithImpl<$Res>
    implements _$ConditionRelayConnectionCopyWith<$Res> {
  __$ConditionRelayConnectionCopyWithImpl(_ConditionRelayConnection _value,
      $Res Function(_ConditionRelayConnection) _then)
      : super(_value, (v) => _then(v as _ConditionRelayConnection));

  @override
  _ConditionRelayConnection get _value =>
      super._value as _ConditionRelayConnection;

  @override
  $Res call({
    Object? edges = freezed,
    Object? pageInfo = freezed,
  }) {
    return _then(_ConditionRelayConnection(
      edges: edges == freezed
          ? _value.edges
          : edges // ignore: cast_nullable_to_non_nullable
              as List<ConditionEdgeRelay?>?,
      pageInfo: pageInfo == freezed
          ? _value.pageInfo
          : pageInfo // ignore: cast_nullable_to_non_nullable
              as PageInfo?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ConditionRelayConnection implements _ConditionRelayConnection {
  _$_ConditionRelayConnection(
      {@JsonKey(name: 'edges') this.edges,
      @JsonKey(name: 'pageInfo') this.pageInfo});

  factory _$_ConditionRelayConnection.fromJson(Map<String, dynamic> json) =>
      _$_$_ConditionRelayConnectionFromJson(json);

  @override
  @JsonKey(name: 'edges')
  final List<ConditionEdgeRelay?>? edges;
  @override
  @JsonKey(name: 'pageInfo')
  final PageInfo? pageInfo;

  @override
  String toString() {
    return 'ConditionRelayConnection(edges: $edges, pageInfo: $pageInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ConditionRelayConnection &&
            (identical(other.edges, edges) ||
                const DeepCollectionEquality().equals(other.edges, edges)) &&
            (identical(other.pageInfo, pageInfo) ||
                const DeepCollectionEquality()
                    .equals(other.pageInfo, pageInfo)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(edges) ^
      const DeepCollectionEquality().hash(pageInfo);

  @JsonKey(ignore: true)
  @override
  _$ConditionRelayConnectionCopyWith<_ConditionRelayConnection> get copyWith =>
      __$ConditionRelayConnectionCopyWithImpl<_ConditionRelayConnection>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ConditionRelayConnectionToJson(this);
  }
}

abstract class _ConditionRelayConnection implements ConditionRelayConnection {
  factory _ConditionRelayConnection(
          {@JsonKey(name: 'edges') List<ConditionEdgeRelay?>? edges,
          @JsonKey(name: 'pageInfo') PageInfo? pageInfo}) =
      _$_ConditionRelayConnection;

  factory _ConditionRelayConnection.fromJson(Map<String, dynamic> json) =
      _$_ConditionRelayConnection.fromJson;

  @override
  @JsonKey(name: 'edges')
  List<ConditionEdgeRelay?>? get edges => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'pageInfo')
  PageInfo? get pageInfo => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ConditionRelayConnectionCopyWith<_ConditionRelayConnection> get copyWith =>
      throw _privateConstructorUsedError;
}

ConditionEdgeRelay _$ConditionEdgeRelayFromJson(Map<String, dynamic> json) {
  return _ConditionEdgeRelay.fromJson(json);
}

/// @nodoc
class _$ConditionEdgeRelayTearOff {
  const _$ConditionEdgeRelayTearOff();

  _ConditionEdgeRelay call(
      {@JsonKey(name: 'cursor') String? cursor,
      @JsonKey(name: 'node') Condition? node}) {
    return _ConditionEdgeRelay(
      cursor: cursor,
      node: node,
    );
  }

  ConditionEdgeRelay fromJson(Map<String, Object> json) {
    return ConditionEdgeRelay.fromJson(json);
  }
}

/// @nodoc
const $ConditionEdgeRelay = _$ConditionEdgeRelayTearOff();

/// @nodoc
mixin _$ConditionEdgeRelay {
  @JsonKey(name: 'cursor')
  String? get cursor => throw _privateConstructorUsedError;
  @JsonKey(name: 'node')
  Condition? get node => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConditionEdgeRelayCopyWith<ConditionEdgeRelay> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConditionEdgeRelayCopyWith<$Res> {
  factory $ConditionEdgeRelayCopyWith(
          ConditionEdgeRelay value, $Res Function(ConditionEdgeRelay) then) =
      _$ConditionEdgeRelayCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'cursor') String? cursor,
      @JsonKey(name: 'node') Condition? node});

  $ConditionCopyWith<$Res>? get node;
}

/// @nodoc
class _$ConditionEdgeRelayCopyWithImpl<$Res>
    implements $ConditionEdgeRelayCopyWith<$Res> {
  _$ConditionEdgeRelayCopyWithImpl(this._value, this._then);

  final ConditionEdgeRelay _value;
  // ignore: unused_field
  final $Res Function(ConditionEdgeRelay) _then;

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
              as Condition?,
    ));
  }

  @override
  $ConditionCopyWith<$Res>? get node {
    if (_value.node == null) {
      return null;
    }

    return $ConditionCopyWith<$Res>(_value.node!, (value) {
      return _then(_value.copyWith(node: value));
    });
  }
}

/// @nodoc
abstract class _$ConditionEdgeRelayCopyWith<$Res>
    implements $ConditionEdgeRelayCopyWith<$Res> {
  factory _$ConditionEdgeRelayCopyWith(
          _ConditionEdgeRelay value, $Res Function(_ConditionEdgeRelay) then) =
      __$ConditionEdgeRelayCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'cursor') String? cursor,
      @JsonKey(name: 'node') Condition? node});

  @override
  $ConditionCopyWith<$Res>? get node;
}

/// @nodoc
class __$ConditionEdgeRelayCopyWithImpl<$Res>
    extends _$ConditionEdgeRelayCopyWithImpl<$Res>
    implements _$ConditionEdgeRelayCopyWith<$Res> {
  __$ConditionEdgeRelayCopyWithImpl(
      _ConditionEdgeRelay _value, $Res Function(_ConditionEdgeRelay) _then)
      : super(_value, (v) => _then(v as _ConditionEdgeRelay));

  @override
  _ConditionEdgeRelay get _value => super._value as _ConditionEdgeRelay;

  @override
  $Res call({
    Object? cursor = freezed,
    Object? node = freezed,
  }) {
    return _then(_ConditionEdgeRelay(
      cursor: cursor == freezed
          ? _value.cursor
          : cursor // ignore: cast_nullable_to_non_nullable
              as String?,
      node: node == freezed
          ? _value.node
          : node // ignore: cast_nullable_to_non_nullable
              as Condition?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ConditionEdgeRelay implements _ConditionEdgeRelay {
  _$_ConditionEdgeRelay(
      {@JsonKey(name: 'cursor') this.cursor, @JsonKey(name: 'node') this.node});

  factory _$_ConditionEdgeRelay.fromJson(Map<String, dynamic> json) =>
      _$_$_ConditionEdgeRelayFromJson(json);

  @override
  @JsonKey(name: 'cursor')
  final String? cursor;
  @override
  @JsonKey(name: 'node')
  final Condition? node;

  @override
  String toString() {
    return 'ConditionEdgeRelay(cursor: $cursor, node: $node)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ConditionEdgeRelay &&
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
  _$ConditionEdgeRelayCopyWith<_ConditionEdgeRelay> get copyWith =>
      __$ConditionEdgeRelayCopyWithImpl<_ConditionEdgeRelay>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ConditionEdgeRelayToJson(this);
  }
}

abstract class _ConditionEdgeRelay implements ConditionEdgeRelay {
  factory _ConditionEdgeRelay(
      {@JsonKey(name: 'cursor') String? cursor,
      @JsonKey(name: 'node') Condition? node}) = _$_ConditionEdgeRelay;

  factory _ConditionEdgeRelay.fromJson(Map<String, dynamic> json) =
      _$_ConditionEdgeRelay.fromJson;

  @override
  @JsonKey(name: 'cursor')
  String? get cursor => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'node')
  Condition? get node => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ConditionEdgeRelayCopyWith<_ConditionEdgeRelay> get copyWith =>
      throw _privateConstructorUsedError;
}
