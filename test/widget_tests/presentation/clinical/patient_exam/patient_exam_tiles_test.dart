// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sghi_core/ui_components/src/buttons.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/allergies/exam_allergies_table.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_exam_buttons/exam_item_add_button.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_exam_buttons/next_tile_button.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_exam_buttons/previous_tile_button.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_exam_review.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_exam_tiles.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_exam_titles/patient_exam_card_title.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_examination/general_systems_exam_widget.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_examination/review_of_systems.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_history/chief_complaint.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_history/patient_history_wrapper.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/problems/patient_exam_problems.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/vitals/vitals.dart';
import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  final Store<CoreState> store =
      Store<CoreState>(initialState: CoreState.initial());
  testWidgets('patient exam tiles renders correctly',
      (WidgetTester tester) async {
    startMockVisitAndExam();

    await buildTestWidget(
        tester: tester, store: store, widget: PatientExamTiles());

    /// Step 1
    expect(find.byKey(const Key('0')), findsOneWidget);
    expect(find.byType(NextTileButton), findsOneWidget);
    expect(find.byType(PreviousTileButton), findsNothing);
    expect(find.text('Patient Review'), findsOneWidget);
    expect(find.text('Conditions, Allergies and vitals'), findsOneWidget);
    expect(find.byType(PatientExamReview), findsOneWidget);
    expect(find.byType(PatientProblemTable), findsOneWidget);
    expect(find.byType(ExamAllergiesTable), findsOneWidget);
    expect(find.byType(Vitals), findsOneWidget);

    await tester.tap(find.text('Patient Review'));
    await tester.pumpAndSettle();

    expect(find.byType(ExpansionTile), findsNWidgets(4));
    expect(find.byType(NextTileButton), findsNothing);
    expect(find.byType(PreviousTileButton), findsNothing);
    expect(find.byKey(const Key('1')), findsOneWidget);
    expect(find.byKey(const Key('2')), findsOneWidget);
    expect(find.byKey(const Key('3')), findsOneWidget);

    /// Step 2
    await tester.tap(find.text('Patient History'));
    await tester.pumpAndSettle();

    expect(find.byType(ChiefComplaint), findsOneWidget);
    expect(find.byType(PatientHistoryWrapper), findsOneWidget);

    await tester.tap(find.text('Patient History'));
    await tester.pumpAndSettle();

    /// Step 3
    await tester.tap(find.text('Patient Examination'));
    await tester.pumpAndSettle();

    expect(find.byType(GeneralSystemsExamWidget), findsOneWidget);
    expect(find.byType(ReviewOfSystems), findsOneWidget);

    await tester.tap(find.text('Patient Examination'));
    await tester.pumpAndSettle();

    /// Step 4
    await tester.tap(find.text('Treatment plan'));
    await tester.pumpAndSettle();

    expect(find.byType(PatientExamCardTitle), findsWidgets);
    expect(find.byType(ExamItemAddButton), findsWidgets);

    await tester.tap(find.text('Treatment plan'));
    await tester.pumpAndSettle();
  });

  testWidgets(
      'patient exam tiles PreviousTileButton and NextTileButton works correctly',
      (WidgetTester tester) async {
    startMockVisitAndExam();

    await buildTestWidget(
        tester: tester, store: store, widget: PatientExamTiles());

    /// Step 1
    expect(find.byKey(const Key('0')), findsOneWidget);
    expect(find.byType(NextTileButton), findsOneWidget);
    expect(find.byType(PreviousTileButton), findsNothing);
    expect(find.text('Patient Review'), findsOneWidget);
    expect(find.text('Conditions, Allergies and vitals'), findsOneWidget);
    expect(find.byType(PatientExamReview), findsOneWidget);
    expect(find.byType(PatientProblemTable), findsOneWidget);
    expect(find.byType(ExamAllergiesTable), findsOneWidget);
    expect(find.byType(Vitals), findsOneWidget);

    // tap next button
    final SILPrimaryButton nextButton = find
        .widgetWithText(SILPrimaryButton, nextBtnText)
        .evaluate()
        .first
        .widget as SILPrimaryButton;
    nextButton.onPressed!();
    await tester.pumpAndSettle();

    expect(find.byType(PreviousTileButton), findsOneWidget);

    // tap previous button
    final SILSecondaryButton previousButton = find
        .widgetWithText(SILSecondaryButton, previousBtnText)
        .evaluate()
        .first
        .widget as SILSecondaryButton;
    previousButton.onPressed!();
    await tester.pumpAndSettle();

    expect(find.byType(NextTileButton), findsOneWidget);
  });
}
