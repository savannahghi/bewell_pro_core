import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';
import 'package:bewell_pro_core/presentation/clinical/common/widgets/bewell_table_title_action.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/allergies/exam_allergies_table.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_exam_review.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/vitals/vitals.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  final Store<AppState> store =
      Store<AppState>(initialState: AppState.initial());
  testWidgets('PatientExamReview renders correctly',
      (WidgetTester tester) async {
    startMockVisitAndExam();

    tester.binding.window.devicePixelRatioTestValue = 1.0;
    tester.binding.window.physicalSizeTestValue = tabletLandscape;

    startMockVisitAndExam();
    await buildTestWidget(
        tester: tester,
        store: store,
        widget: ListView(
            shrinkWrap: true, children: <Widget>[PatientExamReview()]));

    await tester.pump(const Duration(seconds: 30));

    expect(find.byType(ExamAllergiesTable), findsWidgets);
    expect(find.byType(Vitals), findsWidgets);
    expect(find.byType(BewellTableTitleAction), findsWidgets);

    await tester.pumpAndSettle();

    addTearDown(() {
      tester.binding.window.clearPhysicalSizeTestValue();
      tester.binding.window.clearDevicePixelRatioTestValue();
    });
  });
}
