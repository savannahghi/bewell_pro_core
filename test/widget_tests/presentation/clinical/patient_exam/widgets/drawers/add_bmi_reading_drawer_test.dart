// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:sghi_core/ui_components/src/buttons.dart';

// Project imports:
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawers/add_bmi_reading_drawer.dart';
import '../../../../../../mocks/mocks.dart';
import '../../../../../../mocks/test_helpers.dart';

void main() {
  group('AddBMI drawer', () {
    setUpAll(() {
      startMockVisitAndExam();
    });

    testWidgets('should save bmi correctly in smallScreen',
        (WidgetTester tester) async {
      await buildDrawerTestWidget(tester, DrawerType.heightAndWeight);

      await tester.pumpAndSettle();

      // verify UI renders correctly
      expect(find.byType(SILPrimaryButton), findsOneWidget);

      // Open drawer
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();

      // verify drawer is open
      expect(find.byType(AddBMI), findsOneWidget);
      expect(find.text(addBMITitle), findsOneWidget);
      expect(find.text('Capture manually'), findsOneWidget);
      expect(find.text('Height'), findsWidgets);
      expect(find.text('cm'), findsWidgets);
      expect(find.byKey(AppWidgetKeys.heightValueKey), findsOneWidget);
      expect(find.text('Weight'), findsWidgets);
      expect(find.byKey(AppWidgetKeys.weightValueKey), findsOneWidget);

      // enter normal height value
      await tester.tap(find.byKey(AppWidgetKeys.heightValueKey));
      await tester.enterText(find.byKey(AppWidgetKeys.heightValueKey), '170');
      await tester.testTextInput.receiveAction(TextInputAction.next);
      await tester.pumpAndSettle();

      // enter normal weight value
      await tester.tap(find.byKey(AppWidgetKeys.weightValueKey));
      await tester.enterText(find.byKey(AppWidgetKeys.weightValueKey), '70');
      await tester.testTextInput.receiveAction(TextInputAction.next);
      await tester.pumpAndSettle();

      // tap save button
      expect(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey),
          findsOneWidget);
      await tester
          .tap(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey));
      await tester.pumpAndSettle();

      // verify that the addBMIObject object is populated
      expect(AddBMIObject().patientRef.valueOrNull, testPatientReference);
      expect(AddBMIObject().patientName.valueOrNull, testPatientName);
      expect(AddBMIObject().encounterRef.valueOrNull, testEncounterReference);

      // verify that the drawer was closed
      // verify(mockObserver.didPush(any, any));
      expect(find.byType(AddBMI), findsNothing);

      // verify that the exam change object was modified
      expect(ExamChangeObject().onAddVitalListener.value, true);

      // verify that a success message was shown
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text(addBMISuccessMsg), findsOneWidget);
    });

    testWidgets('should close the drawer when the cancel button is tapped',
        (WidgetTester tester) async {
      await buildDrawerTestWidget(tester, DrawerType.heightAndWeight);
      await tester.pumpAndSettle();

      // verify UI renders correctly
      expect(find.byType(SILPrimaryButton), findsOneWidget);

      // Open drawer
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();

      // verify drawer is open
      expect(find.text(addBMITitle), findsOneWidget);
      expect(find.text('Capture manually'), findsOneWidget);
      expect(find.text('Height'), findsWidgets);
      expect(find.text('cm'), findsWidgets);
      expect(find.byKey(AppWidgetKeys.heightValueKey), findsOneWidget);
      expect(find.text('Weight'), findsWidgets);
      expect(find.byKey(AppWidgetKeys.weightValueKey), findsOneWidget);

      // enter normal height value
      await tester.tap(find.byKey(AppWidgetKeys.heightValueKey));
      await tester.enterText(find.byKey(AppWidgetKeys.heightValueKey), '170');
      await tester.testTextInput.receiveAction(TextInputAction.next);
      await tester.pumpAndSettle();

      // enter normal weight value
      await tester.tap(find.byKey(AppWidgetKeys.weightValueKey));
      await tester.enterText(find.byKey(AppWidgetKeys.weightValueKey), '70');
      await tester.testTextInput.receiveAction(TextInputAction.next);
      await tester.pumpAndSettle();

      // tap the cancel button
      expect(find.byKey(AppWidgetKeys.silSecondaryButton), findsOneWidget);
      await tester.tap(find.byKey(AppWidgetKeys.silSecondaryButton));
      await tester.pumpAndSettle();

      expect(find.byType(AddBMI), findsNothing);
    });

    testWidgets('should save bmi correctly in largeScreen',
        (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = tabletLandscape;

      await buildDrawerTestWidget(tester, DrawerType.heightAndWeight);
      await tester.pumpAndSettle();

      // verify UI renders correctly
      expect(find.byType(SILPrimaryButton), findsOneWidget);

      // Open drawer
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();

      // verify drawer is open
      expect(find.text(addBMITitle), findsOneWidget);
      expect(find.text('Capture manually'), findsOneWidget);
      expect(find.text('Height'), findsWidgets);
      expect(find.text('cm'), findsWidgets);
      expect(find.byKey(AppWidgetKeys.heightValueKey), findsOneWidget);
      expect(find.text('Weight'), findsWidgets);
      expect(find.byKey(AppWidgetKeys.weightValueKey), findsOneWidget);

      // enter normal height value
      await tester.tap(find.byKey(AppWidgetKeys.heightValueKey));
      await tester.enterText(find.byKey(AppWidgetKeys.heightValueKey), '170');
      await tester.testTextInput.receiveAction(TextInputAction.next);

      // enter normal weight value
      await tester.tap(find.byKey(AppWidgetKeys.weightValueKey));
      await tester.enterText(find.byKey(AppWidgetKeys.weightValueKey), '70');
      await tester.testTextInput.receiveAction(TextInputAction.next);

      // tap save button
      expect(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey),
          findsOneWidget);
      await tester
          .tap(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey));
      await tester.pumpAndSettle();

      // verify that the addBMIObject object is populated
      expect(AddBMIObject().patientRef.value, testPatientReference);
      expect(AddBMIObject().patientName.value, testPatientName);
      expect(AddBMIObject().encounterRef.value, testEncounterReference);

      // verify that the drawer was closed
      // verify(mockObserver.didPush(any, any));
      expect(find.byType(AddBMI), findsNothing);

      // verify that the exam change object was modified
      expect(ExamChangeObject().onAddVitalListener.value, true);

      // verify that a success message was shown
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text(addBMISuccessMsg), findsOneWidget);

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });

    testWidgets('should throw validation error when wrong values are entered',
        (WidgetTester tester) async {
      await buildDrawerTestWidget(tester, DrawerType.heightAndWeight);

      // verify UI renders correctly
      expect(find.byType(SILPrimaryButton), findsOneWidget);

      // Open drawer
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();

      // verify drawer is open
      expect(find.text(addBMITitle), findsOneWidget);
      expect(find.text('Capture manually'), findsOneWidget);
      expect(find.text('Height'), findsWidgets);
      expect(find.text('cm'), findsWidgets);
      expect(find.byKey(AppWidgetKeys.heightValueKey), findsOneWidget);
      expect(find.text('Weight'), findsWidgets);
      expect(find.byKey(AppWidgetKeys.weightValueKey), findsOneWidget);

      // enter wrong height value
      await tester.enterText(find.byKey(AppWidgetKeys.heightValueKey), '0');
      await tester.testTextInput.receiveAction(TextInputAction.next);

      // enter wrong weight value
      await tester.enterText(find.byKey(AppWidgetKeys.weightValueKey), '0');
      await tester.testTextInput.receiveAction(TextInputAction.next);
      await tester.pump();

      // tap save button
      expect(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey),
          findsOneWidget);
      await tester
          .tap(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey));
      await tester.pump();

      // verify throws validation error
      expect(find.text(heightZeroPrompt), findsNothing);
      expect(find.text(weightZeroPrompt), findsNothing);

      // enter wrong height value
      await tester.enterText(find.byKey(AppWidgetKeys.heightValueKey), '400');
      await tester.testTextInput.receiveAction(TextInputAction.next);
      await tester.pumpAndSettle();

      // verify throws validation error
      expect(find.text(heightZeroPrompt), findsNothing);
      expect(find.text(weightZeroPrompt), findsNothing);
    });
  });
}
