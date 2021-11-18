// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:bewell_pro_core/domain/clinical/entities/address.dart';

void main() {
  final Map<String, dynamic> data = <String, String>{};

  test('Address  returns map from json', () {
    expect(
      Address.fromJson(data),
      isA<Address>(),
    );
  });
}
