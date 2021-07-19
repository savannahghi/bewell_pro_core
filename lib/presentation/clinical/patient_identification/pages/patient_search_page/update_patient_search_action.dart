import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_connection.dart';

/// Update the patient search result in the state
class UpdatePatientSearchAction extends ReduxAction<AppState> {
  UpdatePatientSearchAction({required this.activeRecords});

  final List<PatientEdge?>? activeRecords;

  @override
  AppState? reduce() {
    return state.copyWith.call(
        clinicalState: state.clinicalState?.copyWith
            .call(patientSearchResult: activeRecords));
  }
}
