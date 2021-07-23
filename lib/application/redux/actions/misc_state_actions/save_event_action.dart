import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';

class SaveEventAction extends ReduxAction<CoreState> {
  SaveEventAction({required this.eventName, required this.eventPayload});
  final String? eventPayload;
  final String? eventName;

  @override
  Future<CoreState> reduce() async {
    return state.copyWith.miscState!.eventState!
        .call(eventName: eventName, eventPayload: eventPayload);
  }
}
