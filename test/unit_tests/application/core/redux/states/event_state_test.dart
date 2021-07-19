import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/redux/states/event_state.dart';

void main() {
  group('EventState:', () {
    test('should convert state from/to json', () async {
      final EventState state = EventState.initial();
      final Map<String, dynamic> eventStateJson = <String, dynamic>{
        'eventName': 'some event 3',
        'eventPayload': 'some event 3 payload',
      };

      // test whether the event state can be updated
      expect(state.eventName, 'UNKNOWN');
      expect(state.eventPayload, 'UNKNOWN');

      final EventState state2 = state.copyWith
          .call(eventName: 'Event 1', eventPayload: 'Event 1 payload');

      expect(state2.eventName, 'Event 1');

      final EventState state3 = EventState.fromJson(eventStateJson);
      expect(state3, isA<EventState>());
      expect(state3.eventName, 'some event 3');
    });
  });
}
