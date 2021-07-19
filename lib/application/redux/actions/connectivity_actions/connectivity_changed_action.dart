import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';

class ConnectivityChangedAction extends ReduxAction<AppState> {
  final bool isConnected;

  ConnectivityChangedAction({required this.isConnected});

  @override
  Future<AppState> reduce() async {
    final AppState newState =
        state.copyWith.connectivityState!.call(isConnected: isConnected);
    return newState;
  }
}
