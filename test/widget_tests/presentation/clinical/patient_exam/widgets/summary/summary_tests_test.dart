import 'package:async_redux/async_redux.dart';

import 'package:flutter_test/flutter_test.dart';

import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_exam_titles/patient_exam_card_title.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/summary/summary_tests.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/generic_zero_state.dart';

import '../../../../../../mocks/mocks.dart';
import '../../../../../../mocks/test_helpers.dart';

void main() {
  group('AddDiagnosis', () {
    Store<CoreState> store;
    final CoreState state = CoreState.initial();
    store = Store<CoreState>(initialState: state);

    testWidgets(
        'summary tests renders correctly when examTests is null or empty',
        (WidgetTester tester) async {
      startMockVisitAndExam();
      await buildTestWidget(
        store: store,
        tester: tester,
        widget: const ExamSummaryTests(examTests: <dynamic>[]),
      );

      expect(find.byType(PatientExamCardTitle), findsOneWidget);
      expect(find.byType(GenericZeroStateWidget), findsOneWidget);
    });

    testWidgets(
        'summary tests renders correctly when examTests is  not null or not empty for small screen',
        (WidgetTester tester) async {
      startMockVisitAndExam();
      await buildTestWidget(
        store: store,
        tester: tester,
        widget: ExamSummaryTests(examTests: testExamTests),
      );

      expect(find.byType(PatientExamCardTitle), findsOneWidget);
      expect(
          find.text('Fasting glucose [Moles/volume] in Blood'), findsOneWidget);
      expect(find.text('Laboratory procedure'), findsOneWidget);
    });

    testWidgets(
        'summary tests renders correctly when examTests is  not null or not empty for large screen',
        (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = tabletLandscape;
      startMockVisitAndExam();
      await buildTestWidget(
        store: store,
        tester: tester,
        widget: ExamSummaryTests(examTests: testExamTests),
      );

      expect(find.byType(PatientExamCardTitle), findsOneWidget);
      expect(
          find.text('Fasting glucose [Moles/volume] in Blood'), findsOneWidget);
      expect(find.text('Laboratory procedure'), findsOneWidget);

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });
  });
}
