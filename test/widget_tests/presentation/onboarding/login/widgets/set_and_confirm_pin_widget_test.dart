// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_ui_components/platform_loader.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/widgets/phone_login.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/widgets/set_and_confirm_pin_widget.dart';
import '../../../../../mocks/test_helpers.dart';

void main() {
  group('SetAndConfirmPinWidget', () {
    late Store<CoreState> store;

    setUp(() {
      store = Store<CoreState>(initialState: CoreState.initial());
    });

    testWidgets(
        'should navigate to login page once the PIN is successfully reset',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: SetAndConfirmPinWidget(
            setPinStatus: SetPinStatus.IsResettingPin, flag: 'reset_pin'),
      );

      expect(find.byType(SetAndConfirmPinWidget), findsOneWidget);
      expect(find.byType(TextFormField), findsNWidgets(2));
      expect(find.byKey(AppWidgetKeys.createPinFormFieldKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.confirmPinFormFieldKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.setPinKey), findsOneWidget);
      expect(find.byType(SILPlatformLoader), findsNothing);

      await tester.enterText(
          find.byKey(AppWidgetKeys.createPinFormFieldKey), '1234');
      await tester.pump();

      await tester.enterText(
          find.byKey(AppWidgetKeys.confirmPinFormFieldKey), '1234');
      await tester.pump();

      await tester.tap(find.byKey(AppWidgetKeys.setPinKey));
      await tester.pumpAndSettle();

      expect(find.byType(PhoneLogin), findsOneWidget);
    });

    testWidgets('shows the continue button when there is no loading',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: SetAndConfirmPinWidget(
            setPinStatus: SetPinStatus.IsSettingPin, flag: 'test_flag'),
      );

      expect(find.byType(SetAndConfirmPinWidget), findsOneWidget);
      expect(find.byType(TextFormField), findsNWidgets(2));
      expect(find.byKey(AppWidgetKeys.createPinFormFieldKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.confirmPinFormFieldKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.setPinKey), findsOneWidget);
      expect(find.byType(SILPlatformLoader), findsNothing);
    });

    testWidgets('shows loading indicator when processing',
        (WidgetTester tester) async {
      store.dispatch(WaitAction<CoreState>.add('test_flag'));

      await buildTestWidget(
        tester: tester,
        store: store,
        widget: SetAndConfirmPinWidget(
            setPinStatus: SetPinStatus.IsSettingPin, flag: 'test_flag'),
      );

      expect(find.byType(SetAndConfirmPinWidget), findsOneWidget);
      expect(find.byType(TextFormField), findsNWidgets(2));
      expect(find.byKey(AppWidgetKeys.createPinFormFieldKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.confirmPinFormFieldKey), findsOneWidget);
      expect(find.byType(SILPlatformLoader), findsOneWidget);
      expect(store.state.wait!.isWaiting, true);
    });

    testWidgets('should validate inputs when the continue button is pressed',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: SetAndConfirmPinWidget(
            setPinStatus: SetPinStatus.IsSettingPin, flag: 'set_pin'),
      );

      await tester.enterText(
          find.byKey(AppWidgetKeys.createPinFormFieldKey), '1234');
      await tester.pump();

      await tester.enterText(
          find.byKey(AppWidgetKeys.confirmPinFormFieldKey), '1235');
      await tester.pump();

      await tester.tap(find.byKey(AppWidgetKeys.setPinKey));
      await tester.pumpAndSettle();

      // confirm the validation text is shown
      expect(find.text('PINs do not match'), findsOneWidget);

      // verify the snackbar is shown
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Please enter your PIN correctly'), findsOneWidget);
    });
  });
}
