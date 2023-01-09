// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'composition_edge.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CompositionRelayConnection _$CompositionRelayConnectionFromJson(
    Map<String, dynamic> json) {
  return _CompositionRelayConnection.fromJson(json);
}

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
      _$CompositionRelayConnectionCopyWithImpl<$Res,
          CompositionRelayConnection>;
  @useResult
  $Res call(
      {@JsonKey(name: 'pageInfo') PageInfo? pageInfo,
      @JsonKey(name: 'edges') List<CompositionEdgeRelay?>? edges});

  $PageInfoCopyWith<$Res>? get pageInfo;
}

/// @nodoc
class _$CompositionRelayConnectionCopyWithImpl<$Res,
        $Val extends CompositionRelayConnection>
    implements $CompositionRelayConnectionCopyWith<$Res> {
  _$CompositionRelayConnectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageInfo = freezed,
    Object? edges = freezed,
  }) {
    return _then(_value.copyWith(
      pageInfo: freezed == pageInfo
          ? _value.pageInfo
          : pageInfo // ignore: cast_nullable_to_non_nullable
              as PageInfo?,
      edges: freezed == edges
          ? _value.edges
          : edges // ignore: cast_nullable_to_non_nullable
              as List<CompositionEdgeRelay?>?,
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
abstract class _$$_CompositionRelayConnectionCopyWith<$Res>
    implements $CompositionRelayConnectionCopyWith<$Res> {
  factory _$$_CompositionRelayConnectionCopyWith(
          _$_CompositionRelayConnection value,
          $Res Function(_$_CompositionRelayConnection) then) =
      __$$_CompositionRelayConnectionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'pageInfo') PageInfo? pageInfo,
      @JsonKey(name: 'edges') List<CompositionEdgeRelay?>? edges});

  @override
  $PageInfoCopyWith<$Res>? get pageInfo;
}

/// @nodoc
class __$$_CompositionRelayConnectionCopyWithImpl<$Res>
    extends _$CompositionRelayConnectionCopyWithImpl<$Res,
        _$_CompositionRelayConnection>
    implements _$$_CompositionRelayConnectionCopyWith<$Res> {
  __$$_CompositionRelayConnectionCopyWithImpl(
      _$_CompositionRelayConnection _value,
      $Res Function(_$_CompositionRelayConnection) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageInfo = freezed,
    Object? edges = freezed,
  }) {
    return _then(_$_CompositionRelayConnection(
      pageInfo: freezed == pageInfo
          ? _value.pageInfo
          : pageInfo // ignore: cast_nullable_to_non_nullable
              as PageInfo?,
      edges: freezed == edges
          ? _value._edges
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
      @JsonKey(name: 'edges') final List<CompositionEdgeRelay?>? edges})
      : _edges = edges;

  factory _$_CompositionRelayConnection.fromJson(Map<String, dynamic> json) =>
      _$$_CompositionRelayConnectionFromJson(json);

  @override
  @JsonKey(name: 'pageInfo')
  final PageInfo? pageInfo;
  final List<CompositionEdgeRelay?>? _edges;
  @override
  @JsonKey(name: 'edges')
  List<CompositionEdgeRelay?>? get edges {
    final value = _edges;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CompositionRelayConnection(pageInfo: $pageInfo, edges: $edges)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CompositionRelayConnection &&
            (identical(other.pageInfo, pageInfo) ||
                other.pageInfo == pageInfo) &&
            const DeepCollectionEquality().equals(other._edges, _edges));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, pageInfo, const DeepCollectionEquality().hash(_edges));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CompositionRelayConnectionCopyWith<_$_CompositionRelayConnection>
      get copyWith => __$$_CompositionRelayConnectionCopyWithImpl<
          _$_CompositionRelayConnection>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CompositionRelayConnectionToJson(
      this,
    );
  }
}

abstract class _CompositionRelayConnection
    implements CompositionRelayConnection {
  factory _CompositionRelayConnection(
          {@JsonKey(name: 'pageInfo') final PageInfo? pageInfo,
          @JsonKey(name: 'edges') final List<CompositionEdgeRelay?>? edges}) =
      _$_CompositionRelayConnection;

  factory _CompositionRelayConnection.fromJson(Map<String, dynamic> json) =
      _$_CompositionRelayConnection.fromJson;

  @override
  @JsonKey(name: 'pageInfo')
  PageInfo? get pageInfo;
  @override
  @JsonKey(name: 'edges')
  List<CompositionEdgeRelay?>? get edges;
  @override
  @JsonKey(ignore: true)
  _$$_CompositionRelayConnectionCopyWith<_$_CompositionRelayConnection>
      get copyWith => throw _privateConstructorUsedError;
}
