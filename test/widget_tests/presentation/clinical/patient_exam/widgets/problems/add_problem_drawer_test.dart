// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:sghi_core/shared_themes/constants.dart';
import 'package:sghi_core/ui_components/src/buttons.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/problems/add_problem_drawer.dart';
import '../../../../../../mocks/mocks.dart';
import '../../../../../../mocks/test_helpers.dart';

void main() {
  group('AddProblem drawer', () {
    final Store<CoreState> store =
        Store<CoreState>(initialState: CoreState.initial());

    const String problemConfirmed = 'Active';
    const String problemUnConfirmed = 'unconfirmed';
    const String selectedCondition = 'primary exertional headache';
    const String problemNotes = 'Protein';

    final SidePaneProblemStore sidePaneProblemStore = SidePaneProblemStore();
    setUpAll(() {
      startMockVisitAndExam();
    });

    testWidgets('saves a problem, notifies the user and closes the drawer.',
        (WidgetTester tester) async {
      await buildDrawerTestWidget(tester, DrawerType.problem, store: store);

      expect(
          store.state.userState!.userProfile!.userBioData?.firstName!
              .getValue(),
          'Bewell');

      // verify UI renders correctly
      expect(find.byType(SILPrimaryButton), findsOneWidget);

      // Tap btn to open drawer
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pump();

      // verify drawer is open
      expect(find.text(addProblemDrawerTitle), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.addProblemDrawerSearchInputKey),
          findsOneWidget);
      expect(
          find.byKey(AppWidgetKeys.problemDescriptionInputKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.silSecondaryButton), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey),
          findsOneWidget);

      // enter condition
      await tester
          .tap(find.byKey(AppWidgetKeys.addProblemDrawerSearchInputKey));
      await tester.enterText(
          find.byKey(AppWidgetKeys.addProblemDrawerSearchInputKey), 'headache');
      await tester.pump(const Duration(milliseconds: 200));

      // verify suggestion dropdown is displayed
      expect(find.text('Primary exertional headache'), findsOneWidget);
      expect(find.byKey(const Key('158522')), findsOneWidget);

      // select problem item
      await tester.tap(find.byKey(const Key('158522')));
      await tester.pump();

      // enter notes
      await tester.tap(find.byKey(AppWidgetKeys.problemDescriptionInputKey));
      await tester.enterText(
          find.byKey(AppWidgetKeys.problemDescriptionInputKey), problemNotes);
      await tester.pump();

      // tap save button
      await tester
          .tap(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey));
      await tester.pumpAndSettle();

      // verify save callback is called
      expect(sidePaneProblemStore.problemConfirmationStatus.value,
          problemConfirmed);
      expect(
          sidePaneProblemStore.problemName.value.toString(), selectedCondition);
      expect(sidePaneProblemStore.problemNotes.value.toString(), problemNotes);

      expect(ExamChangeObject().onAddProblemListener.value, true);

      // verify success snackbar is displayed
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Condition added successfully'), findsOneWidget);

      // verify drawer closed
      expect(find.byType(AddProblem), findsNothing);
    });

    testWidgets('saves a condition, notifies the user and closes the drawer.',
        (WidgetTester tester) async {
      await buildDrawerTestWidget(tester, DrawerType.condition, store: store);

      expect(
          store.state.userState!.userProfile!.userBioData?.firstName!
              .getValue(),
          'Bewell');

      // verify UI renders correctly
      expect(find.byType(SILPrimaryButton), findsOneWidget);

      // Tap btn to open drawer
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pump();

      // verify drawer is open
      expect(find.text(addProblemDrawerTitle), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.addProblemDrawerSearchInputKey),
          findsOneWidget);
      expect(
          find.byKey(AppWidgetKeys.problemDescriptionInputKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.silSecondaryButton), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey),
          findsOneWidget);

      // enter condition
      await tester
          .tap(find.byKey(AppWidgetKeys.addProblemDrawerSearchInputKey));
      await tester.enterText(
          find.byKey(AppWidgetKeys.addProblemDrawerSearchInputKey), 'headache');
      await tester.pump(const Duration(milliseconds: 200));

      // verify suggestion dropdown is displayed
      expect(find.text('Primary exertional headache'), findsOneWidget);
      expect(find.byKey(const Key('158522')), findsOneWidget);

      // select problem item
      await tester.tap(find.byKey(const Key('158522')));
      await tester.pump();

      // enter notes
      await tester.tap(find.byKey(AppWidgetKeys.problemDescriptionInputKey));
      await tester.enterText(
          find.byKey(AppWidgetKeys.problemDescriptionInputKey), problemNotes);
      await tester.pump();

      // tap save button
      await tester
          .tap(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey));
      await tester.pumpAndSettle();

      // verify save callback is called
      expect(sidePaneProblemStore.problemConfirmationStatus.value,
          problemConfirmed);
      expect(
          sidePaneProblemStore.problemName.value.toString(), selectedCondition);
      expect(sidePaneProblemStore.problemNotes.value.toString(), problemNotes);

      expect(ExamChangeObject().onAddPatientHistoryListener.value, true);

      // verify success snackbar is displayed
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Chief complaint added successfully'), findsOneWidget);

      // verify drawer closed
      expect(find.byType(AddProblem), findsNothing);
    });

    testWidgets('alerts the user when there is a problem adding a a condition',
        (WidgetTester tester) async {
      final MockShortGraphQlClient graphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{
                'listConcepts': <dynamic>[
                  <String, dynamic>{
                    'concept_class': 'Diagnosis',
                    'datatype': 'N/A',
                    'id': '158522',
                    'descriptions': null,
                    'display_name': 'primary exertional headache',
                  },
                ],
                'createFHIRCondition': null,
              }
            }),
            200),
      );

      await buildDrawerTestWidget(
        tester,
        DrawerType.condition,
        store: store,
        graphQlClient: graphQlClient,
      );

      expect(
          store.state.userState!.userProfile!.userBioData?.firstName!
              .getValue(),
          'Bewell');

      // verify UI renders correctly
      expect(find.byType(SILPrimaryButton), findsOneWidget);

      // Tap btn to open drawer
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pump();

      // verify drawer is open
      expect(find.text(addProblemDrawerTitle), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.addProblemDrawerSearchInputKey),
          findsOneWidget);
      expect(
          find.byKey(AppWidgetKeys.problemDescriptionInputKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.silSecondaryButton), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey),
          findsOneWidget);

      // enter condition
      await tester
          .tap(find.byKey(AppWidgetKeys.addProblemDrawerSearchInputKey));
      await tester.enterText(
          find.byKey(AppWidgetKeys.addProblemDrawerSearchInputKey), 'headache');
      await tester.pump(const Duration(milliseconds: 200));

      // verify suggestion dropdown is displayed
      expect(find.text('Primary exertional headache'), findsOneWidget);
      expect(find.byKey(const Key('158522')), findsOneWidget);

      // select problem item
      await tester.tap(find.byKey(const Key('158522')));
      await tester.pump();

      // enter notes
      await tester.tap(find.byKey(AppWidgetKeys.problemDescriptionInputKey));
      await tester.enterText(
          find.byKey(AppWidgetKeys.problemDescriptionInputKey), problemNotes);
      await tester.pump();

      // tap save button
      await tester
          .tap(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey));
      await tester.pumpAndSettle();

      // verify success snackbar is displayed
      expect(find.byType(SnackBar), findsOneWidget);
      expect(
          find.text('Sorry, an error occurred while Adding the problem.'
              ' Please try again later, or contact Slade 360 Be.Well '
              'Support on $kBewellSupportPhoneNumber'),
          findsOneWidget);
    });

    testWidgets('pops without saving values when cancel button is tapped',
        (WidgetTester tester) async {
      await buildDrawerTestWidget(tester, DrawerType.problem);

      // verify UI renders correctly
      expect(find.byType(SILPrimaryButton), findsOneWidget);

      // Tap btn to open drawer
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pump();

      // verify drawer is open
      expect(find.text(addProblemDrawerTitle), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.addProblemDrawerSearchInputKey),
          findsOneWidget);
      expect(
          find.byKey(AppWidgetKeys.problemDescriptionInputKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.silSecondaryButton), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey),
          findsOneWidget);

      // enter condition
      await tester
          .tap(find.byKey(AppWidgetKeys.addProblemDrawerSearchInputKey));
      await tester.enterText(
          find.byKey(AppWidgetKeys.addProblemDrawerSearchInputKey), 'headache');
      await tester.pump(const Duration(milliseconds: 200));

      // verify suggestion dropdown is displayed
      expect(find.text('Primary exertional headache'), findsOneWidget);
      expect(find.byKey(const Key('158522')), findsOneWidget);

      // select problem item
      await tester.tap(find.byKey(const Key('158522')));
      await tester.pump();

      // enter notes
      await tester.tap(find.byKey(AppWidgetKeys.problemDescriptionInputKey));
      await tester.enterText(
          find.byKey(AppWidgetKeys.problemDescriptionInputKey), problemNotes);
      await tester.pump();

      // tap cancel button
      await tester.tap(find.byKey(AppWidgetKeys.silSecondaryButton));
      await tester.pumpAndSettle();

      // verify success snackbar is not displayed
      expect(find.byType(SnackBar), findsNothing);
      expect(find.text('Allergy added'), findsNothing);

      // verify drawer is closed
      // verify(mockObserver.didPush(any, any));
      expect(find.byType(AddProblem), findsNothing);
    });

    testWidgets('saves an unconfirmed problem', (WidgetTester tester) async {
      await buildDrawerTestWidget(tester, DrawerType.problem);
      await tester.pump();

      // verify UI renders correctly
      expect(find.byType(SILPrimaryButton), findsOneWidget);

      // Tap btn to open drawer
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pump();

      // verify drawer is open
      expect(find.text(addProblemDrawerTitle), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.addProblemDrawerSearchInputKey),
          findsOneWidget);
      expect(
          find.byKey(AppWidgetKeys.problemDescriptionInputKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.silSecondaryButton), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey),
          findsOneWidget);

      // enter condition
      await tester
          .tap(find.byKey(AppWidgetKeys.addProblemDrawerSearchInputKey));
      await tester.enterText(
          find.byKey(AppWidgetKeys.addProblemDrawerSearchInputKey), 'headache');
      await tester.pump(const Duration(milliseconds: 200));

      // verify suggestion dropdown is displayed
      expect(find.text('Primary exertional headache'), findsOneWidget);
      expect(find.byKey(const Key('158522')), findsOneWidget);

      // select problem item
      await tester.tap(find.byKey(const Key('158522')));
      await tester.pump();

      // uncheck confirmation checkbox
      expect(find.byKey(AppWidgetKeys.problemConfirmationCheckbox),
          findsOneWidget);
      await tester.tap(find.byKey(AppWidgetKeys.problemConfirmationCheckbox));
      await tester.pump();

      // enter notes
      await tester.tap(find.byKey(AppWidgetKeys.problemDescriptionInputKey));
      await tester.enterText(
          find.byKey(AppWidgetKeys.problemDescriptionInputKey), problemNotes);
      await tester.pump();

      // tap save button
      await tester
          .tap(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey));
      await tester.pumpAndSettle();

      // verify save callback is called
      expect(sidePaneProblemStore.problemConfirmationStatus.value,
          problemUnConfirmed);
      expect(sidePaneProblemStore.problemName.value, selectedCondition);
      expect(sidePaneProblemStore.problemNotes.value, problemNotes);
      expect(ExamChangeObject().onAddProblemListener.value, true);

      // verify success snackbar is displayed
      expect(find.byType(SnackBar), findsOneWidget);

      // verify drawer closed
      expect(find.byType(AddProblem), findsNothing);
      // verify(mockObserver.didPop(any, any));
    });

    testWidgets('clears the problem search input when close icon is tapped',
        (WidgetTester tester) async {
      await buildDrawerTestWidget(tester, DrawerType.problem);

      // verify UI renders correctly
      expect(find.byType(SILPrimaryButton), findsOneWidget);

      // Tap btn to open drawer
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pump();

      // verify drawer is open
      expect(find.text(addProblemDrawerTitle), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.addProblemDrawerSearchInputKey),
          findsOneWidget);
      expect(
          find.byKey(AppWidgetKeys.problemDescriptionInputKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.silSecondaryButton), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey),
          findsOneWidget);

      // enter condition
      await tester
          .tap(find.byKey(AppWidgetKeys.addProblemDrawerSearchInputKey));
      await tester.enterText(
          find.byKey(AppWidgetKeys.addProblemDrawerSearchInputKey), 'headache');
      await tester.pump(const Duration(milliseconds: 200));

      // tap suffix icon (cancel) on drawerSearchInput
      expect(find.byIcon(Icons.close), findsWidgets);
      await tester.tap(find.byIcon(Icons.close).last);

      // tap save button
      await tester
          .tap(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey));
      await tester.pumpAndSettle();

      // verify success snackbar is displayed
      expect(find.byType(SnackBar), findsNothing);

      // verify drawer closed
      expect(find.byType(AddProblem), findsOneWidget);
      // verifyNever(mockObserver.didPop(any, any));
    });

    testWidgets('verify cancel selected problem/condition works',
        (WidgetTester tester) async {
      await buildDrawerTestWidget(tester, DrawerType.problem);

      // verify UI renders correctly
      expect(find.byType(SILPrimaryButton), findsOneWidget);

      // Tap btn to open drawer
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pump();

      // verify drawer is open
      expect(find.text(addProblemDrawerTitle), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.addProblemDrawerSearchInputKey),
          findsOneWidget);
      expect(
          find.byKey(AppWidgetKeys.problemDescriptionInputKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.silSecondaryButton), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey),
          findsOneWidget);

      // enter condition
      await tester
          .tap(find.byKey(AppWidgetKeys.addProblemDrawerSearchInputKey));
      await tester.enterText(
          find.byKey(AppWidgetKeys.addProblemDrawerSearchInputKey), 'headache');
      await tester.pump(const Duration(milliseconds: 200));

      // verify suggestion dropdown is displayed
      expect(find.text('Primary exertional headache'), findsOneWidget);
      expect(find.byKey(const Key('158522')), findsOneWidget);

      // select problem item
      await tester.tap(find.byKey(const Key('158522')));
      await tester.pump();

      // enter notes
      await tester.tap(find.byKey(AppWidgetKeys.problemDescriptionInputKey));
      await tester.enterText(
          find.byKey(AppWidgetKeys.problemDescriptionInputKey), problemNotes);
      await tester.pump();

      // tap cancel btn to unselect a condition/problem
      expect(find.text('Cancel'), findsWidgets);
      await tester.tap(find.text('Cancel').first);

      await tester.pump();

      // verify suggestion dropdown is displayed
      expect(find.text('Primary exertional headache'), findsNothing);
      expect(find.byKey(const Key('158522')), findsNothing);
    });
  });
}
