import 'dart:async';
import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/redux/actions/user_feed_actions/fetch_user_feed_action.dart';
import 'package:bewell_pro_core/application/redux/actions/user_feed_actions/save_user_feed_action.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:http/http.dart';

import '../../../../../mocks/mocks.dart';

void main() {
  group('FetchUserFeedAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial(),
        // this prevents the verbose logs in the terminal
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
    });

    test(
      'should fetch user feed successfully and update the user feed state',
      () async {
        final MockShortSILGraphQlClient graphQlClient =
            MockShortSILGraphQlClient.withResponse('idToken', 'endpoint',
                Response(json.encode(mockUserFeed), 200));

        final StreamController<dynamic> streamController =
            StreamController<dynamic>.broadcast();

        final Stream<dynamic> _stream =
            streamController.stream.asBroadcastStream();

        _stream.listen((dynamic event) {});

        expectLater(
          _stream,
          emitsInOrder(<dynamic>[
            <String, dynamic>{
              'data': <String, dynamic>{'loading': true}
            },
            mockUserFeed,
          ]),
        );

        /// confirm the state is unknown
        expect(storeTester.state.userFeedState!.userFeed, 'UNKNOWN');

        await storeTester.dispatch(
          FetchUserFeedAction(
              feedStreamController: streamController, client: graphQlClient),
        );

        final TestInfoList<AppState> info = await storeTester.waitAll(<Type>[
          FetchUserFeedAction,
          SaveUserFeedAction,
        ]);

        expect(info.get(FetchUserFeedAction)!.dispatchCount, 2);
        expect(info.length, 2);

        // confirm the state was saved
        expect(
            json.decode(
                info.get(SaveUserFeedAction)!.state.userFeedState!.userFeed!),
            mockUserFeed);
        expect(UserFeedStore().refreshFeed.value, false);

        addTearDown(() {
          streamController.close();
        });
      },
    );

    test(
      'should fail to fetch user feed when a timeout occurs',
      () async {
        final MockShortSILGraphQlClient graphQlClient =
            MockShortSILGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(json.encode(<String, dynamic>{'error': 'timeout'}), 408),
        );

        final StreamController<dynamic> streamController =
            StreamController<dynamic>.broadcast();

        final Stream<dynamic> _stream =
            streamController.stream.asBroadcastStream();

        /// listen to the values emitted from the stream
        _stream.listen((dynamic event) {}, onError: (dynamic emittedError) {
          // confirm that the error was added to the stream
          expect(emittedError, isA<Map<String, dynamic>>());
          expect(emittedError, <String, dynamic>{'error': 'timeout'});
        });

        // verify that the stream emits only the values we expect
        expectLater(
          _stream,
          emitsInOrder(<dynamic>[
            emits(
              <String, dynamic>{
                'data': <String, dynamic>{'loading': true}
              },
            ),
            emitsError(<String, dynamic>{'error': 'timeout'}),
          ]),
        );

        /// confirm the state is unknown
        expect(storeTester.state.userFeedState!.userFeed, 'UNKNOWN');

        await storeTester.dispatch(
          FetchUserFeedAction(
              feedStreamController: streamController, client: graphQlClient),
        );

        final TestInfo<AppState> info =
            await storeTester.waitUntil(FetchUserFeedAction);

        // confirm the state is not updated
        expect(info.state.userFeedState!.userFeed, 'UNKNOWN');
        expect(info.dispatchCount, 1);

        addTearDown(() {
          streamController.close();
        });
      },
    );

    test(
      'should get user feed from state when refresh is false and the state '
      ' is already saved to state',
      () async {
        // save the user feed to state
        storeTester
            .dispatch(SaveUserFeedAction(feed: json.encode(mockUserFeed)));

        final StreamController<dynamic> streamController =
            StreamController<dynamic>.broadcast();

        final Stream<dynamic> _stream =
            streamController.stream.asBroadcastStream();

        /// listen to the values emitted from the stream
        _stream.listen((dynamic event) {});

        // verify that the stream emits only the values we expect
        expectLater(
          _stream,
          emitsInOrder(<dynamic>[
            <String, dynamic>{
              'data': <String, dynamic>{'loading': true}
            },
            mockUserFeed,
          ]),
        );

        await storeTester.dispatch(
          FetchUserFeedAction(
              feedStreamController: streamController,
              client: mockSILGraphQlClient),
        );

        final TestInfo<AppState> info =
            await storeTester.waitUntil(FetchUserFeedAction);

        // confirm the state is not updated
        expect(info.state.userFeedState!.userFeed, json.encode(mockUserFeed));
        expect(info.dispatchCount, 2);

        addTearDown(() {
          streamController.close();
        });
      },
    );
  });
}
