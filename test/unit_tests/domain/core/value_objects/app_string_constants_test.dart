import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';

void main() {
  group('app_string_constants functions', () {
    test('verifyRequestMsg should return correct string', () {
      const String phoneNo = '+254712354678';
      expect(
          verifyRequestMsg(phoneNo), 'We have sent a 6 digit PIN to $phoneNo');
    });
  });
}
