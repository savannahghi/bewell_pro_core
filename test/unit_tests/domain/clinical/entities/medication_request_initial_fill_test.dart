import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/domain/clinical/entities/fhir.dart';
import 'package:bewell_pro_core/domain/clinical/entities/medication_request_initial_fill.dart';

void main() {
  test('MedicationRequestInitialFill should create a valid object', () {
    final MedicationRequestInitialFill _medicationRequestInitialFill =
        MedicationRequestInitialFill(
            id: 'Some id',
            quantity: Quantity(value: 10),
            duration: const Duration(days: 10));

    final Map<String, dynamic> _medicationRequestInitialFillObject =
        _medicationRequestInitialFill.toJson();

    expect(_medicationRequestInitialFillObject.containsKey('ID'), true);
    expect(_medicationRequestInitialFillObject.containsKey('Quantity'), true);
    expect(_medicationRequestInitialFillObject.containsKey('Duration'), true);

    final Map<String, dynamic> medicationRequestInitialFillData =
        <String, dynamic>{
      'ID': 'some id',
      'Quantity': <String, dynamic>{'Value': 10},
      'Duration': 10
    };

    final MedicationRequestInitialFill _serializedMedicationRequestInitialFill =
        MedicationRequestInitialFill.fromJson(medicationRequestInitialFillData);

    expect(_serializedMedicationRequestInitialFill.id, 'some id');
    expect(_serializedMedicationRequestInitialFill.quantity!.value, 10);
  });
}
