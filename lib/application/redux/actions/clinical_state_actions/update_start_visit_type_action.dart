import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/start_visit_type_enum.dart';

/// change the value of start visit type
///
/// can be by request access or emergency override
class UpdateStartVisitTypeAction extends ReduxAction<CoreState> {
  UpdateStartVisitTypeAction({
    required this.startVisitType,
  });

  final StartVisitType? startVisitType;

  @override
  CoreState? reduce() {
    return state.copyWith(
        clinicalState: store.state.clinicalState?.copyWith
            .call(startVisitType: startVisitType));
  }
}
