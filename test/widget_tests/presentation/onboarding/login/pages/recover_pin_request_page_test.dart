// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:sghi_core/ui_components/src/inputs.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/pages/recover_pin_request_page.dart';
import '../../../../../mocks/mocks.dart';
import '../../../../../mocks/test_helpers.dart';

void main() {
  group('RecoverPinRequest', () {
    late StoreTester<CoreState> storeTester;

    setUp(() {
      storeTester = StoreTester<CoreState>(
        initialState: CoreState.initial(),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
    });

    testWidgets(
        'navigates to VerifyPinResetRequestPage when continue button is pressed',
        (WidgetTester tester) async {
      final MockShortGraphQlClient graphQlClient =
          MockShortGraphQlClient.withResponse('idToken', 'endpoint',
              http.Response(json.encode(<String, String>{'otp': '1234'}), 200));

      await buildTestWidget(
          tester: tester,
          store: storeTester.store,
          graphQlClient: graphQlClient,
          widget: RecoverPinRequest());

      await tester.enterText(find.byType(SILPhoneInput), '712345678');
      await tester.pump();

      await tester.tap(find.text(continueText));
      await tester.pump();
    });

    testWidgets(
        'displays SnackBar with text checkConnectionText when instance of SILException is thrown',
        (WidgetTester tester) async {
      final MockShortGraphQlClient graphQlClient =
          MockShortGraphQlClient.withResponse('idToken', 'endpoint',
              http.Response(json.encode(<String, String>{'code': '0'}), 400));

      await buildTestWidget(
          tester: tester,
          store: storeTester.store,
          graphQlClient: graphQlClient,
          widget: RecoverPinRequest());

      await tester.enterText(find.byType(SILPhoneInput), '712345678');
      await tester.pump();

      await tester.tap(find.text(continueText));
      await tester.pumpAndSettle();

      expect(find.text(checkConnectionText), findsOneWidget);
    });
  });
}
