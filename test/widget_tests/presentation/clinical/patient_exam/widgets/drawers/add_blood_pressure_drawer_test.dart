// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:shared_ui_components/buttons.dart';

// Project imports:
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawers/add_blood_pressure_drawer.dart';
import '../../../../../../mocks/mocks.dart';
import '../../../../../../mocks/test_helpers.dart';

void main() {
  group('AddBloodPressure drawer', () {
    setUpAll(() {
      startMockVisitAndExam();
    });

    testWidgets('should save bloodPressure correctly on smallScreen',
        (WidgetTester tester) async {
      await buildDrawerTestWidget(tester, DrawerType.bloodPressure);

      // verify UI renders correctly
      expect(find.byType(SILPrimaryButton), findsOneWidget);

      // Open drawer
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pump();

      // verify drawer is open
      expect(find.text(addBloodPressureTitle), findsOneWidget);
      expect(find.byType(Form), findsOneWidget);
      expect(find.text('Capture manually'), findsOneWidget);
      expect(find.text('Systole'), findsOneWidget);
      expect(find.text('Diastole'), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.systoleValueKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.diastoleValueKey), findsOneWidget);
      expect(find.text('BP'), findsOneWidget);
      expect(find.text('mmHg'), findsWidgets);
      expect(find.text('Sys'), findsOneWidget);
      expect(find.text('Dia'), findsOneWidget);

      // add normal systole value
      await tester.enterText(find.byKey(AppWidgetKeys.systoleValueKey), '120');
      await tester.testTextInput.receiveAction(TextInputAction.next);

      // add normal diastole value
      await tester.enterText(find.byKey(AppWidgetKeys.diastoleValueKey), '80');
      await tester.testTextInput.receiveAction(TextInputAction.next);
      await tester.pump(const Duration(milliseconds: 200));

      // tap the save button
      expect(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey),
          findsOneWidget);
      await tester
          .tap(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey));
      await tester.pumpAndSettle();

      // verify that the bloodPressure object is populated
      expect(AddBloodPressureObject().patientRef.value, testPatientReference);
      expect(AddBloodPressureObject().patientName.value, testPatientName);
      expect(
          AddBloodPressureObject().encounterRef.value, testEncounterReference);

      // verify that the drawer was closed
      expect(find.byType(AddBloodPressureObject), findsNothing);

      // verify that the exam change object was modified
      expect(ExamChangeObject().onAddVitalListener.value, true);

      // verify that a success message was shown
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text(addBloodSuccessMsg), findsOneWidget);
    });

    testWidgets('should handle error response', (WidgetTester tester) async {
      final MockShortGraphQlClient graphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(json.encode(<String, dynamic>{'error': ''}), 201),
      );

      await buildDrawerTestWidget(
        tester,
        DrawerType.bloodPressure,
        graphQlClient: graphQlClient,
      );

      // verify UI renders correctly
      expect(find.byType(SILPrimaryButton), findsOneWidget);

      // Open drawer
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pump();

      // verify drawer is open
      expect(find.text(addBloodPressureTitle), findsOneWidget);
      expect(find.byType(Form), findsOneWidget);
      expect(find.text('Capture manually'), findsOneWidget);
      expect(find.text('Systole'), findsOneWidget);
      expect(find.text('Diastole'), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.systoleValueKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.diastoleValueKey), findsOneWidget);
      expect(find.text('BP'), findsOneWidget);
      expect(find.text('mmHg'), findsWidgets);
      expect(find.text('Sys'), findsOneWidget);
      expect(find.text('Dia'), findsOneWidget);

      // add normal systole value
      await tester.enterText(find.byKey(AppWidgetKeys.systoleValueKey), '120');
      await tester.testTextInput.receiveAction(TextInputAction.next);

      // add normal diastole value
      await tester.enterText(find.byKey(AppWidgetKeys.diastoleValueKey), '80');
      await tester.testTextInput.receiveAction(TextInputAction.next);
      await tester.pump(const Duration(milliseconds: 200));

      // tap the save button
      expect(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey),
          findsOneWidget);
      await tester
          .tap(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey));
      await tester.pumpAndSettle();

      // verify that the exam change object was modified
      expect(ExamChangeObject().onAddVitalListener.value, false);
    });

    testWidgets('should close drawer when cancel button is pressed',
        (WidgetTester tester) async {
      await buildDrawerTestWidget(tester, DrawerType.bloodPressure);

      // verify UI renders correctly
      expect(find.byType(SILPrimaryButton), findsOneWidget);

      // Open drawer
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pump();

      // verify drawer is open
      expect(find.text('Capture manually'), findsOneWidget);
      expect(find.text('Systole'), findsOneWidget);
      expect(find.text('Diastole'), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.systoleValueKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.diastoleValueKey), findsOneWidget);
      expect(find.text('mmHg'), findsNWidgets(3));
      expect(find.text('Sys'), findsOneWidget);
      expect(find.text('Dia'), findsOneWidget);

      // add normal systole value
      await tester.enterText(find.byKey(AppWidgetKeys.systoleValueKey), '120');
      await tester.testTextInput.receiveAction(TextInputAction.next);

      // add normal diastole value
      await tester.enterText(find.byKey(AppWidgetKeys.diastoleValueKey), '80');
      await tester.testTextInput.receiveAction(TextInputAction.next);
      await tester.pump(const Duration(milliseconds: 200));

      // tap the cancel button
      expect(find.byKey(AppWidgetKeys.silSecondaryButton), findsOneWidget);
      await tester.tap(find.byKey(AppWidgetKeys.silSecondaryButton));
      await tester.pumpAndSettle();

      // verify drawer closed
      // verify(mockObserver.didPush(any, any));
      expect(find.byType(AddBloodPressure), findsNothing);
    });

    testWidgets('should work correctly on large screen',
        (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = tabletLandscape;

      await buildDrawerTestWidget(tester, DrawerType.bloodPressure);

      // verify UI renders correctly
      expect(find.byType(SILPrimaryButton), findsOneWidget);

      // Open drawer
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pump();

      // verify drawer is open
      expect(find.text('Capture manually'), findsOneWidget);
      expect(find.text('Systole'), findsOneWidget);
      expect(find.text('Diastole'), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.systoleValueKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.diastoleValueKey), findsOneWidget);
      expect(find.text('mmHg'), findsNWidgets(3));
      expect(find.text('Sys'), findsOneWidget);
      expect(find.text('Dia'), findsOneWidget);
      expect(find.text('Blood pressure'), findsOneWidget);

      // add normal systole value
      await tester.enterText(find.byKey(AppWidgetKeys.systoleValueKey), '120');
      await tester.testTextInput.receiveAction(TextInputAction.next);

      // add normal diastole value
      await tester.enterText(find.byKey(AppWidgetKeys.diastoleValueKey), '80');
      await tester.testTextInput.receiveAction(TextInputAction.next);
      await tester.pump(const Duration(milliseconds: 200));

      // tap the save button
      expect(find.byKey(AppWidgetKeys.silSecondaryButton), findsOneWidget);
      await tester.tap(find.byKey(AppWidgetKeys.silSecondaryButton));
      await tester.pumpAndSettle();

      // verify drawer closed
      // verify(mockObserver.didPush(any, any));
      expect(find.byType(AddBloodPressure), findsNothing);

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });

    testWidgets('should show validation error when wrong values are added',
        (WidgetTester tester) async {
      await buildDrawerTestWidget(tester, DrawerType.bloodPressure);

      // verify UI renders correctly
      expect(find.byType(SILPrimaryButton), findsOneWidget);

      // Open drawer
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pump();

      // verify drawer is open
      expect(find.text(addBloodPressureTitle), findsOneWidget);
      expect(find.byType(Form), findsOneWidget);
      expect(find.text('Capture manually'), findsOneWidget);
      expect(find.text('Systole'), findsOneWidget);
      expect(find.text('Diastole'), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.systoleValueKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.diastoleValueKey), findsOneWidget);
      expect(find.text('BP'), findsOneWidget);
      expect(find.text('mmHg'), findsWidgets);
      expect(find.text('Sys'), findsOneWidget);
      expect(find.text('Dia'), findsOneWidget);

      // add normal systole value
      await tester.enterText(find.byKey(AppWidgetKeys.systoleValueKey), '370');
      await tester.testTextInput.receiveAction(TextInputAction.next);

      // add normal diastole value
      await tester.enterText(find.byKey(AppWidgetKeys.diastoleValueKey), '210');
      await tester.testTextInput.receiveAction(TextInputAction.next);
      await tester.pump(const Duration(milliseconds: 200));

      // tap the save button
      expect(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey),
          findsOneWidget);
      await tester
          .tap(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey));
      await tester.pumpAndSettle();

      // verify that validation error is shown
      expect(find.text('HIGH'), findsOneWidget);
      expect(find.text('Diastolic pressure is too high'), findsOneWidget);
      expect(find.text('Systolic pressure is too high'), findsOneWidget);
    });
  });
}
