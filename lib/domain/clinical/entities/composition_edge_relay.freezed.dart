// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'composition_edge_relay.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CompositionEdgeRelay _$CompositionEdgeRelayFromJson(Map<String, dynamic> json) {
  return _CompositionEdgeRelay.fromJson(json);
}

/// @nodoc
mixin _$CompositionEdgeRelay {
  @JsonKey(name: 'cursor')
  String? get cursor => throw _privateConstructorUsedError;
  @JsonKey(name: 'node')
  Composition? get node => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CompositionEdgeRelayCopyWith<CompositionEdgeRelay> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompositionEdgeRelayCopyWith<$Res> {
  factory $CompositionEdgeRelayCopyWith(CompositionEdgeRelay value,
          $Res Function(CompositionEdgeRelay) then) =
      _$CompositionEdgeRelayCopyWithImpl<$Res, CompositionEdgeRelay>;
  @useResult
  $Res call(
      {@JsonKey(name: 'cursor') String? cursor,
      @JsonKey(name: 'node') Composition? node});

  $CompositionCopyWith<$Res>? get node;
}

/// @nodoc
class _$CompositionEdgeRelayCopyWithImpl<$Res,
        $Val extends CompositionEdgeRelay>
    implements $CompositionEdgeRelayCopyWith<$Res> {
  _$CompositionEdgeRelayCopyWithImpl(this._value, this._then);

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
              as Composition?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CompositionCopyWith<$Res>? get node {
    if (_value.node == null) {
      return null;
    }

    return $CompositionCopyWith<$Res>(_value.node!, (value) {
      return _then(_value.copyWith(node: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CompositionEdgeRelayCopyWith<$Res>
    implements $CompositionEdgeRelayCopyWith<$Res> {
  factory _$$_CompositionEdgeRelayCopyWith(_$_CompositionEdgeRelay value,
          $Res Function(_$_CompositionEdgeRelay) then) =
      __$$_CompositionEdgeRelayCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'cursor') String? cursor,
      @JsonKey(name: 'node') Composition? node});

  @override
  $CompositionCopyWith<$Res>? get node;
}

/// @nodoc
class __$$_CompositionEdgeRelayCopyWithImpl<$Res>
    extends _$CompositionEdgeRelayCopyWithImpl<$Res, _$_CompositionEdgeRelay>
    implements _$$_CompositionEdgeRelayCopyWith<$Res> {
  __$$_CompositionEdgeRelayCopyWithImpl(_$_CompositionEdgeRelay _value,
      $Res Function(_$_CompositionEdgeRelay) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cursor = freezed,
    Object? node = freezed,
  }) {
    return _then(_$_CompositionEdgeRelay(
      cursor: freezed == cursor
          ? _value.cursor
          : cursor // ignore: cast_nullable_to_non_nullable
              as String?,
      node: freezed == node
          ? _value.node
          : node // ignore: cast_nullable_to_non_nullable
              as Composition?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CompositionEdgeRelay implements _CompositionEdgeRelay {
  _$_CompositionEdgeRelay(
      {@JsonKey(name: 'cursor') this.cursor, @JsonKey(name: 'node') this.node});

  factory _$_CompositionEdgeRelay.fromJson(Map<String, dynamic> json) =>
      _$$_CompositionEdgeRelayFromJson(json);

  @override
  @JsonKey(name: 'cursor')
  final String? cursor;
  @override
  @JsonKey(name: 'node')
  final Composition? node;

  @override
  String toString() {
    return 'CompositionEdgeRelay(cursor: $cursor, node: $node)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CompositionEdgeRelay &&
            (identical(other.cursor, cursor) || other.cursor == cursor) &&
            (identical(other.node, node) || other.node == node));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, cursor, node);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CompositionEdgeRelayCopyWith<_$_CompositionEdgeRelay> get copyWith =>
      __$$_CompositionEdgeRelayCopyWithImpl<_$_CompositionEdgeRelay>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CompositionEdgeRelayToJson(
      this,
    );
  }
}

abstract class _CompositionEdgeRelay implements CompositionEdgeRelay {
  factory _CompositionEdgeRelay(
          {@JsonKey(name: 'cursor') final String? cursor,
          @JsonKey(name: 'node') final Composition? node}) =
      _$_CompositionEdgeRelay;

  factory _CompositionEdgeRelay.fromJson(Map<String, dynamic> json) =
      _$_CompositionEdgeRelay.fromJson;

  @override
  @JsonKey(name: 'cursor')
  String? get cursor;
  @override
  @JsonKey(name: 'node')
  Composition? get node;
  @override
  @JsonKey(ignore: true)
  _$$_CompositionEdgeRelayCopyWith<_$_CompositionEdgeRelay> get copyWith =>
      throw _privateConstructorUsedError;
}
