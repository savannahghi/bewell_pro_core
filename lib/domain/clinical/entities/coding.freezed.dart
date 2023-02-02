// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'coding.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Coding _$CodingFromJson(Map<String, dynamic> json) {
  return _Coding.fromJson(json);
}

/// @nodoc
mixin _$Coding {
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;

  /// The identification of the code system that defines the meaning of the
  ///  symbol in the code.
  @JsonKey(name: 'System')
  String? get system => throw _privateConstructorUsedError;

  /// The version of the code system which was used when choosing this code.
  ///
  /// Note that a well-maintained code system does not need the version reported,
  ///  because the meaning of codes is consistent across versions. However
  ///  this cannot consistently be assured, and when the meaning is not
  ///  guaranteed to be consistent, the version SHOULD be exchanged
  @JsonKey(name: 'Version')
  String? get version => throw _privateConstructorUsedError;

  /// A symbol in syntax defined by the system. The symbol may be a
  ///  predefined code or an expression in a syntax defined by the coding
  ///  system (e.g. post-coordination).
  @JsonKey(name: 'Code')
  String? get code => throw _privateConstructorUsedError;

  /// A representation of the meaning of the code in the system, following
  ///  the rules of the system.
  @JsonKey(name: 'Display')
  String? get display => throw _privateConstructorUsedError;

  /// Indicates that this coding was chosen by a user directly
  ///
  ///  - e.g. off a pick list of available items (codes or displays).
  @JsonKey(name: 'UserSelected')
  bool? get userSelected => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CodingCopyWith<Coding> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CodingCopyWith<$Res> {
  factory $CodingCopyWith(Coding value, $Res Function(Coding) then) =
      _$CodingCopyWithImpl<$Res, Coding>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'System') String? system,
      @JsonKey(name: 'Version') String? version,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'Display') String? display,
      @JsonKey(name: 'UserSelected') bool? userSelected});
}

/// @nodoc
class _$CodingCopyWithImpl<$Res, $Val extends Coding>
    implements $CodingCopyWith<$Res> {
  _$CodingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? system = freezed,
    Object? version = freezed,
    Object? code = freezed,
    Object? display = freezed,
    Object? userSelected = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      system: freezed == system
          ? _value.system
          : system // ignore: cast_nullable_to_non_nullable
              as String?,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      display: freezed == display
          ? _value.display
          : display // ignore: cast_nullable_to_non_nullable
              as String?,
      userSelected: freezed == userSelected
          ? _value.userSelected
          : userSelected // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CodingCopyWith<$Res> implements $CodingCopyWith<$Res> {
  factory _$$_CodingCopyWith(_$_Coding value, $Res Function(_$_Coding) then) =
      __$$_CodingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'System') String? system,
      @JsonKey(name: 'Version') String? version,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'Display') String? display,
      @JsonKey(name: 'UserSelected') bool? userSelected});
}

/// @nodoc
class __$$_CodingCopyWithImpl<$Res>
    extends _$CodingCopyWithImpl<$Res, _$_Coding>
    implements _$$_CodingCopyWith<$Res> {
  __$$_CodingCopyWithImpl(_$_Coding _value, $Res Function(_$_Coding) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? system = freezed,
    Object? version = freezed,
    Object? code = freezed,
    Object? display = freezed,
    Object? userSelected = freezed,
  }) {
    return _then(_$_Coding(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      system: freezed == system
          ? _value.system
          : system // ignore: cast_nullable_to_non_nullable
              as String?,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      display: freezed == display
          ? _value.display
          : display // ignore: cast_nullable_to_non_nullable
              as String?,
      userSelected: freezed == userSelected
          ? _value.userSelected
          : userSelected // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Coding implements _Coding {
  _$_Coding(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'System') this.system,
      @JsonKey(name: 'Version') this.version,
      @JsonKey(name: 'Code') this.code,
      @JsonKey(name: 'Display') this.display,
      @JsonKey(name: 'UserSelected') this.userSelected});

  factory _$_Coding.fromJson(Map<String, dynamic> json) =>
      _$$_CodingFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? id;

  /// The identification of the code system that defines the meaning of the
  ///  symbol in the code.
  @override
  @JsonKey(name: 'System')
  final String? system;

  /// The version of the code system which was used when choosing this code.
  ///
  /// Note that a well-maintained code system does not need the version reported,
  ///  because the meaning of codes is consistent across versions. However
  ///  this cannot consistently be assured, and when the meaning is not
  ///  guaranteed to be consistent, the version SHOULD be exchanged
  @override
  @JsonKey(name: 'Version')
  final String? version;

  /// A symbol in syntax defined by the system. The symbol may be a
  ///  predefined code or an expression in a syntax defined by the coding
  ///  system (e.g. post-coordination).
  @override
  @JsonKey(name: 'Code')
  final String? code;

  /// A representation of the meaning of the code in the system, following
  ///  the rules of the system.
  @override
  @JsonKey(name: 'Display')
  final String? display;

  /// Indicates that this coding was chosen by a user directly
  ///
  ///  - e.g. off a pick list of available items (codes or displays).
  @override
  @JsonKey(name: 'UserSelected')
  final bool? userSelected;

  @override
  String toString() {
    return 'Coding(id: $id, system: $system, version: $version, code: $code, display: $display, userSelected: $userSelected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Coding &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.system, system) || other.system == system) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.display, display) || other.display == display) &&
            (identical(other.userSelected, userSelected) ||
                other.userSelected == userSelected));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, system, version, code, display, userSelected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CodingCopyWith<_$_Coding> get copyWith =>
      __$$_CodingCopyWithImpl<_$_Coding>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CodingToJson(
      this,
    );
  }
}

abstract class _Coding implements Coding {
  factory _Coding(
      {@JsonKey(name: 'ID') final String? id,
      @JsonKey(name: 'System') final String? system,
      @JsonKey(name: 'Version') final String? version,
      @JsonKey(name: 'Code') final String? code,
      @JsonKey(name: 'Display') final String? display,
      @JsonKey(name: 'UserSelected') final bool? userSelected}) = _$_Coding;

  factory _Coding.fromJson(Map<String, dynamic> json) = _$_Coding.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id;
  @override

  /// The identification of the code system that defines the meaning of the
  ///  symbol in the code.
  @JsonKey(name: 'System')
  String? get system;
  @override

  /// The version of the code system which was used when choosing this code.
  ///
  /// Note that a well-maintained code system does not need the version reported,
  ///  because the meaning of codes is consistent across versions. However
  ///  this cannot consistently be assured, and when the meaning is not
  ///  guaranteed to be consistent, the version SHOULD be exchanged
  @JsonKey(name: 'Version')
  String? get version;
  @override

  /// A symbol in syntax defined by the system. The symbol may be a
  ///  predefined code or an expression in a syntax defined by the coding
  ///  system (e.g. post-coordination).
  @JsonKey(name: 'Code')
  String? get code;
  @override

  /// A representation of the meaning of the code in the system, following
  ///  the rules of the system.
  @JsonKey(name: 'Display')
  String? get display;
  @override

  /// Indicates that this coding was chosen by a user directly
  ///
  ///  - e.g. off a pick list of available items (codes or displays).
  @JsonKey(name: 'UserSelected')
  bool? get userSelected;
  @override
  @JsonKey(ignore: true)
  _$$_CodingCopyWith<_$_Coding> get copyWith =>
      throw _privateConstructorUsedError;
}
