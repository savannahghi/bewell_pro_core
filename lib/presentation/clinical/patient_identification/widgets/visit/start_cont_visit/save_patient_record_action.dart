import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';
import 'package:bewell_pro_core/application/redux/states/clinical_state.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_connection.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_payload.dart';

/// Saves a patient record to the app state
///
/// It is the record of the patient being provided services to
class SavePatientRecordAction extends ReduxAction<AppState> {
  SavePatientRecordAction({required this.patientEdge});

  final PatientEdge? patientEdge;

  @override
  AppState reduce() {
    final PatientPayload? patientPayload =
        state.clinicalState?.patientPayload?.copyWith.call(
      patientRecord: patientEdge?.node,
      hasOpenEpisodes: patientEdge?.hasOpenEpisodes,
    );

    final ClinicalState? clinicalState =
        state.clinicalState?.copyWith.call(patientPayload: patientPayload);

    final AppState newState = state.copyWith.call(clinicalState: clinicalState);
    return newState;
  }
}
