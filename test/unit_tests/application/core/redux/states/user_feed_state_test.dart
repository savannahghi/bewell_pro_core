import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/redux/states/user_feed_state.dart';

void main() {
  group('UserFeedState:', () {
    test('should convert state from/to json', () async {
      final UserFeedState state = UserFeedState.initial();
      final Map<String, dynamic> userFeedStateJson = <String, dynamic>{
        'userFeed': 'some-user-feed',
      };

      // test whether the user feed state can be updated
      expect(state.userFeed, 'UNKNOWN');

      final UserFeedState state2 =
          state.copyWith.call(userFeed: 'some-user-feed');

      expect(state2.userFeed, 'some-user-feed');

      final UserFeedState state3 = UserFeedState.fromJson(userFeedStateJson);
      expect(state3, isA<UserFeedState>());
      expect(state3.userFeed, 'some-user-feed');
    });
  });
}
