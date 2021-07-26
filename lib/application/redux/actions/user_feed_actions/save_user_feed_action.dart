import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';

class SaveUserFeedAction extends ReduxAction<CoreState> {
  SaveUserFeedAction({required this.feed});

  final String feed;

  @override
  CoreState reduce() {
    final CoreState newState = state.copyWith(
        userFeedState:
            store.state.userFeedState?.copyWith.call(userFeed: feed));

    return newState;
  }
}
