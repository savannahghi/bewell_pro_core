// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:bewell_pro_core/domain/core/entities/otp_response.dart';
import 'package:bewell_pro_core/domain/resources/outputs.dart';

void main() {
  group('CanRegisterOutput', () {
    test('throws an exception if response is null', () {
      expect(() => CanRegisterOutput(canRegister: true), throwsException);
    });
    test('should not throw an exception if response is not null', () {
      final OTPResponse response =
          OTPResponse.fromJson(<String, String>{'otp': '0000'});
      expect(() => CanRegisterOutput(canRegister: true, response: response),
          returnsNormally);
    });
    test('should not throw an exception if canRegister is false', () {
      expect(() => CanRegisterOutput(canRegister: false), returnsNormally);
    });
  });
}
