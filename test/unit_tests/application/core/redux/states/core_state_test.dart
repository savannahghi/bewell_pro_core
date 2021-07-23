import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/application/redux/states/user_feed_state.dart';

void main() {
  group('CoreState:', () {
    test('should convert state from/to json', () async {
      final CoreState state = CoreState.initial();
      final Map<String, dynamic> coreStateJson = <String, dynamic>{
        'userFeedState': <String, dynamic>{'userFeed': 'some-user-feed'},
      };

      // test whether the core state can be updated
      expect(state.userFeedState!.userFeed, 'UNKNOWN');
      final CoreState state2 = state.copyWith
          .call(userFeedState: UserFeedState(userFeed: 'some-user-feed'));

      expect(state2.userFeedState!.userFeed, 'some-user-feed');

      final CoreState state3 = CoreState.fromJson(coreStateJson);
      expect(state3, isA<CoreState>());
      expect(state3.userFeedState!.userFeed, 'some-user-feed');
    });
  });
}
