// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'identifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Identifier _$IdentifierFromJson(Map<String, dynamic> json) {
  return _Identifier.fromJson(json);
}

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
      _$IdentifierCopyWithImpl<$Res, Identifier>;
  @useResult
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
class _$IdentifierCopyWithImpl<$Res, $Val extends Identifier>
    implements $IdentifierCopyWith<$Res> {
  _$IdentifierCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
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
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      use: freezed == use
          ? _value.use
          : use // ignore: cast_nullable_to_non_nullable
              as IdentifierUseEnum?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      system: freezed == system
          ? _value.system
          : system // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      period: freezed == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as Period?,
      assigner: freezed == assigner
          ? _value.assigner
          : assigner // ignore: cast_nullable_to_non_nullable
              as Reference?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CodeableConceptCopyWith<$Res>? get type {
    if (_value.type == null) {
      return null;
    }

    return $CodeableConceptCopyWith<$Res>(_value.type!, (value) {
      return _then(_value.copyWith(type: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PeriodCopyWith<$Res>? get period {
    if (_value.period == null) {
      return null;
    }

    return $PeriodCopyWith<$Res>(_value.period!, (value) {
      return _then(_value.copyWith(period: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ReferenceCopyWith<$Res>? get assigner {
    if (_value.assigner == null) {
      return null;
    }

    return $ReferenceCopyWith<$Res>(_value.assigner!, (value) {
      return _then(_value.copyWith(assigner: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_IdentifierCopyWith<$Res>
    implements $IdentifierCopyWith<$Res> {
  factory _$$_IdentifierCopyWith(
          _$_Identifier value, $Res Function(_$_Identifier) then) =
      __$$_IdentifierCopyWithImpl<$Res>;
  @override
  @useResult
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
class __$$_IdentifierCopyWithImpl<$Res>
    extends _$IdentifierCopyWithImpl<$Res, _$_Identifier>
    implements _$$_IdentifierCopyWith<$Res> {
  __$$_IdentifierCopyWithImpl(
      _$_Identifier _value, $Res Function(_$_Identifier) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
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
    return _then(_$_Identifier(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      use: freezed == use
          ? _value.use
          : use // ignore: cast_nullable_to_non_nullable
              as IdentifierUseEnum?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      system: freezed == system
          ? _value.system
          : system // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      period: freezed == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as Period?,
      assigner: freezed == assigner
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
      _$$_IdentifierFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? id;

  /// The purpose of this identifier.
  @override
  @JsonKey(name: 'Use', unknownEnumValue: IdentifierUseEnum.official)
  final IdentifierUseEnum? use;

  /// A coded type for the identifier that can be used to determine which
  ///  identifier to use for a specific purpose.
  @override
  @JsonKey(name: 'Type')
  final CodeableConcept? type;

  /// Establishes the namespace for the value - that is, a URL that describes
  ///  a set values that are unique.
  @override
  @JsonKey(name: 'System')
  final String? system;

  /// The portion of the identifier typically relevant to the user and which
  ///  is unique within the context of the system.
  @override
  @JsonKey(name: 'Value')
  final String? value;
  @override
  @JsonKey(name: 'Period')
  final Period? period;

  /// Organization that issued/manages the identifier.
  @override
  @JsonKey(name: 'Assigner')
  final Reference? assigner;

  @override
  String toString() {
    return 'Identifier(id: $id, use: $use, type: $type, system: $system, value: $value, period: $period, assigner: $assigner)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Identifier &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.use, use) || other.use == use) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.system, system) || other.system == system) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.assigner, assigner) ||
                other.assigner == assigner));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, use, type, system, value, period, assigner);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_IdentifierCopyWith<_$_Identifier> get copyWith =>
      __$$_IdentifierCopyWithImpl<_$_Identifier>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IdentifierToJson(
      this,
    );
  }
}

abstract class _Identifier implements Identifier {
  factory _Identifier(
      {@JsonKey(name: 'ID')
          final String? id,
      @JsonKey(name: 'Use', unknownEnumValue: IdentifierUseEnum.official)
          final IdentifierUseEnum? use,
      @JsonKey(name: 'Type')
          final CodeableConcept? type,
      @JsonKey(name: 'System')
          final String? system,
      @JsonKey(name: 'Value')
          final String? value,
      @JsonKey(name: 'Period')
          final Period? period,
      @JsonKey(name: 'Assigner')
          final Reference? assigner}) = _$_Identifier;

  factory _Identifier.fromJson(Map<String, dynamic> json) =
      _$_Identifier.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id;
  @override

  /// The purpose of this identifier.
  @JsonKey(name: 'Use', unknownEnumValue: IdentifierUseEnum.official)
  IdentifierUseEnum? get use;
  @override

  /// A coded type for the identifier that can be used to determine which
  ///  identifier to use for a specific purpose.
  @JsonKey(name: 'Type')
  CodeableConcept? get type;
  @override

  /// Establishes the namespace for the value - that is, a URL that describes
  ///  a set values that are unique.
  @JsonKey(name: 'System')
  String? get system;
  @override

  /// The portion of the identifier typically relevant to the user and which
  ///  is unique within the context of the system.
  @JsonKey(name: 'Value')
  String? get value;
  @override
  @JsonKey(name: 'Period')
  Period? get period;
  @override

  /// Organization that issued/manages the identifier.
  @JsonKey(name: 'Assigner')
  Reference? get assigner;
  @override
  @JsonKey(ignore: true)
  _$$_IdentifierCopyWith<_$_Identifier> get copyWith =>
      throw _privateConstructorUsedError;
}
