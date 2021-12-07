// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_themes/constants.dart';

// Project imports:
import 'package:bewell_pro_core/application/core/services/onboarding.dart';
import 'package:bewell_pro_core/application/redux/actions/misc_state_actions/batch_update_misc_state_action.dart';
import 'package:bewell_pro_core/application/redux/flags/flags.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/entities/processed_response.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/pages/phone_login_page.dart';
import '../../../../mocks/mock_utils.dart';
import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('Onboarding_utils', () {
    late Store<CoreState> store;

    setUp(() {
      store = Store<CoreState>(initialState: CoreState.initial());
    });

    testWidgets('should validate entered PIN when resetting PIN',
        (WidgetTester tester) async {
      await buildTestWidget(
          tester: tester,
          store: store,
          widget: Builder(builder: (BuildContext context) {
            store.dispatch(
              BatchUpdateMiscStateAction(createPin: '0000', confirmPin: '0000'),
            );
            return GestureDetector(
              onTap: () {
                validateEnteredPin(
                  context: context,
                  flag: resetPinFlag,
                  setPinStatus: SetPinStatus.IsResettingPin,
                );
              },
            );
          }));

      await tester.tap(find.byType(GestureDetector));
      await tester.pump();

      expect(store.state.miscState!.pinCode, 'UNKNOWN');
      expect(store.state.wait!.isWaitingFor(resetPinFlag), true);
    });

    testWidgets(
        'should validate entered PIN when setting a PIN and navigate'
        ' to user names page', (WidgetTester tester) async {
      await setupFirebaseAuthMocks();
      await Firebase.initializeApp();

      final MockShortGraphQlClient mockGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
          json.encode(<String, dynamic>{
            'profile': <String, dynamic>{},
            'customerProfile': <String, dynamic>{},
            'communicationSettings': <String, dynamic>{},
            'auth': <String, dynamic>{},
          }),
          201,
        ),
      );
      store.dispatch(
        BatchUpdateMiscStateAction(createPin: '0000', confirmPin: '0000'),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockGraphQlClient,
        widget: const SizedBox(),
      );

      final BuildContext context = tester.element(find.byType(SizedBox));

      await validateEnteredPin(
          context: context,
          flag: setPinFlag,
          setPinStatus: SetPinStatus.IsSettingPin);

      await tester.pumpAndSettle();

      expect(store.state.miscState!.confirmPin, '0000');
    });

    testWidgets('should validate entered PIN when changing a user PIN',
        (WidgetTester tester) async {
      await setupFirebaseAuthMocks();
      await Firebase.initializeApp();

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

      store.dispatch(
        BatchUpdateMiscStateAction(createPin: '0000', confirmPin: '0000'),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockGraphQlClient,
        widget: const SizedBox(),
      );

      final BuildContext context = tester.element(find.byType(SizedBox));

      await validateEnteredPin(
        context: context,
        flag: setPinFlag,
        setPinStatus: SetPinStatus.IsChangingPin,
      );

      await tester.pumpAndSettle();

      expect(find.byType(PhoneLoginPage), findsOneWidget);
    });

    testWidgets(
        'should show a validation error snackbar when the entered PIN is'
        ' not the same as the confirm PIN', (WidgetTester tester) async {
      store.dispatch(
        BatchUpdateMiscStateAction(createPin: '0000', confirmPin: '0001'),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockGraphQlClient,
        widget: const SizedBox(),
      );

      final BuildContext context = tester.element(find.byType(SizedBox));

      await validateEnteredPin(
        context: context,
        setPinStatus: SetPinStatus.IsSettingPin,
        flag: setPinFlag,
      );

      await tester.pump();

      expect(store.state.miscState!.pinCode, UNKNOWN);
      expect(store.state.wait!.isWaitingFor(setPinFlag), false);

      expect(find.byType(SnackBar), findsOneWidget);
    });

    group('Process Response', () {
      testWidgets('should process a response with a status code of 500',
          (WidgetTester tester) async {
        final http.Response response =
            http.Response(json.encode(<String, dynamic>{}), 500);

        await buildTestWidget(
            tester: tester, store: store, widget: Container());

        final BuildContext context = tester.element(find.byType(Container));

        final ProcessedResponse processedResponse =
            processResponse(response, context);

        // verify the processed response
        expect(processedResponse, isA<ProcessedResponse>());
        expect(processedResponse.ok, false);
        expect(processedResponse.response, response);
        expect(
            processedResponse.message,
            'Sorry, an unknown error occurred. '
            'Try again or contact us $kBewellSupportPhoneNumber');
      });

      testWidgets('should process a response with a status code of 408',
          (WidgetTester tester) async {
        final http.Response response =
            http.Response(json.encode(<String, dynamic>{'code': '0'}), 408);

        await buildTestWidget(
            tester: tester, store: store, widget: Container());

        final BuildContext context = tester.element(find.byType(Container));

        final ProcessedResponse processedResponse =
            processResponse(response, context);

        // verify the processed response
        expect(processedResponse, isA<ProcessedResponse>());
        expect(processedResponse.ok, false);
        expect(processedResponse.response, response);
        expect(processedResponse.message,
            'Slow internet connection. Please check your connection and try again');
      });

      testWidgets(
          'should process a response with a status code of 400 and'
          ' response code 8', (WidgetTester tester) async {
        final http.Response response =
            http.Response(json.encode(<String, dynamic>{'code': '8'}), 400);

        await buildTestWidget(
            tester: tester, store: store, widget: const SizedBox());

        final BuildContext context = tester.element(find.byType(SizedBox));

        final ProcessedResponse processedResponse =
            processResponse(response, context);

        // verify the processed response
        expect(processedResponse, isA<ProcessedResponse>());
        expect(processedResponse.ok, false);
        expect(processedResponse.response, response);
        expect(store.state.miscState!.invalidCredentials, true);
        expect(processedResponse.message, 'Wrong login details provided');
      });

      testWidgets('should process a response with a status code of 400',
          (WidgetTester tester) async {
        final http.Response response =
            http.Response(json.encode(<String, dynamic>{'code': '4'}), 400);

        await buildTestWidget(
            tester: tester, store: store, widget: Container());

        final BuildContext context = tester.element(find.byType(Container));

        final ProcessedResponse processedResponse =
            processResponse(response, context);

        // verify the processed response
        expect(processedResponse, isA<ProcessedResponse>());
        expect(processedResponse.ok, false);
        expect(processedResponse.response, response);

        // confirm that the value of [accountExists] from state is true
        expect(store.state.miscState!.accountExists, true);
        expect(
            processedResponse.message, 'User with that phone number exists.');
      });

      testWidgets(
          'should update state when an unknown phone number error (code 7) has '
          ' been returned from the backend', (WidgetTester tester) async {
        final http.Response response =
            http.Response(json.encode(<String, dynamic>{'code': '7'}), 400);

        await buildTestWidget(
            tester: tester, store: store, widget: Container());

        final BuildContext context = tester.element(find.byType(Container));

        final ProcessedResponse processedResponse =
            processResponse(response, context);

        // verify the processed response
        expect(processedResponse, isA<ProcessedResponse>());
        expect(processedResponse.ok, false);
        expect(processedResponse.response, response);

        // confirm that the value of [accountExists] from state is true
        expect(store.state.miscState!.unKnownPhoneNo, true);
        expect(processedResponse.message,
            'We could not find a user with those details.');
      });

      testWidgets(
          'should return a default response when processing a response with a '
          ' status code of 503', (WidgetTester tester) async {
        final http.Response response =
            http.Response(json.encode(<String, dynamic>{'code': '7'}), 503);

        await buildTestWidget(
            tester: tester, store: store, widget: Container());

        final BuildContext context = tester.element(find.byType(Container));

        final ProcessedResponse processedResponse =
            processResponse(response, context);

        // verify the processed response
        expect(processedResponse, isA<ProcessedResponse>());
        expect(processedResponse.ok, false);
        expect(processedResponse.response, response);

        expect(
            processedResponse.message,
            'Sorry, an error occurred. Please try again,'
            ' or contact Slade 360 Be.Well Support support'
            ' on $kBewellSupportPhoneNumber');
      });
    });

    testWidgets('should process a response with a status code of 201',
        (WidgetTester tester) async {
      final http.Response response = http.Response(
          json.encode(<String, dynamic>{'message': 'success'}), 201);

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockGraphQlClient,
        widget: const SizedBox(),
      );

      final BuildContext context = tester.element(find.byType(SizedBox));

      final ProcessedResponse processedResponse =
          processResponse(response, context);

      await tester.pump();

      expect(processedResponse, isA<ProcessedResponse>());
      expect(processedResponse.ok, true);
      expect(processedResponse.response, response);
      expect(processedResponse.message, '');
    });
  });
}
