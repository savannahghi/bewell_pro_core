// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'narrative.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Narrative _$NarrativeFromJson(Map<String, dynamic> json) {
  return _Narrative.fromJson(json);
}

/// @nodoc
class _$NarrativeTearOff {
  const _$NarrativeTearOff();

  _Narrative call(
      {@JsonKey(name: 'ID')
          String? id,
      @JsonKey(name: 'Status', unknownEnumValue: NarrativeStatusEnum.empty)
          NarrativeStatusEnum? status,
      @JsonKey(name: 'Div')
          String? div}) {
    return _Narrative(
      id: id,
      status: status,
      div: div,
    );
  }

  Narrative fromJson(Map<String, Object> json) {
    return Narrative.fromJson(json);
  }
}

/// @nodoc
const $Narrative = _$NarrativeTearOff();

/// @nodoc
mixin _$Narrative {
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;

  /// The status of the narrative - whether it's entirely generated
  ///  (from just the defined data or the extensions too),
  ///  or whether a human authored it and it may contain additional data.
  @JsonKey(name: 'Status', unknownEnumValue: NarrativeStatusEnum.empty)
  NarrativeStatusEnum? get status => throw _privateConstructorUsedError;

  /// The actual narrative content, a stripped down version of XHTML.
  @JsonKey(name: 'Div')
  String? get div => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NarrativeCopyWith<Narrative> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NarrativeCopyWith<$Res> {
  factory $NarrativeCopyWith(Narrative value, $Res Function(Narrative) then) =
      _$NarrativeCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'ID')
          String? id,
      @JsonKey(name: 'Status', unknownEnumValue: NarrativeStatusEnum.empty)
          NarrativeStatusEnum? status,
      @JsonKey(name: 'Div')
          String? div});
}

/// @nodoc
class _$NarrativeCopyWithImpl<$Res> implements $NarrativeCopyWith<$Res> {
  _$NarrativeCopyWithImpl(this._value, this._then);

  final Narrative _value;
  // ignore: unused_field
  final $Res Function(Narrative) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? status = freezed,
    Object? div = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as NarrativeStatusEnum?,
      div: div == freezed
          ? _value.div
          : div // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$NarrativeCopyWith<$Res> implements $NarrativeCopyWith<$Res> {
  factory _$NarrativeCopyWith(
          _Narrative value, $Res Function(_Narrative) then) =
      __$NarrativeCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'ID')
          String? id,
      @JsonKey(name: 'Status', unknownEnumValue: NarrativeStatusEnum.empty)
          NarrativeStatusEnum? status,
      @JsonKey(name: 'Div')
          String? div});
}

/// @nodoc
class __$NarrativeCopyWithImpl<$Res> extends _$NarrativeCopyWithImpl<$Res>
    implements _$NarrativeCopyWith<$Res> {
  __$NarrativeCopyWithImpl(_Narrative _value, $Res Function(_Narrative) _then)
      : super(_value, (v) => _then(v as _Narrative));

  @override
  _Narrative get _value => super._value as _Narrative;

  @override
  $Res call({
    Object? id = freezed,
    Object? status = freezed,
    Object? div = freezed,
  }) {
    return _then(_Narrative(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as NarrativeStatusEnum?,
      div: div == freezed
          ? _value.div
          : div // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Narrative implements _Narrative {
  _$_Narrative(
      {@JsonKey(name: 'ID')
          this.id,
      @JsonKey(name: 'Status', unknownEnumValue: NarrativeStatusEnum.empty)
          this.status,
      @JsonKey(name: 'Div')
          this.div});

  factory _$_Narrative.fromJson(Map<String, dynamic> json) =>
      _$_$_NarrativeFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? id;
  @override

  /// The status of the narrative - whether it's entirely generated
  ///  (from just the defined data or the extensions too),
  ///  or whether a human authored it and it may contain additional data.
  @JsonKey(name: 'Status', unknownEnumValue: NarrativeStatusEnum.empty)
  final NarrativeStatusEnum? status;
  @override

  /// The actual narrative content, a stripped down version of XHTML.
  @JsonKey(name: 'Div')
  final String? div;

  @override
  String toString() {
    return 'Narrative(id: $id, status: $status, div: $div)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Narrative &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.div, div) ||
                const DeepCollectionEquality().equals(other.div, div)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(div);

  @JsonKey(ignore: true)
  @override
  _$NarrativeCopyWith<_Narrative> get copyWith =>
      __$NarrativeCopyWithImpl<_Narrative>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_NarrativeToJson(this);
  }
}

abstract class _Narrative implements Narrative {
  factory _Narrative(
      {@JsonKey(name: 'ID')
          String? id,
      @JsonKey(name: 'Status', unknownEnumValue: NarrativeStatusEnum.empty)
          NarrativeStatusEnum? status,
      @JsonKey(name: 'Div')
          String? div}) = _$_Narrative;

  factory _Narrative.fromJson(Map<String, dynamic> json) =
      _$_Narrative.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;
  @override

  /// The status of the narrative - whether it's entirely generated
  ///  (from just the defined data or the extensions too),
  ///  or whether a human authored it and it may contain additional data.
  @JsonKey(name: 'Status', unknownEnumValue: NarrativeStatusEnum.empty)
  NarrativeStatusEnum? get status => throw _privateConstructorUsedError;
  @override

  /// The actual narrative content, a stripped down version of XHTML.
  @JsonKey(name: 'Div')
  String? get div => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$NarrativeCopyWith<_Narrative> get copyWith =>
      throw _privateConstructorUsedError;
}
