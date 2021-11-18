// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/generic_zero_state.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_exam_titles/patient_exam_card_title.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/summary/summary_medications.dart';
import '../../../../../../mocks/mocks.dart';
import '../../../../../../mocks/test_helpers.dart';

void main() {
  group('ExamSummaryMedications', () {
    final Store<CoreState> store =
        Store<CoreState>(initialState: CoreState.initial());

    setUpAll(() {
      startMockVisitAndExam();
    });

    testWidgets('renders correctly when examTests is null or empty',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: const ExamSummaryMedications(examMedications: <dynamic>[]),
      );

      expect(find.byType(PatientExamCardTitle), findsOneWidget);
      expect(find.byType(GenericZeroStateWidget), findsOneWidget);
    });

    testWidgets(
        'renders correctly when examTests is  not null or not empty for small screen',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: ExamSummaryMedications(examMedications: testExamMedications),
      );

      expect(find.byType(PatientExamCardTitle), findsOneWidget);
      expect(find.text('Take 5 Capsules every 2 Hours for 3 Hours.'),
          findsOneWidget);
    });

    testWidgets(
        'renders correctly when examTests is  not null or not empty for large screen',
        (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = tabletLandscape;

      await buildTestWidget(
        tester: tester,
        store: store,
        widget: ExamSummaryMedications(examMedications: testExamMedications),
      );

      expect(find.byType(PatientExamCardTitle), findsOneWidget);
      expect(find.text('Take 5 Capsules every 2 Hours for 3 Hours.'),
          findsOneWidget);

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });
  });
}
