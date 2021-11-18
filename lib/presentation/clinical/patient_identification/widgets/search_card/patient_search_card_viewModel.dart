// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:bewell_pro_core/domain/clinical/entities/patient_connection.dart';

class PatientSearchCardViewModel extends Vm {
  PatientSearchCardViewModel({required this.patientEdge});

  final PatientEdge? patientEdge;
}
