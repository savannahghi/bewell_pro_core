import 'package:misc_utilities/misc.dart';

class MedicationItem {
  late String? medication;
  late String? orderDate;
  late String? medicationStatus;
  late String? dosageInstruction;

  MedicationItem({required Map<String, dynamic> item}) {
    medication = item['medicationCodeableConcept'] == null
        ? null
        : item['medicationCodeableConcept']['text'].toString();
    orderDate = DateFormatter(item['authoredOn'].toString()).parseDateValue();
    medicationStatus = item['status'].toString();
    dosageInstruction = item['dosageInstruction'] == null
        ? 'No dosage instructions provided'
        : item['dosageInstruction'][0]['patientInstruction']?.toString();
  }
}
