// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_ui_components/buttons.dart';

// Project imports:
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawers/add_oxygen_saturation_drawer.dart';
import '../../../../../../mocks/mocks.dart';
import '../../../../../../mocks/test_helpers.dart';

void main() {
  group('AddOxygenSaturation drawer', () {
    setUpAll(() {
      startMockVisitAndExam();
    });

    testWidgets('saves oxygenValue correctly in smallScreen',
        (WidgetTester tester) async {
      await buildDrawerTestWidget(tester, DrawerType.bloodOxygen);

      await tester.pump();

      // verify UI renders correctly
      expect(find.byType(SILPrimaryButton), findsOneWidget);

      // Open drawer
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();

      // verify drawer is open
      expect(find.text(addOxygenTitle), findsOneWidget);
      expect(find.byType(Form), findsOneWidget);
      expect(find.text('Capture manually'), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.oxygenSPO2ValueKey), findsOneWidget);

      // enter normal SP02 value
      await tester.tap(find.byKey(AppWidgetKeys.oxygenSPO2ValueKey));
      await tester.enterText(
          find.byKey(AppWidgetKeys.oxygenSPO2ValueKey), '60');
      await tester.testTextInput.receiveAction(TextInputAction.next);
      await tester.pumpAndSettle();

      // tap save button
      expect(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey),
          findsOneWidget);
      await tester
          .tap(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey));
      await tester.pumpAndSettle();

      // verify that the addOxygenSaturationObject is populated
      expect(
          AddOxygenSaturationObject().patientRef.value, testPatientReference);
      expect(AddOxygenSaturationObject().patientName.value, testPatientName);
      expect(AddOxygenSaturationObject().encounterRef.value,
          testEncounterReference);

      // verify that the drawer was closed
      // verify(mockObserver.didPush(any, any));
      expect(find.byType(AddOxygenSaturationObject), findsNothing);

      // verify that the exam change object was modified
      expect(ExamChangeObject().onAddVitalListener.value, true);

      // verify that a success message was shown
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text(addOxygenSuccessMsg), findsOneWidget);
    });

    testWidgets('should close drawer when cancel button is tapped',
        (WidgetTester tester) async {
      await buildDrawerTestWidget(tester, DrawerType.bloodOxygen);

      await tester.pump();

      // verify UI renders correctly
      expect(find.byType(SILPrimaryButton), findsOneWidget);

      // Open drawer
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();

      // verify drawer is open
      expect(find.text(addOxygenTitle), findsOneWidget);
      expect(find.byType(Form), findsOneWidget);
      expect(find.text('Capture manually'), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.oxygenSPO2ValueKey), findsOneWidget);

      // enter normal SP02 value
      await tester.tap(find.byKey(AppWidgetKeys.oxygenSPO2ValueKey));
      await tester.enterText(
          find.byKey(AppWidgetKeys.oxygenSPO2ValueKey), '60');
      await tester.testTextInput.receiveAction(TextInputAction.next);
      await tester.pumpAndSettle();

      // tap cancel button
      expect(find.byKey(AppWidgetKeys.silSecondaryButton), findsOneWidget);
      await tester.tap(find.byKey(AppWidgetKeys.silSecondaryButton));
      await tester.pumpAndSettle();

      // verify drawer closed
      // verify(mockObserver.didPush(any, any));
      expect(find.byType(AddOxygenSaturation), findsNothing);
    });

    testWidgets('saves correctly in largeScreen', (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = const Size(1280, 720);

      await buildDrawerTestWidget(tester, DrawerType.bloodOxygen);

      await tester.pump();

      // verify UI renders correctly
      expect(find.byType(SILPrimaryButton), findsOneWidget);

      // Open drawer
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();

      // verify drawer is open
      expect(find.text(addOxygenTitle), findsOneWidget);
      expect(find.byType(Form), findsOneWidget);
      expect(find.text('Capture manually'), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.oxygenSPO2ValueKey), findsOneWidget);

      // enter normal SP02 value
      await tester.tap(find.byKey(AppWidgetKeys.oxygenSPO2ValueKey));
      await tester.enterText(
          find.byKey(AppWidgetKeys.oxygenSPO2ValueKey), '60');
      await tester.testTextInput.receiveAction(TextInputAction.next);
      await tester.pumpAndSettle();

      // tap save button
      expect(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey),
          findsOneWidget);
      await tester
          .tap(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey));
      await tester.pumpAndSettle();

      // verify that the addOxygenSaturationObject object is populated
      expect(
          AddOxygenSaturationObject().patientRef.value, testPatientReference);
      expect(AddOxygenSaturationObject().patientName.value, testPatientName);
      expect(AddOxygenSaturationObject().encounterRef.value,
          testEncounterReference);

      // verify that the drawer was closed
      // verify(mockObserver.didPush(any, any));
      expect(find.byType(AddOxygenSaturationObject), findsNothing);

      // verify that the exam change object was modified
      expect(ExamChangeObject().onAddVitalListener.value, true);

      // verify that a success message was shown
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text(addOxygenSuccessMsg), findsOneWidget);

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });

    testWidgets('throws validation error when invalid values are entered',
        (WidgetTester tester) async {
      await buildDrawerTestWidget(tester, DrawerType.bloodOxygen);

      // verify UI renders correctly
      expect(find.byType(SILPrimaryButton), findsOneWidget);

      // Open drawer
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();

      // verify drawer is open
      expect(find.text(addOxygenTitle), findsOneWidget);
      expect(find.byType(Form), findsOneWidget);
      expect(find.text('Capture manually'), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.oxygenSPO2ValueKey), findsOneWidget);

      // enter high SP02 value
      await tester.tap(find.byKey(AppWidgetKeys.oxygenSPO2ValueKey));
      await tester.enterText(
          find.byKey(AppWidgetKeys.oxygenSPO2ValueKey), '120');
      await tester.testTextInput.receiveAction(TextInputAction.next);
      await tester.pumpAndSettle();

      // tap save button
      expect(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey),
          findsOneWidget);
      await tester
          .tap(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey));
      await tester.pumpAndSettle();

      // verify throws validation error
      expect(find.text('HIGH'), findsOneWidget);
      expect(find.text('SPO2 cannot be more than 100'), findsOneWidget);
    });
  });
}
