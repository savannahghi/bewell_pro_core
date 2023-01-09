// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'patient_contact.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PatientContact _$PatientContactFromJson(Map<String, dynamic> json) {
  return _PatientContact.fromJson(json);
}

/// @nodoc
mixin _$PatientContact {
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;

  /// The nature of the relationship between the patient and the contact person.
  @JsonKey(name: 'Relationship')
  List<CodeableConcept?>? get relationship =>
      throw _privateConstructorUsedError;

  /// A name associated with the contact person.
  @JsonKey(name: 'Name')
  HumanName? get name => throw _privateConstructorUsedError;

  /// A contact detail for the person, e.g. a telephone number or an email address.
  @JsonKey(name: 'Telecom')
  List<ContactPoint?>? get telecom => throw _privateConstructorUsedError;

  /// Address for the contact person.
  @JsonKey(name: 'Address')
  Address? get address => throw _privateConstructorUsedError;

  /// Administrative Gender - the gender that the contact person is
  ///  considered to have for administration and record keeping purposes.
  @JsonKey(name: 'Gender', unknownEnumValue: PatientGenderEnum.unknown)
  PatientGenderEnum? get gender => throw _privateConstructorUsedError;

  /// Organization on behalf of which the contact is acting or for which
  ///  the contact is working.
  @JsonKey(name: 'Organization')
  Reference? get organization => throw _privateConstructorUsedError;

  /// The period during which this contact person or organization is valid
  ///  to be contacted relating to this patient.
  @JsonKey(name: 'period')
  Period? get period => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PatientContactCopyWith<PatientContact> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientContactCopyWith<$Res> {
  factory $PatientContactCopyWith(
          PatientContact value, $Res Function(PatientContact) then) =
      _$PatientContactCopyWithImpl<$Res, PatientContact>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID')
          String? id,
      @JsonKey(name: 'Relationship')
          List<CodeableConcept?>? relationship,
      @JsonKey(name: 'Name')
          HumanName? name,
      @JsonKey(name: 'Telecom')
          List<ContactPoint?>? telecom,
      @JsonKey(name: 'Address')
          Address? address,
      @JsonKey(name: 'Gender', unknownEnumValue: PatientGenderEnum.unknown)
          PatientGenderEnum? gender,
      @JsonKey(name: 'Organization')
          Reference? organization,
      @JsonKey(name: 'period')
          Period? period});

  $HumanNameCopyWith<$Res>? get name;
  $AddressCopyWith<$Res>? get address;
  $ReferenceCopyWith<$Res>? get organization;
  $PeriodCopyWith<$Res>? get period;
}

/// @nodoc
class _$PatientContactCopyWithImpl<$Res, $Val extends PatientContact>
    implements $PatientContactCopyWith<$Res> {
  _$PatientContactCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? relationship = freezed,
    Object? name = freezed,
    Object? telecom = freezed,
    Object? address = freezed,
    Object? gender = freezed,
    Object? organization = freezed,
    Object? period = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      relationship: freezed == relationship
          ? _value.relationship
          : relationship // ignore: cast_nullable_to_non_nullable
              as List<CodeableConcept?>?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as HumanName?,
      telecom: freezed == telecom
          ? _value.telecom
          : telecom // ignore: cast_nullable_to_non_nullable
              as List<ContactPoint?>?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as PatientGenderEnum?,
      organization: freezed == organization
          ? _value.organization
          : organization // ignore: cast_nullable_to_non_nullable
              as Reference?,
      period: freezed == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as Period?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $HumanNameCopyWith<$Res>? get name {
    if (_value.name == null) {
      return null;
    }

    return $HumanNameCopyWith<$Res>(_value.name!, (value) {
      return _then(_value.copyWith(name: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res>? get address {
    if (_value.address == null) {
      return null;
    }

    return $AddressCopyWith<$Res>(_value.address!, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ReferenceCopyWith<$Res>? get organization {
    if (_value.organization == null) {
      return null;
    }

    return $ReferenceCopyWith<$Res>(_value.organization!, (value) {
      return _then(_value.copyWith(organization: value) as $Val);
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
}

/// @nodoc
abstract class _$$_PatientContactCopyWith<$Res>
    implements $PatientContactCopyWith<$Res> {
  factory _$$_PatientContactCopyWith(
          _$_PatientContact value, $Res Function(_$_PatientContact) then) =
      __$$_PatientContactCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID')
          String? id,
      @JsonKey(name: 'Relationship')
          List<CodeableConcept?>? relationship,
      @JsonKey(name: 'Name')
          HumanName? name,
      @JsonKey(name: 'Telecom')
          List<ContactPoint?>? telecom,
      @JsonKey(name: 'Address')
          Address? address,
      @JsonKey(name: 'Gender', unknownEnumValue: PatientGenderEnum.unknown)
          PatientGenderEnum? gender,
      @JsonKey(name: 'Organization')
          Reference? organization,
      @JsonKey(name: 'period')
          Period? period});

  @override
  $HumanNameCopyWith<$Res>? get name;
  @override
  $AddressCopyWith<$Res>? get address;
  @override
  $ReferenceCopyWith<$Res>? get organization;
  @override
  $PeriodCopyWith<$Res>? get period;
}

/// @nodoc
class __$$_PatientContactCopyWithImpl<$Res>
    extends _$PatientContactCopyWithImpl<$Res, _$_PatientContact>
    implements _$$_PatientContactCopyWith<$Res> {
  __$$_PatientContactCopyWithImpl(
      _$_PatientContact _value, $Res Function(_$_PatientContact) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? relationship = freezed,
    Object? name = freezed,
    Object? telecom = freezed,
    Object? address = freezed,
    Object? gender = freezed,
    Object? organization = freezed,
    Object? period = freezed,
  }) {
    return _then(_$_PatientContact(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      relationship: freezed == relationship
          ? _value._relationship
          : relationship // ignore: cast_nullable_to_non_nullable
              as List<CodeableConcept?>?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as HumanName?,
      telecom: freezed == telecom
          ? _value._telecom
          : telecom // ignore: cast_nullable_to_non_nullable
              as List<ContactPoint?>?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as PatientGenderEnum?,
      organization: freezed == organization
          ? _value.organization
          : organization // ignore: cast_nullable_to_non_nullable
              as Reference?,
      period: freezed == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as Period?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PatientContact implements _PatientContact {
  _$_PatientContact(
      {@JsonKey(name: 'ID')
          this.id,
      @JsonKey(name: 'Relationship')
          final List<CodeableConcept?>? relationship,
      @JsonKey(name: 'Name')
          this.name,
      @JsonKey(name: 'Telecom')
          final List<ContactPoint?>? telecom,
      @JsonKey(name: 'Address')
          this.address,
      @JsonKey(name: 'Gender', unknownEnumValue: PatientGenderEnum.unknown)
          this.gender,
      @JsonKey(name: 'Organization')
          this.organization,
      @JsonKey(name: 'period')
          this.period})
      : _relationship = relationship,
        _telecom = telecom;

  factory _$_PatientContact.fromJson(Map<String, dynamic> json) =>
      _$$_PatientContactFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? id;

  /// The nature of the relationship between the patient and the contact person.
  final List<CodeableConcept?>? _relationship;

  /// The nature of the relationship between the patient and the contact person.
  @override
  @JsonKey(name: 'Relationship')
  List<CodeableConcept?>? get relationship {
    final value = _relationship;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// A name associated with the contact person.
  @override
  @JsonKey(name: 'Name')
  final HumanName? name;

  /// A contact detail for the person, e.g. a telephone number or an email address.
  final List<ContactPoint?>? _telecom;

  /// A contact detail for the person, e.g. a telephone number or an email address.
  @override
  @JsonKey(name: 'Telecom')
  List<ContactPoint?>? get telecom {
    final value = _telecom;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Address for the contact person.
  @override
  @JsonKey(name: 'Address')
  final Address? address;

  /// Administrative Gender - the gender that the contact person is
  ///  considered to have for administration and record keeping purposes.
  @override
  @JsonKey(name: 'Gender', unknownEnumValue: PatientGenderEnum.unknown)
  final PatientGenderEnum? gender;

  /// Organization on behalf of which the contact is acting or for which
  ///  the contact is working.
  @override
  @JsonKey(name: 'Organization')
  final Reference? organization;

  /// The period during which this contact person or organization is valid
  ///  to be contacted relating to this patient.
  @override
  @JsonKey(name: 'period')
  final Period? period;

  @override
  String toString() {
    return 'PatientContact(id: $id, relationship: $relationship, name: $name, telecom: $telecom, address: $address, gender: $gender, organization: $organization, period: $period)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PatientContact &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._relationship, _relationship) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._telecom, _telecom) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.organization, organization) ||
                other.organization == organization) &&
            (identical(other.period, period) || other.period == period));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_relationship),
      name,
      const DeepCollectionEquality().hash(_telecom),
      address,
      gender,
      organization,
      period);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PatientContactCopyWith<_$_PatientContact> get copyWith =>
      __$$_PatientContactCopyWithImpl<_$_PatientContact>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PatientContactToJson(
      this,
    );
  }
}

abstract class _PatientContact implements PatientContact {
  factory _PatientContact(
      {@JsonKey(name: 'ID')
          final String? id,
      @JsonKey(name: 'Relationship')
          final List<CodeableConcept?>? relationship,
      @JsonKey(name: 'Name')
          final HumanName? name,
      @JsonKey(name: 'Telecom')
          final List<ContactPoint?>? telecom,
      @JsonKey(name: 'Address')
          final Address? address,
      @JsonKey(name: 'Gender', unknownEnumValue: PatientGenderEnum.unknown)
          final PatientGenderEnum? gender,
      @JsonKey(name: 'Organization')
          final Reference? organization,
      @JsonKey(name: 'period')
          final Period? period}) = _$_PatientContact;

  factory _PatientContact.fromJson(Map<String, dynamic> json) =
      _$_PatientContact.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id;
  @override

  /// The nature of the relationship between the patient and the contact person.
  @JsonKey(name: 'Relationship')
  List<CodeableConcept?>? get relationship;
  @override

  /// A name associated with the contact person.
  @JsonKey(name: 'Name')
  HumanName? get name;
  @override

  /// A contact detail for the person, e.g. a telephone number or an email address.
  @JsonKey(name: 'Telecom')
  List<ContactPoint?>? get telecom;
  @override

  /// Address for the contact person.
  @JsonKey(name: 'Address')
  Address? get address;
  @override

  /// Administrative Gender - the gender that the contact person is
  ///  considered to have for administration and record keeping purposes.
  @JsonKey(name: 'Gender', unknownEnumValue: PatientGenderEnum.unknown)
  PatientGenderEnum? get gender;
  @override

  /// Organization on behalf of which the contact is acting or for which
  ///  the contact is working.
  @JsonKey(name: 'Organization')
  Reference? get organization;
  @override

  /// The period during which this contact person or organization is valid
  ///  to be contacted relating to this patient.
  @JsonKey(name: 'period')
  Period? get period;
  @override
  @JsonKey(ignore: true)
  _$$_PatientContactCopyWith<_$_PatientContact> get copyWith =>
      throw _privateConstructorUsedError;
}
