import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/redux/actions/misc_state_actions/batch_update_misc_state_action.dart';
import 'package:bewell_pro_core/application/redux/flags/flags.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/widgets/onboarding_scaffold.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/pages/phone_login_page.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/pages/recover_pin_request_page.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/widgets/error_alert_box.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/widgets/recover_pin.dart';
import 'package:shared_ui_components/buttons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shared_ui_components/inputs.dart';
import 'package:shared_ui_components/platform_loader.dart';

import '../../../../../mocks/mocks.dart';
import '../../../../../mocks/test_helpers.dart';

void main() {
  group('Recover Pin page', () {
    late Store<AppState> store;

    setUp(() {
      final AppState state = AppState.initial();
      store = Store<AppState>(initialState: state);
    });

    testWidgets('recover PIN renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        store: store,
        tester: tester,
        widget: RecoverPinPage(),
      );

      final Finder silPrimaryButton = find.byType(SILPrimaryButton);

      expect(find.byType(RecoverPinRequest), findsOneWidget);
      expect(find.byType(OnboardingScaffold), findsOneWidget);
      expect(silPrimaryButton, findsOneWidget);
    });

    testWidgets('onboarding scaffold renders correctly',
        (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = tabletLandscape;

      await tester.pumpWidget(const MaterialApp(
        home: OnboardingScaffold(
          dimension: 0,
          icon: MdiIcons.security,
          title: recoverTitle,
          msg: recoverMsg,
          child: Placeholder(),
        ),
      ));

      expect(find.byIcon(MdiIcons.security), findsOneWidget);
      expect(find.text(recoverTitle), findsOneWidget);
      expect(find.text(recoverMsg), findsOneWidget);

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });

    testWidgets('displays error message when phon no. is unknown',
        (WidgetTester tester) async {
      store.dispatch(BatchUpdateMiscStateAction(unKnownPhoneNo: true));
      await buildTestWidget(
          store: store,
          tester: tester,
          widget: Builder(builder: (BuildContext context) {
            return RecoverPinPage();
          }));

      final Finder silPrimaryButton = find.byType(SILPrimaryButton);

      expect(silPrimaryButton, findsOneWidget);

      expect(find.byType(SILPhoneInput), findsOneWidget);
      await tester.enterText(find.byType(SILPhoneInput), '0795426411');
      expect(find.byType(ErrorAlertBox), findsOneWidget);
    });

    testWidgets('displays continue button when phon no. is known',
        (WidgetTester tester) async {
      await buildTestWidget(
          store: store,
          tester: tester,
          widget: Builder(builder: (BuildContext context) {
            store.dispatch(BatchUpdateMiscStateAction(unKnownPhoneNo: false));

            return RecoverPinPage();
          }));

      final Finder silPrimaryButton = find.byType(SILPrimaryButton);

      expect(silPrimaryButton, findsOneWidget);

      expect(find.byType(SILPhoneInput), findsOneWidget);
      await tester.enterText(find.byType(SILPhoneInput), '0712345678');
      expect(find.byType(SILPlatformLoader), findsNothing);
      expect(silPrimaryButton, findsOneWidget);
    });

    testWidgets('shows a loading indicator when processing',
        (WidgetTester tester) async {
      await buildTestWidget(
          store: store,
          tester: tester,
          widget: Builder(builder: (BuildContext context) {
            store.dispatch(WaitAction<AppState>.add(
              requestPinResetFlag,
              ref: '${requestPinResetFlag}_ref',
            ));

            return RecoverPinPage();
          }));

      expect(find.byType(SILPlatformLoader), findsOneWidget);
    });

    testWidgets('back button works', (WidgetTester tester) async {
      await buildTestWidget(
        store: store,
        tester: tester,
        widget: RecoverPinRequest(),
      );

      final Finder flatButtonKey =
          find.byKey(AppWidgetKeys.recoverRequestBackButton);
      expect(flatButtonKey, findsOneWidget);
      await tester.tap(flatButtonKey);
      await tester.pumpAndSettle();
      expect(find.byType(PhoneLoginPage), findsOneWidget);
    });
  });
}
