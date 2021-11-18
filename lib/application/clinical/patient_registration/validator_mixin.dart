// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:domain_objects/value_objects.dart';

// Project imports:
import 'package:bewell_pro_core/domain/core/entities/identification_details.dart';
import 'package:bewell_pro_core/domain/core/failures/generic_exception.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';

mixin Validator {
  final StreamTransformer<String, String> validateName =
      StreamTransformer<String, String>.fromHandlers(
          handleData: (String value, EventSink<String> sink) {
    if (isValidName(value)) {
      sink.add(value);
    } else {
      sink.addError(GenericException.withMessage(fieldCannotBeEmptyText));
    }
  });

  final StreamTransformer<DateTime, DateTime> validateDate =
      StreamTransformer<DateTime, DateTime>.fromHandlers(
          handleData: (DateTime value, EventSink<DateTime> sink) {
    if (isValidDate(value)) {
      sink.add(value);
    } else {
      sink.addError(GenericException.withMessage('Date cannot be future date'));
    }
  });

  final StreamTransformer<Gender, Gender> validateGender =
      StreamTransformer<Gender, Gender>.fromHandlers(
          handleData: (Gender value, EventSink<Gender> sink) {
    if (isValidGender(value)) {
      sink.add(value);
    } else {
      sink.addError(GenericException.withMessage('Gender.unknown not allowed'));
    }
  });

  final StreamTransformer<String, String> validatePhoneNumbers =
      StreamTransformer<String, String>.fromHandlers(
          handleData: (String value, EventSink<String> sink) {
    if (isValidPhone(value)) {
      sink.add(value);
    } else {
      sink.addError(GenericException.withMessage('Invalid phone number'));
    }
  });

  final StreamTransformer<IdentificationDetails, IdentificationDetails>
      validateIdNumber = StreamTransformer<IdentificationDetails,
              IdentificationDetails>.fromHandlers(
          handleData: (IdentificationDetails value,
              EventSink<IdentificationDetails> sink) {
    final String document =
        describeEnum(value.documentType).replaceAll('_', ' ');

    if (!isValidIdNo(value.documentNumber)) {
      if (value.documentNumber.isEmpty) {
        sink.addError(
            GenericException.withMessage('$document number is required'));
      } else if (value.documentNumber.length > 12) {
        sink.addError(
            GenericException.withMessage('$document number is invalid'));
      }
    } else {
      sink.add(value);
    }
  });

  static bool isValidName(String name) {
    return name.isNotEmpty;
  }

  static bool isValidDate(DateTime date) {
    return date.year <= DateTime.now().year;
  }

  static bool isValidPhone(String value) {
    return value.length > 12 && PhoneNumber.withValue(value).isValid();
  }

  static bool isValidGender(Gender gender) {
    return gender != Gender.unknown;
  }

  static bool isValidIdNo(String idNo) {
    return idNo.isNotEmpty && idNo.length <= 12;
  }
}
