// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/actions/misc_state_actions/batch_update_misc_state_action.dart';
import 'package:bewell_pro_core/application/redux/actions/onboarding_actions/change_user_pin_action.dart';
import 'package:bewell_pro_core/application/redux/actions/user_state_actions/batch_update_user_state_action.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/pages/phone_login_page.dart';
import 'package:sghi_core/domain_objects/entities/user_profile.dart';
import 'package:sghi_core/domain_objects/value_objects/unknown.dart';
import '../../../../../mocks/mocks.dart';
import '../../../../../mocks/test_helpers.dart';

void main() {
  group('ChangeUserPinAction', () {
    late StoreTester<CoreState> storeTester;

    setUp(() {
      storeTester = StoreTester<CoreState>(
        initialState: CoreState.initial(),
        // this suppresses the verbose logs in the terminal
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
    });

    testWidgets(
        'should change a user\'s PIN successfully and'
        ' log them out of the app', (WidgetTester tester) async {
      final MockShortGraphQlClient mockGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
            json.encode(
              <String, dynamic>{
                'data': <String, dynamic>{'updateUserPIN': true}
              },
            ),
            200),
      );

      storeTester.dispatch(BatchUpdateUserStateAction(
          userProfile: UserProfile(primaryPhoneNumber: testPhoneNumber)));

      await buildTestWidget(
        tester: tester,
        store: storeTester.store,
        graphQlClient: mockGraphQlClient,
        widget: Builder(builder: (BuildContext context) {
          return GestureDetector(
            onTap: () async {
              await storeTester
                  .dispatch(ChangeUserPinAction(pin: '0000', context: context));
            },
          );
        }),
      );

      await tester.tap(find.byType(GestureDetector));
      await tester.pumpAndSettle();

      // verify that the user was logged out
      expect(storeTester.state.userState!.isSignedIn, false);
      expect(storeTester.state.userState!.inActivitySetInTime, UNKNOWN);

      /// verify that the login page is visible
      expect(find.byType(PhoneLoginPage), findsOneWidget);
    });

    testWidgets('should fail to change a user\'s PIN due to an error',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
            json.encode(
              <String, dynamic>{'error': 'unable to change PIN'},
            ),
            200),
      );

      storeTester.dispatch(BatchUpdateUserStateAction(
          userProfile: UserProfile(primaryPhoneNumber: testPhoneNumber)));

      await buildTestWidget(
        tester: tester,
        store: storeTester.store,
        graphQlClient: mockGraphQlClient,
        widget: Builder(builder: (BuildContext context) {
          return GestureDetector(
            onTap: () async {
              await storeTester
                  .dispatch(ChangeUserPinAction(pin: '0000', context: context));
            },
          );
        }),
      );

      await tester.tap(find.byType(GestureDetector));
      await tester.pump();

      expect(find.byType(SnackBar), findsOneWidget);

      // verify that the user was logged out
      expect(storeTester.state.userState!.isSignedIn, false);
      expect(storeTester.state.userState!.inActivitySetInTime, UNKNOWN);
    });

    testWidgets('should fail to change a user\'s PIN due to a backend error',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
            json.encode(
              <String, dynamic>{
                'data': <String, dynamic>{'updateUserPIN': false}
              },
            ),
            200),
      );

      await buildTestWidget(
        tester: tester,
        store: storeTester.store,
        graphQlClient: mockGraphQlClient,
        widget: Builder(builder: (BuildContext context) {
          storeTester.dispatch(BatchUpdateMiscStateAction(pinCode: '0000'));
          storeTester.dispatch(BatchUpdateUserStateAction(
              userProfile: UserProfile(primaryPhoneNumber: testPhoneNumber)));

          return GestureDetector(
            onTap: () async {
              await storeTester
                  .dispatch(ChangeUserPinAction(pin: '0000', context: context));
            },
          );
        }),
      );

      await tester.tap(find.byType(GestureDetector));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Failed to change your PIN. Please try again later'),
          findsOneWidget);

      // verify that the user was logged out
      expect(storeTester.state.userState!.isSignedIn, false);
      expect(storeTester.state.userState!.inActivitySetInTime, UNKNOWN);
    });
  });
}
