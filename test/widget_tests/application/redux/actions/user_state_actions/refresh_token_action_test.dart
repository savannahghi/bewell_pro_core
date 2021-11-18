// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/actions/user_state_actions/refresh_token_action.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/widgets/phone_login.dart';
import '../../../../../mocks/mocks.dart';
import '../../../../../mocks/test_helpers.dart';

void main() {
  group('RefreshTokenAction', () {
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
      'should log out the user if the app is not able to refresh their token',
      (WidgetTester tester) async {
        final MockShortGraphQlClient graphQlClient =
            MockShortGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(json.encode(<String, dynamic>{'error': 'some error'}), 500),
        );

        await buildTestWidget(
          tester: tester,
          store: storeTester.store,
          graphQlClient: graphQlClient,
          widget: Builder(builder: (BuildContext context) {
            return GestureDetector(
              onTap: () async {
                await storeTester
                    .dispatch(RefreshTokenAction(context: context));
              },
            );
          }),
        );

        await tester.tap(find.byType(GestureDetector));
        await tester.pumpAndSettle();

        expect(find.byType(PhoneLogin), findsOneWidget);
      },
    );
  });
}
