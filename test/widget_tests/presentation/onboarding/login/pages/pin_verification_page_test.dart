// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/domain/core/value_objects/enums.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/pages/pin_verification_page.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/widgets/onboarding_scaffold.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/widgets/phone_login.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/widgets/verify_pin.dart';
import '../../../../../mocks/mocks.dart';
import '../../../../../mocks/test_helpers.dart';

void main() {
  group('PinVerificationPage', () {
    late Store<CoreState> store;

    setUp(() {
      store = Store<CoreState>(initialState: CoreState.initial());
    });

    testWidgets(
        'renders correctly and logs user out if the logout button '
        'is tapped ', (WidgetTester tester) async {
      await buildTestWidget(
        store: store,
        tester: tester,
        widget: const PinVerificationPage(
          pinVerificationType: PinVerificationType.resumeWithPin,
        ),
      );

      expect(find.byType(PinVerificationPage), findsOneWidget);
      expect(find.text(enterPin), findsOneWidget);
      expect(find.byType(OnboardingScaffold), findsOneWidget);
      expect(find.byType(VerifyPin), findsOneWidget);

      await tester.tap(find.byKey(AppWidgetKeys.logoutButton));
      await tester.pumpAndSettle();

      expect(find.byType(ScaffoldMessenger), findsOneWidget);
      expect(find.byType(PhoneLogin), findsOneWidget);
    });

    testWidgets('pops the current page is should pop is set to true',
        (WidgetTester tester) async {
      final MockNavigatorObserver navigatorObserver = MockNavigatorObserver();

      await buildTestWidget(
        store: store,
        tester: tester,
        navigatorObservers: <NavigatorObserver>[navigatorObserver],
        widget: const PinVerificationPage(
          pinVerificationType: PinVerificationType.resumeWithPin,
          shouldPop: true,
        ),
      );

      expect(find.byType(PinVerificationPage), findsOneWidget);
      expect(find.text(enterPin), findsOneWidget);
      expect(find.byType(OnboardingScaffold), findsOneWidget);
      expect(find.byType(VerifyPin), findsOneWidget);

      await tester.tap(find.byKey(AppWidgetKeys.logoutButton));
      await tester.pumpAndSettle();
    });
  });
}
