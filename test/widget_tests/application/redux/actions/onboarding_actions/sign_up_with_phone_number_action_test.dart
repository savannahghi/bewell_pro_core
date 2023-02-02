// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

// Project imports:
import 'package:bewell_pro_core/application/redux/actions/misc_state_actions/batch_update_misc_state_action.dart';
import 'package:bewell_pro_core/application/redux/actions/user_state_actions/signup_with_phone_number_action.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:sghi_core/misc_utilities/misc.dart';
import '../../../../../mocks/mocks.dart';
import '../../../../../mocks/test_helpers.dart';

void main() {
  group('SignupWithPhoneNumberAction', () {
    late StoreTester<CoreState> storeTester;

    setUp(() {
      storeTester = StoreTester<CoreState>(
        initialState: CoreState.initial(),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
    });

    testWidgets('shows a snackbar if phone number is empty',
        (WidgetTester tester) async {
      await buildTestWidget(
          tester: tester,
          store: storeTester.store,
          widget: Builder(
            builder: (BuildContext context) {
              return TextButton(
                onPressed: () async {
                  await storeTester.dispatch(SignupWithPhoneNumberAction(
                      phoneNumber: '', context: context));
                },
                child: const Text('sign up with phone number'),
              );
            },
          ));

      await tester.tap(find.byType(TextButton));
      await tester.pump();

      expect(find.text(signupPhoneNo), findsOneWidget);
    });

    testWidgets('updates state correctly when given a valid number',
        (WidgetTester tester) async {
      const String otpCode = '123456';
      const String phoneNo = '712345678';

      final GlobalKey<FormState> formKey = GlobalKey<FormState>();
      final MockShortGraphQlClient graphQlClient =
          MockShortGraphQlClient.withResponse(
              'idToken',
              'endpoint',
              http.Response(
                  json.encode(<String, String>{'otp': otpCode}), 200));

      await storeTester
          .dispatch(BatchUpdateMiscStateAction(acceptedTerms: true));

      await buildTestWidget(
          tester: tester,
          store: storeTester.store,
          graphQlClient: graphQlClient,
          widget: Builder(
            builder: (BuildContext context) {
              return Form(
                key: formKey,
                child: TextButton(
                  onPressed: () async {
                    await storeTester.dispatch(SignupWithPhoneNumberAction(
                        phoneNumber: phoneNo, context: context));
                  },
                  child: const Text('sign up with phone number'),
                ),
              );
            },
          ));

      await tester.tap(find.byType(TextButton));
      await tester.pump();

      expect(storeTester.state.miscState!.otpCode, otpCode);
      expect(storeTester.state.miscState!.message,
          verifyDesc(formatPhoneNumber(phoneNumber: phoneNo, countryCode: '')));
    });

    testWidgets('renders snackbar if request fails',
        (WidgetTester tester) async {
      const String phoneNo = '712345678';

      final GlobalKey<FormState> formKey = GlobalKey<FormState>();
      final MockShortGraphQlClient graphQlClient =
          MockShortGraphQlClient.withResponse('idToken', 'endpoint',
              http.Response(json.encode(<String, int>{'code': 8}), 400));

      await storeTester
          .dispatch(BatchUpdateMiscStateAction(acceptedTerms: true));
      await buildTestWidget(
          tester: tester,
          store: storeTester.store,
          graphQlClient: graphQlClient,
          widget: Builder(
            builder: (BuildContext context) {
              return Form(
                key: formKey,
                child: TextButton(
                  onPressed: () async {
                    await storeTester.dispatch(SignupWithPhoneNumberAction(
                        phoneNumber: phoneNo, context: context));
                  },
                  child: const Text('sign up with phone number'),
                ),
              );
            },
          ));

      await tester.tap(find.byType(TextButton));
      await tester.pump();

      expect(find.text(wrongCredentialsText), findsOneWidget);
    });
  });
}
