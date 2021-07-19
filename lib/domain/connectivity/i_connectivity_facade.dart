abstract class IConnectivityFacade {
  Future<bool> checkConnection();
  Stream<bool> onConnectivityChanged();
}
