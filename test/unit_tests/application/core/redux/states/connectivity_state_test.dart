import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/redux/states/connectivity_state.dart';

void main() {
  group('ConnectivityState:', () {
    test('should convert state from/to json', () async {
      final ConnectivityState state = ConnectivityState.initial();
      final Map<String, dynamic> connectivityStateJson = <String, dynamic>{
        'isConnected': false,
      };

      // test whether the connectivity state can be updated
      expect(state.isConnected, false);
      final ConnectivityState state2 = state.copyWith.call(isConnected: true);

      expect(state2.isConnected, true);
      // print(ConnectivityStateJson);

      final ConnectivityState state3 =
          ConnectivityState.fromJson(connectivityStateJson);
      expect(state3, isA<ConnectivityState>());

      expect(state3.isConnected, false);
    });
  });
}
