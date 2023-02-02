// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'condition_edge.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ConditionRelayConnection _$ConditionRelayConnectionFromJson(
    Map<String, dynamic> json) {
  return _ConditionRelayConnection.fromJson(json);
}

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
      _$ConditionRelayConnectionCopyWithImpl<$Res, ConditionRelayConnection>;
  @useResult
  $Res call(
      {@JsonKey(name: 'edges') List<ConditionEdgeRelay?>? edges,
      @JsonKey(name: 'pageInfo') PageInfo? pageInfo});

  $PageInfoCopyWith<$Res>? get pageInfo;
}

/// @nodoc
class _$ConditionRelayConnectionCopyWithImpl<$Res,
        $Val extends ConditionRelayConnection>
    implements $ConditionRelayConnectionCopyWith<$Res> {
  _$ConditionRelayConnectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? edges = freezed,
    Object? pageInfo = freezed,
  }) {
    return _then(_value.copyWith(
      edges: freezed == edges
          ? _value.edges
          : edges // ignore: cast_nullable_to_non_nullable
              as List<ConditionEdgeRelay?>?,
      pageInfo: freezed == pageInfo
          ? _value.pageInfo
          : pageInfo // ignore: cast_nullable_to_non_nullable
              as PageInfo?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PageInfoCopyWith<$Res>? get pageInfo {
    if (_value.pageInfo == null) {
      return null;
    }

    return $PageInfoCopyWith<$Res>(_value.pageInfo!, (value) {
      return _then(_value.copyWith(pageInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ConditionRelayConnectionCopyWith<$Res>
    implements $ConditionRelayConnectionCopyWith<$Res> {
  factory _$$_ConditionRelayConnectionCopyWith(
          _$_ConditionRelayConnection value,
          $Res Function(_$_ConditionRelayConnection) then) =
      __$$_ConditionRelayConnectionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'edges') List<ConditionEdgeRelay?>? edges,
      @JsonKey(name: 'pageInfo') PageInfo? pageInfo});

  @override
  $PageInfoCopyWith<$Res>? get pageInfo;
}

/// @nodoc
class __$$_ConditionRelayConnectionCopyWithImpl<$Res>
    extends _$ConditionRelayConnectionCopyWithImpl<$Res,
        _$_ConditionRelayConnection>
    implements _$$_ConditionRelayConnectionCopyWith<$Res> {
  __$$_ConditionRelayConnectionCopyWithImpl(_$_ConditionRelayConnection _value,
      $Res Function(_$_ConditionRelayConnection) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? edges = freezed,
    Object? pageInfo = freezed,
  }) {
    return _then(_$_ConditionRelayConnection(
      edges: freezed == edges
          ? _value._edges
          : edges // ignore: cast_nullable_to_non_nullable
              as List<ConditionEdgeRelay?>?,
      pageInfo: freezed == pageInfo
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
      {@JsonKey(name: 'edges') final List<ConditionEdgeRelay?>? edges,
      @JsonKey(name: 'pageInfo') this.pageInfo})
      : _edges = edges;

  factory _$_ConditionRelayConnection.fromJson(Map<String, dynamic> json) =>
      _$$_ConditionRelayConnectionFromJson(json);

  final List<ConditionEdgeRelay?>? _edges;
  @override
  @JsonKey(name: 'edges')
  List<ConditionEdgeRelay?>? get edges {
    final value = _edges;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

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
        (other.runtimeType == runtimeType &&
            other is _$_ConditionRelayConnection &&
            const DeepCollectionEquality().equals(other._edges, _edges) &&
            (identical(other.pageInfo, pageInfo) ||
                other.pageInfo == pageInfo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_edges), pageInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ConditionRelayConnectionCopyWith<_$_ConditionRelayConnection>
      get copyWith => __$$_ConditionRelayConnectionCopyWithImpl<
          _$_ConditionRelayConnection>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ConditionRelayConnectionToJson(
      this,
    );
  }
}

abstract class _ConditionRelayConnection implements ConditionRelayConnection {
  factory _ConditionRelayConnection(
          {@JsonKey(name: 'edges') final List<ConditionEdgeRelay?>? edges,
          @JsonKey(name: 'pageInfo') final PageInfo? pageInfo}) =
      _$_ConditionRelayConnection;

  factory _ConditionRelayConnection.fromJson(Map<String, dynamic> json) =
      _$_ConditionRelayConnection.fromJson;

  @override
  @JsonKey(name: 'edges')
  List<ConditionEdgeRelay?>? get edges;
  @override
  @JsonKey(name: 'pageInfo')
  PageInfo? get pageInfo;
  @override
  @JsonKey(ignore: true)
  _$$_ConditionRelayConnectionCopyWith<_$_ConditionRelayConnection>
      get copyWith => throw _privateConstructorUsedError;
}

ConditionEdgeRelay _$ConditionEdgeRelayFromJson(Map<String, dynamic> json) {
  return _ConditionEdgeRelay.fromJson(json);
}

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
      _$ConditionEdgeRelayCopyWithImpl<$Res, ConditionEdgeRelay>;
  @useResult
  $Res call(
      {@JsonKey(name: 'cursor') String? cursor,
      @JsonKey(name: 'node') Condition? node});

  $ConditionCopyWith<$Res>? get node;
}

/// @nodoc
class _$ConditionEdgeRelayCopyWithImpl<$Res, $Val extends ConditionEdgeRelay>
    implements $ConditionEdgeRelayCopyWith<$Res> {
  _$ConditionEdgeRelayCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cursor = freezed,
    Object? node = freezed,
  }) {
    return _then(_value.copyWith(
      cursor: freezed == cursor
          ? _value.cursor
          : cursor // ignore: cast_nullable_to_non_nullable
              as String?,
      node: freezed == node
          ? _value.node
          : node // ignore: cast_nullable_to_non_nullable
              as Condition?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ConditionCopyWith<$Res>? get node {
    if (_value.node == null) {
      return null;
    }

    return $ConditionCopyWith<$Res>(_value.node!, (value) {
      return _then(_value.copyWith(node: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ConditionEdgeRelayCopyWith<$Res>
    implements $ConditionEdgeRelayCopyWith<$Res> {
  factory _$$_ConditionEdgeRelayCopyWith(_$_ConditionEdgeRelay value,
          $Res Function(_$_ConditionEdgeRelay) then) =
      __$$_ConditionEdgeRelayCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'cursor') String? cursor,
      @JsonKey(name: 'node') Condition? node});

  @override
  $ConditionCopyWith<$Res>? get node;
}

/// @nodoc
class __$$_ConditionEdgeRelayCopyWithImpl<$Res>
    extends _$ConditionEdgeRelayCopyWithImpl<$Res, _$_ConditionEdgeRelay>
    implements _$$_ConditionEdgeRelayCopyWith<$Res> {
  __$$_ConditionEdgeRelayCopyWithImpl(
      _$_ConditionEdgeRelay _value, $Res Function(_$_ConditionEdgeRelay) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cursor = freezed,
    Object? node = freezed,
  }) {
    return _then(_$_ConditionEdgeRelay(
      cursor: freezed == cursor
          ? _value.cursor
          : cursor // ignore: cast_nullable_to_non_nullable
              as String?,
      node: freezed == node
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
      _$$_ConditionEdgeRelayFromJson(json);

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
        (other.runtimeType == runtimeType &&
            other is _$_ConditionEdgeRelay &&
            (identical(other.cursor, cursor) || other.cursor == cursor) &&
            (identical(other.node, node) || other.node == node));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, cursor, node);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ConditionEdgeRelayCopyWith<_$_ConditionEdgeRelay> get copyWith =>
      __$$_ConditionEdgeRelayCopyWithImpl<_$_ConditionEdgeRelay>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ConditionEdgeRelayToJson(
      this,
    );
  }
}

abstract class _ConditionEdgeRelay implements ConditionEdgeRelay {
  factory _ConditionEdgeRelay(
      {@JsonKey(name: 'cursor') final String? cursor,
      @JsonKey(name: 'node') final Condition? node}) = _$_ConditionEdgeRelay;

  factory _ConditionEdgeRelay.fromJson(Map<String, dynamic> json) =
      _$_ConditionEdgeRelay.fromJson;

  @override
  @JsonKey(name: 'cursor')
  String? get cursor;
  @override
  @JsonKey(name: 'node')
  Condition? get node;
  @override
  @JsonKey(ignore: true)
  _$$_ConditionEdgeRelayCopyWith<_$_ConditionEdgeRelay> get copyWith =>
      throw _privateConstructorUsedError;
}
