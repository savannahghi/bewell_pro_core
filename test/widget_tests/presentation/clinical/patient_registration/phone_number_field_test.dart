import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/clinical/patient_registration/phone_number_form_manager.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/widgets/phone_number_field.dart';
import 'package:shared_themes/constants.dart';
import 'package:shared_ui_components/inputs.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

class MockFormManager extends PhoneNumberFormManager {
  final bool _shouldShowError;

  MockFormManager({bool? shouldShowError})
      : _shouldShowError = shouldShowError ?? false;

  @override
  Future<String?> verifyPhone(BuildContext context) async {
    if (_shouldShowError) {
      return null;
    }
    return 'otp';
  }
}

void main() {
  group('PhoneNumberFieldWidget', () {
    late Store<AppState> store;
    late MockFormManager formManager;

    const String testPhoneNumber = '798000000';

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
      formManager = MockFormManager();
    });

    testWidgets(
        'should add display verifyPhoneNumber prompt if phone is not verified',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: PhoneNumberFieldWidget(
          formManager: formManager,
          otpReceiver: patientStr,
        ),
      );

      await tester.pump();
      expect(find.byType(SILPhoneInput), findsOneWidget);

      await tester.showKeyboard(find.byType(SILPhoneInput));
      await tester.enterText(find.byType(SILPhoneInput), testPhoneNumber);
      await tester.pumpAndSettle();

      final Finder richTextFinder =
          find.byKey(AppWidgetKeys.verifyPhoneRichTextKey);
      final RichText richText =
          richTextFinder.evaluate().first.widget as RichText;
      final String richTextText = richText.text.toPlainText();
      expect(richTextText, 'Kindly verify phone number*');
    });

    testWidgets(
        'should add display verifyPhoneNumber prompt if phone is not verified '
        'and screen is large', (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = tabletLandscape;

      await buildTestWidget(
        tester: tester,
        store: store,
        widget: PhoneNumberFieldWidget(
          formManager: formManager,
          otpReceiver: patientStr,
        ),
      );

      await tester.pump();
      expect(find.byType(SILPhoneInput), findsOneWidget);

      await tester.showKeyboard(find.byType(SILPhoneInput));
      await tester.enterText(find.byType(SILPhoneInput), testPhoneNumber);
      await tester.pumpAndSettle();

      final Finder richTextFinder =
          find.byKey(AppWidgetKeys.verifyPhoneRichTextKey);
      final RichText richText =
          richTextFinder.evaluate().first.widget as RichText;
      final String richTextText = richText.text.toPlainText();
      expect(richTextText, 'Kindly verify phone number*');

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });

    testWidgets('verify phone number button should work as expected',
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        final PhoneNumberVerifiedState verifiedState = PhoneNumberVerifiedState(
            isPhoneVerified: true, isSendingOtp: false);

        await buildTestWidget(
          tester: tester,
          store: store,
          widget: PhoneNumberFieldWidget(
            formManager: formManager,
            otpReceiver: patientStr,
            verifyPhone: () => formManager.inIsPhoneVerified.add(verifiedState),
          ),
        );

        expect(find.byType(SILPhoneInput), findsOneWidget);

        await tester.enterText(find.byType(SILPhoneInput), testPhoneNumber);
        await tester.pumpAndSettle();

        final Finder verifyPhoneBtn = find.byKey(AppWidgetKeys.verifyButtonKey);
        expect(verifyPhoneBtn, findsOneWidget);
        await tester.tap(verifyPhoneBtn);
        await tester.pump();

        final PhoneNumberVerifiedState emitted = PhoneNumberVerifiedState(
            isPhoneVerified: true, isSendingOtp: false);

        await for (final PhoneNumberVerifiedState emittedResult
            in formManager.isPhoneVerified) {
          expect(emittedResult, emitted);
          return;
        }

        expect(find.text(verifiedPhoneNumber), findsOneWidget);
      });
    });

    testWidgets(
        'verify phone number button should work as expected on large screen',
        (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = tabletLandscape;

      await tester.runAsync(() async {
        final PhoneNumberVerifiedState verifiedState = PhoneNumberVerifiedState(
            isPhoneVerified: true, isSendingOtp: false);

        await buildTestWidget(
          tester: tester,
          store: store,
          widget: PhoneNumberFieldWidget(
            formManager: formManager,
            otpReceiver: patientStr,
            verifyPhone: () => formManager.inIsPhoneVerified.add(verifiedState),
          ),
        );

        await tester.pump();
        expect(find.byType(SILPhoneInput), findsOneWidget);

        await tester.showKeyboard(find.byType(SILPhoneInput));
        await tester.enterText(find.byType(SILPhoneInput), testPhoneNumber);
        await tester.pumpAndSettle();

        final Finder verifyPhoneBtn = find.byKey(AppWidgetKeys.verifyButtonKey);
        expect(verifyPhoneBtn, findsOneWidget);

        await tester.tap(verifyPhoneBtn);

        await for (final PhoneNumberVerifiedState emittedResult
            in formManager.isPhoneVerified) {
          expect(emittedResult, verifiedState);
          return;
        }

        expect(find.text(verifiedPhoneNumber), findsOneWidget);
      });

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });

    testWidgets('should show error if error occurs while sending otp',
        (WidgetTester tester) async {
      final MockFormManager formManager =
          MockFormManager(shouldShowError: true);

      await buildTestWidget(
        tester: tester,
        store: store,
        widget: PhoneNumberFieldWidget(
          formManager: formManager,
          otpReceiver: patientStr,
        ),
      );

      expect(find.byType(SILPhoneInput), findsOneWidget);

      await tester.enterText(find.byType(SILPhoneInput), testPhoneNumber);
      await tester.pumpAndSettle();

      final Finder verifyPhoneBtn = find.byKey(AppWidgetKeys.verifyButtonKey);
      expect(verifyPhoneBtn, findsOneWidget);
      await tester.tap(verifyPhoneBtn);
      await tester.pump();

      expect(find.text(UserFeedBackTexts.getErrorMessage(sendingTheOtp)),
          findsOneWidget);
    });

    testWidgets('change in phone number triggers snackbar',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: PhoneNumberFieldWidget(
          formManager: formManager,
          otpReceiver: patientStr,
        ),
      );

      const String testPhoneNumber2 = '798123456';

      await tester.pump();
      expect(find.byType(SILPhoneInput), findsOneWidget);

      await tester.showKeyboard(find.byType(SILPhoneInput));
      await tester.enterText(find.byType(SILPhoneInput), testPhoneNumber);
      await tester.pumpAndSettle();

      await tester.showKeyboard(find.byType(SILPhoneInput));
      await tester.enterText(find.byType(SILPhoneInput), testPhoneNumber2);
      await tester.pumpAndSettle();

      expect(find.text(testPhoneNumber2), findsOneWidget);

      final Finder snackBar = find.byType(SnackBar);
      final Finder textWidgetFinder = find.descendant(
          of: snackBar, matching: find.text(verifyPhoneChangedPrompt));

      expect(textWidgetFinder, findsOneWidget);
    });
    test('PhoneNumberVerifiedState equality checck functions correctly', () {
      final PhoneNumberVerifiedState phoneNumberVerifiedState =
          PhoneNumberVerifiedState(isPhoneVerified: true, isSendingOtp: true);
      final PhoneNumberVerifiedState state =
          PhoneNumberVerifiedState(isPhoneVerified: true, isSendingOtp: true);
      final bool isEqual = phoneNumberVerifiedState.hashCode == state.hashCode;

      expect(isEqual, true);
    });
  });
}
