// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/states/core_state.dart';

void main() {
  group('CoreState', () {
    test('two instances with same parameters should be equal', () {
      CoreState state = CoreState.initial();
      expect(state, CoreState.initial());

      state = state.copyWith(
          userState: state.userState?.copyWith.call(isSignedIn: true));

      expect(state, isNot(CoreState.initial()));
    });
  });
}
