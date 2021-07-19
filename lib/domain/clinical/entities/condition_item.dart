import 'package:misc_utilities/misc.dart';

class ConditionItem {
  late String? condition;
  late String? date;
  late String? status;
  late String? note;
  late String? doctor;
  ConditionItem({required Map<String, dynamic> item}) {
    condition = item['code'] == null ? null : item['code']['text'].toString();
    date = item['recordedDate'] == null
        ? 'No recorded date'
        : DateFormatter(item['recordedDate'].toString()).parseDateValue();
    status = item['clinicalStatus'] == null
        ? null
        : item['clinicalStatus']['coding'][0]['code'].toString();
    note = item['note'] == null ? null : item['note'][0]['text'].toString();
    doctor = item['note'] == null
        ? null
        : item['note'][0]['authorString'].toString();
  }
}
