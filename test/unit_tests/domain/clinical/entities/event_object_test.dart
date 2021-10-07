// Package imports:
import 'package:test/test.dart';

// Project imports:
import 'package:bewell_pro_core/domain/clinical/entities/event_object.dart';

void main() {
  test('EventObject should create a valid EventObject object', () {
    final EventObject _range =
        EventObject(firstName: 'john', lastName: 'doe', appVersion: 'test');

    final Map<String, dynamic> rangeObject = _range.toJson();

    expect(rangeObject.containsKey('first_name'), true);
    expect(rangeObject.containsKey('last_name'), true);
    expect(rangeObject.containsKey('app_version'), true);

    final Map<String, dynamic> rangeData = <String, dynamic>{
      'app_version': 'prod',
      'first_name': 'Doe',
      'last_name': 'John'
    };

    final EventObject _serializedRange = EventObject.fromJson(rangeData);
    expect(_serializedRange.appVersion, 'prod');
    expect(_serializedRange.firstName, 'Doe');
    expect(_serializedRange.lastName, 'John');
  });
}
