// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:bewell_pro_core/domain/core/entities/email_input.dart';
import 'package:sghi_core/domain_objects/value_objects/email_address.dart';

void main() {
  final Map<String, String> data = <String, String>{};

  test('email input returns map', () {
    final EmailAddress mymail = EmailAddress.withValue('test@gmail.com');
    const bool commOpt = true;

    expect(
        EmailInput(communicationOptIn: commOpt, emailAddress: mymail).toMap(),
        data);
  });
}
