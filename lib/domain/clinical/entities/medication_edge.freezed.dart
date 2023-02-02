// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'medication_edge.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MedicationRelayConnection _$MedicationRelayConnectionFromJson(
    Map<String, dynamic> json) {
  return _MedicationRelayConnection.fromJson(json);
}

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
      _$MedicationRelayConnectionCopyWithImpl<$Res, MedicationRelayConnection>;
  @useResult
  $Res call(
      {@JsonKey(name: 'edges') List<MedicationEdgeRelay?>? edges,
      @JsonKey(name: 'pageInfo') PageInfo? pageInfo});

  $PageInfoCopyWith<$Res>? get pageInfo;
}

/// @nodoc
class _$MedicationRelayConnectionCopyWithImpl<$Res,
        $Val extends MedicationRelayConnection>
    implements $MedicationRelayConnectionCopyWith<$Res> {
  _$MedicationRelayConnectionCopyWithImpl(this._value, this._then);

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
              as List<MedicationEdgeRelay?>?,
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
abstract class _$$_MedicationRelayConnectionCopyWith<$Res>
    implements $MedicationRelayConnectionCopyWith<$Res> {
  factory _$$_MedicationRelayConnectionCopyWith(
          _$_MedicationRelayConnection value,
          $Res Function(_$_MedicationRelayConnection) then) =
      __$$_MedicationRelayConnectionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'edges') List<MedicationEdgeRelay?>? edges,
      @JsonKey(name: 'pageInfo') PageInfo? pageInfo});

  @override
  $PageInfoCopyWith<$Res>? get pageInfo;
}

/// @nodoc
class __$$_MedicationRelayConnectionCopyWithImpl<$Res>
    extends _$MedicationRelayConnectionCopyWithImpl<$Res,
        _$_MedicationRelayConnection>
    implements _$$_MedicationRelayConnectionCopyWith<$Res> {
  __$$_MedicationRelayConnectionCopyWithImpl(
      _$_MedicationRelayConnection _value,
      $Res Function(_$_MedicationRelayConnection) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? edges = freezed,
    Object? pageInfo = freezed,
  }) {
    return _then(_$_MedicationRelayConnection(
      edges: freezed == edges
          ? _value._edges
          : edges // ignore: cast_nullable_to_non_nullable
              as List<MedicationEdgeRelay?>?,
      pageInfo: freezed == pageInfo
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
      {@JsonKey(name: 'edges') final List<MedicationEdgeRelay?>? edges,
      @JsonKey(name: 'pageInfo') this.pageInfo})
      : _edges = edges;

  factory _$_MedicationRelayConnection.fromJson(Map<String, dynamic> json) =>
      _$$_MedicationRelayConnectionFromJson(json);

  final List<MedicationEdgeRelay?>? _edges;
  @override
  @JsonKey(name: 'edges')
  List<MedicationEdgeRelay?>? get edges {
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
    return 'MedicationRelayConnection(edges: $edges, pageInfo: $pageInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MedicationRelayConnection &&
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
  _$$_MedicationRelayConnectionCopyWith<_$_MedicationRelayConnection>
      get copyWith => __$$_MedicationRelayConnectionCopyWithImpl<
          _$_MedicationRelayConnection>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MedicationRelayConnectionToJson(
      this,
    );
  }
}

abstract class _MedicationRelayConnection implements MedicationRelayConnection {
  factory _MedicationRelayConnection(
          {@JsonKey(name: 'edges') final List<MedicationEdgeRelay?>? edges,
          @JsonKey(name: 'pageInfo') final PageInfo? pageInfo}) =
      _$_MedicationRelayConnection;

  factory _MedicationRelayConnection.fromJson(Map<String, dynamic> json) =
      _$_MedicationRelayConnection.fromJson;

  @override
  @JsonKey(name: 'edges')
  List<MedicationEdgeRelay?>? get edges;
  @override
  @JsonKey(name: 'pageInfo')
  PageInfo? get pageInfo;
  @override
  @JsonKey(ignore: true)
  _$$_MedicationRelayConnectionCopyWith<_$_MedicationRelayConnection>
      get copyWith => throw _privateConstructorUsedError;
}

MedicationEdgeRelay _$MedicationEdgeRelayFromJson(Map<String, dynamic> json) {
  return _MedicationEdgeRelay.fromJson(json);
}

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
      _$MedicationEdgeRelayCopyWithImpl<$Res, MedicationEdgeRelay>;
  @useResult
  $Res call(
      {@JsonKey(name: 'cursor') String? cursor,
      @JsonKey(name: 'node') Medication? node});

  $MedicationCopyWith<$Res>? get node;
}

/// @nodoc
class _$MedicationEdgeRelayCopyWithImpl<$Res, $Val extends MedicationEdgeRelay>
    implements $MedicationEdgeRelayCopyWith<$Res> {
  _$MedicationEdgeRelayCopyWithImpl(this._value, this._then);

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
              as Medication?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MedicationCopyWith<$Res>? get node {
    if (_value.node == null) {
      return null;
    }

    return $MedicationCopyWith<$Res>(_value.node!, (value) {
      return _then(_value.copyWith(node: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MedicationEdgeRelayCopyWith<$Res>
    implements $MedicationEdgeRelayCopyWith<$Res> {
  factory _$$_MedicationEdgeRelayCopyWith(_$_MedicationEdgeRelay value,
          $Res Function(_$_MedicationEdgeRelay) then) =
      __$$_MedicationEdgeRelayCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'cursor') String? cursor,
      @JsonKey(name: 'node') Medication? node});

  @override
  $MedicationCopyWith<$Res>? get node;
}

/// @nodoc
class __$$_MedicationEdgeRelayCopyWithImpl<$Res>
    extends _$MedicationEdgeRelayCopyWithImpl<$Res, _$_MedicationEdgeRelay>
    implements _$$_MedicationEdgeRelayCopyWith<$Res> {
  __$$_MedicationEdgeRelayCopyWithImpl(_$_MedicationEdgeRelay _value,
      $Res Function(_$_MedicationEdgeRelay) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cursor = freezed,
    Object? node = freezed,
  }) {
    return _then(_$_MedicationEdgeRelay(
      cursor: freezed == cursor
          ? _value.cursor
          : cursor // ignore: cast_nullable_to_non_nullable
              as String?,
      node: freezed == node
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
      _$$_MedicationEdgeRelayFromJson(json);

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
        (other.runtimeType == runtimeType &&
            other is _$_MedicationEdgeRelay &&
            (identical(other.cursor, cursor) || other.cursor == cursor) &&
            (identical(other.node, node) || other.node == node));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, cursor, node);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MedicationEdgeRelayCopyWith<_$_MedicationEdgeRelay> get copyWith =>
      __$$_MedicationEdgeRelayCopyWithImpl<_$_MedicationEdgeRelay>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MedicationEdgeRelayToJson(
      this,
    );
  }
}

abstract class _MedicationEdgeRelay implements MedicationEdgeRelay {
  factory _MedicationEdgeRelay(
      {@JsonKey(name: 'cursor') final String? cursor,
      @JsonKey(name: 'node') final Medication? node}) = _$_MedicationEdgeRelay;

  factory _MedicationEdgeRelay.fromJson(Map<String, dynamic> json) =
      _$_MedicationEdgeRelay.fromJson;

  @override
  @JsonKey(name: 'cursor')
  String? get cursor;
  @override
  @JsonKey(name: 'node')
  Medication? get node;
  @override
  @JsonKey(ignore: true)
  _$$_MedicationEdgeRelayCopyWith<_$_MedicationEdgeRelay> get copyWith =>
      throw _privateConstructorUsedError;
}
