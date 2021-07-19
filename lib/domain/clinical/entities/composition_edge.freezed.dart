// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'composition_edge.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CompositionRelayConnection _$CompositionRelayConnectionFromJson(
    Map<String, dynamic> json) {
  return _CompositionRelayConnection.fromJson(json);
}

/// @nodoc
class _$CompositionRelayConnectionTearOff {
  const _$CompositionRelayConnectionTearOff();

  _CompositionRelayConnection call(
      {@JsonKey(name: 'pageInfo') PageInfo? pageInfo,
      @JsonKey(name: 'edges') List<CompositionEdgeRelay?>? edges}) {
    return _CompositionRelayConnection(
      pageInfo: pageInfo,
      edges: edges,
    );
  }

  CompositionRelayConnection fromJson(Map<String, Object> json) {
    return CompositionRelayConnection.fromJson(json);
  }
}

/// @nodoc
const $CompositionRelayConnection = _$CompositionRelayConnectionTearOff();

/// @nodoc
mixin _$CompositionRelayConnection {
  @JsonKey(name: 'pageInfo')
  PageInfo? get pageInfo => throw _privateConstructorUsedError;
  @JsonKey(name: 'edges')
  List<CompositionEdgeRelay?>? get edges => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CompositionRelayConnectionCopyWith<CompositionRelayConnection>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompositionRelayConnectionCopyWith<$Res> {
  factory $CompositionRelayConnectionCopyWith(CompositionRelayConnection value,
          $Res Function(CompositionRelayConnection) then) =
      _$CompositionRelayConnectionCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'pageInfo') PageInfo? pageInfo,
      @JsonKey(name: 'edges') List<CompositionEdgeRelay?>? edges});

  $PageInfoCopyWith<$Res>? get pageInfo;
}

/// @nodoc
class _$CompositionRelayConnectionCopyWithImpl<$Res>
    implements $CompositionRelayConnectionCopyWith<$Res> {
  _$CompositionRelayConnectionCopyWithImpl(this._value, this._then);

  final CompositionRelayConnection _value;
  // ignore: unused_field
  final $Res Function(CompositionRelayConnection) _then;

  @override
  $Res call({
    Object? pageInfo = freezed,
    Object? edges = freezed,
  }) {
    return _then(_value.copyWith(
      pageInfo: pageInfo == freezed
          ? _value.pageInfo
          : pageInfo // ignore: cast_nullable_to_non_nullable
              as PageInfo?,
      edges: edges == freezed
          ? _value.edges
          : edges // ignore: cast_nullable_to_non_nullable
              as List<CompositionEdgeRelay?>?,
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
abstract class _$CompositionRelayConnectionCopyWith<$Res>
    implements $CompositionRelayConnectionCopyWith<$Res> {
  factory _$CompositionRelayConnectionCopyWith(
          _CompositionRelayConnection value,
          $Res Function(_CompositionRelayConnection) then) =
      __$CompositionRelayConnectionCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'pageInfo') PageInfo? pageInfo,
      @JsonKey(name: 'edges') List<CompositionEdgeRelay?>? edges});

  @override
  $PageInfoCopyWith<$Res>? get pageInfo;
}

/// @nodoc
class __$CompositionRelayConnectionCopyWithImpl<$Res>
    extends _$CompositionRelayConnectionCopyWithImpl<$Res>
    implements _$CompositionRelayConnectionCopyWith<$Res> {
  __$CompositionRelayConnectionCopyWithImpl(_CompositionRelayConnection _value,
      $Res Function(_CompositionRelayConnection) _then)
      : super(_value, (v) => _then(v as _CompositionRelayConnection));

  @override
  _CompositionRelayConnection get _value =>
      super._value as _CompositionRelayConnection;

  @override
  $Res call({
    Object? pageInfo = freezed,
    Object? edges = freezed,
  }) {
    return _then(_CompositionRelayConnection(
      pageInfo: pageInfo == freezed
          ? _value.pageInfo
          : pageInfo // ignore: cast_nullable_to_non_nullable
              as PageInfo?,
      edges: edges == freezed
          ? _value.edges
          : edges // ignore: cast_nullable_to_non_nullable
              as List<CompositionEdgeRelay?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CompositionRelayConnection implements _CompositionRelayConnection {
  _$_CompositionRelayConnection(
      {@JsonKey(name: 'pageInfo') this.pageInfo,
      @JsonKey(name: 'edges') this.edges});

  factory _$_CompositionRelayConnection.fromJson(Map<String, dynamic> json) =>
      _$_$_CompositionRelayConnectionFromJson(json);

  @override
  @JsonKey(name: 'pageInfo')
  final PageInfo? pageInfo;
  @override
  @JsonKey(name: 'edges')
  final List<CompositionEdgeRelay?>? edges;

  @override
  String toString() {
    return 'CompositionRelayConnection(pageInfo: $pageInfo, edges: $edges)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CompositionRelayConnection &&
            (identical(other.pageInfo, pageInfo) ||
                const DeepCollectionEquality()
                    .equals(other.pageInfo, pageInfo)) &&
            (identical(other.edges, edges) ||
                const DeepCollectionEquality().equals(other.edges, edges)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(pageInfo) ^
      const DeepCollectionEquality().hash(edges);

  @JsonKey(ignore: true)
  @override
  _$CompositionRelayConnectionCopyWith<_CompositionRelayConnection>
      get copyWith => __$CompositionRelayConnectionCopyWithImpl<
          _CompositionRelayConnection>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CompositionRelayConnectionToJson(this);
  }
}

abstract class _CompositionRelayConnection
    implements CompositionRelayConnection {
  factory _CompositionRelayConnection(
          {@JsonKey(name: 'pageInfo') PageInfo? pageInfo,
          @JsonKey(name: 'edges') List<CompositionEdgeRelay?>? edges}) =
      _$_CompositionRelayConnection;

  factory _CompositionRelayConnection.fromJson(Map<String, dynamic> json) =
      _$_CompositionRelayConnection.fromJson;

  @override
  @JsonKey(name: 'pageInfo')
  PageInfo? get pageInfo => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'edges')
  List<CompositionEdgeRelay?>? get edges => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CompositionRelayConnectionCopyWith<_CompositionRelayConnection>
      get copyWith => throw _privateConstructorUsedError;
}
