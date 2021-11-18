// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/states/core_state.dart';

class UpdatePatientPatientFoundAction extends ReduxAction<CoreState> {
  UpdatePatientPatientFoundAction({required this.searchFound});

  final bool? searchFound;

  @override
  CoreState? reduce() {
    return state.copyWith.call(
        clinicalState: state.clinicalState?.copyWith
            .call(patientSearchFound: searchFound));
  }
}
