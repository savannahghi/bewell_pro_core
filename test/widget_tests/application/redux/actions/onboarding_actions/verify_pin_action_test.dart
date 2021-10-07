// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

// Project imports:
import 'package:bewell_pro_core/application/redux/actions/onboarding_actions/verify_pin_action.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/pages/set_user_names_page.dart';
import 'package:bewell_pro_core/presentation/onboarding/profile/change_pin.dart';
import '../../../../../mocks/mocks.dart';
import '../../../../../mocks/test_helpers.dart';

void main() {
  group('VerifyPinAction', () {
    late StoreTester<CoreState> storeTester;

    setUp(() {
      storeTester = StoreTester<CoreState>(
        initialState: CoreState.initial(),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
    });

    testWidgets(
        'navigates to profileChangePinRoute when a user is changing their PIN',
        (WidgetTester tester) async {
      final MockShortGraphQlClient graphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
            json.encode(
              <String, dynamic>{
                'data': <String, dynamic>{'resumeWithPIN': true}
              },
            ),
            200),
      );

      await buildTestWidget(
          tester: tester,
          store: storeTester.store,
          graphQlClient: graphQlClient,
          widget: Builder(builder: (BuildContext context) {
            return TextButton(
              onPressed: () async {
                await storeTester.dispatch(
                  VerifyPinAction(
                      context: context, isChangingPin: true, pin: '0000'),
                );
              },
              child: const Text('update user pin'),
            );
          }));

      await tester.tap(find.byType(TextButton));
      await tester.pumpAndSettle();

      expect(find.byType(ProfileChangePin), findsOneWidget);
    });

    testWidgets(
        'navigates to user names page when a user is changing their PIN',
        (WidgetTester tester) async {
      final MockShortGraphQlClient graphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
            json.encode(
              <String, dynamic>{
                'data': <String, dynamic>{'resumeWithPIN': true}
              },
            ),
            200),
      );

      await buildTestWidget(
          tester: tester,
          store: storeTester.store,
          graphQlClient: graphQlClient,
          widget: Builder(builder: (BuildContext context) {
            return TextButton(
              onPressed: () async {
                await storeTester.dispatch(
                  VerifyPinAction(
                      context: context, isChangingPin: false, pin: '0000'),
                );
              },
              child: const Text('update user pin'),
            );
          }));

      await tester.tap(find.byType(TextButton));
      await tester.pumpAndSettle();

      expect(find.byType(SetUserNamesPage), findsOneWidget);
    });

    testWidgets('should modify core state when an invalid PIN is provided',
        (WidgetTester tester) async {
      final MockShortGraphQlClient graphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
            json.encode(
              <String, dynamic>{
                'data': <String, dynamic>{'resumeWithPIN': false}
              },
            ),
            200),
      );

      await buildTestWidget(
          tester: tester,
          store: storeTester.store,
          graphQlClient: graphQlClient,
          widget: Builder(builder: (BuildContext context) {
            return TextButton(
              onPressed: () async {
                await storeTester.dispatch(
                  VerifyPinAction(
                      context: context, isChangingPin: false, pin: '0000'),
                );
              },
              child: const Text('update user pin'),
            );
          }));

      await tester.tap(find.byType(TextButton));
      await tester.pumpAndSettle();

      expect(storeTester.state.miscState!.invalidPin, true);
      expect(storeTester.state.miscState!.pinCode, UNKNOWN);
    });

    testWidgets(
        'should show an error when there is an error verifying a user\'s PIN',
        (WidgetTester tester) async {
      final MockShortGraphQlClient graphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
            json.encode(
              <String, dynamic>{'error': 'expired auth token'},
            ),
            200),
      );

      await buildTestWidget(
          tester: tester,
          store: storeTester.store,
          graphQlClient: graphQlClient,
          widget: Builder(builder: (BuildContext context) {
            return TextButton(
              onPressed: () async {
                await storeTester.dispatch(
                  VerifyPinAction(
                      context: context, isChangingPin: false, pin: '0000'),
                );
              },
              child: const Text('update user pin'),
            );
          }));

      await tester.tap(find.byType(TextButton));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
    });
  });
}
