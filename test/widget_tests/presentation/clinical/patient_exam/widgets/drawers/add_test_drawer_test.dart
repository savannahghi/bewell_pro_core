// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sghi_core/ui_components/src/buttons.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawer_common_widgets/drawer_search_results.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawer_common_widgets/drawer_selected_item.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/treatment_plan/add_test_drawer.dart';
import '../../../../../../mocks/mocks.dart';
import '../../../../../../mocks/test_helpers.dart';

void main() {
  group('AddTest', () {
    setUpAll(() {
      startMockVisitAndExam();
    });

    const String testName = 'CXR';
    const String testID = '645';

    testWidgets('renders & saves correctly', (WidgetTester tester) async {
      await buildDrawerTestWidget(tester, DrawerType.test);

      // verify UI renders correctly
      expect(find.byType(SILPrimaryButton), findsOneWidget);

      // Tap btn to open drawer
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pump();

      // verify drawer is open
      expect(find.text(addTestsTitle), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.addTestsSearchInputKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.silSecondaryButton), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey),
          findsOneWidget);
      expect(find.byKey(AppWidgetKeys.addTestsNotesKey), findsOneWidget);

      // enter a test
      await tester.tap(find.byKey(AppWidgetKeys.addTestsSearchInputKey));
      await tester.enterText(
          find.byKey(AppWidgetKeys.addTestsSearchInputKey), testName);
      await tester.pump();

      // confirm tests suggestions are displayed
      expect(find.text(testName), findsOneWidget);
      expect(find.byKey(const Key(testID)), findsOneWidget);

      // select test item
      await tester.tap(find.byKey(const Key(testID)));
      await tester.pump();

      // enter notes
      await tester.tap(find.byKey(AppWidgetKeys.addTestsNotesKey));
      await tester.enterText(
          find.byKey(AppWidgetKeys.addTestsNotesKey), 'text');
      await tester.pump();

      expect(find.text('text'), findsOneWidget);

      // tap save button
      expect(find.byType(RawMaterialButton), findsWidgets);
      final RawMaterialButton saveButton = find
          .widgetWithText(RawMaterialButton, saveText)
          .evaluate()
          .first
          .widget as RawMaterialButton;
      saveButton.onPressed!();
      await tester.pumpAndSettle();
    });

    testWidgets('cancel btn pops without saving values',
        (WidgetTester tester) async {
      await buildDrawerTestWidget(tester, DrawerType.test);

      // verify UI renders correctly
      expect(find.byType(SILPrimaryButton), findsOneWidget);

      // Tap btn to open drawer
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pump();

      // verify drawer is open
      expect(find.text(addTestsTitle), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.addTestsSearchInputKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.silSecondaryButton), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey),
          findsOneWidget);

      // enter a test
      await tester.tap(find.byKey(AppWidgetKeys.addTestsSearchInputKey));
      await tester.enterText(
          find.byKey(AppWidgetKeys.addTestsSearchInputKey), testName);
      await tester.pump();

      // confirm tests suggestions are displayed
      expect(find.text(testName), findsOneWidget);
      expect(find.byKey(const Key(testID)), findsOneWidget);

      // select test item
      await tester.tap(find.byKey(const Key(testID)));
      await tester.pump();

      // tap cancel button
      await tester.tap(find.byKey(AppWidgetKeys.silSecondaryButton));
      await tester.pump();

      // verify success snackbar is not displayed
      expect(find.byType(SnackBar), findsNothing);
      expect(find.text('Allergy added'), findsNothing);

      // verify drawer is closed
      // verify(mockObserver.didPush(any, any));
    });

    testWidgets('saves an unconfirmed diagnosis', (WidgetTester tester) async {
      await buildDrawerTestWidget(tester, DrawerType.test);

      // verify UI renders correctly
      expect(find.byType(SILPrimaryButton), findsOneWidget);

      // Tap btn to open drawer
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pump();

      // verify drawer is open
      expect(find.text(addTestsTitle), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.addTestsSearchInputKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.silSecondaryButton), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey),
          findsOneWidget);

      // enter a test
      await tester.tap(find.byKey(AppWidgetKeys.addTestsSearchInputKey));
      await tester.enterText(
          find.byKey(AppWidgetKeys.addTestsSearchInputKey), testName);
      await tester.pump();

      // confirm tests suggestions are displayed
      expect(find.text(testName), findsOneWidget);
      expect(find.byKey(const Key(testID)), findsOneWidget);

      // select test item
      await tester.tap(find.byKey(const Key(testID)));
      await tester.pump();

      // uncheck confirmed checkbox
      await tester.tap(find.byKey(AppWidgetKeys.testConfirmationCheckboxKey));
      await tester.pump();

      // tap save button
      await tester
          .tap(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey));
      await tester.pump();

      // verify drawer closed
      // verify(mockObserver.didPush(any, any));
    });

    testWidgets('test search input suffix icon cancels',
        (WidgetTester tester) async {
      await buildDrawerTestWidget(tester, DrawerType.test);

      // verify UI renders correctly
      expect(find.byType(SILPrimaryButton), findsOneWidget);

      // Tap btn to open drawer
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();

      // verify drawer is open
      expect(find.text(addTestsTitle), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.addTestsSearchInputKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.silSecondaryButton), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey),
          findsOneWidget);

      // enter a test
      await tester.tap(find.byKey(AppWidgetKeys.addTestsSearchInputKey));
      await tester.enterText(
          find.byKey(AppWidgetKeys.addTestsSearchInputKey), testName);
      await tester.pump();
      expect(find.text(testName), findsOneWidget);

      // confirm tests suggestions are displayed
      expect(find.text(testName), findsOneWidget);
      expect(find.byKey(const Key(testID)), findsOneWidget);

      // select test item
      await tester.tap(find.byKey(const Key(testID)));
      await tester.pumpAndSettle();

      // tap suffix icon (cancel) on drawerSearchInput
      expect(find.byIcon(Icons.close), findsWidgets);
      await tester.tap(find.byIcon(Icons.close).last);

      // tap save button
      await tester
          .tap(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey));
      await tester.pump();

      // verify drawer closed
      // verify(mockObserver.didPush(any, any));
    });

    testWidgets('verify cancel selected test item works',
        (WidgetTester tester) async {
      await buildDrawerTestWidget(tester, DrawerType.test);

      // verify UI renders correctly
      expect(find.byType(SILPrimaryButton), findsOneWidget);

      // Tap btn to open drawer
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pump();

      // verify drawer is open
      expect(find.text(addTestsTitle), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.addTestsSearchInputKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.silSecondaryButton), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey),
          findsOneWidget);

      // enter a test
      await tester.tap(find.byKey(AppWidgetKeys.addTestsSearchInputKey));
      await tester.enterText(
          find.byKey(AppWidgetKeys.addTestsSearchInputKey), testName);
      await tester.pump();

      // confirm tests suggestions are displayed
      expect(find.text(testName), findsOneWidget);
      expect(find.byKey(const Key(testID)), findsOneWidget);

      // select test item
      await tester.tap(find.byKey(const Key(testID)));
      await tester.pump();

      // tap cancel btn to unselect a testItem
      expect(find.text('Cancel'), findsWidgets);
      await tester.tap(find.text('Cancel').first);

      // tap save button
      await tester
          .tap(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey));
      await tester.pumpAndSettle();
    });

    testWidgets('should open and close drawer', (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = const Size(1280, 1280);

      final Store<CoreState> store =
          Store<CoreState>(initialState: CoreState.initial());

      await buildTestWidget(
        tester: tester,
        store: store,
        widget: const AddTestDrawer(),
      );

      /// Verify drawer is open
      expect(find.text(addTestsTitle), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.addTestsSearchInputKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.silSecondaryButton), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey),
          findsOneWidget);
      expect(find.byType(DrawerSelectedItem), findsNothing);
      expect(find.byType(DrawerSearchResults), findsOneWidget);

      /// Close drawer
      expect(find.text(silButtonCancel), findsOneWidget);
      await tester.tap(find.text(silButtonCancel));
      await tester.pumpAndSettle();

      // /// Verify drawer is closed
      expect(find.text(addTestsTitle), findsNothing);
      expect(find.byKey(AppWidgetKeys.addTestsSearchInputKey), findsNothing);
      expect(find.byKey(AppWidgetKeys.silSecondaryButton), findsNothing);
      expect(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey),
          findsNothing);
      expect(find.byType(DrawerSelectedItem), findsNothing);
      expect(find.byType(DrawerSearchResults), findsNothing);
      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });

    testWidgets('verify select and unselect and save works',
        (WidgetTester tester) async {
      final AddTestObject testData = AddTestObject();

      await buildDrawerTestWidget(tester, DrawerType.test);

      /// Verify ui is rendered & open drawer
      expect(find.byType(SILPrimaryButton), findsOneWidget);
      expect(find.text(drawerTestRootText), findsOneWidget);
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();

      /// Verify drawer is open
      expect(find.text(addTestsTitle), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.addTestsSearchInputKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.silSecondaryButton), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey),
          findsOneWidget);
      expect(find.byType(DrawerSelectedItem), findsNothing);
      expect(find.byType(DrawerSearchResults), findsOneWidget);

      /// Enter a test
      await tester.tap(find.byKey(AppWidgetKeys.addTestsSearchInputKey));
      await tester.enterText(
          find.byKey(AppWidgetKeys.addTestsSearchInputKey), 'malaria');
      await tester.pumpAndSettle();

      /// Confirm tests suggestions are displayed
      expect(find.text('malaria'), findsOneWidget);
      expect(find.text('Select'), findsWidgets);

      /// select test item
      await tester.tap(find.text('Select').first);
      await tester.pumpAndSettle();

      /// Tap cancel btn to unselect a testItem
      expect(find.text('Cancel'), findsNWidgets(2));
      await tester.tap(find.text('Cancel').first);
      await tester.pumpAndSettle();

      /// Clear search input
      expect(find.byKey(AppWidgetKeys.suffixCloseIconKey), findsOneWidget);
      await tester.tap(find.byKey(AppWidgetKeys.suffixCloseIconKey));
      await tester.pumpAndSettle();

      /// Enter a new test
      await tester.tap(find.byKey(AppWidgetKeys.addTestsSearchInputKey));
      await tester.enterText(
          find.byKey(AppWidgetKeys.addTestsSearchInputKey), 'malaria');
      await tester.pump(const Duration(seconds: 5));

      /// Confirm tests suggestions are displayed
      expect(find.text('malaria'), findsOneWidget);
      expect(find.text('Select'), findsWidgets);

      /// select test item
      await tester.tap(find.text('Select').first);
      await tester.pumpAndSettle();

      /// verify selection works
      expect(find.byType(DrawerSelectedItem), findsOneWidget);
      expect(find.byType(DrawerSearchResults), findsNothing);

      /// Check checkbox (makes it unconfirmed)
      expect(find.byKey(AppWidgetKeys.testConfirmationCheckboxKey),
          findsOneWidget);
      await tester.tap(find.byKey(AppWidgetKeys.testConfirmationCheckboxKey));
      await tester.pumpAndSettle();

      /// Check checkbox again (makes it confirmed)
      expect(find.byKey(AppWidgetKeys.testConfirmationCheckboxKey),
          findsOneWidget);
      await tester.tap(find.byKey(AppWidgetKeys.testConfirmationCheckboxKey));
      await tester.pumpAndSettle();

      /// Add notes
      expect(find.byKey(AppWidgetKeys.addTestsNotesKey), findsOneWidget);
      await tester.tap(find.byKey(AppWidgetKeys.addTestsNotesKey));
      await tester.enterText(
          find.byKey(AppWidgetKeys.addTestsNotesKey), 'sample note');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      /// Ensure saves
      expect(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey),
          findsOneWidget);
      testData.diagnosisID.add('event');
      testData.diagnosisName.add('event');
      await tester
          .tap(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey));
      await tester.pumpAndSettle();

      /// Verify drawer closed
      expect(find.text(drawerTestRootText), findsOneWidget);
      expect(find.text(addTestsTitle), findsNothing);
      expect(find.byKey(AppWidgetKeys.addTestsSearchInputKey), findsNothing);
      expect(find.byKey(AppWidgetKeys.silSecondaryButton), findsNothing);
      expect(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey),
          findsNothing);
      expect(find.byType(DrawerSelectedItem), findsNothing);
      expect(find.byType(DrawerSearchResults), findsNothing);
    });
  });
}
