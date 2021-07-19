import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawers/add_respiratory_rate_drawer.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:shared_ui_components/buttons.dart';

import '../../../../../../mocks/mocks.dart';
import '../../../../../../mocks/test_helpers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('AddRespiratoryRate drawer', () {
    setUpAll(() {
      startMockVisitAndExam();
    });

    testWidgets('saves respiratory rate in smallScreen',
        (WidgetTester tester) async {
      await buildDrawerTestWidget(tester, DrawerType.respiratoryRate);

      // Open drawer
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pump();

      // verify drawer is open
      expect(find.text(addRespiratoryTitle), findsOneWidget);
      expect(find.byType(Form), findsOneWidget);
      expect(find.text('Capture manually'), findsOneWidget);
      expect(find.text('BPM'), findsNWidgets(2));

      expect(find.byKey(AppWidgetKeys.bmpValueKey), findsOneWidget);

      // enter a normal respiratory rate
      await tester.tap(find.byKey(AppWidgetKeys.bmpValueKey));
      await tester.enterText(find.byKey(AppWidgetKeys.bmpValueKey), '70');
      await tester.testTextInput.receiveAction(TextInputAction.next);
      await tester.pump(const Duration(milliseconds: 200));

      // tap save button
      expect(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey),
          findsOneWidget);
      await tester
          .tap(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey));
      await tester.pumpAndSettle();

      // verify that the AddRespiratoryRateObject object is populated
      expect(AddRespiratoryRateObject().patientRef.value, testPatientReference);
      expect(AddRespiratoryRateObject().patientName.value, testPatientName);
      expect(AddRespiratoryRateObject().encounterRef.value,
          testEncounterReference);

      // verify that the drawer was closed
      // verify(mockObserver.didPush(any, any));
      expect(find.byType(AddRespiratoryRateObject), findsNothing);

      // verify that the exam change object was modified
      expect(ExamChangeObject().onAddVitalListener.value, true);

      // verify that a success message was shown
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text(addRespiratorySuccessMsg), findsOneWidget);
    });

    testWidgets('closes drawer when cancel button is pressed',
        (WidgetTester tester) async {
      await buildDrawerTestWidget(tester, DrawerType.respiratoryRate);

      // Open drawer
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pump();

      // verify drawer is open
      expect(find.text(addRespiratoryTitle), findsOneWidget);
      expect(find.byType(Form), findsOneWidget);
      expect(find.text('Capture manually'), findsOneWidget);
      expect(find.text('BPM'), findsNWidgets(2));
      expect(find.byKey(AppWidgetKeys.bmpValueKey), findsOneWidget);

      // enter a normal respiratory rate
      await tester.tap(find.byKey(AppWidgetKeys.bmpValueKey));
      await tester.enterText(find.byKey(AppWidgetKeys.bmpValueKey), '70');
      await tester.testTextInput.receiveAction(TextInputAction.next);
      await tester.pump(const Duration(milliseconds: 200));

      // tap cancel button
      expect(find.byKey(AppWidgetKeys.silSecondaryButton), findsOneWidget);
      await tester.tap(find.byKey(AppWidgetKeys.silSecondaryButton));
      await tester.pumpAndSettle();

      // verify drawer closed
      // verify(mockObserver.didPush(any, any));
      expect(find.byType(AddRespiratoryRate), findsNothing);
    });

    testWidgets('saves respiratory rate in largeScreen',
        (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = const Size(1280, 720);

      await buildDrawerTestWidget(tester, DrawerType.respiratoryRate);

      // Open drawer
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pump();

      // verify drawer is open
      expect(find.text(addRespiratoryTitle), findsOneWidget);
      expect(find.byType(Form), findsOneWidget);
      expect(find.text('Capture manually'), findsOneWidget);
      expect(find.text('BPM'), findsNWidgets(2));
      expect(find.byKey(AppWidgetKeys.bmpValueKey), findsOneWidget);

      // enter a normal respiratory rate
      await tester.tap(find.byKey(AppWidgetKeys.bmpValueKey));
      await tester.enterText(find.byKey(AppWidgetKeys.bmpValueKey), '70');
      await tester.testTextInput.receiveAction(TextInputAction.next);
      await tester.pump(const Duration(milliseconds: 200));

      // tap save button
      expect(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey),
          findsOneWidget);
      await tester
          .tap(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey));
      await tester.pumpAndSettle();

      // verify that the AddRespiratoryRateObject object is populated
      expect(AddRespiratoryRateObject().patientRef.value, testPatientReference);
      expect(AddRespiratoryRateObject().patientName.value, testPatientName);
      expect(AddRespiratoryRateObject().encounterRef.value,
          testEncounterReference);

      // verify that the drawer was closed
      // verify(mockObserver.didPush(any, any));
      expect(find.byType(AddRespiratoryRateObject), findsNothing);

      // verify that the exam change object was modified
      expect(ExamChangeObject().onAddVitalListener.value, true);

      // verify that a success message was shown
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text(addRespiratorySuccessMsg), findsOneWidget);

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });

    testWidgets(
        'should throw validation error when invalid details are entered',
        (WidgetTester tester) async {
      await buildDrawerTestWidget(tester, DrawerType.respiratoryRate);

      // verify UI renders correctly
      expect(find.byType(SILPrimaryButton), findsOneWidget);

      // Open drawer
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pump();

      // verify drawer is open
      expect(find.text(addRespiratoryTitle), findsOneWidget);
      expect(find.byType(Form), findsOneWidget);
      expect(find.text('Capture manually'), findsOneWidget);
      expect(find.text('BPM'), findsNWidgets(2));
      expect(find.byKey(AppWidgetKeys.bmpValueKey), findsOneWidget);

      // enter a high respiratory rate
      await tester.tap(find.byKey(AppWidgetKeys.bmpValueKey));
      await tester.enterText(find.byKey(AppWidgetKeys.bmpValueKey), '220');
      await tester.testTextInput.receiveAction(TextInputAction.next);
      await tester.pump(const Duration(milliseconds: 200));

      // tap save button
      expect(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey),
          findsOneWidget);
      await tester
          .tap(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey));
      await tester.pumpAndSettle();

      // verify throws validation error
      expect(find.text('HIGH'), findsOneWidget);
      expect(find.text('BPM is too high'), findsOneWidget);
    });
  });
}
