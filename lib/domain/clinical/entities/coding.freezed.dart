// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'coding.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Coding _$CodingFromJson(Map<String, dynamic> json) {
  return _Coding.fromJson(json);
}

/// @nodoc
class _$CodingTearOff {
  const _$CodingTearOff();

  _Coding call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'System') String? system,
      @JsonKey(name: 'Version') String? version,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'Display') String? display,
      @JsonKey(name: 'UserSelected') bool? userSelected}) {
    return _Coding(
      id: id,
      system: system,
      version: version,
      code: code,
      display: display,
      userSelected: userSelected,
    );
  }

  Coding fromJson(Map<String, Object> json) {
    return Coding.fromJson(json);
  }
}

/// @nodoc
const $Coding = _$CodingTearOff();

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
      _$CodingCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'System') String? system,
      @JsonKey(name: 'Version') String? version,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'Display') String? display,
      @JsonKey(name: 'UserSelected') bool? userSelected});
}

/// @nodoc
class _$CodingCopyWithImpl<$Res> implements $CodingCopyWith<$Res> {
  _$CodingCopyWithImpl(this._value, this._then);

  final Coding _value;
  // ignore: unused_field
  final $Res Function(Coding) _then;

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
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      system: system == freezed
          ? _value.system
          : system // ignore: cast_nullable_to_non_nullable
              as String?,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      display: display == freezed
          ? _value.display
          : display // ignore: cast_nullable_to_non_nullable
              as String?,
      userSelected: userSelected == freezed
          ? _value.userSelected
          : userSelected // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$CodingCopyWith<$Res> implements $CodingCopyWith<$Res> {
  factory _$CodingCopyWith(_Coding value, $Res Function(_Coding) then) =
      __$CodingCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'System') String? system,
      @JsonKey(name: 'Version') String? version,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'Display') String? display,
      @JsonKey(name: 'UserSelected') bool? userSelected});
}

/// @nodoc
class __$CodingCopyWithImpl<$Res> extends _$CodingCopyWithImpl<$Res>
    implements _$CodingCopyWith<$Res> {
  __$CodingCopyWithImpl(_Coding _value, $Res Function(_Coding) _then)
      : super(_value, (v) => _then(v as _Coding));

  @override
  _Coding get _value => super._value as _Coding;

  @override
  $Res call({
    Object? id = freezed,
    Object? system = freezed,
    Object? version = freezed,
    Object? code = freezed,
    Object? display = freezed,
    Object? userSelected = freezed,
  }) {
    return _then(_Coding(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      system: system == freezed
          ? _value.system
          : system // ignore: cast_nullable_to_non_nullable
              as String?,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      display: display == freezed
          ? _value.display
          : display // ignore: cast_nullable_to_non_nullable
              as String?,
      userSelected: userSelected == freezed
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
      _$_$_CodingFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? id;
  @override

  /// The identification of the code system that defines the meaning of the
  ///  symbol in the code.
  @JsonKey(name: 'System')
  final String? system;
  @override

  /// The version of the code system which was used when choosing this code.
  ///
  /// Note that a well-maintained code system does not need the version reported,
  ///  because the meaning of codes is consistent across versions. However
  ///  this cannot consistently be assured, and when the meaning is not
  ///  guaranteed to be consistent, the version SHOULD be exchanged
  @JsonKey(name: 'Version')
  final String? version;
  @override

  /// A symbol in syntax defined by the system. The symbol may be a
  ///  predefined code or an expression in a syntax defined by the coding
  ///  system (e.g. post-coordination).
  @JsonKey(name: 'Code')
  final String? code;
  @override

  /// A representation of the meaning of the code in the system, following
  ///  the rules of the system.
  @JsonKey(name: 'Display')
  final String? display;
  @override

  /// Indicates that this coding was chosen by a user directly
  ///
  ///  - e.g. off a pick list of available items (codes or displays).
  @JsonKey(name: 'UserSelected')
  final bool? userSelected;

  @override
  String toString() {
    return 'Coding(id: $id, system: $system, version: $version, code: $code, display: $display, userSelected: $userSelected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Coding &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.system, system) ||
                const DeepCollectionEquality().equals(other.system, system)) &&
            (identical(other.version, version) ||
                const DeepCollectionEquality()
                    .equals(other.version, version)) &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.display, display) ||
                const DeepCollectionEquality()
                    .equals(other.display, display)) &&
            (identical(other.userSelected, userSelected) ||
                const DeepCollectionEquality()
                    .equals(other.userSelected, userSelected)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(system) ^
      const DeepCollectionEquality().hash(version) ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(display) ^
      const DeepCollectionEquality().hash(userSelected);

  @JsonKey(ignore: true)
  @override
  _$CodingCopyWith<_Coding> get copyWith =>
      __$CodingCopyWithImpl<_Coding>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CodingToJson(this);
  }
}

abstract class _Coding implements Coding {
  factory _Coding(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'System') String? system,
      @JsonKey(name: 'Version') String? version,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'Display') String? display,
      @JsonKey(name: 'UserSelected') bool? userSelected}) = _$_Coding;

  factory _Coding.fromJson(Map<String, dynamic> json) = _$_Coding.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;
  @override

  /// The identification of the code system that defines the meaning of the
  ///  symbol in the code.
  @JsonKey(name: 'System')
  String? get system => throw _privateConstructorUsedError;
  @override

  /// The version of the code system which was used when choosing this code.
  ///
  /// Note that a well-maintained code system does not need the version reported,
  ///  because the meaning of codes is consistent across versions. However
  ///  this cannot consistently be assured, and when the meaning is not
  ///  guaranteed to be consistent, the version SHOULD be exchanged
  @JsonKey(name: 'Version')
  String? get version => throw _privateConstructorUsedError;
  @override

  /// A symbol in syntax defined by the system. The symbol may be a
  ///  predefined code or an expression in a syntax defined by the coding
  ///  system (e.g. post-coordination).
  @JsonKey(name: 'Code')
  String? get code => throw _privateConstructorUsedError;
  @override

  /// A representation of the meaning of the code in the system, following
  ///  the rules of the system.
  @JsonKey(name: 'Display')
  String? get display => throw _privateConstructorUsedError;
  @override

  /// Indicates that this coding was chosen by a user directly
  ///
  ///  - e.g. off a pick list of available items (codes or displays).
  @JsonKey(name: 'UserSelected')
  bool? get userSelected => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CodingCopyWith<_Coding> get copyWith => throw _privateConstructorUsedError;
}
