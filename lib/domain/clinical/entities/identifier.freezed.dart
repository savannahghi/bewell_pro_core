// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'identifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Identifier _$IdentifierFromJson(Map<String, dynamic> json) {
  return _Identifier.fromJson(json);
}

/// @nodoc
class _$IdentifierTearOff {
  const _$IdentifierTearOff();

  _Identifier call(
      {@JsonKey(name: 'ID')
          String? id,
      @JsonKey(name: 'Use', unknownEnumValue: IdentifierUseEnum.official)
          IdentifierUseEnum? use,
      @JsonKey(name: 'Type')
          CodeableConcept? type,
      @JsonKey(name: 'System')
          String? system,
      @JsonKey(name: 'Value')
          String? value,
      @JsonKey(name: 'Period')
          Period? period,
      @JsonKey(name: 'Assigner')
          Reference? assigner}) {
    return _Identifier(
      id: id,
      use: use,
      type: type,
      system: system,
      value: value,
      period: period,
      assigner: assigner,
    );
  }

  Identifier fromJson(Map<String, Object> json) {
    return Identifier.fromJson(json);
  }
}

/// @nodoc
const $Identifier = _$IdentifierTearOff();

/// @nodoc
mixin _$Identifier {
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;

  /// The purpose of this identifier.
  @JsonKey(name: 'Use', unknownEnumValue: IdentifierUseEnum.official)
  IdentifierUseEnum? get use => throw _privateConstructorUsedError;

  /// A coded type for the identifier that can be used to determine which
  ///  identifier to use for a specific purpose.
  @JsonKey(name: 'Type')
  CodeableConcept? get type => throw _privateConstructorUsedError;

  /// Establishes the namespace for the value - that is, a URL that describes
  ///  a set values that are unique.
  @JsonKey(name: 'System')
  String? get system => throw _privateConstructorUsedError;

  /// The portion of the identifier typically relevant to the user and which
  ///  is unique within the context of the system.
  @JsonKey(name: 'Value')
  String? get value => throw _privateConstructorUsedError;
  @JsonKey(name: 'Period')
  Period? get period => throw _privateConstructorUsedError;

  /// Organization that issued/manages the identifier.
  @JsonKey(name: 'Assigner')
  Reference? get assigner => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IdentifierCopyWith<Identifier> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IdentifierCopyWith<$Res> {
  factory $IdentifierCopyWith(
          Identifier value, $Res Function(Identifier) then) =
      _$IdentifierCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'ID')
          String? id,
      @JsonKey(name: 'Use', unknownEnumValue: IdentifierUseEnum.official)
          IdentifierUseEnum? use,
      @JsonKey(name: 'Type')
          CodeableConcept? type,
      @JsonKey(name: 'System')
          String? system,
      @JsonKey(name: 'Value')
          String? value,
      @JsonKey(name: 'Period')
          Period? period,
      @JsonKey(name: 'Assigner')
          Reference? assigner});

  $CodeableConceptCopyWith<$Res>? get type;
  $PeriodCopyWith<$Res>? get period;
  $ReferenceCopyWith<$Res>? get assigner;
}

/// @nodoc
class _$IdentifierCopyWithImpl<$Res> implements $IdentifierCopyWith<$Res> {
  _$IdentifierCopyWithImpl(this._value, this._then);

  final Identifier _value;
  // ignore: unused_field
  final $Res Function(Identifier) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? use = freezed,
    Object? type = freezed,
    Object? system = freezed,
    Object? value = freezed,
    Object? period = freezed,
    Object? assigner = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      use: use == freezed
          ? _value.use
          : use // ignore: cast_nullable_to_non_nullable
              as IdentifierUseEnum?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      system: system == freezed
          ? _value.system
          : system // ignore: cast_nullable_to_non_nullable
              as String?,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      period: period == freezed
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as Period?,
      assigner: assigner == freezed
          ? _value.assigner
          : assigner // ignore: cast_nullable_to_non_nullable
              as Reference?,
    ));
  }

  @override
  $CodeableConceptCopyWith<$Res>? get type {
    if (_value.type == null) {
      return null;
    }

    return $CodeableConceptCopyWith<$Res>(_value.type!, (value) {
      return _then(_value.copyWith(type: value));
    });
  }

  @override
  $PeriodCopyWith<$Res>? get period {
    if (_value.period == null) {
      return null;
    }

    return $PeriodCopyWith<$Res>(_value.period!, (value) {
      return _then(_value.copyWith(period: value));
    });
  }

  @override
  $ReferenceCopyWith<$Res>? get assigner {
    if (_value.assigner == null) {
      return null;
    }

    return $ReferenceCopyWith<$Res>(_value.assigner!, (value) {
      return _then(_value.copyWith(assigner: value));
    });
  }
}

/// @nodoc
abstract class _$IdentifierCopyWith<$Res> implements $IdentifierCopyWith<$Res> {
  factory _$IdentifierCopyWith(
          _Identifier value, $Res Function(_Identifier) then) =
      __$IdentifierCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'ID')
          String? id,
      @JsonKey(name: 'Use', unknownEnumValue: IdentifierUseEnum.official)
          IdentifierUseEnum? use,
      @JsonKey(name: 'Type')
          CodeableConcept? type,
      @JsonKey(name: 'System')
          String? system,
      @JsonKey(name: 'Value')
          String? value,
      @JsonKey(name: 'Period')
          Period? period,
      @JsonKey(name: 'Assigner')
          Reference? assigner});

  @override
  $CodeableConceptCopyWith<$Res>? get type;
  @override
  $PeriodCopyWith<$Res>? get period;
  @override
  $ReferenceCopyWith<$Res>? get assigner;
}

/// @nodoc
class __$IdentifierCopyWithImpl<$Res> extends _$IdentifierCopyWithImpl<$Res>
    implements _$IdentifierCopyWith<$Res> {
  __$IdentifierCopyWithImpl(
      _Identifier _value, $Res Function(_Identifier) _then)
      : super(_value, (v) => _then(v as _Identifier));

  @override
  _Identifier get _value => super._value as _Identifier;

  @override
  $Res call({
    Object? id = freezed,
    Object? use = freezed,
    Object? type = freezed,
    Object? system = freezed,
    Object? value = freezed,
    Object? period = freezed,
    Object? assigner = freezed,
  }) {
    return _then(_Identifier(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      use: use == freezed
          ? _value.use
          : use // ignore: cast_nullable_to_non_nullable
              as IdentifierUseEnum?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      system: system == freezed
          ? _value.system
          : system // ignore: cast_nullable_to_non_nullable
              as String?,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      period: period == freezed
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as Period?,
      assigner: assigner == freezed
          ? _value.assigner
          : assigner // ignore: cast_nullable_to_non_nullable
              as Reference?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Identifier implements _Identifier {
  _$_Identifier(
      {@JsonKey(name: 'ID')
          this.id,
      @JsonKey(name: 'Use', unknownEnumValue: IdentifierUseEnum.official)
          this.use,
      @JsonKey(name: 'Type')
          this.type,
      @JsonKey(name: 'System')
          this.system,
      @JsonKey(name: 'Value')
          this.value,
      @JsonKey(name: 'Period')
          this.period,
      @JsonKey(name: 'Assigner')
          this.assigner});

  factory _$_Identifier.fromJson(Map<String, dynamic> json) =>
      _$_$_IdentifierFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? id;
  @override

  /// The purpose of this identifier.
  @JsonKey(name: 'Use', unknownEnumValue: IdentifierUseEnum.official)
  final IdentifierUseEnum? use;
  @override

  /// A coded type for the identifier that can be used to determine which
  ///  identifier to use for a specific purpose.
  @JsonKey(name: 'Type')
  final CodeableConcept? type;
  @override

  /// Establishes the namespace for the value - that is, a URL that describes
  ///  a set values that are unique.
  @JsonKey(name: 'System')
  final String? system;
  @override

  /// The portion of the identifier typically relevant to the user and which
  ///  is unique within the context of the system.
  @JsonKey(name: 'Value')
  final String? value;
  @override
  @JsonKey(name: 'Period')
  final Period? period;
  @override

  /// Organization that issued/manages the identifier.
  @JsonKey(name: 'Assigner')
  final Reference? assigner;

  @override
  String toString() {
    return 'Identifier(id: $id, use: $use, type: $type, system: $system, value: $value, period: $period, assigner: $assigner)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Identifier &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.use, use) ||
                const DeepCollectionEquality().equals(other.use, use)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.system, system) ||
                const DeepCollectionEquality().equals(other.system, system)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)) &&
            (identical(other.period, period) ||
                const DeepCollectionEquality().equals(other.period, period)) &&
            (identical(other.assigner, assigner) ||
                const DeepCollectionEquality()
                    .equals(other.assigner, assigner)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(use) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(system) ^
      const DeepCollectionEquality().hash(value) ^
      const DeepCollectionEquality().hash(period) ^
      const DeepCollectionEquality().hash(assigner);

  @JsonKey(ignore: true)
  @override
  _$IdentifierCopyWith<_Identifier> get copyWith =>
      __$IdentifierCopyWithImpl<_Identifier>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_IdentifierToJson(this);
  }
}

abstract class _Identifier implements Identifier {
  factory _Identifier(
      {@JsonKey(name: 'ID')
          String? id,
      @JsonKey(name: 'Use', unknownEnumValue: IdentifierUseEnum.official)
          IdentifierUseEnum? use,
      @JsonKey(name: 'Type')
          CodeableConcept? type,
      @JsonKey(name: 'System')
          String? system,
      @JsonKey(name: 'Value')
          String? value,
      @JsonKey(name: 'Period')
          Period? period,
      @JsonKey(name: 'Assigner')
          Reference? assigner}) = _$_Identifier;

  factory _Identifier.fromJson(Map<String, dynamic> json) =
      _$_Identifier.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;
  @override

  /// The purpose of this identifier.
  @JsonKey(name: 'Use', unknownEnumValue: IdentifierUseEnum.official)
  IdentifierUseEnum? get use => throw _privateConstructorUsedError;
  @override

  /// A coded type for the identifier that can be used to determine which
  ///  identifier to use for a specific purpose.
  @JsonKey(name: 'Type')
  CodeableConcept? get type => throw _privateConstructorUsedError;
  @override

  /// Establishes the namespace for the value - that is, a URL that describes
  ///  a set values that are unique.
  @JsonKey(name: 'System')
  String? get system => throw _privateConstructorUsedError;
  @override

  /// The portion of the identifier typically relevant to the user and which
  ///  is unique within the context of the system.
  @JsonKey(name: 'Value')
  String? get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Period')
  Period? get period => throw _privateConstructorUsedError;
  @override

  /// Organization that issued/manages the identifier.
  @JsonKey(name: 'Assigner')
  Reference? get assigner => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$IdentifierCopyWith<_Identifier> get copyWith =>
      throw _privateConstructorUsedError;
}
