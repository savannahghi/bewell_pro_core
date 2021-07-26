import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/application/redux/states/event_state.dart';

class SaveEventAction extends ReduxAction<CoreState> {
  SaveEventAction({required this.eventName, required this.eventPayload});
  final String? eventPayload;
  final String? eventName;

  @override
  CoreState reduce() {
    final EventState eventState = state.miscState!.eventState!.copyWith
        .call(eventName: eventName, eventPayload: eventPayload);

    return state.copyWith(
      miscState: state.miscState?.copyWith.call(eventState: eventState),
    );
  }
}
