// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:bewell_pro_core/application/core/services/onboarding.dart';

void main() {
  group('Onboarding', () {
    test('should return status code 11 if the body does not have a code', () {
      final Map<String, dynamic> body = <String, dynamic>{};
      expect(unMarshallErrorResponse(body), 11);

      body['code'] = '';
      expect(unMarshallErrorResponse(body), 11);

      body['code'] = '2';
      expect(unMarshallErrorResponse(body), 2);

      body['code'] = '0';
      expect(unMarshallErrorResponse(body), 0);

      expect(unMarshallErrorResponse(null), 11);
    });
  });
}
