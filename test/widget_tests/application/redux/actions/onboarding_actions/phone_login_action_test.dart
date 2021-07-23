import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/redux/actions/user_state_actions/phone_login_action.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:http/http.dart';

import '../../../../../mocks/mocks.dart';
import '../../../../../mocks/test_helpers.dart';

void main() {
  group('PhoneLoginAction', () {
    late StoreTester<CoreState> storeTester;

    setUp(() {
      storeTester = StoreTester<CoreState>(
        initialState: CoreState.initial(),
        // this suppresses the verbose logs in the terminal
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
        shouldThrowUserExceptions: true,
      );
    });

    testWidgets(
      'should notify a user when they are not able to sign in',
      (WidgetTester tester) async {
        final MockShortGraphQlClient graphQlClient =
            MockShortGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(json.encode(<String, dynamic>{'code': '8'}), 500),
        );

        await buildTestWidget(
          tester: tester,
          store: storeTester.store,
          graphQlClient: graphQlClient,
          widget: Builder(builder: (BuildContext context) {
            return GestureDetector(
              onTap: () async {
                await storeTester.dispatch(
                  PhoneLoginAction(context: context),
                );
              },
            );
          }),
        );
        await tester.pumpAndSettle();

        await tester.tap(find.byType(GestureDetector));
        await tester.pumpAndSettle();

        expect(find.byType(SnackBar), findsOneWidget);
      },
    );
  });
}
