// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_ui_components/buttons.dart';

// Project imports:
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawer_header.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawers/add_pulse_reading_drawer.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawers/drawer_utils/vital_legend_column.dart';
import '../../../../../../mocks/mocks.dart';
import '../../../../../../mocks/test_helpers.dart';

void main() {
  group('AddPulseReading drawer', () {
    setUpAll(() {
      startMockVisitAndExam();
    });

    testWidgets('should save & render correctly in smallScreen',
        (WidgetTester tester) async {
      await buildDrawerTestWidget(tester, DrawerType.pulse);

      // check that the ui is rendered properly
      expect(find.byType(SILPrimaryButton), findsOneWidget);

      // open the drawer
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();

      // verify that the drawer exists
      expect(find.byType(AddPulseReading), findsOneWidget);
      expect(find.byType(SILDrawerHeader), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey),
          findsOneWidget);
      expect(find.text('Add Pulse Reading'), findsOneWidget);
      expect(find.text('Capture manually'), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.pulseValueKey), findsOneWidget);

      // add normal bmp value
      await tester.tap(find.byKey(AppWidgetKeys.pulseValueKey));
      await tester.enterText(find.byKey(AppWidgetKeys.pulseValueKey), '85');
      await tester.pump(const Duration(milliseconds: 200));

      // verify legend exists
      expect(find.text('NORMAL'), findsOneWidget);
      expect(find.byType(VitalLegendColumn), findsOneWidget);

      // tap the save button
      await tester
          .tap(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey));
      await tester.pumpAndSettle();

      // verify that the pulse object is populated
      expect(AddPulseObject().patientRef.value, testPatientReference);
      expect(AddPulseObject().patientName.value, testPatientName);
      expect(AddPulseObject().encounterRef.value, testEncounterReference);

      // verify that the drawer was closed
      // verify(mockObserver.didPop(any, any));
      expect(find.byType(AddPulseReading), findsNothing);

      // verify that the exam change object was modified
      expect(ExamChangeObject().onAddVitalListener.value, true);

      // verify that a success message was shown
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Pulse reading added'), findsOneWidget);
    });

    testWidgets('cancel btn should close the drawer without saving',
        (WidgetTester tester) async {
      await buildDrawerTestWidget(tester, DrawerType.pulse);

      // check that the ui is rendered properly
      expect(find.byType(SILPrimaryButton), findsOneWidget);

      // open the drawer
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pump();

      // verify that the drawer exists
      expect(find.byType(AddPulseReading), findsOneWidget);
      expect(find.byType(SILDrawerHeader), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey),
          findsOneWidget);
      expect(find.text('Add Pulse Reading'), findsOneWidget);
      expect(find.text('Capture manually'), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.pulseValueKey), findsOneWidget);

      // enter normal bmp value
      await tester.tap(find.byKey(AppWidgetKeys.pulseValueKey));
      await tester.enterText(find.byKey(AppWidgetKeys.pulseValueKey), '70');
      await tester.pump(const Duration(milliseconds: 200));

      // verify legend exists
      expect(find.text('NORMAL'), findsOneWidget);
      expect(find.byType(VitalLegendColumn), findsOneWidget);

      // find & tap cancel button
      expect(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey),
          findsOneWidget);
      await tester.tap(find.byKey(AppWidgetKeys.silSecondaryButton));
      await tester.pumpAndSettle();

      // verify drawer was closed
      // verify(mockObserver.didPush(any, any));
      expect(find.byType(AddPulseReading), findsNothing);
    });

    testWidgets('should save & render correctly in largeScreen',
        (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = tabletLandscape;

      await buildDrawerTestWidget(tester, DrawerType.pulse);

      // check that the ui is rendered properly
      expect(find.byType(SILPrimaryButton), findsOneWidget);

      // open the drawer
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pump();

      // verify that the drawer exists
      expect(find.byType(AddPulseReading), findsOneWidget);
      expect(find.byType(SILDrawerHeader), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey),
          findsOneWidget);
      expect(find.text('Add Pulse Reading'), findsOneWidget);
      expect(find.text('Capture manually'), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.pulseValueKey), findsOneWidget);

      // add normal bmp value
      await tester.tap(find.byKey(AppWidgetKeys.pulseValueKey));
      await tester.enterText(find.byKey(AppWidgetKeys.pulseValueKey), '85');
      await tester.pump(const Duration(milliseconds: 200));

      // verify legend exists
      expect(find.text('NORMAL'), findsOneWidget);
      expect(find.byType(VitalLegendColumn), findsOneWidget);

      // tap the save button
      await tester
          .tap(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey));
      await tester.pumpAndSettle();

      // verify that the pulse object is populated
      expect(AddPulseObject().patientRef.value, testPatientReference);
      expect(AddPulseObject().patientName.value, testPatientName);
      expect(AddPulseObject().encounterRef.value, testEncounterReference);

      // verify that the drawer was closed
      // verify(mockObserver.didPop(any, any));
      expect(find.byType(AddPulseReading), findsNothing);

      // verify that the exam change object was modified
      expect(ExamChangeObject().onAddVitalListener.value, true);

      // verify that a success message was shown
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Pulse reading added'), findsOneWidget);

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });

    testWidgets(
        'should show a validation error when invalid pulse value is entered',
        (WidgetTester tester) async {
      await buildDrawerTestWidget(tester, DrawerType.pulse);

      // check that the ui is rendered properly
      expect(find.byType(SILPrimaryButton), findsOneWidget);

      // open the drawer
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pump();

      // verify that the drawer exists
      expect(find.byType(AddPulseReading), findsOneWidget);
      expect(find.byType(SILDrawerHeader), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey),
          findsOneWidget);
      expect(find.text('Add Pulse Reading'), findsOneWidget);
      expect(find.text('Capture manually'), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.pulseValueKey), findsOneWidget);

      // add a high bmp value
      await tester.tap(find.byKey(AppWidgetKeys.pulseValueKey));
      await tester.enterText(find.byKey(AppWidgetKeys.pulseValueKey), '150');
      await tester.pump(const Duration(milliseconds: 200));

      // verify legend exists
      expect(find.byType(VitalLegendColumn), findsOneWidget);
      expect(find.text('HIGH'), findsOneWidget);

      // tap the save button
      await tester
          .tap(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey));
      await tester.pumpAndSettle();

      // verify validation error is thrown
      expect(find.text('Pulse rate is too high'), findsOneWidget);
    });
  });
}
