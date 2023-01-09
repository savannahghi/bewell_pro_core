// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'allergy_intolerance_relay_connection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AllergyIntoleranceRelayConnection _$AllergyIntoleranceRelayConnectionFromJson(
    Map<String, dynamic> json) {
  return _AllergyIntoleranceRelayConnection.fromJson(json);
}

/// @nodoc
mixin _$AllergyIntoleranceRelayConnection {
  @JsonKey(name: 'edges')
  List<AllergyIntoleranceRelayEdge?>? get edges =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'pageInfo')
  PageInfo? get pageInfo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AllergyIntoleranceRelayConnectionCopyWith<AllergyIntoleranceRelayConnection>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllergyIntoleranceRelayConnectionCopyWith<$Res> {
  factory $AllergyIntoleranceRelayConnectionCopyWith(
          AllergyIntoleranceRelayConnection value,
          $Res Function(AllergyIntoleranceRelayConnection) then) =
      _$AllergyIntoleranceRelayConnectionCopyWithImpl<$Res,
          AllergyIntoleranceRelayConnection>;
  @useResult
  $Res call(
      {@JsonKey(name: 'edges') List<AllergyIntoleranceRelayEdge?>? edges,
      @JsonKey(name: 'pageInfo') PageInfo? pageInfo});

  $PageInfoCopyWith<$Res>? get pageInfo;
}

/// @nodoc
class _$AllergyIntoleranceRelayConnectionCopyWithImpl<$Res,
        $Val extends AllergyIntoleranceRelayConnection>
    implements $AllergyIntoleranceRelayConnectionCopyWith<$Res> {
  _$AllergyIntoleranceRelayConnectionCopyWithImpl(this._value, this._then);

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
              as List<AllergyIntoleranceRelayEdge?>?,
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
abstract class _$$_AllergyIntoleranceRelayConnectionCopyWith<$Res>
    implements $AllergyIntoleranceRelayConnectionCopyWith<$Res> {
  factory _$$_AllergyIntoleranceRelayConnectionCopyWith(
          _$_AllergyIntoleranceRelayConnection value,
          $Res Function(_$_AllergyIntoleranceRelayConnection) then) =
      __$$_AllergyIntoleranceRelayConnectionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'edges') List<AllergyIntoleranceRelayEdge?>? edges,
      @JsonKey(name: 'pageInfo') PageInfo? pageInfo});

  @override
  $PageInfoCopyWith<$Res>? get pageInfo;
}

/// @nodoc
class __$$_AllergyIntoleranceRelayConnectionCopyWithImpl<$Res>
    extends _$AllergyIntoleranceRelayConnectionCopyWithImpl<$Res,
        _$_AllergyIntoleranceRelayConnection>
    implements _$$_AllergyIntoleranceRelayConnectionCopyWith<$Res> {
  __$$_AllergyIntoleranceRelayConnectionCopyWithImpl(
      _$_AllergyIntoleranceRelayConnection _value,
      $Res Function(_$_AllergyIntoleranceRelayConnection) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? edges = freezed,
    Object? pageInfo = freezed,
  }) {
    return _then(_$_AllergyIntoleranceRelayConnection(
      edges: freezed == edges
          ? _value._edges
          : edges // ignore: cast_nullable_to_non_nullable
              as List<AllergyIntoleranceRelayEdge?>?,
      pageInfo: freezed == pageInfo
          ? _value.pageInfo
          : pageInfo // ignore: cast_nullable_to_non_nullable
              as PageInfo?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AllergyIntoleranceRelayConnection
    implements _AllergyIntoleranceRelayConnection {
  _$_AllergyIntoleranceRelayConnection(
      {@JsonKey(name: 'edges') final List<AllergyIntoleranceRelayEdge?>? edges,
      @JsonKey(name: 'pageInfo') this.pageInfo})
      : _edges = edges;

  factory _$_AllergyIntoleranceRelayConnection.fromJson(
          Map<String, dynamic> json) =>
      _$$_AllergyIntoleranceRelayConnectionFromJson(json);

  final List<AllergyIntoleranceRelayEdge?>? _edges;
  @override
  @JsonKey(name: 'edges')
  List<AllergyIntoleranceRelayEdge?>? get edges {
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
    return 'AllergyIntoleranceRelayConnection(edges: $edges, pageInfo: $pageInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AllergyIntoleranceRelayConnection &&
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
  _$$_AllergyIntoleranceRelayConnectionCopyWith<
          _$_AllergyIntoleranceRelayConnection>
      get copyWith => __$$_AllergyIntoleranceRelayConnectionCopyWithImpl<
          _$_AllergyIntoleranceRelayConnection>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AllergyIntoleranceRelayConnectionToJson(
      this,
    );
  }
}

abstract class _AllergyIntoleranceRelayConnection
    implements AllergyIntoleranceRelayConnection {
  factory _AllergyIntoleranceRelayConnection(
      {@JsonKey(name: 'edges')
          final List<AllergyIntoleranceRelayEdge?>? edges,
      @JsonKey(name: 'pageInfo')
          final PageInfo? pageInfo}) = _$_AllergyIntoleranceRelayConnection;

  factory _AllergyIntoleranceRelayConnection.fromJson(
          Map<String, dynamic> json) =
      _$_AllergyIntoleranceRelayConnection.fromJson;

  @override
  @JsonKey(name: 'edges')
  List<AllergyIntoleranceRelayEdge?>? get edges;
  @override
  @JsonKey(name: 'pageInfo')
  PageInfo? get pageInfo;
  @override
  @JsonKey(ignore: true)
  _$$_AllergyIntoleranceRelayConnectionCopyWith<
          _$_AllergyIntoleranceRelayConnection>
      get copyWith => throw _privateConstructorUsedError;
}
