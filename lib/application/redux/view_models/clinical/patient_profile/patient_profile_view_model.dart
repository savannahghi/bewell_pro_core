import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_payload.dart';

class PatientProfileViewModel extends Vm {
  final Patient? patient;

  PatientProfileViewModel({this.patient}) : super(equals: <Object?>[patient]);

  static PatientProfileViewModel fromStore(Store<CoreState> store) {
    final PatientPayload? patientPayload =
        store.state.clinicalState?.patientPayload;
    return PatientProfileViewModel(patient: patientPayload?.patientRecord);
  }
}
