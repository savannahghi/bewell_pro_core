import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';

class SaveUserFeedAction extends ReduxAction<AppState> {
  SaveUserFeedAction({required this.feed});

  final String feed;

  @override
  AppState reduce() {
    final AppState newState =
        state.copyWith.userFeedState!.call(userFeed: feed);

    return newState;
  }
}
