// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:shared_themes/constants.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/actions/onboarding_actions/update_user_names_action.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import '../../../../../mocks/mocks.dart';
import '../../../../../mocks/test_helpers.dart';

void main() {
  group('UpdateUserNamesAction', () {
    late StoreTester<CoreState> storeTester;

    setUp(() {
      storeTester = StoreTester<CoreState>(
        initialState: CoreState.initial(),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
    });

    testWidgets('displays snackbar if request has an error',
        (WidgetTester tester) async {
      final MockShortGraphQlClient graphQlClient =
          MockShortGraphQlClient.withResponse('idToken', 'endpoint',
              http.Response(json.encode(<String, String>{'error': ''}), 400));

      await buildTestWidget(
          tester: tester,
          store: storeTester.store,
          graphQlClient: graphQlClient,
          widget: Builder(builder: (BuildContext context) {
            return TextButton(
              onPressed: () async {
                await storeTester.dispatch(UpdateUserNamesAction(
                    context: context,
                    updatedFirstName: 'John',
                    updatedLastName: 'Doe'));
              },
              child: const Text('update user name'),
            );
          }));

      await tester.tap(find.byType(TextButton));
      await tester.pump();

      expect(find.text(UserFeedBackTexts.getErrorMessage()), findsOneWidget);
    });
  });
}
