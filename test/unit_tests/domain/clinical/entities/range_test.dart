import 'package:bewell_pro_core/domain/clinical/entities/fhir.dart';
import 'package:bewell_pro_core/domain/clinical/entities/range.dart';
import 'package:test/test.dart';

void main() {
  test('Range should create a valid Range object', () {
    final Range _range = Range(
      id: 'some id',
      high: Quantity(id: 'some high quantity id', value: 100),
      low: Quantity(id: 'some low quantity id', value: 10),
    );

    final Map<String, dynamic> rangeObject = _range.toJson();

    expect(rangeObject.containsKey('ID'), true);
    expect(rangeObject.containsKey('Low'), true);
    expect(rangeObject.containsKey('High'), true);

    final Map<String, dynamic> rangeData = <String, dynamic>{
      'ID': 'some id',
      'High': <String, dynamic>{
        'ID': 'some high id',
        'Value': 100,
      },
      'Low': <String, dynamic>{
        'ID': 'some low id',
        'Value': 10,
      },
    };

    final Range _serializedRange = Range.fromJson(rangeData);
    expect(_serializedRange.id, 'some id');
    expect(_serializedRange.high!.value, 100);
    expect(_serializedRange.low!.value, 10);
  });
}
