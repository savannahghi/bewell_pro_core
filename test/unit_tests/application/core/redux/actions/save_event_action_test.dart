import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/actions/misc_state_actions/save_event_action.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';
import 'package:test/test.dart';

void main() {
  group('SaveEventAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial(),
        // this suppresses the verbose logs in the terminal
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
    });

    test('saves and event to state correctly', () async {
      storeTester.dispatch(
          SaveEventAction(eventName: 'a_new_event', eventPayload: 'some_data'));
      final TestInfo<AppState> info = await storeTester.wait(SaveEventAction);

      expect(info.state.miscState?.eventState?.eventName, 'a_new_event');
      expect(info.state.miscState?.eventState?.eventPayload, 'some_data');
    });

    test('saves a null event to state correctly', () async {
      storeTester
          .dispatch(SaveEventAction(eventName: null, eventPayload: null));
      final TestInfo<AppState> info = await storeTester.wait(SaveEventAction);

      expect(info.state.miscState?.eventState?.eventName, null);
      expect(info.state.miscState?.eventState?.eventPayload, null);
    });
  });
}
