// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/onboarding/common/widgets/landing_actions.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/pages/phone_login_page.dart';
import 'package:bewell_pro_core/presentation/onboarding/signup/phone_signup_page.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('Landing Actions', () {
    testWidgets('should navigate to create account page',
        (WidgetTester tester) async {
      final Store<CoreState> store =
          Store<CoreState>(initialState: CoreState.initial());

      await buildTestWidget(
        tester: tester,
        store: store,
        widget: Scaffold(body: LandingActions()),
      );

      /// Verify UI renders
      expect(find.text(createAccount), findsOneWidget);
      expect(find.text(landingSignIn), findsOneWidget);
      expect(find.byType(LandingActions), findsOneWidget);

      /// Tap Create account Key
      await tester.tap(find.byKey(AppWidgetKeys.createAccountKey));
      await tester.pumpAndSettle();

      /// Verify navigates
      expect(find.byType(LandingActions), findsNothing);
      expect(find.byType(PhoneSignUpPage), findsOneWidget);
    });

    testWidgets('should navigate to sign in page', (WidgetTester tester) async {
      final Store<CoreState> store =
          Store<CoreState>(initialState: CoreState.initial());

      await buildTestWidget(
        tester: tester,
        store: store,
        widget: Scaffold(body: LandingActions()),
      );

      /// Verify UI renders
      expect(find.text(createAccount), findsOneWidget);
      expect(find.text(landingSignIn), findsOneWidget);
      expect(find.byType(LandingActions), findsOneWidget);

      /// Tap Login Key
      await tester.tap(find.byKey(AppWidgetKeys.signInKey));
      await tester.pumpAndSettle();

      /// Verify navigates
      expect(find.byType(LandingActions), findsNothing);
      expect(find.byType(PhoneLoginPage), findsOneWidget);
    });
  });
}
