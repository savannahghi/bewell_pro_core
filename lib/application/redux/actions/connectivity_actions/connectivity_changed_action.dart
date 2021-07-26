import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/states/connectivity_state.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';

class ConnectivityChangedAction extends ReduxAction<CoreState> {
  final bool isConnected;

  ConnectivityChangedAction({required this.isConnected});

  @override
  Future<CoreState> reduce() async {
    final ConnectivityState? newConnectivityState =
        state.connectivityState?.copyWith.call(isConnected: isConnected);

    return state.copyWith(connectivityState: newConnectivityState);
  }
}
