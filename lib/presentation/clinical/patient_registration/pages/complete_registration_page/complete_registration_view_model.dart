// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:bewell_pro_core/domain/clinical/entities/patient_payload.dart';
import 'package:bewell_pro_core/domain/core/value_objects/type_defs.dart';

class CompleteRegistrationViewModel extends Vm {
  final OnStartVisit onStartVisit;
  final void Function(PatientPayload) updatePatientRecord;

  CompleteRegistrationViewModel({
    required this.onStartVisit,
    required this.updatePatientRecord,
  });
}
