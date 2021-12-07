// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_exam_buttons/complete_button.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_exam_buttons/exam_item_add_button.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_exam_buttons/next_tile_button.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_exam_buttons/previous_tile_button.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_exams_title_icons/patient_exam_active_title_icon.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_exams_title_icons/patient_exam_done_title_icon.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  testWidgets('ExamItemButton renders correctly ', (WidgetTester tester) async {
    await buildTestWidget(
        tester: tester, widget: const ExamItemAddButton(buttonText: 'Done'));

    expect(find.text('Done'), findsOneWidget);
    expect(find.byKey(AppWidgetKeys.examItemButtonKeyKey), findsOneWidget);
  });

  testWidgets(
      'Complete buttons renders and works correctly when the view summary store is false',
      (WidgetTester tester) async {
    await buildTestWidget(
        tester: tester,
        widget: const CompleteButton(
          buttonText: 'Done',
        ));

    // expect to find the complete button
    expect(find.byKey(AppWidgetKeys.completeButtonKey), findsOneWidget);
    expect(find.text('Done'), findsOneWidget);

    //expect that tapping the button when the store is false renders a snackbar
    await tester.tap(find.byKey(AppWidgetKeys.completeButtonKey));
    await tester.pumpAndSettle();

    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.byType(ScaffoldMessenger), findsOneWidget);
    expect(find.text(addItemsToPatientExamPrompt), findsOneWidget);
  });

  testWidgets('PatientExamInActiveTitleIcon renders correctly',
      (WidgetTester tester) async {
    await buildTestWidget(
        tester: tester,
        widget: const PatientExamActiveTitleIcon(
          iconText: '2',
        ));

    expect(find.byType(CircleAvatar), findsOneWidget);
    expect(find.text('2'), findsOneWidget);
  });

  testWidgets('PatientExamDoneTitleIcon renders correctly ',
      (WidgetTester tester) async {
    await buildTestWidget(tester: tester, widget: PatientExamDoneTitleIcon());

    expect(find.byType(CircleAvatar), findsOneWidget);
    expect(find.byIcon(Icons.check), findsOneWidget);
  });

  testWidgets('NextTile and previous tile buttons renders correctly ',
      (WidgetTester tester) async {
    final List<int> integers = <int>[];
    void addNumber() {
      integers.add(1);
    }

    void removeNumber() {
      integers.remove(1);
    }

    await buildTestWidget(
        tester: tester,
        widget: Row(
          children: <Widget>[
            NextTileButton(
              callback: addNumber,
            ),
            PreviousTileButton(
              callback: removeNumber,
            )
          ],
        ));
    //expect to find the next button
    expect(find.byKey(AppWidgetKeys.nextTileButtonKey), findsOneWidget);
    expect(find.text('Next'), findsOneWidget);

    //expect tapping the button adds an item to the list
    await tester.tap(find.byKey(AppWidgetKeys.nextTileButtonKey));
    await tester.pumpAndSettle();

    expect(integers.length, 1);

    //expect tapping the button again adds another item to the list
    await tester.tap(find.byKey(AppWidgetKeys.nextTileButtonKey));
    await tester.pumpAndSettle();

    expect(integers.length, 2);

    //expect to find the previous button
    expect(find.text('Previous'), findsOneWidget);
    expect(find.byKey(AppWidgetKeys.previousTileButtonKey), findsOneWidget);

    //expect tapping the button removes an item to the list
    await tester.tap(find.byKey(AppWidgetKeys.previousTileButtonKey));
    await tester.pumpAndSettle();

    expect(integers.length, 1);
  });
}
