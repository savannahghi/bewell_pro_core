import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/domain/clinical/entities/fhir.dart';
import 'package:bewell_pro_core/domain/clinical/entities/medication_request_dispense.dart';
import 'package:bewell_pro_core/domain/clinical/entities/medication_request_initial_fill.dart';
import 'package:bewell_pro_core/domain/clinical/entities/period.dart';

void main() {
  test('MedicationRequestDispense should create a valid object', () {
    final MedicationRequestDispense _medicationRequestDispense =
        MedicationRequestDispense(
      id: 'some id',
      initialFill: MedicationRequestInitialFill(
          id: 'initial fill id',
          quantity: Quantity(value: 20),
          duration: const Duration(days: 10)),
      validityPeriod: Period(
        id: 'period id',
        start: 'some day',
        end: 'some other day',
      ),
      numberOfRepeatsAllowed: 3,
      quantity: Quantity(value: 10),
    );

    final Map<String, dynamic> _medicationRequestDispenseObject =
        _medicationRequestDispense.toJson();

    expect(_medicationRequestDispenseObject.containsKey('ID'), true);
    expect(_medicationRequestDispenseObject.containsKey('InitialFill'), true);
    expect(
        _medicationRequestDispenseObject.containsKey('ValidityPeriod'), true);
    expect(
        _medicationRequestDispenseObject.containsKey('NumberOfRepeatsAllowed'),
        true);

    final Map<String, dynamic> medicationRequestDispenseData =
        <String, dynamic>{
      'ID': 'some id',
      'InitialFill': <String, dynamic>{
        'ID': 'initial fill id',
        'Quantity': <String, dynamic>{'Value': 20}
      },
      'ValidityPeriod': <String, dynamic>{
        'ID': 'period id',
        'Start': 'some day',
        'End': 'some other day',
      },
      'Quantity': <String, dynamic>{'Value': 20}
    };

    final MedicationRequestDispense _serializedMedicationRequestDispense =
        MedicationRequestDispense.fromJson(medicationRequestDispenseData);

    expect(_serializedMedicationRequestDispense.id, 'some id');
    expect(_serializedMedicationRequestDispense.initialFill!.id,
        'initial fill id');
    expect(
        _serializedMedicationRequestDispense.validityPeriod!.id, 'period id');
    expect(_serializedMedicationRequestDispense.quantity!.value, 20);
  });
}
