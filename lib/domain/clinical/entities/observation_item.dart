// Package imports:
import 'package:misc_utilities/misc.dart';

class ObservationItem {
  late String observation;
  late String value;
  late String unit;

  late String date;
  ObservationItem({required dynamic item}) {
    observation = item['code']['text'].toString();
    value = item['valueQuantity']['value'].toString();
    unit = item['valueQuantity']['unit'].toString();
    date = DateFormatter(item['effectiveInstant'].toString()).parseDateValue();
  }
}
