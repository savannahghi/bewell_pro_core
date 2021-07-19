// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'patient.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Patient _$PatientFromJson(Map<String, dynamic> json) {
  return _Patient.fromJson(json);
}

/// @nodoc
class _$PatientTearOff {
  const _$PatientTearOff();

  _Patient call(
      {@JsonKey(name: 'ID')
          String? id,
      @JsonKey(name: 'Text')
          Narrative? text,
      @JsonKey(name: 'Identifier')
          List<Identifier?>? identifier,
      @JsonKey(name: 'Active')
          bool? active,
      @JsonKey(name: 'Name')
          List<HumanName?>? name,
      @JsonKey(name: 'Telecom')
          List<ContactPoint?>? telecom,
      @JsonKey(name: 'Gender', unknownEnumValue: PatientGenderEnum.unknown)
          PatientGenderEnum? gender,
      @JsonKey(name: 'BirthDate')
          String? birthDate,
      @JsonKey(name: 'DeceasedBoolean')
          bool? deceasedBool,
      @JsonKey(name: 'DeceasedDateTime')
          String? deceasedDateTime,
      @JsonKey(name: 'MultipleBirthBoolean')
          bool? multipleBirthBoolean,
      @JsonKey(name: 'MultipleBirthInteger')
          int? multipleBirthInteger,
      @JsonKey(name: 'Address')
          Address? address,
      @JsonKey(name: 'MaritalStatus')
          CodeableConcept? maritalStatus,
      @JsonKey(name: 'Photo')
          List<Attachment>? photo,
      @JsonKey(name: 'Contact')
          PatientContact? contact,
      @JsonKey(name: 'Communication')
          List<Communication?>? communication,
      @JsonKey(name: 'GeneralPractitioner')
          List<Reference?>? generalPractitioner,
      @JsonKey(name: 'ManagingOrganization')
          Reference? managingOrganization,
      @JsonKey(name: 'Link')
          List<PatientLink?>? link}) {
    return _Patient(
      id: id,
      text: text,
      identifier: identifier,
      active: active,
      name: name,
      telecom: telecom,
      gender: gender,
      birthDate: birthDate,
      deceasedBool: deceasedBool,
      deceasedDateTime: deceasedDateTime,
      multipleBirthBoolean: multipleBirthBoolean,
      multipleBirthInteger: multipleBirthInteger,
      address: address,
      maritalStatus: maritalStatus,
      photo: photo,
      contact: contact,
      communication: communication,
      generalPractitioner: generalPractitioner,
      managingOrganization: managingOrganization,
      link: link,
    );
  }

  Patient fromJson(Map<String, Object> json) {
    return Patient.fromJson(json);
  }
}

/// @nodoc
const $Patient = _$PatientTearOff();

/// @nodoc
mixin _$Patient {
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Text')
  Narrative? get text => throw _privateConstructorUsedError;

  /// An identifier for this patient.
  @JsonKey(name: 'Identifier')
  List<Identifier?>? get identifier => throw _privateConstructorUsedError;
  @JsonKey(name: 'Active')
  bool? get active => throw _privateConstructorUsedError;
  @JsonKey(name: 'Name')
  List<HumanName?>? get name => throw _privateConstructorUsedError;

  /// A contact detail (e.g. a telephone number or an email address)
  /// by which the individual may be contacted.
  @JsonKey(name: 'Telecom')
  List<ContactPoint?>? get telecom => throw _privateConstructorUsedError;
  @JsonKey(name: 'Gender', unknownEnumValue: PatientGenderEnum.unknown)
  PatientGenderEnum? get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'BirthDate')
  String? get birthDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'DeceasedBoolean')
  bool? get deceasedBool => throw _privateConstructorUsedError;
  @JsonKey(name: 'DeceasedDateTime')
  String? get deceasedDateTime => throw _privateConstructorUsedError;

  /// Indicates whether the patient is part of a multiple (boolean) or
  ///  indicates the actual birth order (integer).
  @JsonKey(name: 'MultipleBirthBoolean')
  bool? get multipleBirthBoolean => throw _privateConstructorUsedError;
  @JsonKey(name: 'MultipleBirthInteger')
  int? get multipleBirthInteger => throw _privateConstructorUsedError;
  @JsonKey(name: 'Address')
  Address? get address => throw _privateConstructorUsedError;

  /// This field contains a patient's most recent marital (civil) status.
  @JsonKey(name: 'MaritalStatus')
  CodeableConcept? get maritalStatus => throw _privateConstructorUsedError;

  /// Image of the patient.
  @JsonKey(name: 'Photo')
  List<Attachment>? get photo => throw _privateConstructorUsedError;

  /// A contact party (e.g. guardian, partner, friend) for the patient.
  @JsonKey(name: 'Contact')
  PatientContact? get contact => throw _privateConstructorUsedError;

  /// A language which may be used to communicate with the patient about his
  ///  or her health.
  @JsonKey(name: 'Communication')
  List<Communication?>? get communication => throw _privateConstructorUsedError;

  /// Patient's nominated care provider.
  @JsonKey(name: 'GeneralPractitioner')
  List<Reference?>? get generalPractitioner =>
      throw _privateConstructorUsedError;

  /// Organization that is the custodian of the patient record.
  @JsonKey(name: 'ManagingOrganization')
  Reference? get managingOrganization => throw _privateConstructorUsedError;

  /// Link to another patient resource that concerns the same actual patient.
  @JsonKey(name: 'Link')
  List<PatientLink?>? get link => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PatientCopyWith<Patient> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientCopyWith<$Res> {
  factory $PatientCopyWith(Patient value, $Res Function(Patient) then) =
      _$PatientCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'ID')
          String? id,
      @JsonKey(name: 'Text')
          Narrative? text,
      @JsonKey(name: 'Identifier')
          List<Identifier?>? identifier,
      @JsonKey(name: 'Active')
          bool? active,
      @JsonKey(name: 'Name')
          List<HumanName?>? name,
      @JsonKey(name: 'Telecom')
          List<ContactPoint?>? telecom,
      @JsonKey(name: 'Gender', unknownEnumValue: PatientGenderEnum.unknown)
          PatientGenderEnum? gender,
      @JsonKey(name: 'BirthDate')
          String? birthDate,
      @JsonKey(name: 'DeceasedBoolean')
          bool? deceasedBool,
      @JsonKey(name: 'DeceasedDateTime')
          String? deceasedDateTime,
      @JsonKey(name: 'MultipleBirthBoolean')
          bool? multipleBirthBoolean,
      @JsonKey(name: 'MultipleBirthInteger')
          int? multipleBirthInteger,
      @JsonKey(name: 'Address')
          Address? address,
      @JsonKey(name: 'MaritalStatus')
          CodeableConcept? maritalStatus,
      @JsonKey(name: 'Photo')
          List<Attachment>? photo,
      @JsonKey(name: 'Contact')
          PatientContact? contact,
      @JsonKey(name: 'Communication')
          List<Communication?>? communication,
      @JsonKey(name: 'GeneralPractitioner')
          List<Reference?>? generalPractitioner,
      @JsonKey(name: 'ManagingOrganization')
          Reference? managingOrganization,
      @JsonKey(name: 'Link')
          List<PatientLink?>? link});

  $NarrativeCopyWith<$Res>? get text;
  $AddressCopyWith<$Res>? get address;
  $CodeableConceptCopyWith<$Res>? get maritalStatus;
  $PatientContactCopyWith<$Res>? get contact;
  $ReferenceCopyWith<$Res>? get managingOrganization;
}

/// @nodoc
class _$PatientCopyWithImpl<$Res> implements $PatientCopyWith<$Res> {
  _$PatientCopyWithImpl(this._value, this._then);

  final Patient _value;
  // ignore: unused_field
  final $Res Function(Patient) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? text = freezed,
    Object? identifier = freezed,
    Object? active = freezed,
    Object? name = freezed,
    Object? telecom = freezed,
    Object? gender = freezed,
    Object? birthDate = freezed,
    Object? deceasedBool = freezed,
    Object? deceasedDateTime = freezed,
    Object? multipleBirthBoolean = freezed,
    Object? multipleBirthInteger = freezed,
    Object? address = freezed,
    Object? maritalStatus = freezed,
    Object? photo = freezed,
    Object? contact = freezed,
    Object? communication = freezed,
    Object? generalPractitioner = freezed,
    Object? managingOrganization = freezed,
    Object? link = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as Narrative?,
      identifier: identifier == freezed
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as List<Identifier?>?,
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as List<HumanName?>?,
      telecom: telecom == freezed
          ? _value.telecom
          : telecom // ignore: cast_nullable_to_non_nullable
              as List<ContactPoint?>?,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as PatientGenderEnum?,
      birthDate: birthDate == freezed
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String?,
      deceasedBool: deceasedBool == freezed
          ? _value.deceasedBool
          : deceasedBool // ignore: cast_nullable_to_non_nullable
              as bool?,
      deceasedDateTime: deceasedDateTime == freezed
          ? _value.deceasedDateTime
          : deceasedDateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      multipleBirthBoolean: multipleBirthBoolean == freezed
          ? _value.multipleBirthBoolean
          : multipleBirthBoolean // ignore: cast_nullable_to_non_nullable
              as bool?,
      multipleBirthInteger: multipleBirthInteger == freezed
          ? _value.multipleBirthInteger
          : multipleBirthInteger // ignore: cast_nullable_to_non_nullable
              as int?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address?,
      maritalStatus: maritalStatus == freezed
          ? _value.maritalStatus
          : maritalStatus // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      photo: photo == freezed
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as List<Attachment>?,
      contact: contact == freezed
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as PatientContact?,
      communication: communication == freezed
          ? _value.communication
          : communication // ignore: cast_nullable_to_non_nullable
              as List<Communication?>?,
      generalPractitioner: generalPractitioner == freezed
          ? _value.generalPractitioner
          : generalPractitioner // ignore: cast_nullable_to_non_nullable
              as List<Reference?>?,
      managingOrganization: managingOrganization == freezed
          ? _value.managingOrganization
          : managingOrganization // ignore: cast_nullable_to_non_nullable
              as Reference?,
      link: link == freezed
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as List<PatientLink?>?,
    ));
  }

  @override
  $NarrativeCopyWith<$Res>? get text {
    if (_value.text == null) {
      return null;
    }

    return $NarrativeCopyWith<$Res>(_value.text!, (value) {
      return _then(_value.copyWith(text: value));
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
  $CodeableConceptCopyWith<$Res>? get maritalStatus {
    if (_value.maritalStatus == null) {
      return null;
    }

    return $CodeableConceptCopyWith<$Res>(_value.maritalStatus!, (value) {
      return _then(_value.copyWith(maritalStatus: value));
    });
  }

  @override
  $PatientContactCopyWith<$Res>? get contact {
    if (_value.contact == null) {
      return null;
    }

    return $PatientContactCopyWith<$Res>(_value.contact!, (value) {
      return _then(_value.copyWith(contact: value));
    });
  }

  @override
  $ReferenceCopyWith<$Res>? get managingOrganization {
    if (_value.managingOrganization == null) {
      return null;
    }

    return $ReferenceCopyWith<$Res>(_value.managingOrganization!, (value) {
      return _then(_value.copyWith(managingOrganization: value));
    });
  }
}

/// @nodoc
abstract class _$PatientCopyWith<$Res> implements $PatientCopyWith<$Res> {
  factory _$PatientCopyWith(_Patient value, $Res Function(_Patient) then) =
      __$PatientCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'ID')
          String? id,
      @JsonKey(name: 'Text')
          Narrative? text,
      @JsonKey(name: 'Identifier')
          List<Identifier?>? identifier,
      @JsonKey(name: 'Active')
          bool? active,
      @JsonKey(name: 'Name')
          List<HumanName?>? name,
      @JsonKey(name: 'Telecom')
          List<ContactPoint?>? telecom,
      @JsonKey(name: 'Gender', unknownEnumValue: PatientGenderEnum.unknown)
          PatientGenderEnum? gender,
      @JsonKey(name: 'BirthDate')
          String? birthDate,
      @JsonKey(name: 'DeceasedBoolean')
          bool? deceasedBool,
      @JsonKey(name: 'DeceasedDateTime')
          String? deceasedDateTime,
      @JsonKey(name: 'MultipleBirthBoolean')
          bool? multipleBirthBoolean,
      @JsonKey(name: 'MultipleBirthInteger')
          int? multipleBirthInteger,
      @JsonKey(name: 'Address')
          Address? address,
      @JsonKey(name: 'MaritalStatus')
          CodeableConcept? maritalStatus,
      @JsonKey(name: 'Photo')
          List<Attachment>? photo,
      @JsonKey(name: 'Contact')
          PatientContact? contact,
      @JsonKey(name: 'Communication')
          List<Communication?>? communication,
      @JsonKey(name: 'GeneralPractitioner')
          List<Reference?>? generalPractitioner,
      @JsonKey(name: 'ManagingOrganization')
          Reference? managingOrganization,
      @JsonKey(name: 'Link')
          List<PatientLink?>? link});

  @override
  $NarrativeCopyWith<$Res>? get text;
  @override
  $AddressCopyWith<$Res>? get address;
  @override
  $CodeableConceptCopyWith<$Res>? get maritalStatus;
  @override
  $PatientContactCopyWith<$Res>? get contact;
  @override
  $ReferenceCopyWith<$Res>? get managingOrganization;
}

/// @nodoc
class __$PatientCopyWithImpl<$Res> extends _$PatientCopyWithImpl<$Res>
    implements _$PatientCopyWith<$Res> {
  __$PatientCopyWithImpl(_Patient _value, $Res Function(_Patient) _then)
      : super(_value, (v) => _then(v as _Patient));

  @override
  _Patient get _value => super._value as _Patient;

  @override
  $Res call({
    Object? id = freezed,
    Object? text = freezed,
    Object? identifier = freezed,
    Object? active = freezed,
    Object? name = freezed,
    Object? telecom = freezed,
    Object? gender = freezed,
    Object? birthDate = freezed,
    Object? deceasedBool = freezed,
    Object? deceasedDateTime = freezed,
    Object? multipleBirthBoolean = freezed,
    Object? multipleBirthInteger = freezed,
    Object? address = freezed,
    Object? maritalStatus = freezed,
    Object? photo = freezed,
    Object? contact = freezed,
    Object? communication = freezed,
    Object? generalPractitioner = freezed,
    Object? managingOrganization = freezed,
    Object? link = freezed,
  }) {
    return _then(_Patient(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as Narrative?,
      identifier: identifier == freezed
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as List<Identifier?>?,
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as List<HumanName?>?,
      telecom: telecom == freezed
          ? _value.telecom
          : telecom // ignore: cast_nullable_to_non_nullable
              as List<ContactPoint?>?,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as PatientGenderEnum?,
      birthDate: birthDate == freezed
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String?,
      deceasedBool: deceasedBool == freezed
          ? _value.deceasedBool
          : deceasedBool // ignore: cast_nullable_to_non_nullable
              as bool?,
      deceasedDateTime: deceasedDateTime == freezed
          ? _value.deceasedDateTime
          : deceasedDateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      multipleBirthBoolean: multipleBirthBoolean == freezed
          ? _value.multipleBirthBoolean
          : multipleBirthBoolean // ignore: cast_nullable_to_non_nullable
              as bool?,
      multipleBirthInteger: multipleBirthInteger == freezed
          ? _value.multipleBirthInteger
          : multipleBirthInteger // ignore: cast_nullable_to_non_nullable
              as int?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address?,
      maritalStatus: maritalStatus == freezed
          ? _value.maritalStatus
          : maritalStatus // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      photo: photo == freezed
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as List<Attachment>?,
      contact: contact == freezed
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as PatientContact?,
      communication: communication == freezed
          ? _value.communication
          : communication // ignore: cast_nullable_to_non_nullable
              as List<Communication?>?,
      generalPractitioner: generalPractitioner == freezed
          ? _value.generalPractitioner
          : generalPractitioner // ignore: cast_nullable_to_non_nullable
              as List<Reference?>?,
      managingOrganization: managingOrganization == freezed
          ? _value.managingOrganization
          : managingOrganization // ignore: cast_nullable_to_non_nullable
              as Reference?,
      link: link == freezed
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as List<PatientLink?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Patient implements _Patient {
  _$_Patient(
      {@JsonKey(name: 'ID')
          this.id,
      @JsonKey(name: 'Text')
          this.text,
      @JsonKey(name: 'Identifier')
          this.identifier,
      @JsonKey(name: 'Active')
          this.active,
      @JsonKey(name: 'Name')
          this.name,
      @JsonKey(name: 'Telecom')
          this.telecom,
      @JsonKey(name: 'Gender', unknownEnumValue: PatientGenderEnum.unknown)
          this.gender,
      @JsonKey(name: 'BirthDate')
          this.birthDate,
      @JsonKey(name: 'DeceasedBoolean')
          this.deceasedBool,
      @JsonKey(name: 'DeceasedDateTime')
          this.deceasedDateTime,
      @JsonKey(name: 'MultipleBirthBoolean')
          this.multipleBirthBoolean,
      @JsonKey(name: 'MultipleBirthInteger')
          this.multipleBirthInteger,
      @JsonKey(name: 'Address')
          this.address,
      @JsonKey(name: 'MaritalStatus')
          this.maritalStatus,
      @JsonKey(name: 'Photo')
          this.photo,
      @JsonKey(name: 'Contact')
          this.contact,
      @JsonKey(name: 'Communication')
          this.communication,
      @JsonKey(name: 'GeneralPractitioner')
          this.generalPractitioner,
      @JsonKey(name: 'ManagingOrganization')
          this.managingOrganization,
      @JsonKey(name: 'Link')
          this.link});

  factory _$_Patient.fromJson(Map<String, dynamic> json) =>
      _$_$_PatientFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? id;
  @override
  @JsonKey(name: 'Text')
  final Narrative? text;
  @override

  /// An identifier for this patient.
  @JsonKey(name: 'Identifier')
  final List<Identifier?>? identifier;
  @override
  @JsonKey(name: 'Active')
  final bool? active;
  @override
  @JsonKey(name: 'Name')
  final List<HumanName?>? name;
  @override

  /// A contact detail (e.g. a telephone number or an email address)
  /// by which the individual may be contacted.
  @JsonKey(name: 'Telecom')
  final List<ContactPoint?>? telecom;
  @override
  @JsonKey(name: 'Gender', unknownEnumValue: PatientGenderEnum.unknown)
  final PatientGenderEnum? gender;
  @override
  @JsonKey(name: 'BirthDate')
  final String? birthDate;
  @override
  @JsonKey(name: 'DeceasedBoolean')
  final bool? deceasedBool;
  @override
  @JsonKey(name: 'DeceasedDateTime')
  final String? deceasedDateTime;
  @override

  /// Indicates whether the patient is part of a multiple (boolean) or
  ///  indicates the actual birth order (integer).
  @JsonKey(name: 'MultipleBirthBoolean')
  final bool? multipleBirthBoolean;
  @override
  @JsonKey(name: 'MultipleBirthInteger')
  final int? multipleBirthInteger;
  @override
  @JsonKey(name: 'Address')
  final Address? address;
  @override

  /// This field contains a patient's most recent marital (civil) status.
  @JsonKey(name: 'MaritalStatus')
  final CodeableConcept? maritalStatus;
  @override

  /// Image of the patient.
  @JsonKey(name: 'Photo')
  final List<Attachment>? photo;
  @override

  /// A contact party (e.g. guardian, partner, friend) for the patient.
  @JsonKey(name: 'Contact')
  final PatientContact? contact;
  @override

  /// A language which may be used to communicate with the patient about his
  ///  or her health.
  @JsonKey(name: 'Communication')
  final List<Communication?>? communication;
  @override

  /// Patient's nominated care provider.
  @JsonKey(name: 'GeneralPractitioner')
  final List<Reference?>? generalPractitioner;
  @override

  /// Organization that is the custodian of the patient record.
  @JsonKey(name: 'ManagingOrganization')
  final Reference? managingOrganization;
  @override

  /// Link to another patient resource that concerns the same actual patient.
  @JsonKey(name: 'Link')
  final List<PatientLink?>? link;

  @override
  String toString() {
    return 'Patient(id: $id, text: $text, identifier: $identifier, active: $active, name: $name, telecom: $telecom, gender: $gender, birthDate: $birthDate, deceasedBool: $deceasedBool, deceasedDateTime: $deceasedDateTime, multipleBirthBoolean: $multipleBirthBoolean, multipleBirthInteger: $multipleBirthInteger, address: $address, maritalStatus: $maritalStatus, photo: $photo, contact: $contact, communication: $communication, generalPractitioner: $generalPractitioner, managingOrganization: $managingOrganization, link: $link)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Patient &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.text, text) ||
                const DeepCollectionEquality().equals(other.text, text)) &&
            (identical(other.identifier, identifier) ||
                const DeepCollectionEquality()
                    .equals(other.identifier, identifier)) &&
            (identical(other.active, active) ||
                const DeepCollectionEquality().equals(other.active, active)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.telecom, telecom) ||
                const DeepCollectionEquality()
                    .equals(other.telecom, telecom)) &&
            (identical(other.gender, gender) ||
                const DeepCollectionEquality().equals(other.gender, gender)) &&
            (identical(other.birthDate, birthDate) ||
                const DeepCollectionEquality()
                    .equals(other.birthDate, birthDate)) &&
            (identical(other.deceasedBool, deceasedBool) ||
                const DeepCollectionEquality()
                    .equals(other.deceasedBool, deceasedBool)) &&
            (identical(other.deceasedDateTime, deceasedDateTime) ||
                const DeepCollectionEquality()
                    .equals(other.deceasedDateTime, deceasedDateTime)) &&
            (identical(other.multipleBirthBoolean, multipleBirthBoolean) ||
                const DeepCollectionEquality().equals(
                    other.multipleBirthBoolean, multipleBirthBoolean)) &&
            (identical(other.multipleBirthInteger, multipleBirthInteger) ||
                const DeepCollectionEquality().equals(
                    other.multipleBirthInteger, multipleBirthInteger)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
            (identical(other.maritalStatus, maritalStatus) ||
                const DeepCollectionEquality()
                    .equals(other.maritalStatus, maritalStatus)) &&
            (identical(other.photo, photo) ||
                const DeepCollectionEquality().equals(other.photo, photo)) &&
            (identical(other.contact, contact) ||
                const DeepCollectionEquality()
                    .equals(other.contact, contact)) &&
            (identical(other.communication, communication) ||
                const DeepCollectionEquality()
                    .equals(other.communication, communication)) &&
            (identical(other.generalPractitioner, generalPractitioner) ||
                const DeepCollectionEquality()
                    .equals(other.generalPractitioner, generalPractitioner)) &&
            (identical(other.managingOrganization, managingOrganization) ||
                const DeepCollectionEquality().equals(
                    other.managingOrganization, managingOrganization)) &&
            (identical(other.link, link) ||
                const DeepCollectionEquality().equals(other.link, link)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(text) ^
      const DeepCollectionEquality().hash(identifier) ^
      const DeepCollectionEquality().hash(active) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(telecom) ^
      const DeepCollectionEquality().hash(gender) ^
      const DeepCollectionEquality().hash(birthDate) ^
      const DeepCollectionEquality().hash(deceasedBool) ^
      const DeepCollectionEquality().hash(deceasedDateTime) ^
      const DeepCollectionEquality().hash(multipleBirthBoolean) ^
      const DeepCollectionEquality().hash(multipleBirthInteger) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(maritalStatus) ^
      const DeepCollectionEquality().hash(photo) ^
      const DeepCollectionEquality().hash(contact) ^
      const DeepCollectionEquality().hash(communication) ^
      const DeepCollectionEquality().hash(generalPractitioner) ^
      const DeepCollectionEquality().hash(managingOrganization) ^
      const DeepCollectionEquality().hash(link);

  @JsonKey(ignore: true)
  @override
  _$PatientCopyWith<_Patient> get copyWith =>
      __$PatientCopyWithImpl<_Patient>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PatientToJson(this);
  }
}

abstract class _Patient implements Patient {
  factory _Patient(
      {@JsonKey(name: 'ID')
          String? id,
      @JsonKey(name: 'Text')
          Narrative? text,
      @JsonKey(name: 'Identifier')
          List<Identifier?>? identifier,
      @JsonKey(name: 'Active')
          bool? active,
      @JsonKey(name: 'Name')
          List<HumanName?>? name,
      @JsonKey(name: 'Telecom')
          List<ContactPoint?>? telecom,
      @JsonKey(name: 'Gender', unknownEnumValue: PatientGenderEnum.unknown)
          PatientGenderEnum? gender,
      @JsonKey(name: 'BirthDate')
          String? birthDate,
      @JsonKey(name: 'DeceasedBoolean')
          bool? deceasedBool,
      @JsonKey(name: 'DeceasedDateTime')
          String? deceasedDateTime,
      @JsonKey(name: 'MultipleBirthBoolean')
          bool? multipleBirthBoolean,
      @JsonKey(name: 'MultipleBirthInteger')
          int? multipleBirthInteger,
      @JsonKey(name: 'Address')
          Address? address,
      @JsonKey(name: 'MaritalStatus')
          CodeableConcept? maritalStatus,
      @JsonKey(name: 'Photo')
          List<Attachment>? photo,
      @JsonKey(name: 'Contact')
          PatientContact? contact,
      @JsonKey(name: 'Communication')
          List<Communication?>? communication,
      @JsonKey(name: 'GeneralPractitioner')
          List<Reference?>? generalPractitioner,
      @JsonKey(name: 'ManagingOrganization')
          Reference? managingOrganization,
      @JsonKey(name: 'Link')
          List<PatientLink?>? link}) = _$_Patient;

  factory _Patient.fromJson(Map<String, dynamic> json) = _$_Patient.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Text')
  Narrative? get text => throw _privateConstructorUsedError;
  @override

  /// An identifier for this patient.
  @JsonKey(name: 'Identifier')
  List<Identifier?>? get identifier => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Active')
  bool? get active => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Name')
  List<HumanName?>? get name => throw _privateConstructorUsedError;
  @override

  /// A contact detail (e.g. a telephone number or an email address)
  /// by which the individual may be contacted.
  @JsonKey(name: 'Telecom')
  List<ContactPoint?>? get telecom => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Gender', unknownEnumValue: PatientGenderEnum.unknown)
  PatientGenderEnum? get gender => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'BirthDate')
  String? get birthDate => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'DeceasedBoolean')
  bool? get deceasedBool => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'DeceasedDateTime')
  String? get deceasedDateTime => throw _privateConstructorUsedError;
  @override

  /// Indicates whether the patient is part of a multiple (boolean) or
  ///  indicates the actual birth order (integer).
  @JsonKey(name: 'MultipleBirthBoolean')
  bool? get multipleBirthBoolean => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'MultipleBirthInteger')
  int? get multipleBirthInteger => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Address')
  Address? get address => throw _privateConstructorUsedError;
  @override

  /// This field contains a patient's most recent marital (civil) status.
  @JsonKey(name: 'MaritalStatus')
  CodeableConcept? get maritalStatus => throw _privateConstructorUsedError;
  @override

  /// Image of the patient.
  @JsonKey(name: 'Photo')
  List<Attachment>? get photo => throw _privateConstructorUsedError;
  @override

  /// A contact party (e.g. guardian, partner, friend) for the patient.
  @JsonKey(name: 'Contact')
  PatientContact? get contact => throw _privateConstructorUsedError;
  @override

  /// A language which may be used to communicate with the patient about his
  ///  or her health.
  @JsonKey(name: 'Communication')
  List<Communication?>? get communication => throw _privateConstructorUsedError;
  @override

  /// Patient's nominated care provider.
  @JsonKey(name: 'GeneralPractitioner')
  List<Reference?>? get generalPractitioner =>
      throw _privateConstructorUsedError;
  @override

  /// Organization that is the custodian of the patient record.
  @JsonKey(name: 'ManagingOrganization')
  Reference? get managingOrganization => throw _privateConstructorUsedError;
  @override

  /// Link to another patient resource that concerns the same actual patient.
  @JsonKey(name: 'Link')
  List<PatientLink?>? get link => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PatientCopyWith<_Patient> get copyWith =>
      throw _privateConstructorUsedError;
}
