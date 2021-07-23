import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/summary/widgets/sign_off_exam.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/summary/widgets/summary_exam_button.dart';

import '../../../../mocks/test_helpers.dart';

void main() {
  final Store<CoreState> store =
      Store<CoreState>(initialState: CoreState.initial());
  testWidgets('SignOffExam renders correctly', (WidgetTester tester) async {
    await buildTestWidget(tester: tester, store: store, widget: SignOffExam());

    expect(find.byType(SaveExamSummaryButton), findsOneWidget);
    expect(find.byKey(AppWidgetKeys.signOffExamPreviousButton), findsOneWidget);
    expect(find.byType(SaveExamSummaryButton), findsOneWidget);

    await tester.tap(find.byKey(AppWidgetKeys.signOffExamPreviousButton));
    await tester.pumpAndSettle();

    expect(find.byKey(AppWidgetKeys.signOffExamPreviousButton), findsNothing);
    expect(find.byType(SaveExamSummaryButton), findsNothing);
  });
}
