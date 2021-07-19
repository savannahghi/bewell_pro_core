import 'package:bewell_pro_core/domain/clinical/entities/patient_payload.dart';
import 'package:rxdart/rxdart.dart';

class PatientPayloadHelper {
  final BehaviorSubject<PatientPayload> _patientPayload =
      BehaviorSubject<PatientPayload>();

  PatientPayload? get patientPayload => _patientPayload.valueOrNull;

  String? get patientName => patientPayload?.patientRecord?.name?.first?.text;

  String? get patientID => _patientPayload.valueOrNull?.patientRecord?.id;

  String? get patientPhone =>
      _patientPayload.valueOrNull?.patientRecord?.telecom?.first?.value;
  BehaviorSubject<String?> phoneNumber = BehaviorSubject<String?>();

  void updatePatient(PatientPayload patientPayload) =>
      _patientPayload.add(patientPayload);
}
