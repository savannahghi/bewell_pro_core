import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/core/graphql/mutations.dart';

void main() {
  test('registerDevice should return a map', () {
    const String deviceToken = 'jshdif89-jhe87fd';

    expect(registerDeviceTokenMutationVariables(deviceToken),
        <String, String>{'token': deviceToken});
  });
}
