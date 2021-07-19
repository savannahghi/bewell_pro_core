// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'allergy_intolerance_relay_edge.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AllergyIntoleranceRelayEdge _$AllergyIntoleranceRelayEdgeFromJson(
    Map<String, dynamic> json) {
  return _AllergyIntoleranceRelayEdge.fromJson(json);
}

/// @nodoc
class _$AllergyIntoleranceRelayEdgeTearOff {
  const _$AllergyIntoleranceRelayEdgeTearOff();

  _AllergyIntoleranceRelayEdge call(
      {@JsonKey(name: 'cursor') String? cursor,
      @JsonKey(name: 'node') AllergyIntolerance? node}) {
    return _AllergyIntoleranceRelayEdge(
      cursor: cursor,
      node: node,
    );
  }

  AllergyIntoleranceRelayEdge fromJson(Map<String, Object> json) {
    return AllergyIntoleranceRelayEdge.fromJson(json);
  }
}

/// @nodoc
const $AllergyIntoleranceRelayEdge = _$AllergyIntoleranceRelayEdgeTearOff();

/// @nodoc
mixin _$AllergyIntoleranceRelayEdge {
  @JsonKey(name: 'cursor')
  String? get cursor => throw _privateConstructorUsedError;
  @JsonKey(name: 'node')
  AllergyIntolerance? get node => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AllergyIntoleranceRelayEdgeCopyWith<AllergyIntoleranceRelayEdge>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllergyIntoleranceRelayEdgeCopyWith<$Res> {
  factory $AllergyIntoleranceRelayEdgeCopyWith(
          AllergyIntoleranceRelayEdge value,
          $Res Function(AllergyIntoleranceRelayEdge) then) =
      _$AllergyIntoleranceRelayEdgeCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'cursor') String? cursor,
      @JsonKey(name: 'node') AllergyIntolerance? node});

  $AllergyIntoleranceCopyWith<$Res>? get node;
}

/// @nodoc
class _$AllergyIntoleranceRelayEdgeCopyWithImpl<$Res>
    implements $AllergyIntoleranceRelayEdgeCopyWith<$Res> {
  _$AllergyIntoleranceRelayEdgeCopyWithImpl(this._value, this._then);

  final AllergyIntoleranceRelayEdge _value;
  // ignore: unused_field
  final $Res Function(AllergyIntoleranceRelayEdge) _then;

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
              as AllergyIntolerance?,
    ));
  }

  @override
  $AllergyIntoleranceCopyWith<$Res>? get node {
    if (_value.node == null) {
      return null;
    }

    return $AllergyIntoleranceCopyWith<$Res>(_value.node!, (value) {
      return _then(_value.copyWith(node: value));
    });
  }
}

/// @nodoc
abstract class _$AllergyIntoleranceRelayEdgeCopyWith<$Res>
    implements $AllergyIntoleranceRelayEdgeCopyWith<$Res> {
  factory _$AllergyIntoleranceRelayEdgeCopyWith(
          _AllergyIntoleranceRelayEdge value,
          $Res Function(_AllergyIntoleranceRelayEdge) then) =
      __$AllergyIntoleranceRelayEdgeCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'cursor') String? cursor,
      @JsonKey(name: 'node') AllergyIntolerance? node});

  @override
  $AllergyIntoleranceCopyWith<$Res>? get node;
}

/// @nodoc
class __$AllergyIntoleranceRelayEdgeCopyWithImpl<$Res>
    extends _$AllergyIntoleranceRelayEdgeCopyWithImpl<$Res>
    implements _$AllergyIntoleranceRelayEdgeCopyWith<$Res> {
  __$AllergyIntoleranceRelayEdgeCopyWithImpl(
      _AllergyIntoleranceRelayEdge _value,
      $Res Function(_AllergyIntoleranceRelayEdge) _then)
      : super(_value, (v) => _then(v as _AllergyIntoleranceRelayEdge));

  @override
  _AllergyIntoleranceRelayEdge get _value =>
      super._value as _AllergyIntoleranceRelayEdge;

  @override
  $Res call({
    Object? cursor = freezed,
    Object? node = freezed,
  }) {
    return _then(_AllergyIntoleranceRelayEdge(
      cursor: cursor == freezed
          ? _value.cursor
          : cursor // ignore: cast_nullable_to_non_nullable
              as String?,
      node: node == freezed
          ? _value.node
          : node // ignore: cast_nullable_to_non_nullable
              as AllergyIntolerance?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AllergyIntoleranceRelayEdge implements _AllergyIntoleranceRelayEdge {
  _$_AllergyIntoleranceRelayEdge(
      {@JsonKey(name: 'cursor') this.cursor, @JsonKey(name: 'node') this.node});

  factory _$_AllergyIntoleranceRelayEdge.fromJson(Map<String, dynamic> json) =>
      _$_$_AllergyIntoleranceRelayEdgeFromJson(json);

  @override
  @JsonKey(name: 'cursor')
  final String? cursor;
  @override
  @JsonKey(name: 'node')
  final AllergyIntolerance? node;

  @override
  String toString() {
    return 'AllergyIntoleranceRelayEdge(cursor: $cursor, node: $node)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AllergyIntoleranceRelayEdge &&
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
  _$AllergyIntoleranceRelayEdgeCopyWith<_AllergyIntoleranceRelayEdge>
      get copyWith => __$AllergyIntoleranceRelayEdgeCopyWithImpl<
          _AllergyIntoleranceRelayEdge>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AllergyIntoleranceRelayEdgeToJson(this);
  }
}

abstract class _AllergyIntoleranceRelayEdge
    implements AllergyIntoleranceRelayEdge {
  factory _AllergyIntoleranceRelayEdge(
          {@JsonKey(name: 'cursor') String? cursor,
          @JsonKey(name: 'node') AllergyIntolerance? node}) =
      _$_AllergyIntoleranceRelayEdge;

  factory _AllergyIntoleranceRelayEdge.fromJson(Map<String, dynamic> json) =
      _$_AllergyIntoleranceRelayEdge.fromJson;

  @override
  @JsonKey(name: 'cursor')
  String? get cursor => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'node')
  AllergyIntolerance? get node => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AllergyIntoleranceRelayEdgeCopyWith<_AllergyIntoleranceRelayEdge>
      get copyWith => throw _privateConstructorUsedError;
}
