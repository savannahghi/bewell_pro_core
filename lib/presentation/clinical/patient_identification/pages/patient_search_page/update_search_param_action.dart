// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/states/clinical_state.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';

class UpdateSearchParamAction extends ReduxAction<CoreState> {
  UpdateSearchParamAction({required this.phoneNumber});
  final String? phoneNumber;
  @override
  CoreState? reduce() {
    final ClinicalState? clinicalState =
        state.clinicalState?.copyWith.call(patientSearchNumber: phoneNumber);

    return state.copyWith.call(clinicalState: clinicalState);
  }
}
