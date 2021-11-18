// Package imports:
import 'package:domain_objects/value_objects.dart';

// Project imports:
import 'package:bewell_pro_core/domain/core/entities/payload_input.dart';

class PhoneNumberInput with PayloadInput {
  final PhoneNumber msisdn;
  final String verificationCode;
  final bool isUSSD;
  final bool communicationOptIn;

  PhoneNumberInput({
    required this.msisdn,
    required this.verificationCode,
    required this.isUSSD,
    required this.communicationOptIn,
  });

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'msisdn': msisdn.getValue(),
      'verificationCode': verificationCode,
      'isUSSD': isUSSD,
      'communicationOptIn': communicationOptIn,
    };
  }
}
