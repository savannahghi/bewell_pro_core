// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

// Project imports:
import 'package:bewell_pro_core/application/redux/actions/onboarding_actions/update_user_pin_action.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/pages/phone_login_page.dart';
import '../../../../../mocks/mocks.dart';
import '../../../../../mocks/test_helpers.dart';

void main() {
  group('UpdateUserPinAction', () {
    late StoreTester<CoreState> storeTester;

    setUp(() {
      storeTester = StoreTester<CoreState>(
        initialState: CoreState.initial(),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
    });

    testWidgets('navigates to phoneLoginRoute a valid response is received',
        (WidgetTester tester) async {
      final MockShortGraphQlClient graphQlClient =
          MockShortGraphQlClient.withResponse('idToken', 'endpoint',
              http.Response(json.encode(<String, dynamic>{}), 200));

      await buildTestWidget(
          tester: tester,
          store: storeTester.store,
          graphQlClient: graphQlClient,
          widget: Builder(builder: (BuildContext context) {
            return TextButton(
              onPressed: () async {
                await storeTester
                    .dispatch(UpdateUserPinAction(context: context));
              },
              child: const Text('update user pin'),
            );
          }));

      await tester.tap(find.byType(TextButton));
      await tester.pumpAndSettle();

      expect(find.byType(PhoneLoginPage), findsOneWidget);
    });

    testWidgets('updateUserPin renders snackbar when exception is thrown',
        (WidgetTester tester) async {
      final MockShortGraphQlClient graphQlClient =
          MockShortGraphQlClient.withResponse('idToken', 'endpoint',
              http.Response(json.encode(<String, int>{'code': 8}), 400));

      await buildTestWidget(
        tester: tester,
        store: storeTester.store,
        graphQlClient: graphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () async {
                storeTester.dispatch(UpdateUserPinAction(context: context));
              },
              child: const Text('update user pin'),
            );
          },
        ),
      );

      await tester.tap(find.byType(GestureDetector));
      await tester.pump();

      expect(find.text(wrongCredentialsText), findsOneWidget);
    });
  });
}
