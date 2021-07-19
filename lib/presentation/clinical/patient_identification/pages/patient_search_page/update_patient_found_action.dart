import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';

class UpdatePatientPatientFoundAction extends ReduxAction<AppState> {
  UpdatePatientPatientFoundAction({required this.searchFound});

  final bool? searchFound;

  @override
  AppState? reduce() {
    return state.copyWith.call(
        clinicalState: state.clinicalState?.copyWith
            .call(patientSearchFound: searchFound));
  }
}
