import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/redux/actions/user_state_actions/batch_update_user_state_action.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/allergies/add_allergy_drawer.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawer_common_widgets/drawer_search_input.dart';

import 'package:domain_objects/entities.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:shared_ui_components/buttons.dart';

import '../../../../../../mocks/mocks.dart';
import '../../../../../../mocks/test_helpers.dart';

void main() {
  group('Add allergy drawer', () {
    final Store<CoreState> store =
        Store<CoreState>(initialState: CoreState.initial());

    setUpAll(() {
      startMockVisitAndExam();
      store.dispatch(BatchUpdateUserStateAction(
        userProfile: UserProfile(
          userBioData: BioData(
              firstName: Name.withValue('Bewell'),
              lastName: Name.withValue('Test')),
        ),
      ));
    });

    const String substanceConfirmed = 'Confirmed';
    const String substanceNotConfirmed = 'Unconfirmed';
    const String doctorDisplayName = 'Bewell Test';

    testWidgets('renders & saves correctly.', (WidgetTester tester) async {
      final AddAllergyObject _addAllergyObject = AddAllergyObject();

      await buildDrawerTestWidget(tester, DrawerType.allergy);

      // Tap btn to open drawer
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pump();

      // verify drawer is open
      expect(find.byType(AddAllergy), findsOneWidget);
      expect(find.text(addAllergyDrawerTitle), findsOneWidget);
      expect(find.byType(DrawerSearchInput), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey),
          findsOneWidget);
      expect(find.byKey(AppWidgetKeys.silSecondaryButton), findsOneWidget);
      expect(find.text('Allergy description *'), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.addAllergyDrawerSearchInputKey),
          findsOneWidget);
      expect(
          find.byKey(AppWidgetKeys.allergyDescriptionInputKey), findsOneWidget);

      // enter substance value
      await tester
          .tap(find.byKey(AppWidgetKeys.addAllergyDrawerSearchInputKey));
      await tester.enterText(
          find.byKey(AppWidgetKeys.addAllergyDrawerSearchInputKey), 'Protein');
      await tester.pump(const Duration(milliseconds: 200));

      // verify suggestion dropdown is displayed
      expect(find.text('Ospa protein'), findsOneWidget);
      expect(find.byKey(const Key('81243')), findsOneWidget);

      // select allergy item
      await tester.tap(find.byKey(const Key('81243')));
      await tester.pump();

      // enter description
      await tester.tap(find.byKey(AppWidgetKeys.allergyDescriptionInputKey));
      await tester.enterText(
          find.byKey(AppWidgetKeys.allergyDescriptionInputKey), 'Protein');
      await tester.pump();

      // tap save button
      await tester
          .tap(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey));
      await tester.pumpAndSettle();

      // verify save callback is called
      expect(_addAllergyObject.substanceConfirmationStatus.value,
          substanceConfirmed);
      expect(_addAllergyObject.recordingDoctor.value, doctorDisplayName);
      expect(ExamChangeObject().onAddAllergyListener.value, true);
      expect(PrimaryBannerInfoObject().patientBannerChangeListener.value, true);
      expect(ExamChangeObject().onAddProblemListener.value, true);

      // verify success snackbar is displayed
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Allergy added'), findsOneWidget);

      // verify drawer closed
      expect(find.byType(AddAllergy), findsNothing);
    });

    testWidgets('cancel btn pops without saving values',
        (WidgetTester tester) async {
      await buildDrawerTestWidget(tester, DrawerType.allergy);

      // Tap btn to open drawer
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pump();

      // verify drawer is open
      expect(find.byType(AddAllergy), findsOneWidget);
      expect(find.text(addAllergyDrawerTitle), findsOneWidget);
      expect(find.byType(DrawerSearchInput), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.silSecondaryButton), findsOneWidget);
      expect(find.text('Allergy description *'), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.addAllergyDrawerSearchInputKey),
          findsOneWidget);
      expect(
          find.byKey(AppWidgetKeys.allergyDescriptionInputKey), findsOneWidget);

      // enter substance value
      await tester
          .tap(find.byKey(AppWidgetKeys.addAllergyDrawerSearchInputKey));
      await tester.pumpAndSettle();
      await tester.enterText(
          find.byKey(AppWidgetKeys.addAllergyDrawerSearchInputKey), 'Protein');

      await tester.pump(const Duration(milliseconds: 200));

      // verify suggestion dropdown is displayed
      expect(find.text('Ospa protein'), findsOneWidget);
      expect(find.byKey(const Key('81243')), findsOneWidget);

      // select allergy item
      await tester.tap(find.byKey(const Key('81243')));
      await tester.pump();

      // enter description
      await tester.tap(find.byKey(AppWidgetKeys.allergyDescriptionInputKey));
      await tester.enterText(
          find.byKey(AppWidgetKeys.allergyDescriptionInputKey), 'Protein');
      await tester.pump();

      // tap cancel button
      await tester.tap(find.byKey(AppWidgetKeys.silSecondaryButton));
      await tester.pumpAndSettle();

      // verify success snackbar is not displayed
      expect(find.byType(SnackBar), findsNothing);
      expect(find.text('Allergy added'), findsNothing);

      // verify drawer is closed
      // verify(mockObserver.didPush(any, any));
      expect(find.byType(AddAllergy), findsNothing);
    });

    testWidgets('saves an unconfirmed allergy', (WidgetTester tester) async {
      await buildDrawerTestWidget(tester, DrawerType.allergy);

      // Tap btn to open drawer
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pump();

      // verify drawer is open
      expect(find.byType(AddAllergy), findsOneWidget);
      expect(find.text(addAllergyDrawerTitle), findsOneWidget);
      expect(find.byType(DrawerSearchInput), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.silSecondaryButton), findsOneWidget);
      expect(find.text('Allergy description *'), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.addAllergyDrawerSearchInputKey),
          findsOneWidget);
      expect(
          find.byKey(AppWidgetKeys.allergyDescriptionInputKey), findsOneWidget);

      // enter substance value
      await tester
          .tap(find.byKey(AppWidgetKeys.addAllergyDrawerSearchInputKey));
      await tester.enterText(
          find.byKey(AppWidgetKeys.addAllergyDrawerSearchInputKey), 'Protein');
      await tester.pump(const Duration(milliseconds: 200));

      // verify suggestion dropdown is displayed
      expect(find.text('Ospa protein'), findsOneWidget);
      expect(find.byKey(const Key('81243')), findsOneWidget);

      // select allergy item
      await tester.tap(find.byKey(const Key('81243')));
      await tester.pump();

      // enter description
      await tester.tap(find.byKey(AppWidgetKeys.allergyDescriptionInputKey));
      await tester.enterText(
          find.byKey(AppWidgetKeys.allergyDescriptionInputKey), 'Protein');
      await tester.pump();

      // uncheck allergy confirmation checkbox
      expect(find.byKey(AppWidgetKeys.allergyConfirmationCheckbox),
          findsOneWidget);
      await tester.tap(find.byKey(AppWidgetKeys.allergyConfirmationCheckbox));
      await tester.pump();

      // tap save button
      await tester
          .tap(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey));
      await tester.pumpAndSettle();

      // verify save callback is called
      expect(AddAllergyObject().substanceConfirmationStatus.value,
          substanceNotConfirmed);
      expect(AddAllergyObject().recordingDoctor.value, doctorDisplayName);
      expect(ExamChangeObject().onAddAllergyListener.value, true);
      expect(PrimaryBannerInfoObject().patientBannerChangeListener.value, true);
      expect(ExamChangeObject().onAddProblemListener.value, true);

      // verify success snackbar is displayed
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Allergy added'), findsOneWidget);

      // verify drawer closed
      expect(find.byType(AddAllergy), findsNothing);
    });

    testWidgets('substance search input suffix icon cancels',
        (WidgetTester tester) async {
      await buildDrawerTestWidget(tester, DrawerType.allergy);

      // Tap btn to open drawer
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pump();

      // verify drawer is open
      expect(find.byType(AddAllergy), findsOneWidget);
      expect(find.text(addAllergyDrawerTitle), findsOneWidget);
      expect(find.byType(DrawerSearchInput), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.silSecondaryButton), findsOneWidget);
      expect(find.text('Allergy description *'), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.addAllergyDrawerSearchInputKey),
          findsOneWidget);
      expect(
          find.byKey(AppWidgetKeys.allergyDescriptionInputKey), findsOneWidget);

      // enter substance value
      await tester
          .tap(find.byKey(AppWidgetKeys.addAllergyDrawerSearchInputKey));
      await tester.enterText(
          find.byKey(AppWidgetKeys.addAllergyDrawerSearchInputKey), 'Protein');
      await tester.pump(const Duration(milliseconds: 200));

      // tap suffix icon (cancel) on drawerSearchInput
      expect(find.byIcon(Icons.close), findsWidgets);
      await tester.tap(find.byIcon(Icons.close).first);

      // tap save button
      await tester
          .tap(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey));
      await tester.pumpAndSettle();

      // verify save failed
      expect(find.byType(SnackBar), findsNothing);
      expect(find.text('Allergy added'), findsNothing);
    });

    testWidgets('verify cancel selected item works',
        (WidgetTester tester) async {
      await buildDrawerTestWidget(tester, DrawerType.allergy);

      // Tap btn to open drawer
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pump();

      // verify drawer is open
      expect(find.byType(AddAllergy), findsOneWidget);
      expect(find.text(addAllergyDrawerTitle), findsOneWidget);
      expect(find.byType(DrawerSearchInput), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.silSecondaryButton), findsOneWidget);
      expect(find.text('Allergy description *'), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.addAllergyDrawerSearchInputKey),
          findsOneWidget);
      expect(
          find.byKey(AppWidgetKeys.allergyDescriptionInputKey), findsOneWidget);

      // enter substance value
      await tester
          .tap(find.byKey(AppWidgetKeys.addAllergyDrawerSearchInputKey));
      await tester.enterText(
          find.byKey(AppWidgetKeys.addAllergyDrawerSearchInputKey), 'Protein');
      await tester.pump(const Duration(milliseconds: 200));

      // verify suggestion dropdown is displayed
      expect(find.text('Ospa protein'), findsOneWidget);
      expect(find.byKey(const Key('81243')), findsOneWidget);

      // select allergy item
      await tester.tap(find.byKey(const Key('81243')));
      await tester.pump();

      // enter description
      await tester.tap(find.byKey(AppWidgetKeys.allergyDescriptionInputKey));
      await tester.enterText(
          find.byKey(AppWidgetKeys.allergyDescriptionInputKey), 'Protein');
      await tester.pump();

      // tap cancel btn to unselect a substance
      expect(find.text('Cancel'), findsWidgets);

      await tester.tap(find.text('Cancel').first);

      // tap save button
      await tester
          .tap(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey));
      await tester.pumpAndSettle();
    });

    testWidgets('clears the input when the cancel icon is tapped',
        (WidgetTester tester) async {
      await buildDrawerTestWidget(tester, DrawerType.allergy);

      // Tap btn to open drawer
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pump();

      // verify drawer is open
      expect(find.byType(AddAllergy), findsOneWidget);
      expect(find.text(addAllergyDrawerTitle), findsOneWidget);
      expect(find.byType(DrawerSearchInput), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.silSecondaryButton), findsOneWidget);
      expect(find.text('Allergy description *'), findsOneWidget);

      await tester
          .tap(find.byKey(AppWidgetKeys.addAllergyDrawerSearchInputKey));
      await tester.pump();

      expect(find.byKey(AppWidgetKeys.suffixCloseIconKey), findsOneWidget);

      await tester.enterText(
          find.byKey(AppWidgetKeys.addAllergyDrawerSearchInputKey), 'Protein');
      await tester.pumpAndSettle();

      expect(find.text('Protein'), findsOneWidget);

      await tester.tap(find.byKey(AppWidgetKeys.suffixCloseIconKey));
      await tester.pumpAndSettle();

      expect(find.text('Protein'), findsNothing);
    });
  });
}
