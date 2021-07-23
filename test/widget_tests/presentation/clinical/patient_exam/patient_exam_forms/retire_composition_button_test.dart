import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/redux/actions/user_state_actions/batch_update_user_state_action.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/models/exam_composition.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/clinical_exam_forms/retire_composition_button.dart';
import 'package:domain_objects/entities.dart';
import 'package:shared_themes/constants.dart';
import 'package:shared_ui_components/buttons.dart';

import '../../../../../mocks/mocks.dart';
import '../../../../../mocks/test_helpers.dart';

void main() {
  group('RetireCompositionButton', () {
    setUpAll(() {
      startMockVisitAndExam();
    });

    final Store<CoreState> store =
        Store<CoreState>(initialState: CoreState.initial());

    testWidgets('retires a composition and provides user feedback',
        (WidgetTester tester) async {
      ExamCompositionObject().reviewCompositionID.add('some-long-id');

      await buildTestWidget(
        tester: tester,
        store: store,
        widget: const RetireCompositionButton(
          compositionTypeTitle: '',
          title: respiratory,
        ),
      );

      expect(find.byType(SILSecondaryButton), findsOneWidget);
      expect(
          find.byKey(AppWidgetKeys.retireCompositionButtonKey), findsOneWidget);

      await tester.tap(find.byKey(AppWidgetKeys.retireCompositionButtonKey));
      await tester.pump();

      expect(find.byType(Dialog), findsOneWidget);
      expect(find.text(retireText), findsWidgets);
      expect(find.byKey(AppWidgetKeys.retireReasonFormField), findsOneWidget);

      await tester
          .showKeyboard(find.byKey(AppWidgetKeys.retireReasonFormField));
      await tester.enterText(
          find.byKey(AppWidgetKeys.retireReasonFormField), 'healed');
      await tester.pump();

      expect(find.text('healed'), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.retireHelperButtonKey), findsOneWidget);

      await tester.tap(find.byKey(AppWidgetKeys.retireHelperButtonKey));
      await tester.pumpAndSettle();

      expect(find.byKey(AppWidgetKeys.retireHelperButtonKey), findsNothing);
      expect(find.byType(SnackBar), findsOneWidget);
      expect(
          find.text('Respiratory review removed successfully'), findsOneWidget);
    });

    testWidgets('shows an error when the composition ID is null',
        (WidgetTester tester) async {
      final ExamCompositionObject examComposition = ExamCompositionObject();
      examComposition.reviewCompositionID.add(null);
      await buildTestWidget(
          tester: tester,
          store: store,
          widget: const RetireCompositionButton(
            compositionTypeTitle: '',
            title: gastrointestinal,
          ));

      expect(
          find.byKey(AppWidgetKeys.retireCompositionButtonKey), findsOneWidget);

      await tester.tap(find.byKey(AppWidgetKeys.retireCompositionButtonKey));
      await tester.pump();

      expect(find.byType(Dialog), findsOneWidget);
      expect(find.text(retireText), findsWidgets);
      expect(find.byKey(AppWidgetKeys.retireReasonFormField), findsOneWidget);

      await tester
          .showKeyboard(find.byKey(AppWidgetKeys.retireReasonFormField));
      await tester.enterText(
          find.byKey(AppWidgetKeys.retireReasonFormField), 'healed');
      await tester.pump();

      expect(find.text('healed'), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.retireHelperButtonKey), findsOneWidget);

      await tester.tap(find.byKey(AppWidgetKeys.retireHelperButtonKey));
      await tester.pumpAndSettle();

      expect(find.byKey(AppWidgetKeys.retireHelperButtonKey), findsNothing);
      expect(find.byType(SnackBar), findsOneWidget);
      expect(
          find.text('Sorry, an error occurred. Please try again,'
              ' or contact Slade 360 Be.Well Support support'
              ' on $kBewellSupportPhoneNumber'),
          findsOneWidget);
    });

    final List<String> compositionType = <String>[
      peripheral,
      hematologic,
      urinary,
      neurologic,
      cardiac,
      heent,
      heentTwo,
      gi,
      gu,
      ms,
      skin,
      psychiatric
    ];

    // This loops through the test while assigning specific composition
    for (final String element in compositionType) {
      testWidgets('retires a $element composition',
          (WidgetTester tester) async {
        await buildTestWidget(
            tester: tester,
            store: store,
            widget: RetireCompositionButton(
              compositionTypeTitle: '',
              title: element,
            ));

        expect(find.byType(SILSecondaryButton), findsOneWidget);
        expect(find.byKey(AppWidgetKeys.retireCompositionButtonKey),
            findsOneWidget);

        await tester.tap(find.byKey(AppWidgetKeys.retireCompositionButtonKey));
        await tester.pump();

        await tester
            .showKeyboard(find.byKey(AppWidgetKeys.retireReasonFormField));
        await tester.enterText(
            find.byKey(AppWidgetKeys.retireReasonFormField), 'healed');
        await tester.pump();

        await tester.tap(find.byKey(AppWidgetKeys.retireHelperButtonKey));
        await tester.pump();

        expect(find.byKey(AppWidgetKeys.retireHelperButtonKey), findsNothing);
      });
    }

    testWidgets('should verify retire modal interactions work correctly',
        (WidgetTester tester) async {
      final ExamCompositionObject examComposition = ExamCompositionObject();

      const String retireReasonHint =
          'Why do you want to retire the review of system?';

      await buildTestWidget(
        graphQlClient: mockGraphQlClient,
        tester: tester,
        store: store,
        widget: Builder(builder: (BuildContext context) {
          store.dispatch(BatchUpdateUserStateAction(
            userProfile: UserProfile(
                userBioData: BioData(
              firstName: testFirstName,
              lastName: testLastName,
            )),
          ));
          return const RetireCompositionButton(
            compositionTypeTitle: 'heenttwo',
            title: 'heenttwo',
          );
        }),
      );

      await tester.pumpAndSettle();

      // verify renders correctly
      expect(
          find.byKey(AppWidgetKeys.retireCompositionButtonKey), findsOneWidget);
      expect(find.text('Retire'), findsOneWidget);

      // tap retire button
      await tester.tap(find.byKey(AppWidgetKeys.retireCompositionButtonKey));
      await tester.pumpAndSettle();

      // verify callback works
      expect(examComposition.recordingDoctor.value.toString(), 'Happy User');
      expect(examComposition.compositionTitle.value?.name, 'review-of-systems');

      // enter a reason for retiring
      expect(find.text(retireReasonHint), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.retireReasonFormField), findsOneWidget);
      await tester.tap(find.text(retireReasonHint));
      await tester.pumpAndSettle();
      await tester.enterText(
          find.byKey(AppWidgetKeys.retireReasonFormField), 'text');
      await tester.pumpAndSettle();

      // tap cancel button
      expect(find.text('Cancel'), findsOneWidget);
      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle();

      // verify modal was closed

      // tap retire button again
      await tester.tap(find.byKey(AppWidgetKeys.retireCompositionButtonKey));
      await tester.pumpAndSettle();

      // verify callback works
      expect(examComposition.recordingDoctor.value.toString(), 'Happy User');
      expect(examComposition.compositionTitle.valueOrNull?.name,
          'review-of-systems');

      // enter a reason for retiring
      expect(find.text(retireReasonHint), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.retireReasonFormField), findsOneWidget);
      await tester.tap(find.text(retireReasonHint));
      await tester.pumpAndSettle();
      await tester.enterText(
          find.byKey(AppWidgetKeys.retireReasonFormField), 'text');
      await tester.pumpAndSettle();

      // tap retire button
      expect(find.text('Retire'), findsWidgets);
      await tester.tap(find.text('Retire').last);
      await tester.pumpAndSettle(const Duration(milliseconds: 200));

      // verify modal closed
      expect(find.byKey(AppWidgetKeys.retireReasonFormField), findsNothing);
    });
  });
}
