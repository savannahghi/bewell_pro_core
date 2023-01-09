// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'patient.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Patient _$PatientFromJson(Map<String, dynamic> json) {
  return _Patient.fromJson(json);
}

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
      _$PatientCopyWithImpl<$Res, Patient>;
  @useResult
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
class _$PatientCopyWithImpl<$Res, $Val extends Patient>
    implements $PatientCopyWith<$Res> {
  _$PatientCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
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
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as Narrative?,
      identifier: freezed == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as List<Identifier?>?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as List<HumanName?>?,
      telecom: freezed == telecom
          ? _value.telecom
          : telecom // ignore: cast_nullable_to_non_nullable
              as List<ContactPoint?>?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as PatientGenderEnum?,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String?,
      deceasedBool: freezed == deceasedBool
          ? _value.deceasedBool
          : deceasedBool // ignore: cast_nullable_to_non_nullable
              as bool?,
      deceasedDateTime: freezed == deceasedDateTime
          ? _value.deceasedDateTime
          : deceasedDateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      multipleBirthBoolean: freezed == multipleBirthBoolean
          ? _value.multipleBirthBoolean
          : multipleBirthBoolean // ignore: cast_nullable_to_non_nullable
              as bool?,
      multipleBirthInteger: freezed == multipleBirthInteger
          ? _value.multipleBirthInteger
          : multipleBirthInteger // ignore: cast_nullable_to_non_nullable
              as int?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address?,
      maritalStatus: freezed == maritalStatus
          ? _value.maritalStatus
          : maritalStatus // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as List<Attachment>?,
      contact: freezed == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as PatientContact?,
      communication: freezed == communication
          ? _value.communication
          : communication // ignore: cast_nullable_to_non_nullable
              as List<Communication?>?,
      generalPractitioner: freezed == generalPractitioner
          ? _value.generalPractitioner
          : generalPractitioner // ignore: cast_nullable_to_non_nullable
              as List<Reference?>?,
      managingOrganization: freezed == managingOrganization
          ? _value.managingOrganization
          : managingOrganization // ignore: cast_nullable_to_non_nullable
              as Reference?,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as List<PatientLink?>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NarrativeCopyWith<$Res>? get text {
    if (_value.text == null) {
      return null;
    }

    return $NarrativeCopyWith<$Res>(_value.text!, (value) {
      return _then(_value.copyWith(text: value) as $Val);
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
  $CodeableConceptCopyWith<$Res>? get maritalStatus {
    if (_value.maritalStatus == null) {
      return null;
    }

    return $CodeableConceptCopyWith<$Res>(_value.maritalStatus!, (value) {
      return _then(_value.copyWith(maritalStatus: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PatientContactCopyWith<$Res>? get contact {
    if (_value.contact == null) {
      return null;
    }

    return $PatientContactCopyWith<$Res>(_value.contact!, (value) {
      return _then(_value.copyWith(contact: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ReferenceCopyWith<$Res>? get managingOrganization {
    if (_value.managingOrganization == null) {
      return null;
    }

    return $ReferenceCopyWith<$Res>(_value.managingOrganization!, (value) {
      return _then(_value.copyWith(managingOrganization: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PatientCopyWith<$Res> implements $PatientCopyWith<$Res> {
  factory _$$_PatientCopyWith(
          _$_Patient value, $Res Function(_$_Patient) then) =
      __$$_PatientCopyWithImpl<$Res>;
  @override
  @useResult
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
class __$$_PatientCopyWithImpl<$Res>
    extends _$PatientCopyWithImpl<$Res, _$_Patient>
    implements _$$_PatientCopyWith<$Res> {
  __$$_PatientCopyWithImpl(_$_Patient _value, $Res Function(_$_Patient) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
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
    return _then(_$_Patient(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as Narrative?,
      identifier: freezed == identifier
          ? _value._identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as List<Identifier?>?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      name: freezed == name
          ? _value._name
          : name // ignore: cast_nullable_to_non_nullable
              as List<HumanName?>?,
      telecom: freezed == telecom
          ? _value._telecom
          : telecom // ignore: cast_nullable_to_non_nullable
              as List<ContactPoint?>?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as PatientGenderEnum?,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String?,
      deceasedBool: freezed == deceasedBool
          ? _value.deceasedBool
          : deceasedBool // ignore: cast_nullable_to_non_nullable
              as bool?,
      deceasedDateTime: freezed == deceasedDateTime
          ? _value.deceasedDateTime
          : deceasedDateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      multipleBirthBoolean: freezed == multipleBirthBoolean
          ? _value.multipleBirthBoolean
          : multipleBirthBoolean // ignore: cast_nullable_to_non_nullable
              as bool?,
      multipleBirthInteger: freezed == multipleBirthInteger
          ? _value.multipleBirthInteger
          : multipleBirthInteger // ignore: cast_nullable_to_non_nullable
              as int?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address?,
      maritalStatus: freezed == maritalStatus
          ? _value.maritalStatus
          : maritalStatus // ignore: cast_nullable_to_non_nullable
              as CodeableConcept?,
      photo: freezed == photo
          ? _value._photo
          : photo // ignore: cast_nullable_to_non_nullable
              as List<Attachment>?,
      contact: freezed == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as PatientContact?,
      communication: freezed == communication
          ? _value._communication
          : communication // ignore: cast_nullable_to_non_nullable
              as List<Communication?>?,
      generalPractitioner: freezed == generalPractitioner
          ? _value._generalPractitioner
          : generalPractitioner // ignore: cast_nullable_to_non_nullable
              as List<Reference?>?,
      managingOrganization: freezed == managingOrganization
          ? _value.managingOrganization
          : managingOrganization // ignore: cast_nullable_to_non_nullable
              as Reference?,
      link: freezed == link
          ? _value._link
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
          final List<Identifier?>? identifier,
      @JsonKey(name: 'Active')
          this.active,
      @JsonKey(name: 'Name')
          final List<HumanName?>? name,
      @JsonKey(name: 'Telecom')
          final List<ContactPoint?>? telecom,
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
          final List<Attachment>? photo,
      @JsonKey(name: 'Contact')
          this.contact,
      @JsonKey(name: 'Communication')
          final List<Communication?>? communication,
      @JsonKey(name: 'GeneralPractitioner')
          final List<Reference?>? generalPractitioner,
      @JsonKey(name: 'ManagingOrganization')
          this.managingOrganization,
      @JsonKey(name: 'Link')
          final List<PatientLink?>? link})
      : _identifier = identifier,
        _name = name,
        _telecom = telecom,
        _photo = photo,
        _communication = communication,
        _generalPractitioner = generalPractitioner,
        _link = link;

  factory _$_Patient.fromJson(Map<String, dynamic> json) =>
      _$$_PatientFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? id;
  @override
  @JsonKey(name: 'Text')
  final Narrative? text;

  /// An identifier for this patient.
  final List<Identifier?>? _identifier;

  /// An identifier for this patient.
  @override
  @JsonKey(name: 'Identifier')
  List<Identifier?>? get identifier {
    final value = _identifier;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'Active')
  final bool? active;
  final List<HumanName?>? _name;
  @override
  @JsonKey(name: 'Name')
  List<HumanName?>? get name {
    final value = _name;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// A contact detail (e.g. a telephone number or an email address)
  /// by which the individual may be contacted.
  final List<ContactPoint?>? _telecom;

  /// A contact detail (e.g. a telephone number or an email address)
  /// by which the individual may be contacted.
  @override
  @JsonKey(name: 'Telecom')
  List<ContactPoint?>? get telecom {
    final value = _telecom;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

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

  /// Indicates whether the patient is part of a multiple (boolean) or
  ///  indicates the actual birth order (integer).
  @override
  @JsonKey(name: 'MultipleBirthBoolean')
  final bool? multipleBirthBoolean;
  @override
  @JsonKey(name: 'MultipleBirthInteger')
  final int? multipleBirthInteger;
  @override
  @JsonKey(name: 'Address')
  final Address? address;

  /// This field contains a patient's most recent marital (civil) status.
  @override
  @JsonKey(name: 'MaritalStatus')
  final CodeableConcept? maritalStatus;

  /// Image of the patient.
  final List<Attachment>? _photo;

  /// Image of the patient.
  @override
  @JsonKey(name: 'Photo')
  List<Attachment>? get photo {
    final value = _photo;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// A contact party (e.g. guardian, partner, friend) for the patient.
  @override
  @JsonKey(name: 'Contact')
  final PatientContact? contact;

  /// A language which may be used to communicate with the patient about his
  ///  or her health.
  final List<Communication?>? _communication;

  /// A language which may be used to communicate with the patient about his
  ///  or her health.
  @override
  @JsonKey(name: 'Communication')
  List<Communication?>? get communication {
    final value = _communication;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Patient's nominated care provider.
  final List<Reference?>? _generalPractitioner;

  /// Patient's nominated care provider.
  @override
  @JsonKey(name: 'GeneralPractitioner')
  List<Reference?>? get generalPractitioner {
    final value = _generalPractitioner;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Organization that is the custodian of the patient record.
  @override
  @JsonKey(name: 'ManagingOrganization')
  final Reference? managingOrganization;

  /// Link to another patient resource that concerns the same actual patient.
  final List<PatientLink?>? _link;

  /// Link to another patient resource that concerns the same actual patient.
  @override
  @JsonKey(name: 'Link')
  List<PatientLink?>? get link {
    final value = _link;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Patient(id: $id, text: $text, identifier: $identifier, active: $active, name: $name, telecom: $telecom, gender: $gender, birthDate: $birthDate, deceasedBool: $deceasedBool, deceasedDateTime: $deceasedDateTime, multipleBirthBoolean: $multipleBirthBoolean, multipleBirthInteger: $multipleBirthInteger, address: $address, maritalStatus: $maritalStatus, photo: $photo, contact: $contact, communication: $communication, generalPractitioner: $generalPractitioner, managingOrganization: $managingOrganization, link: $link)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Patient &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            const DeepCollectionEquality()
                .equals(other._identifier, _identifier) &&
            (identical(other.active, active) || other.active == active) &&
            const DeepCollectionEquality().equals(other._name, _name) &&
            const DeepCollectionEquality().equals(other._telecom, _telecom) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.deceasedBool, deceasedBool) ||
                other.deceasedBool == deceasedBool) &&
            (identical(other.deceasedDateTime, deceasedDateTime) ||
                other.deceasedDateTime == deceasedDateTime) &&
            (identical(other.multipleBirthBoolean, multipleBirthBoolean) ||
                other.multipleBirthBoolean == multipleBirthBoolean) &&
            (identical(other.multipleBirthInteger, multipleBirthInteger) ||
                other.multipleBirthInteger == multipleBirthInteger) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.maritalStatus, maritalStatus) ||
                other.maritalStatus == maritalStatus) &&
            const DeepCollectionEquality().equals(other._photo, _photo) &&
            (identical(other.contact, contact) || other.contact == contact) &&
            const DeepCollectionEquality()
                .equals(other._communication, _communication) &&
            const DeepCollectionEquality()
                .equals(other._generalPractitioner, _generalPractitioner) &&
            (identical(other.managingOrganization, managingOrganization) ||
                other.managingOrganization == managingOrganization) &&
            const DeepCollectionEquality().equals(other._link, _link));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        text,
        const DeepCollectionEquality().hash(_identifier),
        active,
        const DeepCollectionEquality().hash(_name),
        const DeepCollectionEquality().hash(_telecom),
        gender,
        birthDate,
        deceasedBool,
        deceasedDateTime,
        multipleBirthBoolean,
        multipleBirthInteger,
        address,
        maritalStatus,
        const DeepCollectionEquality().hash(_photo),
        contact,
        const DeepCollectionEquality().hash(_communication),
        const DeepCollectionEquality().hash(_generalPractitioner),
        managingOrganization,
        const DeepCollectionEquality().hash(_link)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PatientCopyWith<_$_Patient> get copyWith =>
      __$$_PatientCopyWithImpl<_$_Patient>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PatientToJson(
      this,
    );
  }
}

abstract class _Patient implements Patient {
  factory _Patient(
      {@JsonKey(name: 'ID')
          final String? id,
      @JsonKey(name: 'Text')
          final Narrative? text,
      @JsonKey(name: 'Identifier')
          final List<Identifier?>? identifier,
      @JsonKey(name: 'Active')
          final bool? active,
      @JsonKey(name: 'Name')
          final List<HumanName?>? name,
      @JsonKey(name: 'Telecom')
          final List<ContactPoint?>? telecom,
      @JsonKey(name: 'Gender', unknownEnumValue: PatientGenderEnum.unknown)
          final PatientGenderEnum? gender,
      @JsonKey(name: 'BirthDate')
          final String? birthDate,
      @JsonKey(name: 'DeceasedBoolean')
          final bool? deceasedBool,
      @JsonKey(name: 'DeceasedDateTime')
          final String? deceasedDateTime,
      @JsonKey(name: 'MultipleBirthBoolean')
          final bool? multipleBirthBoolean,
      @JsonKey(name: 'MultipleBirthInteger')
          final int? multipleBirthInteger,
      @JsonKey(name: 'Address')
          final Address? address,
      @JsonKey(name: 'MaritalStatus')
          final CodeableConcept? maritalStatus,
      @JsonKey(name: 'Photo')
          final List<Attachment>? photo,
      @JsonKey(name: 'Contact')
          final PatientContact? contact,
      @JsonKey(name: 'Communication')
          final List<Communication?>? communication,
      @JsonKey(name: 'GeneralPractitioner')
          final List<Reference?>? generalPractitioner,
      @JsonKey(name: 'ManagingOrganization')
          final Reference? managingOrganization,
      @JsonKey(name: 'Link')
          final List<PatientLink?>? link}) = _$_Patient;

  factory _Patient.fromJson(Map<String, dynamic> json) = _$_Patient.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id;
  @override
  @JsonKey(name: 'Text')
  Narrative? get text;
  @override

  /// An identifier for this patient.
  @JsonKey(name: 'Identifier')
  List<Identifier?>? get identifier;
  @override
  @JsonKey(name: 'Active')
  bool? get active;
  @override
  @JsonKey(name: 'Name')
  List<HumanName?>? get name;
  @override

  /// A contact detail (e.g. a telephone number or an email address)
  /// by which the individual may be contacted.
  @JsonKey(name: 'Telecom')
  List<ContactPoint?>? get telecom;
  @override
  @JsonKey(name: 'Gender', unknownEnumValue: PatientGenderEnum.unknown)
  PatientGenderEnum? get gender;
  @override
  @JsonKey(name: 'BirthDate')
  String? get birthDate;
  @override
  @JsonKey(name: 'DeceasedBoolean')
  bool? get deceasedBool;
  @override
  @JsonKey(name: 'DeceasedDateTime')
  String? get deceasedDateTime;
  @override

  /// Indicates whether the patient is part of a multiple (boolean) or
  ///  indicates the actual birth order (integer).
  @JsonKey(name: 'MultipleBirthBoolean')
  bool? get multipleBirthBoolean;
  @override
  @JsonKey(name: 'MultipleBirthInteger')
  int? get multipleBirthInteger;
  @override
  @JsonKey(name: 'Address')
  Address? get address;
  @override

  /// This field contains a patient's most recent marital (civil) status.
  @JsonKey(name: 'MaritalStatus')
  CodeableConcept? get maritalStatus;
  @override

  /// Image of the patient.
  @JsonKey(name: 'Photo')
  List<Attachment>? get photo;
  @override

  /// A contact party (e.g. guardian, partner, friend) for the patient.
  @JsonKey(name: 'Contact')
  PatientContact? get contact;
  @override

  /// A language which may be used to communicate with the patient about his
  ///  or her health.
  @JsonKey(name: 'Communication')
  List<Communication?>? get communication;
  @override

  /// Patient's nominated care provider.
  @JsonKey(name: 'GeneralPractitioner')
  List<Reference?>? get generalPractitioner;
  @override

  /// Organization that is the custodian of the patient record.
  @JsonKey(name: 'ManagingOrganization')
  Reference? get managingOrganization;
  @override

  /// Link to another patient resource that concerns the same actual patient.
  @JsonKey(name: 'Link')
  List<PatientLink?>? get link;
  @override
  @JsonKey(ignore: true)
  _$$_PatientCopyWith<_$_Patient> get copyWith =>
      throw _privateConstructorUsedError;
}
