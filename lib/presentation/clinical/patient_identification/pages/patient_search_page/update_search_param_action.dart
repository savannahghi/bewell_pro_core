import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';
import 'package:bewell_pro_core/application/redux/states/clinical_state.dart';

class UpdateSearchParamAction extends ReduxAction<AppState> {
  UpdateSearchParamAction({required this.phoneNumber});
  final String? phoneNumber;
  @override
  AppState? reduce() {
    final ClinicalState? clinicalState =
        state.clinicalState?.copyWith.call(patientSearchNumber: phoneNumber);

    return state.copyWith.call(clinicalState: clinicalState);
  }
}
