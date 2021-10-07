// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_diagnosis_tabs.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/treatment_plan/patient_exam_medications.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/treatment_plan/patient_exam_tests.dart';
import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('PatientTabs Page', () {
    final Store<CoreState> store =
        Store<CoreState>(initialState: CoreState.initial());

    testWidgets('renders correctly', (WidgetTester tester) async {
      startMockVisitAndExam();
      await buildTestWidget(
          tester: tester,
          store: store,
          widget: const PatientTabs(
              recordedDiagnosis: '', recordedDiagnosisID: ''));

      expect(find.byType(DefaultTabController), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byType(TabBar), findsOneWidget);
      expect(find.text(patientTestTabTitle), findsOneWidget);
      expect(find.text(patientMedicationTabTitle), findsOneWidget);
      expect(find.byType(TabBarView), findsOneWidget);
      expect(find.byType(PatientExamTests), findsOneWidget);
      expect(find.byType(PatientExamMedications), findsNothing);

      await tester.tap(find.text(patientMedicationTabTitle));
      await tester.pumpAndSettle();

      expect(find.byType(PatientExamMedications), findsOneWidget);
      expect(find.byType(PatientExamTests), findsNothing);

      await tester.tap(find.text(patientTestTabTitle));
      await tester.pumpAndSettle();

      expect(find.byType(PatientExamTests), findsOneWidget);
      expect(find.byType(PatientExamMedications), findsNothing);
    });
  });
}
