import 'dart:async';
import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';
import 'package:bewell_pro_core/domain/connectivity/i_connectivity_facade.dart';

class ConnectivityCheckAction extends ReduxAction<AppState> {
  final IConnectivityFacade _connectivityFacade;

  ConnectivityCheckAction(this._connectivityFacade);

  @override
  Future<AppState?> reduce() async {
    final bool isConnected = await _connectivityFacade.checkConnection();
    final AppState newState =
        state.copyWith.connectivityState!.call(isConnected: isConnected);
    return newState;
  }
}
