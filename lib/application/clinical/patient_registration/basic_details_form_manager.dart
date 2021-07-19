import 'package:bewell_pro_core/application/clinical/patient_registration/validator_mixin.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_registration_image_data.dart';
import 'package:bewell_pro_core/domain/clinical/entities/simple_patient_registration_input.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/entities/identification_details.dart';
import 'package:bewell_pro_core/domain/core/entities/name_input.dart';
import 'package:bewell_pro_core/domain/core/entities/phone_number_input.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:rxdart/rxdart.dart';
import 'phone_number_form_manager.dart';

class BasicDetailsFormManager with Validator {
  final BehaviorSubject<String> _firstName = BehaviorSubject<String>();
  Stream<String> get firstName => _firstName.stream.transform(validateName);
  Sink<String> get inFirstName => _firstName.sink;

  final BehaviorSubject<String> _lastName = BehaviorSubject<String>();
  Stream<String> get lastName => _lastName.stream.transform(validateName);
  Sink<String> get inLastName => _lastName.sink;

  final PhoneNumberFormManager _phoneManager = PhoneNumberFormManager();
  PhoneNumberFormManager get phoneManager => _phoneManager;

  final BehaviorSubject<DateTime> _dateOfBirth = BehaviorSubject<DateTime>();
  Sink<DateTime> get inDateOfBirth => _dateOfBirth.sink;

  final BehaviorSubject<Gender> _gender = BehaviorSubject<Gender>();
  Stream<Gender> get gender => _gender.stream.transform(validateGender);
  Sink<Gender> get inGender => _gender.sink;

  final BehaviorSubject<IdentificationDetails> _identificationDocument =
      BehaviorSubject<IdentificationDetails>();
  Stream<IdentificationDetails> get id =>
      _identificationDocument.stream.transform(validateIdNumber);
  Sink<IdentificationDetails> get inId => _identificationDocument.sink;

  final BehaviorSubject<String> _documentType = BehaviorSubject<String>();
  Sink<String> get inDocumentType => _documentType.sink;

  final BehaviorSubject<PatientRegistrationImageData> _profileImage =
      BehaviorSubject<PatientRegistrationImageData>();
  Stream<PatientRegistrationImageData> get profileImage => _profileImage.stream;
  Sink<PatientRegistrationImageData> get inProfileImage => _profileImage.sink;

  final BehaviorSubject<PatientRegistrationImageData> _idDocumentFront =
      BehaviorSubject<PatientRegistrationImageData>();
  Stream<PatientRegistrationImageData> get idDocumentFront =>
      _idDocumentFront.stream;
  Sink<PatientRegistrationImageData> get inIdDocumentFront =>
      _idDocumentFront.sink;

  final BehaviorSubject<PatientRegistrationImageData> _idDocumentBack =
      BehaviorSubject<PatientRegistrationImageData>();
  Stream<PatientRegistrationImageData> get idDocumentBack =>
      _idDocumentBack.stream;
  Sink<PatientRegistrationImageData> get inIdDocumentBack =>
      _idDocumentBack.sink;

  Stream<bool> get isFormValid => CombineLatestStream.list(
        <Stream<dynamic>>[
          _firstName,
          _lastName,
          _phoneManager.phoneNumber,
          _dateOfBirth,
          _gender,
          _identificationDocument,
          _phoneManager.verificationCode,
        ],
      ).map<bool>((List<dynamic> values) {
        final String firstName = values[0] as String;
        final String lastName = values[1] as String;
        final String phoneNumber = values[2] as String;
        final DateTime dob = values[3] as DateTime;
        final Gender gender = values[4] as Gender;
        final IdentificationDetails idNo = values[5] as IdentificationDetails;
        final String verificationCode = values[6] as String;

        return Validator.isValidName(firstName) &&
            Validator.isValidName(lastName) &&
            Validator.isValidPhone(phoneNumber) &&
            Validator.isValidDate(dob) &&
            Validator.isValidGender(gender) &&
            Validator.isValidIdNo(idNo.documentNumber) &&
            verificationCode.isNotEmpty;
      });

  void updateImageData({
    required ImageDocumentType documentType,
    required PatientRegistrationImageData imageData,
  }) {
    switch (documentType) {
      case ImageDocumentType.Profile:
        inProfileImage.add(imageData);
        break;
      case ImageDocumentType.IDDocumentFront:
        inIdDocumentFront.add(imageData);
        break;
      case ImageDocumentType.IDDocumentBack:
        inIdDocumentBack.add(imageData);
        break;
    }
  }

  SimplePatientRegistrationInput submit() {
    final String? firstName = _firstName.valueOrNull;

    final String? lastName = _lastName.valueOrNull;

    final String? gender = _gender.valueOrNull?.name.toLowerCase();

    final DateTime? dateOfBirth = _dateOfBirth.valueOrNull;

    final String? primaryPhoneNumber = _phoneManager.phoneNumberValue;

    final String? verificationCode = _phoneManager.verificationCodeValue;

    final bool? mobileOptIn = _phoneManager.mobileOptInValue;

    final List<PhoneNumberInput> phoneNumbers = <PhoneNumberInput>[
      PhoneNumberInput(
          msisdn: PhoneNumber.withValue(primaryPhoneNumber!),
          verificationCode: verificationCode!,
          isUSSD: false,
          communicationOptIn: mobileOptIn!)
    ];

    final List<NameInput> names = <NameInput>[
      NameInput(
        firstName: Name.withValue(firstName!),
        lastName: Name.withValue(lastName!),
      ),
    ];

    IdentificationDetails? id = _identificationDocument.value;

    final PatientRegistrationImageData? frontIdImage =
        _idDocumentFront.valueOrNull;
    final PatientRegistrationImageData? backIdImage =
        _idDocumentBack.valueOrNull;

    final List<PatientRegistrationImageData> images =
        <PatientRegistrationImageData>[];

    if (frontIdImage != null) {
      images.add(frontIdImage);
    }

    if (backIdImage != null) {
      images.add(backIdImage);
    }

    id = id.copyWith(images: images);

    final SimplePatientRegistrationInput registerPatientPayload =
        SimplePatientRegistrationInput(
      names: names,
      gender: gender!,
      identificationDetails: id,
      birthDate: dateOfBirth!,
      phoneNumbers: phoneNumbers,
      maritalStatus: MaritalStatus.Unknown,
      active: true,
      replicateUSSD: false,
    );

    return registerPatientPayload;
  }
}
