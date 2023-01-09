// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'narrative.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Narrative _$NarrativeFromJson(Map<String, dynamic> json) {
  return _Narrative.fromJson(json);
}

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
      _$NarrativeCopyWithImpl<$Res, Narrative>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID')
          String? id,
      @JsonKey(name: 'Status', unknownEnumValue: NarrativeStatusEnum.empty)
          NarrativeStatusEnum? status,
      @JsonKey(name: 'Div')
          String? div});
}

/// @nodoc
class _$NarrativeCopyWithImpl<$Res, $Val extends Narrative>
    implements $NarrativeCopyWith<$Res> {
  _$NarrativeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? status = freezed,
    Object? div = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as NarrativeStatusEnum?,
      div: freezed == div
          ? _value.div
          : div // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NarrativeCopyWith<$Res> implements $NarrativeCopyWith<$Res> {
  factory _$$_NarrativeCopyWith(
          _$_Narrative value, $Res Function(_$_Narrative) then) =
      __$$_NarrativeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID')
          String? id,
      @JsonKey(name: 'Status', unknownEnumValue: NarrativeStatusEnum.empty)
          NarrativeStatusEnum? status,
      @JsonKey(name: 'Div')
          String? div});
}

/// @nodoc
class __$$_NarrativeCopyWithImpl<$Res>
    extends _$NarrativeCopyWithImpl<$Res, _$_Narrative>
    implements _$$_NarrativeCopyWith<$Res> {
  __$$_NarrativeCopyWithImpl(
      _$_Narrative _value, $Res Function(_$_Narrative) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? status = freezed,
    Object? div = freezed,
  }) {
    return _then(_$_Narrative(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as NarrativeStatusEnum?,
      div: freezed == div
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
      _$$_NarrativeFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? id;

  /// The status of the narrative - whether it's entirely generated
  ///  (from just the defined data or the extensions too),
  ///  or whether a human authored it and it may contain additional data.
  @override
  @JsonKey(name: 'Status', unknownEnumValue: NarrativeStatusEnum.empty)
  final NarrativeStatusEnum? status;

  /// The actual narrative content, a stripped down version of XHTML.
  @override
  @JsonKey(name: 'Div')
  final String? div;

  @override
  String toString() {
    return 'Narrative(id: $id, status: $status, div: $div)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Narrative &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.div, div) || other.div == div));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, status, div);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NarrativeCopyWith<_$_Narrative> get copyWith =>
      __$$_NarrativeCopyWithImpl<_$_Narrative>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NarrativeToJson(
      this,
    );
  }
}

abstract class _Narrative implements Narrative {
  factory _Narrative(
      {@JsonKey(name: 'ID')
          final String? id,
      @JsonKey(name: 'Status', unknownEnumValue: NarrativeStatusEnum.empty)
          final NarrativeStatusEnum? status,
      @JsonKey(name: 'Div')
          final String? div}) = _$_Narrative;

  factory _Narrative.fromJson(Map<String, dynamic> json) =
      _$_Narrative.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id;
  @override

  /// The status of the narrative - whether it's entirely generated
  ///  (from just the defined data or the extensions too),
  ///  or whether a human authored it and it may contain additional data.
  @JsonKey(name: 'Status', unknownEnumValue: NarrativeStatusEnum.empty)
  NarrativeStatusEnum? get status;
  @override

  /// The actual narrative content, a stripped down version of XHTML.
  @JsonKey(name: 'Div')
  String? get div;
  @override
  @JsonKey(ignore: true)
  _$$_NarrativeCopyWith<_$_Narrative> get copyWith =>
      throw _privateConstructorUsedError;
}
