// Dart imports:
import 'dart:async';
import 'dart:convert';

// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail_image_network/mocktail_image_network.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/actions/navigation_actions/navigation_action.dart';
import 'package:bewell_pro_core/application/redux/actions/navigation_actions/update_navigation_action.dart';
import 'package:bewell_pro_core/application/redux/actions/user_feed_actions/save_user_feed_action.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/pages/phone_login_page.dart';
import '../../../../../mocks/mocks.dart';
import '../../../../../mocks/test_helpers.dart';

void main() {
  group('UpdateNavigationAction', () {
    late StoreTester<CoreState> storeTester;

    final StreamController<dynamic> streamController =
        StreamController<dynamic>.broadcast();

    final Stream<dynamic> _stream = streamController.stream.asBroadcastStream();

    _stream.listen((dynamic event) {});
    late dynamic err;

    setUp(() {
      storeTester = StoreTester<CoreState>(initialState: CoreState.initial());
    });

    testWidgets('should dispatch action and catch error',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
          json.encode(<String, dynamic>{
            'errors': <Object>[
              <String, dynamic>{'message': 'error'}
            ]
          }),
          500,
        ),
      );

      await buildTestWidget(
          tester: tester,
          store: storeTester.store,
          graphQlClient: mockShortSILGraphQlClient,
          widget: Builder(builder: (BuildContext context) {
            return GestureDetector(onTap: () async {
              try {
                await storeTester.dispatch(UpdateNavigationAction(
                    context: context, favouriteUpdate: false));
              } catch (e) {
                err = e;
              }
            });
          }));

      await tester.tap(find.byType(GestureDetector));
      await tester.pumpAndSettle();
      expect(err, isA<Future<dynamic>>());

      expect(find.byType(SnackBar), findsOneWidget);
    });

    testWidgets('should logout if account is disconnected',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
          json.encode(<String, dynamic>{
            'errors': <Object>[
              <String, dynamic>{'message': '7: failed to get a user profile'}
            ]
          }),
          500,
        ),
      );

      await buildTestWidget(
          tester: tester,
          store: storeTester.store,
          graphQlClient: mockShortSILGraphQlClient,
          widget: Builder(builder: (BuildContext context) {
            return GestureDetector(onTap: () async {
              try {
                await storeTester.dispatch(UpdateNavigationAction(
                    context: context, favouriteUpdate: false));
              } catch (e) {
                err = e;
              }
            });
          }));

      await tester.tap(find.byType(GestureDetector));
      await tester.pumpAndSettle(const Duration(seconds: 5));
      expect(err, isA<Future<dynamic>>());

      expect(find.byType(PhoneLoginPage), findsOneWidget);
    });

    testWidgets('should navigate to home if user role is removed',
        (WidgetTester tester) async {
      await storeTester.store.dispatch(
        NavigationAction(
            drawerSelectedIndex: 1,
            bottomBarSelectedIndex: -1,
            primaryActions: secondaryActionsMockedData,
            secondaryActions: secondaryActionsMockedData),
      );

      storeTester.dispatch(SaveUserFeedAction(feed: json.encode(mockUserFeed)));

      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'deleteFavoriteNavAction': true,
              'fetchUserNavigationActions': <String, dynamic>{
                'primary': primaryActionsMockedData,
                'secondary': secondaryActionsEmptyMockedData
              },
            },
          }),
          201,
        ),
      );

      await mockNetworkImages(() async {
        await buildTestWidget(
            tester: tester,
            store: storeTester.store,
            graphQlClient: mockShortSILGraphQlClient,
            widget: Builder(builder: (BuildContext context) {
              return GestureDetector(onTap: () async {
                await storeTester.dispatch(UpdateNavigationAction(
                    context: context, favouriteUpdate: false));
              });
            }));

        await tester.tap(find.byType(GestureDetector));
        await tester.pumpAndSettle();

        final int newDrawerIndex =
            storeTester.store.state.navigationState!.drawerSelectedIndex;
        final int newDrawerBottomIndex =
            storeTester.store.state.navigationState!.bottomBarSelectedIndex;

        expect(newDrawerIndex, -1);
        expect(newDrawerBottomIndex, 0);
      });
    });

    testWidgets('should assign bottomIndex to navigationiconAction',
        (WidgetTester tester) async {
      await storeTester.store.dispatch(
        NavigationAction(
            bottomBarSelectedIndex: 1,
            primaryActions: primaryActionsMockedData,
            secondaryActions: secondaryActionsMockedData),
      );

      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'deleteFavoriteNavAction': true,
              'fetchUserNavigationActions': <String, dynamic>{
                'primary': primaryActionsMockedData,
                'secondary': secondaryActionsMockedData
              }
            },
          }),
          201,
        ),
      );

      await buildTestWidget(
          tester: tester,
          store: storeTester.store,
          graphQlClient: mockShortSILGraphQlClient,
          widget: Builder(builder: (BuildContext context) {
            return GestureDetector(onTap: () async {
              await storeTester.dispatch(UpdateNavigationAction(
                  context: context, favouriteUpdate: false));
            });
          }));

      await tester.tap(find.byType(GestureDetector));
      await tester.pumpAndSettle();

      final int newDrawerIndex =
          storeTester.store.state.navigationState!.drawerSelectedIndex;
      final int newDrawerBottomIndex =
          storeTester.store.state.navigationState!.bottomBarSelectedIndex;

      expect(newDrawerIndex, -1);
      expect(newDrawerBottomIndex, 1);
      expect(err, isA<Future<dynamic>>());
    });

    testWidgets('should assign drawerIndex to navigationiconAction',
        (WidgetTester tester) async {
      await storeTester.store.dispatch(
        NavigationAction(
            drawerSelectedIndex: 1,
            bottomBarSelectedIndex: -1,
            primaryActions: primaryActionsMockedData,
            secondaryActions: secondaryActionsMockedData),
      );

      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'deleteFavoriteNavAction': true,
              'fetchUserNavigationActions': <String, dynamic>{
                'primary': primaryActionsMockedData,
                'secondary': secondaryActionsMockedData
              }
            },
          }),
          201,
        ),
      );

      await buildTestWidget(
          tester: tester,
          store: storeTester.store,
          graphQlClient: mockShortSILGraphQlClient,
          widget: Builder(builder: (BuildContext context) {
            return GestureDetector(onTap: () async {
              await storeTester.dispatch(UpdateNavigationAction(
                  context: context, favouriteUpdate: false));
            });
          }));

      await tester.tap(find.byType(GestureDetector));
      await tester.pumpAndSettle();

      final int newDrawerIndex =
          storeTester.store.state.navigationState!.drawerSelectedIndex;
      final int newDrawerBottomIndex =
          storeTester.store.state.navigationState!.bottomBarSelectedIndex;

      expect(newDrawerIndex, 1);
      expect(newDrawerBottomIndex, 0);
    });
  });
}
