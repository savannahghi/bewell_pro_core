import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/start_visit_type_enum.dart';

/// change the value of start visit type
///
/// can be by request access or emergency override
class UpdateStartVisitTypeAction extends ReduxAction<AppState> {
  UpdateStartVisitTypeAction({
    required this.startVisitType,
  });

  final StartVisitType? startVisitType;

  @override
  AppState? reduce() {
    return state.copyWith.call(
        clinicalState:
            state.clinicalState?.copyWith.call(startVisitType: startVisitType));
  }
}
