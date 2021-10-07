// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_ui_components/buttons.dart';
import 'package:shared_ui_components/platform_loader.dart';

// Project imports:
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/clinical_exam_forms/review_of_systems_form_builder.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/clinical_exam_forms/save_review_of_systems_button.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawers/drawer_utils/drawer_save_button.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  testWidgets('ReviewOfSystemsFormBuilder renders correctly',
      (WidgetTester tester) async {
    await buildDrawerTestWidget(tester, DrawerType.peripheral);

    await tester.tap(find.byType(SILPrimaryButton));
    await tester.pumpAndSettle();

    expect(find.byType(ReviewOfSystemsFormBuilder), findsOneWidget);
    expect(find.byType(ExpansionTile), findsOneWidget);
    expect(find.byType(Checkbox), findsWidgets);

    await tester.tap(find.byType(Checkbox).last);
    await tester.pumpAndSettle();

    await tester.showKeyboard(find.byType(TextFormField));
    await tester.enterText(find.byType(TextFormField), 'add symptoms');

    await tester.pumpAndSettle();
    expect(find.byType(SaveReviewOfSystemsButton), findsOneWidget);
    expect(find.byType(DrawerSaveButton), findsOneWidget);
    await tester.tap(find.byType(DrawerSaveButton));
    await tester.pumpAndSettle();

    expect(find.byType(SILPlatformLoader), findsNothing);
  });

  testWidgets(
      'ReviewOfSystemsFormBuilder collapses the symptoms when the exam being '
      ' performed is a normal exam', (WidgetTester tester) async {
    await buildDrawerTestWidget(tester, DrawerType.peripheral);

    await tester.tap(find.byType(SILPrimaryButton));
    await tester.pumpAndSettle();

    expect(find.text(noAbnormalitiesCheckbox), findsWidgets);

    await tester.tap(find.text(noAbnormalitiesCheckbox));
    await tester.pumpAndSettle();
    expect(find.text('Leg cramps'), findsNothing);
  });
}
