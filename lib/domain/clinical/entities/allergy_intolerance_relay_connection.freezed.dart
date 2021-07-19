// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'allergy_intolerance_relay_connection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AllergyIntoleranceRelayConnection _$AllergyIntoleranceRelayConnectionFromJson(
    Map<String, dynamic> json) {
  return _AllergyIntoleranceRelayConnection.fromJson(json);
}

/// @nodoc
class _$AllergyIntoleranceRelayConnectionTearOff {
  const _$AllergyIntoleranceRelayConnectionTearOff();

  _AllergyIntoleranceRelayConnection call(
      {@JsonKey(name: 'edges') List<AllergyIntoleranceRelayEdge?>? edges,
      @JsonKey(name: 'pageInfo') PageInfo? pageInfo}) {
    return _AllergyIntoleranceRelayConnection(
      edges: edges,
      pageInfo: pageInfo,
    );
  }

  AllergyIntoleranceRelayConnection fromJson(Map<String, Object> json) {
    return AllergyIntoleranceRelayConnection.fromJson(json);
  }
}

/// @nodoc
const $AllergyIntoleranceRelayConnection =
    _$AllergyIntoleranceRelayConnectionTearOff();

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
      _$AllergyIntoleranceRelayConnectionCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'edges') List<AllergyIntoleranceRelayEdge?>? edges,
      @JsonKey(name: 'pageInfo') PageInfo? pageInfo});

  $PageInfoCopyWith<$Res>? get pageInfo;
}

/// @nodoc
class _$AllergyIntoleranceRelayConnectionCopyWithImpl<$Res>
    implements $AllergyIntoleranceRelayConnectionCopyWith<$Res> {
  _$AllergyIntoleranceRelayConnectionCopyWithImpl(this._value, this._then);

  final AllergyIntoleranceRelayConnection _value;
  // ignore: unused_field
  final $Res Function(AllergyIntoleranceRelayConnection) _then;

  @override
  $Res call({
    Object? edges = freezed,
    Object? pageInfo = freezed,
  }) {
    return _then(_value.copyWith(
      edges: edges == freezed
          ? _value.edges
          : edges // ignore: cast_nullable_to_non_nullable
              as List<AllergyIntoleranceRelayEdge?>?,
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
abstract class _$AllergyIntoleranceRelayConnectionCopyWith<$Res>
    implements $AllergyIntoleranceRelayConnectionCopyWith<$Res> {
  factory _$AllergyIntoleranceRelayConnectionCopyWith(
          _AllergyIntoleranceRelayConnection value,
          $Res Function(_AllergyIntoleranceRelayConnection) then) =
      __$AllergyIntoleranceRelayConnectionCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'edges') List<AllergyIntoleranceRelayEdge?>? edges,
      @JsonKey(name: 'pageInfo') PageInfo? pageInfo});

  @override
  $PageInfoCopyWith<$Res>? get pageInfo;
}

/// @nodoc
class __$AllergyIntoleranceRelayConnectionCopyWithImpl<$Res>
    extends _$AllergyIntoleranceRelayConnectionCopyWithImpl<$Res>
    implements _$AllergyIntoleranceRelayConnectionCopyWith<$Res> {
  __$AllergyIntoleranceRelayConnectionCopyWithImpl(
      _AllergyIntoleranceRelayConnection _value,
      $Res Function(_AllergyIntoleranceRelayConnection) _then)
      : super(_value, (v) => _then(v as _AllergyIntoleranceRelayConnection));

  @override
  _AllergyIntoleranceRelayConnection get _value =>
      super._value as _AllergyIntoleranceRelayConnection;

  @override
  $Res call({
    Object? edges = freezed,
    Object? pageInfo = freezed,
  }) {
    return _then(_AllergyIntoleranceRelayConnection(
      edges: edges == freezed
          ? _value.edges
          : edges // ignore: cast_nullable_to_non_nullable
              as List<AllergyIntoleranceRelayEdge?>?,
      pageInfo: pageInfo == freezed
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
      {@JsonKey(name: 'edges') this.edges,
      @JsonKey(name: 'pageInfo') this.pageInfo});

  factory _$_AllergyIntoleranceRelayConnection.fromJson(
          Map<String, dynamic> json) =>
      _$_$_AllergyIntoleranceRelayConnectionFromJson(json);

  @override
  @JsonKey(name: 'edges')
  final List<AllergyIntoleranceRelayEdge?>? edges;
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
        (other is _AllergyIntoleranceRelayConnection &&
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
  _$AllergyIntoleranceRelayConnectionCopyWith<
          _AllergyIntoleranceRelayConnection>
      get copyWith => __$AllergyIntoleranceRelayConnectionCopyWithImpl<
          _AllergyIntoleranceRelayConnection>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AllergyIntoleranceRelayConnectionToJson(this);
  }
}

abstract class _AllergyIntoleranceRelayConnection
    implements AllergyIntoleranceRelayConnection {
  factory _AllergyIntoleranceRelayConnection(
          {@JsonKey(name: 'edges') List<AllergyIntoleranceRelayEdge?>? edges,
          @JsonKey(name: 'pageInfo') PageInfo? pageInfo}) =
      _$_AllergyIntoleranceRelayConnection;

  factory _AllergyIntoleranceRelayConnection.fromJson(
          Map<String, dynamic> json) =
      _$_AllergyIntoleranceRelayConnection.fromJson;

  @override
  @JsonKey(name: 'edges')
  List<AllergyIntoleranceRelayEdge?>? get edges =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'pageInfo')
  PageInfo? get pageInfo => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AllergyIntoleranceRelayConnectionCopyWith<
          _AllergyIntoleranceRelayConnection>
      get copyWith => throw _privateConstructorUsedError;
}
