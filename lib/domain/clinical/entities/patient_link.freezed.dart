// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'patient_link.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PatientLink _$PatientLinkFromJson(Map<String, dynamic> json) {
  return _PatientLink.fromJson(json);
}

/// @nodoc
class _$PatientLinkTearOff {
  const _$PatientLinkTearOff();

  _PatientLink call(
      {@JsonKey(name: 'ID')
          String? id,
      @JsonKey(name: 'Other')
          Reference? other,
      @JsonKey(name: 'Type', unknownEnumValue: PatientLinkTypeEnum.refer)
          PatientLinkTypeEnum? type}) {
    return _PatientLink(
      id: id,
      other: other,
      type: type,
    );
  }

  PatientLink fromJson(Map<String, Object> json) {
    return PatientLink.fromJson(json);
  }
}

/// @nodoc
const $PatientLink = _$PatientLinkTearOff();

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
      _$PatientLinkCopyWithImpl<$Res>;
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
class _$PatientLinkCopyWithImpl<$Res> implements $PatientLinkCopyWith<$Res> {
  _$PatientLinkCopyWithImpl(this._value, this._then);

  final PatientLink _value;
  // ignore: unused_field
  final $Res Function(PatientLink) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? other = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      other: other == freezed
          ? _value.other
          : other // ignore: cast_nullable_to_non_nullable
              as Reference?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PatientLinkTypeEnum?,
    ));
  }

  @override
  $ReferenceCopyWith<$Res>? get other {
    if (_value.other == null) {
      return null;
    }

    return $ReferenceCopyWith<$Res>(_value.other!, (value) {
      return _then(_value.copyWith(other: value));
    });
  }
}

/// @nodoc
abstract class _$PatientLinkCopyWith<$Res>
    implements $PatientLinkCopyWith<$Res> {
  factory _$PatientLinkCopyWith(
          _PatientLink value, $Res Function(_PatientLink) then) =
      __$PatientLinkCopyWithImpl<$Res>;
  @override
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
class __$PatientLinkCopyWithImpl<$Res> extends _$PatientLinkCopyWithImpl<$Res>
    implements _$PatientLinkCopyWith<$Res> {
  __$PatientLinkCopyWithImpl(
      _PatientLink _value, $Res Function(_PatientLink) _then)
      : super(_value, (v) => _then(v as _PatientLink));

  @override
  _PatientLink get _value => super._value as _PatientLink;

  @override
  $Res call({
    Object? id = freezed,
    Object? other = freezed,
    Object? type = freezed,
  }) {
    return _then(_PatientLink(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      other: other == freezed
          ? _value.other
          : other // ignore: cast_nullable_to_non_nullable
              as Reference?,
      type: type == freezed
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
      _$_$_PatientLinkFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? id;
  @override

  /// The other patient resource that the link refers to.
  @JsonKey(name: 'Other')
  final Reference? other;
  @override

  /// The type of link between this patient resource and another patient
  ///  resource.
  @JsonKey(name: 'Type', unknownEnumValue: PatientLinkTypeEnum.refer)
  final PatientLinkTypeEnum? type;

  @override
  String toString() {
    return 'PatientLink(id: $id, other: $other, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PatientLink &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.other, this.other) ||
                const DeepCollectionEquality()
                    .equals(other.other, this.other)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(other) ^
      const DeepCollectionEquality().hash(type);

  @JsonKey(ignore: true)
  @override
  _$PatientLinkCopyWith<_PatientLink> get copyWith =>
      __$PatientLinkCopyWithImpl<_PatientLink>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PatientLinkToJson(this);
  }
}

abstract class _PatientLink implements PatientLink {
  factory _PatientLink(
      {@JsonKey(name: 'ID')
          String? id,
      @JsonKey(name: 'Other')
          Reference? other,
      @JsonKey(name: 'Type', unknownEnumValue: PatientLinkTypeEnum.refer)
          PatientLinkTypeEnum? type}) = _$_PatientLink;

  factory _PatientLink.fromJson(Map<String, dynamic> json) =
      _$_PatientLink.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;
  @override

  /// The other patient resource that the link refers to.
  @JsonKey(name: 'Other')
  Reference? get other => throw _privateConstructorUsedError;
  @override

  /// The type of link between this patient resource and another patient
  ///  resource.
  @JsonKey(name: 'Type', unknownEnumValue: PatientLinkTypeEnum.refer)
  PatientLinkTypeEnum? get type => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PatientLinkCopyWith<_PatientLink> get copyWith =>
      throw _privateConstructorUsedError;
}
