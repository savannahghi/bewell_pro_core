import 'package:connectivity/connectivity.dart';
import 'package:bewell_pro_core/domain/connectivity/i_connectivity_facade.dart';
import 'package:rxdart/rxdart.dart';

class MobileConnectivityFacade implements IConnectivityFacade {
  final Connectivity _connectivity;

  MobileConnectivityFacade(this._connectivity);

  @override
  Future<bool> checkConnection() async {
    final ConnectivityResult result = await _connectivity.checkConnectivity();
    return _isConnectivityChange(result);
  }

  @override
  Stream<bool> onConnectivityChanged() {
    final Stream<bool> changeStream =
        _connectivity.onConnectivityChanged.map<bool>(_isConnectivityChange);

    return checkConnection()
        .asStream()
        .mergeWith(<Stream<bool>>[changeStream]).distinct();
  }

  bool _isConnectivityChange(ConnectivityResult event) =>
      event == ConnectivityResult.wifi || event == ConnectivityResult.mobile;
}
