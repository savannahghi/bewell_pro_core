import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/entities.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/redux/actions/misc_state_actions/save_event_action.dart';
import 'package:bewell_pro_core/application/redux/actions/misc_state_actions/send_event_action.dart';
import 'package:bewell_pro_core/application/redux/actions/user_state_actions/batch_update_user_state_action.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:http/http.dart';

import '../../../mocks/mocks.dart';

void main() {
  group('SendEventAction', () {
    late StoreTester<CoreState> storeTester;

    setUp(() {
      storeTester = StoreTester<CoreState>.from(
        Store<CoreState>(initialState: CoreState.initial()),
        // this suppresses the verbose logs in the terminal
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
    });

    test('should send an event and save it to state', () async {
      storeTester.dispatch(BatchUpdateUserStateAction(
          auth: AuthCredentialResponse(uid: 'some-uid')));

      final TestInfo<CoreState> info =
          await storeTester.waitUntil(BatchUpdateUserStateAction);

      expect(info.state.userState!.auth!.uid, 'some-uid');
      expect(info.dispatchCount, 1);

      storeTester.dispatch(
        SendEventAction(
          client: mockGraphQlClient,
          eventName: 'some event',
          eventPayload: <String, dynamic>{'eventData': 'some data'},
        ),
      );

      final TestInfo<CoreState> sendEventInfo =
          await storeTester.wait(SendEventAction);

      expect(sendEventInfo.dispatchCount, 2);
    });

    test('should save an event to state for later sending', () async {
      final MockShortGraphQlClient client = MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
            json.encode(
              <String, dynamic>{
                'data': <String, bool>{'processEvent': false}
              },
            ),
            200),
      );

      storeTester.dispatch(BatchUpdateUserStateAction(
          auth: AuthCredentialResponse(uid: 'some-uid')));

      final TestInfo<CoreState> info =
          await storeTester.waitUntil(BatchUpdateUserStateAction);

      expect(info.state.userState!.auth!.uid, 'some-uid');
      expect(info.dispatchCount, 1);

      storeTester.dispatch(
        SendEventAction(
          client: client,
          eventName: 'some event',
          eventPayload: <String, dynamic>{'eventData': 'some data'},
        ),
      );

      final TestInfoList<CoreState> sendEventInfo =
          await storeTester.waitAll(<Type>[SendEventAction, SaveEventAction]);

      expect(sendEventInfo, isNotEmpty);
      expect(storeTester.state.miscState!.eventState!.eventName, 'some event');
    });
  });
}
