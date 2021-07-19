// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'patient_contact.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PatientContact _$PatientContactFromJson(Map<String, dynamic> json) {
  return _PatientContact.fromJson(json);
}

/// @nodoc
class _$PatientContactTearOff {
  const _$PatientContactTearOff();

  _PatientContact call(
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
          Period? period}) {
    return _PatientContact(
      id: id,
      relationship: relationship,
      name: name,
      telecom: telecom,
      address: address,
      gender: gender,
      organization: organization,
      period: period,
    );
  }

  PatientContact fromJson(Map<String, Object> json) {
    return PatientContact.fromJson(json);
  }
}

/// @nodoc
const $PatientContact = _$PatientContactTearOff();

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
      _$PatientContactCopyWithImpl<$Res>;
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
class _$PatientContactCopyWithImpl<$Res>
    implements $PatientContactCopyWith<$Res> {
  _$PatientContactCopyWithImpl(this._value, this._then);

  final PatientContact _value;
  // ignore: unused_field
  final $Res Function(PatientContact) _then;

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
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      relationship: relationship == freezed
          ? _value.relationship
          : relationship // ignore: cast_nullable_to_non_nullable
              as List<CodeableConcept?>?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as HumanName?,
      telecom: telecom == freezed
          ? _value.telecom
          : telecom // ignore: cast_nullable_to_non_nullable
              as List<ContactPoint?>?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address?,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as PatientGenderEnum?,
      organization: organization == freezed
          ? _value.organization
          : organization // ignore: cast_nullable_to_non_nullable
              as Reference?,
      period: period == freezed
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as Period?,
    ));
  }

  @override
  $HumanNameCopyWith<$Res>? get name {
    if (_value.name == null) {
      return null;
    }

    return $HumanNameCopyWith<$Res>(_value.name!, (value) {
      return _then(_value.copyWith(name: value));
    });
  }

  @override
  $AddressCopyWith<$Res>? get address {
    if (_value.address == null) {
      return null;
    }

    return $AddressCopyWith<$Res>(_value.address!, (value) {
      return _then(_value.copyWith(address: value));
    });
  }

  @override
  $ReferenceCopyWith<$Res>? get organization {
    if (_value.organization == null) {
      return null;
    }

    return $ReferenceCopyWith<$Res>(_value.organization!, (value) {
      return _then(_value.copyWith(organization: value));
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
}

/// @nodoc
abstract class _$PatientContactCopyWith<$Res>
    implements $PatientContactCopyWith<$Res> {
  factory _$PatientContactCopyWith(
          _PatientContact value, $Res Function(_PatientContact) then) =
      __$PatientContactCopyWithImpl<$Res>;
  @override
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
class __$PatientContactCopyWithImpl<$Res>
    extends _$PatientContactCopyWithImpl<$Res>
    implements _$PatientContactCopyWith<$Res> {
  __$PatientContactCopyWithImpl(
      _PatientContact _value, $Res Function(_PatientContact) _then)
      : super(_value, (v) => _then(v as _PatientContact));

  @override
  _PatientContact get _value => super._value as _PatientContact;

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
    return _then(_PatientContact(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      relationship: relationship == freezed
          ? _value.relationship
          : relationship // ignore: cast_nullable_to_non_nullable
              as List<CodeableConcept?>?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as HumanName?,
      telecom: telecom == freezed
          ? _value.telecom
          : telecom // ignore: cast_nullable_to_non_nullable
              as List<ContactPoint?>?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address?,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as PatientGenderEnum?,
      organization: organization == freezed
          ? _value.organization
          : organization // ignore: cast_nullable_to_non_nullable
              as Reference?,
      period: period == freezed
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
          this.relationship,
      @JsonKey(name: 'Name')
          this.name,
      @JsonKey(name: 'Telecom')
          this.telecom,
      @JsonKey(name: 'Address')
          this.address,
      @JsonKey(name: 'Gender', unknownEnumValue: PatientGenderEnum.unknown)
          this.gender,
      @JsonKey(name: 'Organization')
          this.organization,
      @JsonKey(name: 'period')
          this.period});

  factory _$_PatientContact.fromJson(Map<String, dynamic> json) =>
      _$_$_PatientContactFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? id;
  @override

  /// The nature of the relationship between the patient and the contact person.
  @JsonKey(name: 'Relationship')
  final List<CodeableConcept?>? relationship;
  @override

  /// A name associated with the contact person.
  @JsonKey(name: 'Name')
  final HumanName? name;
  @override

  /// A contact detail for the person, e.g. a telephone number or an email address.
  @JsonKey(name: 'Telecom')
  final List<ContactPoint?>? telecom;
  @override

  /// Address for the contact person.
  @JsonKey(name: 'Address')
  final Address? address;
  @override

  /// Administrative Gender - the gender that the contact person is
  ///  considered to have for administration and record keeping purposes.
  @JsonKey(name: 'Gender', unknownEnumValue: PatientGenderEnum.unknown)
  final PatientGenderEnum? gender;
  @override

  /// Organization on behalf of which the contact is acting or for which
  ///  the contact is working.
  @JsonKey(name: 'Organization')
  final Reference? organization;
  @override

  /// The period during which this contact person or organization is valid
  ///  to be contacted relating to this patient.
  @JsonKey(name: 'period')
  final Period? period;

  @override
  String toString() {
    return 'PatientContact(id: $id, relationship: $relationship, name: $name, telecom: $telecom, address: $address, gender: $gender, organization: $organization, period: $period)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PatientContact &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.relationship, relationship) ||
                const DeepCollectionEquality()
                    .equals(other.relationship, relationship)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.telecom, telecom) ||
                const DeepCollectionEquality()
                    .equals(other.telecom, telecom)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
            (identical(other.gender, gender) ||
                const DeepCollectionEquality().equals(other.gender, gender)) &&
            (identical(other.organization, organization) ||
                const DeepCollectionEquality()
                    .equals(other.organization, organization)) &&
            (identical(other.period, period) ||
                const DeepCollectionEquality().equals(other.period, period)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(relationship) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(telecom) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(gender) ^
      const DeepCollectionEquality().hash(organization) ^
      const DeepCollectionEquality().hash(period);

  @JsonKey(ignore: true)
  @override
  _$PatientContactCopyWith<_PatientContact> get copyWith =>
      __$PatientContactCopyWithImpl<_PatientContact>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PatientContactToJson(this);
  }
}

abstract class _PatientContact implements PatientContact {
  factory _PatientContact(
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
          Period? period}) = _$_PatientContact;

  factory _PatientContact.fromJson(Map<String, dynamic> json) =
      _$_PatientContact.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;
  @override

  /// The nature of the relationship between the patient and the contact person.
  @JsonKey(name: 'Relationship')
  List<CodeableConcept?>? get relationship =>
      throw _privateConstructorUsedError;
  @override

  /// A name associated with the contact person.
  @JsonKey(name: 'Name')
  HumanName? get name => throw _privateConstructorUsedError;
  @override

  /// A contact detail for the person, e.g. a telephone number or an email address.
  @JsonKey(name: 'Telecom')
  List<ContactPoint?>? get telecom => throw _privateConstructorUsedError;
  @override

  /// Address for the contact person.
  @JsonKey(name: 'Address')
  Address? get address => throw _privateConstructorUsedError;
  @override

  /// Administrative Gender - the gender that the contact person is
  ///  considered to have for administration and record keeping purposes.
  @JsonKey(name: 'Gender', unknownEnumValue: PatientGenderEnum.unknown)
  PatientGenderEnum? get gender => throw _privateConstructorUsedError;
  @override

  /// Organization on behalf of which the contact is acting or for which
  ///  the contact is working.
  @JsonKey(name: 'Organization')
  Reference? get organization => throw _privateConstructorUsedError;
  @override

  /// The period during which this contact person or organization is valid
  ///  to be contacted relating to this patient.
  @JsonKey(name: 'period')
  Period? get period => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PatientContactCopyWith<_PatientContact> get copyWith =>
      throw _privateConstructorUsedError;
}
