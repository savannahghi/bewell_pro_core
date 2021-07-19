import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawers/add_temperature_reading_drawer.dart';
import 'package:shared_ui_components/buttons.dart';

import '../../../../../../mocks/mocks.dart';
import '../../../../../../mocks/test_helpers.dart';

void main() {
  group('AddTemperature drawer', () {
    setUpAll(() {
      startMockVisitAndExam();
    });

    testWidgets('saves temperature value on smallScreen',
        (WidgetTester tester) async {
      await buildDrawerTestWidget(tester, DrawerType.temperature);

      // verify UI renders correctly
      expect(find.byType(SILPrimaryButton), findsOneWidget);

      // Open drawer
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pump();

      // verify drawer is open
      expect(find.text(addTemperatureTitle), findsOneWidget);
      expect(find.byType(Form), findsOneWidget);
      expect(find.text('Capture manually'), findsOneWidget);
      expect(find.text('C'), findsWidgets);
      expect(find.byKey(AppWidgetKeys.temperatureValueKey), findsOneWidget);

      // add normal temperature reading
      await tester.tap(find.byKey(AppWidgetKeys.temperatureValueKey));
      await tester.enterText(
          find.byKey(AppWidgetKeys.temperatureValueKey), '35');
      await tester.testTextInput.receiveAction(TextInputAction.next);
      await tester.pumpAndSettle();

      // tap save button
      expect(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey),
          findsOneWidget);
      await tester
          .tap(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey));
      await tester.pumpAndSettle();

      // verify that the AddTemperatureReadingObject is populated
      expect(
          AddTemperatureReadingObject().patientRef.value, testPatientReference);
      expect(AddTemperatureReadingObject().patientName.value, testPatientName);
      expect(AddTemperatureReadingObject().encounterRef.value,
          testEncounterReference);

      // verify that the drawer was closed
      // verify(mockObserver.didPush(any, any));
      expect(find.byType(AddTemperatureReadingObject), findsNothing);

      // verify that the exam change object was modified
      expect(ExamChangeObject().onAddVitalListener.value, true);

      // verify that a success message was shown
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text(addTemperatureSuccessMsg), findsOneWidget);
    });

    testWidgets('closes drawer when cancel button is pressed',
        (WidgetTester tester) async {
      await buildDrawerTestWidget(tester, DrawerType.temperature);

      // verify UI renders correctly
      expect(find.byType(SILPrimaryButton), findsOneWidget);

      // Open drawer
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pump();

      // verify drawer is open
      expect(find.text(addTemperatureTitle), findsOneWidget);
      expect(find.byType(Form), findsOneWidget);
      expect(find.text('Capture manually'), findsOneWidget);
      expect(find.text('C'), findsWidgets);
      expect(find.byKey(AppWidgetKeys.temperatureValueKey), findsOneWidget);

      // add normal temperature reading
      await tester.tap(find.byKey(AppWidgetKeys.temperatureValueKey));
      await tester.enterText(
          find.byKey(AppWidgetKeys.temperatureValueKey), '35');
      await tester.testTextInput.receiveAction(TextInputAction.next);
      await tester.pumpAndSettle();

      // tap cancel button
      expect(find.byKey(AppWidgetKeys.silSecondaryButton), findsOneWidget);
      await tester.tap(find.byKey(AppWidgetKeys.silSecondaryButton));
      await tester.pumpAndSettle();

      // verify drawer is closed
      // verify(mockObserver.didPush(any, any));
      expect(find.byType(AddTemperature), findsNothing);
    });

    testWidgets('saves temperature value on largeScreen',
        (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = const Size(1280, 720);

      await buildDrawerTestWidget(tester, DrawerType.temperature);

      // verify UI renders correctly
      expect(find.byType(SILPrimaryButton), findsOneWidget);

      // Open drawer
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pump();

      // verify drawer is open
      expect(find.text(addTemperatureTitle), findsOneWidget);
      expect(find.byType(Form), findsOneWidget);
      expect(find.text('Capture manually'), findsOneWidget);
      expect(find.text('C'), findsWidgets);
      expect(find.byKey(AppWidgetKeys.temperatureValueKey), findsOneWidget);

      // add normal temperature reading
      await tester.tap(find.byKey(AppWidgetKeys.temperatureValueKey));
      await tester.enterText(
          find.byKey(AppWidgetKeys.temperatureValueKey), '35');
      await tester.testTextInput.receiveAction(TextInputAction.next);
      await tester.pump(const Duration(milliseconds: 200));

      // tap save button
      expect(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey),
          findsOneWidget);
      await tester
          .tap(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey));
      await tester.pumpAndSettle();

      // verify that the AddTemperatureReadingObject is populated
      expect(
          AddTemperatureReadingObject().patientRef.value, testPatientReference);
      expect(AddTemperatureReadingObject().patientName.value, testPatientName);
      expect(AddTemperatureReadingObject().encounterRef.value,
          testEncounterReference);

      // verify that the drawer was closed
      // verify(mockObserver.didPush(any, any));
      expect(find.byType(AddTemperatureReadingObject), findsNothing);

      // verify that the exam change object was modified
      expect(ExamChangeObject().onAddVitalListener.value, true);

      // verify that a success message was shown
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text(addTemperatureSuccessMsg), findsOneWidget);

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });

    testWidgets(
        'should throw validation error when invalid temperature value is entered',
        (WidgetTester tester) async {
      await buildDrawerTestWidget(tester, DrawerType.temperature);

      // verify UI renders correctly
      expect(find.byType(SILPrimaryButton), findsOneWidget);

      // Open drawer
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();

      // verify drawer is open
      expect(find.text(addTemperatureTitle), findsOneWidget);
      expect(find.byType(Form), findsOneWidget);
      expect(find.text('Capture manually'), findsOneWidget);
      expect(find.text('C'), findsWidgets);
      expect(find.byKey(AppWidgetKeys.temperatureValueKey), findsOneWidget);

      // add high temperature reading
      await tester.tap(find.byKey(AppWidgetKeys.temperatureValueKey));
      await tester.enterText(
          find.byKey(AppWidgetKeys.temperatureValueKey), '60');
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
      expect(find.text('Temperature is too high'), findsOneWidget);
    });
  });
}
