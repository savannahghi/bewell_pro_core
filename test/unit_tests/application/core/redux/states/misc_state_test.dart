// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/states/misc_state.dart';

void main() {
  group('MiscState:', () {
    test('should convert state from/to json', () async {
      final MiscState state = MiscState.initial();
      final Map<String, dynamic> eventStateJson = <String, dynamic>{
        'visitCount': '5',
        'acceptedTerms': true,
      };

      // test whether the event state can be updated
      expect(state.visitCount, 'UNKNOWN');
      expect(state.acceptedTerms, false);

      final MiscState state2 = state.copyWith.call(otpCode: '000000');

      expect(state2.otpCode, '000000');

      final MiscState state3 = MiscState.fromJson(eventStateJson);
      expect(state3, isA<MiscState>());
      expect(state3.visitCount, '5');
    });
  });
}
