import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/domain/clinical/entities/OTP_episode_creation_input.dart';

void main() {
  test('OTPEpisodeCreationInput should convert from json', () {
    final Map<String, dynamic> breakGlassJson = <String, dynamic>{
      'patientID': 'some-id',
      'providerCode': '123',
      'otp': '123456',
      'fullAccess': false,
    };

    final OTPEpisodeCreationInput input =
        OTPEpisodeCreationInput.fromJson(breakGlassJson);

    expect(input, isA<OTPEpisodeCreationInput>());
    expect(input.fullAccess, false);
    expect(input.providerCode, '123');
  });
}
