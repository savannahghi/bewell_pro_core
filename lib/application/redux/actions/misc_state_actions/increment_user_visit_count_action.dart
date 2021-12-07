// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/value_objects.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/actions/misc_state_actions/batch_update_misc_state_action.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';

/// Increments Visit Counter
///
/// Used to check the number of visits that User has.
///
/// `10` is the number of visits required in order to ask for a post visit survey.
class IncrementUserVisitCountAction extends ReduxAction<CoreState> {
  @override
  CoreState reduce() {
    int currentVisitCount;
    // reset the visit count if it is null or unknown
    if (state.miscState!.visitCount != null &&
        state.miscState!.visitCount == UNKNOWN) {
      currentVisitCount = 0;
    } else {
      // parse the current value so that we can be able to increment below
      currentVisitCount = int.tryParse(state.miscState!.visitCount!)!;
    }

    // set reset visit count to true
    final bool resetVisitCount =
        currentVisitCount >= int.tryParse(kPostSurveyVisitAskCount)!;

    // increment the current visit count or reset the count
    // if the count is the same as the threshold
    if (resetVisitCount == true) {
      currentVisitCount = 0;
    } else {
      currentVisitCount++;
    }

    dispatch(
        BatchUpdateMiscStateAction(visitCount: currentVisitCount.toString()));

    return state;
  }
}
