// Dart imports:
import 'dart:async';

// Package imports:
import 'package:domain_objects/value_objects.dart';
import 'package:rxdart/rxdart.dart';
import 'package:test/test.dart';

// Project imports:
import 'package:bewell_pro_core/application/clinical/patient_registration/validator_mixin.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/entities/identification_details.dart';
import 'package:bewell_pro_core/domain/core/failures/generic_exception.dart';

void main() {
  group('Validator', () {
    test('validateDate should work appropriately', () async {
      final BehaviorSubject<DateTime> dobSubject = BehaviorSubject<DateTime>();
      final TestClass testClass = TestClass(dateOfBirthSubject: dobSubject);

      final DateTime now = DateTime.now();
      final DateTime futureDate = DateTime(now.year + 1, now.month, now.day);

      testClass.inDateOfBirth?.add(now);
      await expectLater(testClass.dateOfBirth, emits(now));

      testClass.inDateOfBirth?.add(futureDate);
      await expectLater(
          testClass.dateOfBirth,
          emitsError(
              GenericException.withMessage('Date cannot be future date')));
      dobSubject.close();
    });

    test('validateGender should work appropriately', () async {
      final BehaviorSubject<Gender> genderSubject = BehaviorSubject<Gender>();
      final TestClass testClass = TestClass(genderSubject: genderSubject);

      testClass.inGender?.add(Gender.male);
      await expectLater(testClass.gender, emits(Gender.male));

      testClass.inGender?.add(Gender.unknown);
      await expectLater(
          testClass.gender,
          emitsError(
              GenericException.withMessage('Gender.unknown not allowed')));

      genderSubject.close();
    });

    test('validatePhoneNumbers should work appropriately', () async {
      const String correctPhoneNumber = '+254798000000';
      const String incorrectPhoneNumber = '12345';
      final BehaviorSubject<String> phoneSubject = BehaviorSubject<String>();
      final TestClass testClass = TestClass(phoneNumberSubject: phoneSubject);

      testClass.inPhoneNumber?.add(correctPhoneNumber);
      await expectLater(testClass.phoneNumber, emits(correctPhoneNumber));

      testClass.inPhoneNumber?.add(incorrectPhoneNumber);
      await expectLater(testClass.phoneNumber,
          emitsError(GenericException.withMessage('Invalid phone number')));

      phoneSubject.close();
    });

    test('validateIdNumber should work appropriately', () async {
      const IdentificationDetails correctDetails = IdentificationDetails(
          documentNumber: '12345678', documentType: DocumentType.National_ID);

      const IdentificationDetails emptyId = IdentificationDetails(
          documentNumber: '', documentType: DocumentType.National_ID);

      const IdentificationDetails idTooLong = IdentificationDetails(
          documentNumber: '1234567890123',
          documentType: DocumentType.National_ID);

      final BehaviorSubject<IdentificationDetails> idDetailsSubject =
          BehaviorSubject<IdentificationDetails>();
      final TestClass testClass = TestClass(idDetailsSubject: idDetailsSubject);

      testClass.inId?.add(correctDetails);
      await expectLater(testClass.id, emits(correctDetails));

      testClass.inId?.add(emptyId);
      await expectLater(
          testClass.id,
          emitsError(
              GenericException.withMessage('National ID number is required')));

      testClass.inId?.add(idTooLong);
      await expectLater(
          testClass.id,
          emitsError(
              GenericException.withMessage('National ID number is invalid')));

      idDetailsSubject.close();
    });
  });
}

class TestClass with Validator {
  TestClass({
    BehaviorSubject<DateTime>? dateOfBirthSubject,
    BehaviorSubject<Gender>? genderSubject,
    BehaviorSubject<String>? phoneNumberSubject,
    BehaviorSubject<IdentificationDetails>? idDetailsSubject,
  })  : _dateOfBirthSubject = dateOfBirthSubject,
        _genderSubject = genderSubject,
        _phoneNumber = phoneNumberSubject,
        _identificationDocument = idDetailsSubject;

  final BehaviorSubject<DateTime>? _dateOfBirthSubject;
  final BehaviorSubject<Gender>? _genderSubject;
  final BehaviorSubject<String>? _phoneNumber;
  final BehaviorSubject<IdentificationDetails>? _identificationDocument;

  Stream<DateTime>? get dateOfBirth =>
      _dateOfBirthSubject?.stream.transform(validateDate);
  Sink<DateTime>? get inDateOfBirth => _dateOfBirthSubject?.sink;

  Stream<Gender>? get gender =>
      _genderSubject?.stream.transform(validateGender);
  Sink<Gender>? get inGender => _genderSubject?.sink;

  Stream<String>? get phoneNumber =>
      _phoneNumber?.stream.transform(validatePhoneNumbers);
  Sink<String>? get inPhoneNumber => _phoneNumber?.sink;

  Stream<IdentificationDetails>? get id =>
      _identificationDocument?.stream.transform(validateIdNumber);
  Sink<IdentificationDetails>? get inId => _identificationDocument?.sink;
}
