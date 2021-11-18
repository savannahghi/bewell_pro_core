// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:bewell_pro_core/domain/clinical/entities/break_glass_episode_creation_input.dart';

void main() {
  test('BreakGlassEpisodeCreationInput should convert from json', () {
    final Map<String, dynamic> breakGlassJson = <String, dynamic>{
      'patientID': 'some-id',
      'providerCode': '123',
      'otp': '123456',
      'fullAccess': false,
    };

    final BreakGlassEpisodeCreationInput input =
        BreakGlassEpisodeCreationInput.fromJson(breakGlassJson);

    expect(input, isA<BreakGlassEpisodeCreationInput>());
    expect(input.fullAccess, false);
    expect(input.providerCode, '123');
  });
}
