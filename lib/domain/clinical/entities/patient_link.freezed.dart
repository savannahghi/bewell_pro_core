// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'patient_link.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PatientLink _$PatientLinkFromJson(Map<String, dynamic> json) {
  return _PatientLink.fromJson(json);
}

/// @nodoc
mixin _$PatientLink {
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;

  /// The other patient resource that the link refers to.
  @JsonKey(name: 'Other')
  Reference? get other => throw _privateConstructorUsedError;

  /// The type of link between this patient resource and another patient
  ///  resource.
  @JsonKey(name: 'Type', unknownEnumValue: PatientLinkTypeEnum.refer)
  PatientLinkTypeEnum? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PatientLinkCopyWith<PatientLink> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientLinkCopyWith<$Res> {
  factory $PatientLinkCopyWith(
          PatientLink value, $Res Function(PatientLink) then) =
      _$PatientLinkCopyWithImpl<$Res, PatientLink>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID')
          String? id,
      @JsonKey(name: 'Other')
          Reference? other,
      @JsonKey(name: 'Type', unknownEnumValue: PatientLinkTypeEnum.refer)
          PatientLinkTypeEnum? type});

  $ReferenceCopyWith<$Res>? get other;
}

/// @nodoc
class _$PatientLinkCopyWithImpl<$Res, $Val extends PatientLink>
    implements $PatientLinkCopyWith<$Res> {
  _$PatientLinkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? other = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      other: freezed == other
          ? _value.other
          : other // ignore: cast_nullable_to_non_nullable
              as Reference?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PatientLinkTypeEnum?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ReferenceCopyWith<$Res>? get other {
    if (_value.other == null) {
      return null;
    }

    return $ReferenceCopyWith<$Res>(_value.other!, (value) {
      return _then(_value.copyWith(other: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PatientLinkCopyWith<$Res>
    implements $PatientLinkCopyWith<$Res> {
  factory _$$_PatientLinkCopyWith(
          _$_PatientLink value, $Res Function(_$_PatientLink) then) =
      __$$_PatientLinkCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID')
          String? id,
      @JsonKey(name: 'Other')
          Reference? other,
      @JsonKey(name: 'Type', unknownEnumValue: PatientLinkTypeEnum.refer)
          PatientLinkTypeEnum? type});

  @override
  $ReferenceCopyWith<$Res>? get other;
}

/// @nodoc
class __$$_PatientLinkCopyWithImpl<$Res>
    extends _$PatientLinkCopyWithImpl<$Res, _$_PatientLink>
    implements _$$_PatientLinkCopyWith<$Res> {
  __$$_PatientLinkCopyWithImpl(
      _$_PatientLink _value, $Res Function(_$_PatientLink) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? other = freezed,
    Object? type = freezed,
  }) {
    return _then(_$_PatientLink(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      other: freezed == other
          ? _value.other
          : other // ignore: cast_nullable_to_non_nullable
              as Reference?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PatientLinkTypeEnum?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PatientLink implements _PatientLink {
  _$_PatientLink(
      {@JsonKey(name: 'ID')
          this.id,
      @JsonKey(name: 'Other')
          this.other,
      @JsonKey(name: 'Type', unknownEnumValue: PatientLinkTypeEnum.refer)
          this.type});

  factory _$_PatientLink.fromJson(Map<String, dynamic> json) =>
      _$$_PatientLinkFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? id;

  /// The other patient resource that the link refers to.
  @override
  @JsonKey(name: 'Other')
  final Reference? other;

  /// The type of link between this patient resource and another patient
  ///  resource.
  @override
  @JsonKey(name: 'Type', unknownEnumValue: PatientLinkTypeEnum.refer)
  final PatientLinkTypeEnum? type;

  @override
  String toString() {
    return 'PatientLink(id: $id, other: $other, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PatientLink &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.other, this.other) || other.other == this.other) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, other, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PatientLinkCopyWith<_$_PatientLink> get copyWith =>
      __$$_PatientLinkCopyWithImpl<_$_PatientLink>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PatientLinkToJson(
      this,
    );
  }
}

abstract class _PatientLink implements PatientLink {
  factory _PatientLink(
      {@JsonKey(name: 'ID')
          final String? id,
      @JsonKey(name: 'Other')
          final Reference? other,
      @JsonKey(name: 'Type', unknownEnumValue: PatientLinkTypeEnum.refer)
          final PatientLinkTypeEnum? type}) = _$_PatientLink;

  factory _PatientLink.fromJson(Map<String, dynamic> json) =
      _$_PatientLink.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id;
  @override

  /// The other patient resource that the link refers to.
  @JsonKey(name: 'Other')
  Reference? get other;
  @override

  /// The type of link between this patient resource and another patient
  ///  resource.
  @JsonKey(name: 'Type', unknownEnumValue: PatientLinkTypeEnum.refer)
  PatientLinkTypeEnum? get type;
  @override
  @JsonKey(ignore: true)
  _$$_PatientLinkCopyWith<_$_PatientLink> get copyWith =>
      throw _privateConstructorUsedError;
}
