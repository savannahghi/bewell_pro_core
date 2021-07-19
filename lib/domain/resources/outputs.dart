import 'package:bewell_pro_core/domain/core/entities/otp_response.dart';

class CanRegisterOutput {
  final OTPResponse? response;
  final bool canRegister;
  CanRegisterOutput({this.response, required this.canRegister})
      : assert(() {
          if (canRegister == true && response == null) {
            throw Exception('response must not be null if canRegister is true');
          }
          return true;
        }());
}
