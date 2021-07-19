import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';

class SaveEventAction extends ReduxAction<AppState> {
  SaveEventAction({required this.eventName, required this.eventPayload});
  final String? eventPayload;
  final String? eventName;

  @override
  Future<AppState> reduce() async {
    return state.copyWith.miscState!.eventState!
        .call(eventName: eventName, eventPayload: eventPayload);
  }
}
