// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'medication_edge.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MedicationRelayConnection _$MedicationRelayConnectionFromJson(
    Map<String, dynamic> json) {
  return _MedicationRelayConnection.fromJson(json);
}

/// @nodoc
class _$MedicationRelayConnectionTearOff {
  const _$MedicationRelayConnectionTearOff();

  _MedicationRelayConnection call(
      {@JsonKey(name: 'edges') List<MedicationEdgeRelay?>? edges,
      @JsonKey(name: 'pageInfo') PageInfo? pageInfo}) {
    return _MedicationRelayConnection(
      edges: edges,
      pageInfo: pageInfo,
    );
  }

  MedicationRelayConnection fromJson(Map<String, Object> json) {
    return MedicationRelayConnection.fromJson(json);
  }
}

/// @nodoc
const $MedicationRelayConnection = _$MedicationRelayConnectionTearOff();

/// @nodoc
mixin _$MedicationRelayConnection {
  @JsonKey(name: 'edges')
  List<MedicationEdgeRelay?>? get edges => throw _privateConstructorUsedError;
  @JsonKey(name: 'pageInfo')
  PageInfo? get pageInfo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MedicationRelayConnectionCopyWith<MedicationRelayConnection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedicationRelayConnectionCopyWith<$Res> {
  factory $MedicationRelayConnectionCopyWith(MedicationRelayConnection value,
          $Res Function(MedicationRelayConnection) then) =
      _$MedicationRelayConnectionCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'edges') List<MedicationEdgeRelay?>? edges,
      @JsonKey(name: 'pageInfo') PageInfo? pageInfo});

  $PageInfoCopyWith<$Res>? get pageInfo;
}

/// @nodoc
class _$MedicationRelayConnectionCopyWithImpl<$Res>
    implements $MedicationRelayConnectionCopyWith<$Res> {
  _$MedicationRelayConnectionCopyWithImpl(this._value, this._then);

  final MedicationRelayConnection _value;
  // ignore: unused_field
  final $Res Function(MedicationRelayConnection) _then;

  @override
  $Res call({
    Object? edges = freezed,
    Object? pageInfo = freezed,
  }) {
    return _then(_value.copyWith(
      edges: edges == freezed
          ? _value.edges
          : edges // ignore: cast_nullable_to_non_nullable
              as List<MedicationEdgeRelay?>?,
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
abstract class _$MedicationRelayConnectionCopyWith<$Res>
    implements $MedicationRelayConnectionCopyWith<$Res> {
  factory _$MedicationRelayConnectionCopyWith(_MedicationRelayConnection value,
          $Res Function(_MedicationRelayConnection) then) =
      __$MedicationRelayConnectionCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'edges') List<MedicationEdgeRelay?>? edges,
      @JsonKey(name: 'pageInfo') PageInfo? pageInfo});

  @override
  $PageInfoCopyWith<$Res>? get pageInfo;
}

/// @nodoc
class __$MedicationRelayConnectionCopyWithImpl<$Res>
    extends _$MedicationRelayConnectionCopyWithImpl<$Res>
    implements _$MedicationRelayConnectionCopyWith<$Res> {
  __$MedicationRelayConnectionCopyWithImpl(_MedicationRelayConnection _value,
      $Res Function(_MedicationRelayConnection) _then)
      : super(_value, (v) => _then(v as _MedicationRelayConnection));

  @override
  _MedicationRelayConnection get _value =>
      super._value as _MedicationRelayConnection;

  @override
  $Res call({
    Object? edges = freezed,
    Object? pageInfo = freezed,
  }) {
    return _then(_MedicationRelayConnection(
      edges: edges == freezed
          ? _value.edges
          : edges // ignore: cast_nullable_to_non_nullable
              as List<MedicationEdgeRelay?>?,
      pageInfo: pageInfo == freezed
          ? _value.pageInfo
          : pageInfo // ignore: cast_nullable_to_non_nullable
              as PageInfo?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MedicationRelayConnection implements _MedicationRelayConnection {
  _$_MedicationRelayConnection(
      {@JsonKey(name: 'edges') this.edges,
      @JsonKey(name: 'pageInfo') this.pageInfo});

  factory _$_MedicationRelayConnection.fromJson(Map<String, dynamic> json) =>
      _$_$_MedicationRelayConnectionFromJson(json);

  @override
  @JsonKey(name: 'edges')
  final List<MedicationEdgeRelay?>? edges;
  @override
  @JsonKey(name: 'pageInfo')
  final PageInfo? pageInfo;

  @override
  String toString() {
    return 'MedicationRelayConnection(edges: $edges, pageInfo: $pageInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MedicationRelayConnection &&
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
  _$MedicationRelayConnectionCopyWith<_MedicationRelayConnection>
      get copyWith =>
          __$MedicationRelayConnectionCopyWithImpl<_MedicationRelayConnection>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MedicationRelayConnectionToJson(this);
  }
}

abstract class _MedicationRelayConnection implements MedicationRelayConnection {
  factory _MedicationRelayConnection(
          {@JsonKey(name: 'edges') List<MedicationEdgeRelay?>? edges,
          @JsonKey(name: 'pageInfo') PageInfo? pageInfo}) =
      _$_MedicationRelayConnection;

  factory _MedicationRelayConnection.fromJson(Map<String, dynamic> json) =
      _$_MedicationRelayConnection.fromJson;

  @override
  @JsonKey(name: 'edges')
  List<MedicationEdgeRelay?>? get edges => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'pageInfo')
  PageInfo? get pageInfo => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MedicationRelayConnectionCopyWith<_MedicationRelayConnection>
      get copyWith => throw _privateConstructorUsedError;
}

MedicationEdgeRelay _$MedicationEdgeRelayFromJson(Map<String, dynamic> json) {
  return _MedicationEdgeRelay.fromJson(json);
}

/// @nodoc
class _$MedicationEdgeRelayTearOff {
  const _$MedicationEdgeRelayTearOff();

  _MedicationEdgeRelay call(
      {@JsonKey(name: 'cursor') String? cursor,
      @JsonKey(name: 'node') Medication? node}) {
    return _MedicationEdgeRelay(
      cursor: cursor,
      node: node,
    );
  }

  MedicationEdgeRelay fromJson(Map<String, Object> json) {
    return MedicationEdgeRelay.fromJson(json);
  }
}

/// @nodoc
const $MedicationEdgeRelay = _$MedicationEdgeRelayTearOff();

/// @nodoc
mixin _$MedicationEdgeRelay {
  @JsonKey(name: 'cursor')
  String? get cursor => throw _privateConstructorUsedError;
  @JsonKey(name: 'node')
  Medication? get node => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MedicationEdgeRelayCopyWith<MedicationEdgeRelay> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedicationEdgeRelayCopyWith<$Res> {
  factory $MedicationEdgeRelayCopyWith(
          MedicationEdgeRelay value, $Res Function(MedicationEdgeRelay) then) =
      _$MedicationEdgeRelayCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'cursor') String? cursor,
      @JsonKey(name: 'node') Medication? node});

  $MedicationCopyWith<$Res>? get node;
}

/// @nodoc
class _$MedicationEdgeRelayCopyWithImpl<$Res>
    implements $MedicationEdgeRelayCopyWith<$Res> {
  _$MedicationEdgeRelayCopyWithImpl(this._value, this._then);

  final MedicationEdgeRelay _value;
  // ignore: unused_field
  final $Res Function(MedicationEdgeRelay) _then;

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
              as Medication?,
    ));
  }

  @override
  $MedicationCopyWith<$Res>? get node {
    if (_value.node == null) {
      return null;
    }

    return $MedicationCopyWith<$Res>(_value.node!, (value) {
      return _then(_value.copyWith(node: value));
    });
  }
}

/// @nodoc
abstract class _$MedicationEdgeRelayCopyWith<$Res>
    implements $MedicationEdgeRelayCopyWith<$Res> {
  factory _$MedicationEdgeRelayCopyWith(_MedicationEdgeRelay value,
          $Res Function(_MedicationEdgeRelay) then) =
      __$MedicationEdgeRelayCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'cursor') String? cursor,
      @JsonKey(name: 'node') Medication? node});

  @override
  $MedicationCopyWith<$Res>? get node;
}

/// @nodoc
class __$MedicationEdgeRelayCopyWithImpl<$Res>
    extends _$MedicationEdgeRelayCopyWithImpl<$Res>
    implements _$MedicationEdgeRelayCopyWith<$Res> {
  __$MedicationEdgeRelayCopyWithImpl(
      _MedicationEdgeRelay _value, $Res Function(_MedicationEdgeRelay) _then)
      : super(_value, (v) => _then(v as _MedicationEdgeRelay));

  @override
  _MedicationEdgeRelay get _value => super._value as _MedicationEdgeRelay;

  @override
  $Res call({
    Object? cursor = freezed,
    Object? node = freezed,
  }) {
    return _then(_MedicationEdgeRelay(
      cursor: cursor == freezed
          ? _value.cursor
          : cursor // ignore: cast_nullable_to_non_nullable
              as String?,
      node: node == freezed
          ? _value.node
          : node // ignore: cast_nullable_to_non_nullable
              as Medication?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MedicationEdgeRelay implements _MedicationEdgeRelay {
  _$_MedicationEdgeRelay(
      {@JsonKey(name: 'cursor') this.cursor, @JsonKey(name: 'node') this.node});

  factory _$_MedicationEdgeRelay.fromJson(Map<String, dynamic> json) =>
      _$_$_MedicationEdgeRelayFromJson(json);

  @override
  @JsonKey(name: 'cursor')
  final String? cursor;
  @override
  @JsonKey(name: 'node')
  final Medication? node;

  @override
  String toString() {
    return 'MedicationEdgeRelay(cursor: $cursor, node: $node)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MedicationEdgeRelay &&
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
  _$MedicationEdgeRelayCopyWith<_MedicationEdgeRelay> get copyWith =>
      __$MedicationEdgeRelayCopyWithImpl<_MedicationEdgeRelay>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MedicationEdgeRelayToJson(this);
  }
}

abstract class _MedicationEdgeRelay implements MedicationEdgeRelay {
  factory _MedicationEdgeRelay(
      {@JsonKey(name: 'cursor') String? cursor,
      @JsonKey(name: 'node') Medication? node}) = _$_MedicationEdgeRelay;

  factory _MedicationEdgeRelay.fromJson(Map<String, dynamic> json) =
      _$_MedicationEdgeRelay.fromJson;

  @override
  @JsonKey(name: 'cursor')
  String? get cursor => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'node')
  Medication? get node => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MedicationEdgeRelayCopyWith<_MedicationEdgeRelay> get copyWith =>
      throw _privateConstructorUsedError;
}
