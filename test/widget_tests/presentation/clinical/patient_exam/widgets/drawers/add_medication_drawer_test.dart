// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:sghi_core/ui_components/src/buttons.dart';

// Project imports:
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/medications/medication_search_result_container.dart';
import '../../../../../../mocks/mocks.dart';
import '../../../../../../mocks/test_helpers.dart';

void main() {
  setUpAll(() {
    startMockVisitAndExam();
  });

  group('Add Medication drawer', () {
    testWidgets('renders & saves correctly.', (WidgetTester tester) async {
      await buildDrawerTestWidget(tester, DrawerType.medication);

      // verify UI renders correctly
      expect(find.byType(SILPrimaryButton), findsOneWidget);

      // Tap btn to open drawer
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();

      // verify drawer is open
      expect(find.text(addMedicationTitle), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.addMedicationSearchInputKey),
          findsOneWidget);

      // enter medication
      await tester.tap(find.byKey(AppWidgetKeys.addMedicationSearchInputKey));
      await tester.enterText(
          find.byKey(AppWidgetKeys.addMedicationSearchInputKey), 'paracetamol');
      await tester.pump();

      // verify suggestion dropdown is displayed
      expect(find.text('Paracetamol syrup'), findsOneWidget);
      expect(find.byKey(const Key('466')), findsOneWidget);

      // select problem item
      await tester.tap(find.byKey(const Key('466')));
      await tester.pumpAndSettle();

      // confirm AddMedicationForm is displayed
      expect(find.byKey(AppWidgetKeys.silSecondaryButton), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey),
          findsOneWidget);
      expect(find.text('Selected Medication'), findsOneWidget);
      expect(find.text('Prescription'), findsOneWidget);

      expect(find.byKey(AppWidgetKeys.rxKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.takeEveryKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.periodKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.noteKey), findsOneWidget);

      // enter rx value
      await tester.tap(find.byKey(AppWidgetKeys.rxKey));
      await tester.enterText(find.byKey(AppWidgetKeys.rxKey), '20');
      await tester.pumpAndSettle();

      // enter takeEveryKey value
      await tester.tap(find.byKey(AppWidgetKeys.takeEveryKey));
      await tester.enterText(find.byKey(AppWidgetKeys.takeEveryKey), '8');
      await tester.pumpAndSettle();

      // enter periodKey value
      await tester.tap(find.byKey(AppWidgetKeys.periodKey));
      await tester.enterText(find.byKey(AppWidgetKeys.periodKey), '4');
      await tester.pumpAndSettle();

      // enter notes
      await tester.tap(find.byKey(AppWidgetKeys.noteKey));
      await tester.enterText(find.byKey(AppWidgetKeys.noteKey), 'doctors note');
      await tester.pumpAndSettle();

      // tap save button
      await tester
          .tap(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey));
      await tester.pumpAndSettle();

      // verify drawer closed
      // verify(mockObserver.didPush(any, any));
    });

    testWidgets('search input close button works correctly',
        (WidgetTester tester) async {
      await buildDrawerTestWidget(tester, DrawerType.medication);

      // verify UI renders correctly
      expect(find.byType(SILPrimaryButton), findsOneWidget);

      // Tap btn to open drawer
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();

      // find the search bar and enter some text
      expect(find.byKey(AppWidgetKeys.addMedicationSearchInputKey),
          findsOneWidget);
      await tester.enterText(
          find.byKey(AppWidgetKeys.addMedicationSearchInputKey), 'Amoxicillin');
      await tester.pump();

      // find close icon button and press it
      expect(find.byKey(AppWidgetKeys.suffixCloseIconKey), findsOneWidget);
      await tester.tap(find.byKey(AppWidgetKeys.suffixCloseIconKey));

      expect(find.byType(MedicationSearchResults), findsOneWidget);
    });

    testWidgets('Cancel medication works correctly',
        (WidgetTester tester) async {
      await buildDrawerTestWidget(tester, DrawerType.medication);

      expect(find.byType(SILPrimaryButton), findsOneWidget);

      // Tap btn to open drawer
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();

      // verify drawer is open
      expect(find.text(addMedicationTitle), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.addMedicationSearchInputKey),
          findsOneWidget);

      // enter medication
      await tester.tap(find.byKey(AppWidgetKeys.addMedicationSearchInputKey));
      await tester.enterText(
          find.byKey(AppWidgetKeys.addMedicationSearchInputKey), 'paracetamol');
      await tester.pump();

      // verify suggestion dropdown is displayed
      expect(find.text('Paracetamol syrup'), findsOneWidget);
      expect(find.byKey(const Key('466')), findsOneWidget);

      // select problem item
      await tester.tap(find.byKey(const Key('466')));
      await tester.pumpAndSettle();
      expect(find.text('Selected Medication'), findsOneWidget);
      expect(
          find.byKey(AppWidgetKeys.addMedicationCancelBtnKey), findsOneWidget);
      await tester.tap(find.byKey(AppWidgetKeys.addMedicationCancelBtnKey));
      await tester.pump();

      expect(find.byType(MedicationSearchResults), findsOneWidget);
    });
  });
}
