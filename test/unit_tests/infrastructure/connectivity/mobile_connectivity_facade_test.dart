import 'package:connectivity/connectivity.dart';
import 'package:connectivity_platform_interface/connectivity_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/infrastructure/connectivity/mobile_connectivity_facade.dart';
import 'package:mockito/mockito.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

const ConnectivityResult kCheckConnectivityResult = ConnectivityResult.wifi;
const LocationAuthorizationStatus kRequestLocationResult =
    LocationAuthorizationStatus.authorizedAlways;
const LocationAuthorizationStatus kGetLocationResult =
    LocationAuthorizationStatus.authorizedAlways;

void main() {
  group('ConnectivityStatus', () {
    late Connectivity connectivity;
    late MockConnectivityPlatform fakePlatform;
    setUp(() async {
      fakePlatform = MockConnectivityPlatform();
      ConnectivityPlatform.instance = fakePlatform;
      connectivity = Connectivity();
    });

    TestWidgetsFlutterBinding.ensureInitialized();

    test('checkConnection()', () async {
      final MobileConnectivityFacade connectivityStatus =
          MobileConnectivityFacade(connectivity);

      expect(await connectivityStatus.checkConnection(), isTrue);
    });

    test('onConnectivityChanged', () {
      final MobileConnectivityFacade connectivityStatus =
          MobileConnectivityFacade(connectivity);

      expectLater(connectivityStatus.onConnectivityChanged(),
          emitsInOrder(<bool>[true, false, true]));
    });
  });
}

class MockConnectivityPlatform extends Fake
    with MockPlatformInterfaceMixin
    implements ConnectivityPlatform {
  @override
  Stream<ConnectivityResult> get onConnectivityChanged {
    return Stream<ConnectivityResult>.fromIterable(
      <ConnectivityResult>[
        ConnectivityResult.wifi,
        ConnectivityResult.none,
        ConnectivityResult.mobile,
      ],
    );
  }

  @override
  Future<ConnectivityResult> checkConnectivity() async {
    return kCheckConnectivityResult;
  }
}
