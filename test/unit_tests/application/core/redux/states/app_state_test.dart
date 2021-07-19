import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';
import 'package:bewell_pro_core/application/redux/states/user_feed_state.dart';

void main() {
  group('AppState:', () {
    test('should convert state from/to json', () async {
      final AppState state = AppState.initial();
      final Map<String, dynamic> appStateJson = <String, dynamic>{
        'userFeedState': <String, dynamic>{'userFeed': 'some-user-feed'},
      };

      // test whether the app state can be updated
      expect(state.userFeedState!.userFeed, 'UNKNOWN');
      final AppState state2 = state.copyWith
          .call(userFeedState: UserFeedState(userFeed: 'some-user-feed'));

      expect(state2.userFeedState!.userFeed, 'some-user-feed');

      final AppState state3 = AppState.fromJson(appStateJson);
      expect(state3, isA<AppState>());
      expect(state3.userFeedState!.userFeed, 'some-user-feed');
    });
  });
}
