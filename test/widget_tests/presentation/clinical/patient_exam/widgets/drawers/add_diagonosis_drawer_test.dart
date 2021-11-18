// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:shared_ui_components/buttons.dart';

// Project imports:
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/diagnosis/add_diagnosis_drawer.dart';
import '../../../../../../mocks/mocks.dart';
import '../../../../../../mocks/test_helpers.dart';

void main() {
  group('Add Diagnosis', () {
    setUpAll(() {
      startMockVisitAndExam();
    });

    const String diagnosisName = 'Malaria, confirmed';
    const String date = '01 Jan 2021';
    final DateTime dateTime = DateFormat('d MMM yyyy').parse('01 Jan 2021');
    final String recordedDate = dateTime.toIso8601String().split('T')[0];

    final SidePaneDiagnosisStore sidePaneDiagnosisStore =
        SidePaneDiagnosisStore();

    testWidgets('renders & saves correctly', (WidgetTester tester) async {
      await buildDrawerTestWidget(tester, DrawerType.diagnosis);

      // Tap btn to open drawer
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pump();

      // verify drawer is open
      expect(find.text(diagnosisDrawerTitle), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.diagnosisInputKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.diagnosisDatePickerKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.silSecondaryButton), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey),
          findsOneWidget);

      // enter diagnosis
      await tester.tap(find.byKey(AppWidgetKeys.diagnosisInputKey));
      await tester.enterText(
          find.byKey(AppWidgetKeys.diagnosisInputKey), 'Malaria');
      await tester.pump(const Duration(milliseconds: 200));

      // confirm diagnosis suggestions are displayed
      expect(find.text(diagnosisName), findsOneWidget);
      expect(find.byKey(const Key('160148')), findsOneWidget);

      // select diagnosis item
      await tester.tap(find.byKey(const Key('160148')));
      await tester.pump();

      // uncheck confirmed checkbox
      await tester.tap(find.byKey(AppWidgetKeys.diagnosisConfirmCheckbox));
      await tester.pump();

      // re-check confirmed checkbox
      await tester.tap(find.byKey(AppWidgetKeys.diagnosisConfirmCheckbox));
      await tester.pump();

      await tester.enterText(
          find.byKey(AppWidgetKeys.diagnosisDatePickerKey), date);
      await tester.pumpAndSettle();

      // tap save button
      await tester
          .tap(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey));
      await tester.pumpAndSettle();

      // verify save callback is called
      expect(sidePaneDiagnosisStore.diagnosisName.value, diagnosisName);
      expect(sidePaneDiagnosisStore.recorderDate.value, recordedDate);

      // verify success snackbar is displayed
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text(diagnosisAddedSuccessMsg), findsOneWidget);

      // verify drawer closed
      expect(find.byType(AddDiagnosis), findsNothing);
    });

    testWidgets('cancel btn pops without saving values',
        (WidgetTester tester) async {
      await buildDrawerTestWidget(tester, DrawerType.diagnosis);

      // Tap btn to open drawer
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pump();

      // verify drawer is open
      expect(find.text(diagnosisDrawerTitle), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.diagnosisInputKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.diagnosisDatePickerKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.silSecondaryButton), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey),
          findsOneWidget);

      // enter diagnosis
      await tester.tap(find.byKey(AppWidgetKeys.diagnosisInputKey));
      await tester.enterText(
          find.byKey(AppWidgetKeys.diagnosisInputKey), 'Malaria');
      await tester.pump(const Duration(milliseconds: 200));

      // confirm diagnosis suggestions are displayed
      expect(find.text(diagnosisName), findsOneWidget);
      expect(find.byKey(const Key('160148')), findsOneWidget);

      // select diagnosis item
      await tester.tap(find.byKey(const Key('160148')));
      await tester.pump();

      // tap cancel button
      await tester.tap(find.byKey(AppWidgetKeys.silSecondaryButton));
      await tester.pumpAndSettle();

      // verify success snackbar is not displayed
      expect(find.byType(SnackBar), findsNothing);
      expect(find.text('Allergy added'), findsNothing);

      // verify drawer is closed
      expect(find.byType(AddDiagnosis), findsNothing);
    });

    testWidgets('saves an unconfirmed diagnosis', (WidgetTester tester) async {
      await buildDrawerTestWidget(tester, DrawerType.diagnosis);

      // Tap btn to open drawer
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pump();

      // verify drawer is open
      expect(find.text(diagnosisDrawerTitle), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.diagnosisInputKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.diagnosisDatePickerKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.silSecondaryButton), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey),
          findsOneWidget);

      // enter diagnosis
      await tester.tap(find.byKey(AppWidgetKeys.diagnosisInputKey));
      await tester.enterText(
          find.byKey(AppWidgetKeys.diagnosisInputKey), 'Malaria');
      await tester.pump(const Duration(milliseconds: 200));

      // confirm diagnosis suggestions are displayed
      expect(find.text(diagnosisName), findsOneWidget);
      expect(find.byKey(const Key('160148')), findsOneWidget);

      // select diagnosis item
      await tester.tap(find.byKey(const Key('160148')));
      await tester.pump();

      // uncheck confirmed checkbox
      await tester.tap(find.byKey(AppWidgetKeys.diagnosisConfirmCheckbox));
      await tester.pump();

      // tap save button
      await tester
          .tap(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey));
      await tester.pumpAndSettle();

      // verify save callback is called
      expect(
          sidePaneDiagnosisStore.diagnosisName.value.toString(), diagnosisName);

      // verify success snackbar is displayed
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text(diagnosisAddedSuccessMsg), findsOneWidget);

      // verify drawer closed
      expect(find.byType(AddDiagnosis), findsNothing);
    });

    testWidgets('diagnosis search input suffix icon cancels',
        (WidgetTester tester) async {
      await buildDrawerTestWidget(tester, DrawerType.diagnosis);

      // Tap btn to open drawer
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pump();

      // verify drawer is open
      expect(find.text(diagnosisDrawerTitle), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.diagnosisInputKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.diagnosisDatePickerKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.silSecondaryButton), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey),
          findsOneWidget);

      // enter diagnosis
      await tester.tap(find.byKey(AppWidgetKeys.diagnosisInputKey));
      await tester.enterText(
          find.byKey(AppWidgetKeys.diagnosisInputKey), 'Malaria');
      await tester.pump(const Duration(milliseconds: 200));

      // tap suffix icon (cancel) on drawerSearchInput
      expect(find.byIcon(Icons.close), findsWidgets);
      await tester.tap(find.byIcon(Icons.close).last);

      // tap save button
      await tester
          .tap(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey));
      await tester.pumpAndSettle();

      // verify success snackbar is not displayed
      expect(find.byType(SnackBar), findsNothing);

      // verify drawer closed
      expect(find.byType(AddDiagnosis), findsOneWidget);
      // verifyNever(mockObserver.didPop(any, any));
    });

    testWidgets('verify cancel selected diagnosis works',
        (WidgetTester tester) async {
      await buildDrawerTestWidget(tester, DrawerType.diagnosis);

      // Tap btn to open drawer
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pump();

      // verify drawer is open
      expect(find.text(diagnosisDrawerTitle), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.diagnosisInputKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.diagnosisDatePickerKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.silSecondaryButton), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey),
          findsOneWidget);

      // enter diagnosis
      await tester.tap(find.byKey(AppWidgetKeys.diagnosisInputKey));
      await tester.enterText(
          find.byKey(AppWidgetKeys.diagnosisInputKey), 'Malaria');
      await tester.pump(const Duration(milliseconds: 200));

      // confirm diagnosis suggestions are displayed
      expect(find.text(diagnosisName), findsOneWidget);
      expect(find.byKey(const Key('160148')), findsOneWidget);

      // select diagnosis item
      await tester.tap(find.byKey(const Key('160148')));
      await tester.pump();

      // tap cancel btn to unselect a condition/problem
      expect(find.text('Cancel'), findsWidgets);
      await tester.tap(find.text('Cancel').first);

      // tap save button
      await tester
          .tap(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey));
      await tester.pumpAndSettle();

      // verify success snackbar is not displayed
      expect(find.byType(SnackBar), findsOneWidget);

      // verify drawer closed
      expect(find.byType(AddDiagnosis), findsNothing);
    });
  });
}
