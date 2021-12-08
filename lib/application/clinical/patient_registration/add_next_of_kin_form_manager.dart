// Package imports:
import 'package:domain_objects/value_objects.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';

// Project imports:
import 'package:bewell_pro_core/application/clinical/patient_registration/phone_number_form_manager.dart';
import 'package:bewell_pro_core/application/clinical/patient_registration/validator_mixin.dart';
import 'package:bewell_pro_core/domain/clinical/entities/simple_next_of_kin_input.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/entities/name_input.dart';
import 'package:bewell_pro_core/domain/core/entities/phone_number_input.dart';

class AddNextOfKinFormManager with Validator {
  final BehaviorSubject<String> _firstName = BehaviorSubject<String>();
  Stream<String> get firstName => _firstName.stream.transform(validateName);
  Sink<String> get inFirstName => _firstName.sink;

  final BehaviorSubject<String> _lastName = BehaviorSubject<String>();
  Stream<String> get lastName => _lastName.stream.transform(validateName);
  Sink<String> get inLastName => _lastName.sink;

  final PhoneNumberFormManager _phoneManager = PhoneNumberFormManager();
  PhoneNumberFormManager get phoneManager => _phoneManager;

  final BehaviorSubject<DateTime> _dateOfBirth = BehaviorSubject<DateTime>();
  Stream<DateTime> get dateOfBirth =>
      _dateOfBirth.stream.transform(validateDate);
  Sink<DateTime> get inDateOfBirth => _dateOfBirth.sink;

  final BehaviorSubject<Gender> _gender = BehaviorSubject<Gender>();
  Stream<Gender> get gender => _gender.stream.transform(validateGender);
  Sink<Gender> get inGender => _gender.sink;

  final BehaviorSubject<NextOfKinRelation> _relationship =
      BehaviorSubject<NextOfKinRelation>();
  Stream<NextOfKinRelation> get relationship => _relationship.stream;
  Sink<NextOfKinRelation> get inRelationship => _relationship.sink;

  final BehaviorSubject<String> _patientId = BehaviorSubject<String>();
  Sink<String> get inPatientId => _patientId.sink;

  Stream<bool> get isFormValid => CombineLatestStream.list(
        <Stream<dynamic>>[
          _firstName,
          _lastName,
          _phoneManager.phoneNumber,
          _dateOfBirth,
          _gender,
          _phoneManager.verificationCode,
          _relationship,
        ],
      ).map<bool>((List<dynamic> values) {
        final String firstName = values[0] as String;
        final String lastName = values[1] as String;
        final String phoneNumber = values[2] as String;
        final DateTime dob = values[3] as DateTime;
        final Gender gender = values[4] as Gender;
        final String verificationCode = values[5] as String;
        final NextOfKinRelation relation = values[6] as NextOfKinRelation;

        return Validator.isValidName(firstName) &&
            Validator.isValidName(lastName) &&
            Validator.isValidPhone(phoneNumber) &&
            Validator.isValidDate(dob) &&
            Validator.isValidGender(gender) &&
            verificationCode.isNotEmpty &&
            relation != NextOfKinRelation.Unknown;
      });

  DateTime parseDateString(String dateString) {
    final DateTime date =
        DateFormat.yMMMMd('en_GB').parseLoose(dateString.replaceAll(',', ''));
    return date;
  }

  SimpleNextOfKinInput submit() {
    final String? patientID = _patientId.valueOrNull;

    final String? firstName = _firstName.valueOrNull;

    final String? lastName = _lastName.valueOrNull;

    final String? phoneNumber = _phoneManager.phoneNumberValue;

    final String? verificationCode = _phoneManager.verificationCodeValue;

    final Gender? gender = _gender.valueOrNull;

    final DateTime? birthDate = _dateOfBirth.valueOrNull;

    final NextOfKinRelation? relationship = _relationship.valueOrNull;

    final PhoneNumberInput phoneNumberInput = PhoneNumberInput(
      msisdn: PhoneNumber.withValue(phoneNumber!),
      verificationCode: verificationCode!,
      isUSSD: false,
      communicationOptIn: true,
    );
    final List<PhoneNumberInput> phoneNumbers = <PhoneNumberInput>[
      phoneNumberInput
    ];

    final List<NameInput> names = <NameInput>[
      NameInput(
        firstName: Name.withValue(firstName!),
        lastName: Name.withValue(lastName!),
      ),
    ];

    final SimpleNextOfKinInput nextOfKinInput = SimpleNextOfKinInput(
      patientID: patientID!,
      names: names,
      phoneNumbers: phoneNumbers,
      gender: gender!,
      birthDate: birthDate!,
      relationship: relationship!,
      active: true,
    );

    return nextOfKinInput;
  }

  String dateToString(DateTime dateTime) {
    return DateFormat('d MMM, yyyy').format(dateTime);
  }
}
