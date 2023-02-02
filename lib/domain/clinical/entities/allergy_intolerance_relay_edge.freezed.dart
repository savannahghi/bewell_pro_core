// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'allergy_intolerance_relay_edge.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AllergyIntoleranceRelayEdge _$AllergyIntoleranceRelayEdgeFromJson(
    Map<String, dynamic> json) {
  return _AllergyIntoleranceRelayEdge.fromJson(json);
}

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
      _$AllergyIntoleranceRelayEdgeCopyWithImpl<$Res,
          AllergyIntoleranceRelayEdge>;
  @useResult
  $Res call(
      {@JsonKey(name: 'cursor') String? cursor,
      @JsonKey(name: 'node') AllergyIntolerance? node});

  $AllergyIntoleranceCopyWith<$Res>? get node;
}

/// @nodoc
class _$AllergyIntoleranceRelayEdgeCopyWithImpl<$Res,
        $Val extends AllergyIntoleranceRelayEdge>
    implements $AllergyIntoleranceRelayEdgeCopyWith<$Res> {
  _$AllergyIntoleranceRelayEdgeCopyWithImpl(this._value, this._then);

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
              as AllergyIntolerance?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AllergyIntoleranceCopyWith<$Res>? get node {
    if (_value.node == null) {
      return null;
    }

    return $AllergyIntoleranceCopyWith<$Res>(_value.node!, (value) {
      return _then(_value.copyWith(node: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AllergyIntoleranceRelayEdgeCopyWith<$Res>
    implements $AllergyIntoleranceRelayEdgeCopyWith<$Res> {
  factory _$$_AllergyIntoleranceRelayEdgeCopyWith(
          _$_AllergyIntoleranceRelayEdge value,
          $Res Function(_$_AllergyIntoleranceRelayEdge) then) =
      __$$_AllergyIntoleranceRelayEdgeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'cursor') String? cursor,
      @JsonKey(name: 'node') AllergyIntolerance? node});

  @override
  $AllergyIntoleranceCopyWith<$Res>? get node;
}

/// @nodoc
class __$$_AllergyIntoleranceRelayEdgeCopyWithImpl<$Res>
    extends _$AllergyIntoleranceRelayEdgeCopyWithImpl<$Res,
        _$_AllergyIntoleranceRelayEdge>
    implements _$$_AllergyIntoleranceRelayEdgeCopyWith<$Res> {
  __$$_AllergyIntoleranceRelayEdgeCopyWithImpl(
      _$_AllergyIntoleranceRelayEdge _value,
      $Res Function(_$_AllergyIntoleranceRelayEdge) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cursor = freezed,
    Object? node = freezed,
  }) {
    return _then(_$_AllergyIntoleranceRelayEdge(
      cursor: freezed == cursor
          ? _value.cursor
          : cursor // ignore: cast_nullable_to_non_nullable
              as String?,
      node: freezed == node
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
      _$$_AllergyIntoleranceRelayEdgeFromJson(json);

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
        (other.runtimeType == runtimeType &&
            other is _$_AllergyIntoleranceRelayEdge &&
            (identical(other.cursor, cursor) || other.cursor == cursor) &&
            (identical(other.node, node) || other.node == node));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, cursor, node);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AllergyIntoleranceRelayEdgeCopyWith<_$_AllergyIntoleranceRelayEdge>
      get copyWith => __$$_AllergyIntoleranceRelayEdgeCopyWithImpl<
          _$_AllergyIntoleranceRelayEdge>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AllergyIntoleranceRelayEdgeToJson(
      this,
    );
  }
}

abstract class _AllergyIntoleranceRelayEdge
    implements AllergyIntoleranceRelayEdge {
  factory _AllergyIntoleranceRelayEdge(
          {@JsonKey(name: 'cursor') final String? cursor,
          @JsonKey(name: 'node') final AllergyIntolerance? node}) =
      _$_AllergyIntoleranceRelayEdge;

  factory _AllergyIntoleranceRelayEdge.fromJson(Map<String, dynamic> json) =
      _$_AllergyIntoleranceRelayEdge.fromJson;

  @override
  @JsonKey(name: 'cursor')
  String? get cursor;
  @override
  @JsonKey(name: 'node')
  AllergyIntolerance? get node;
  @override
  @JsonKey(ignore: true)
  _$$_AllergyIntoleranceRelayEdgeCopyWith<_$_AllergyIntoleranceRelayEdge>
      get copyWith => throw _privateConstructorUsedError;
}
