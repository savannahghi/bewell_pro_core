import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';
import 'package:bewell_pro_core/application/redux/states/clinical_state.dart';
import 'package:bewell_pro_core/domain/clinical/entities/contact_point.dart';
import 'package:bewell_pro_core/domain/clinical/entities/human_name.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_payload.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/patient_gender_enum.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_exam_buttons/complete_button.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/summary/patient_exam_summary.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:shared_ui_components/buttons.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  late Store<AppState> store;

  setUp(() {
    store = Store<AppState>(
      initialState: AppState.initial().copyWith(
          clinicalState: ClinicalState(
        patientPayload: PatientPayload(
          patientRecord: Patient(
            name: <HumanName>[HumanName(text: 'Doe John')],
            telecom: <ContactPoint>[ContactPoint(value: '+254798000000')],
            gender: PatientGenderEnum.male,
          ),
        ),
      )),
    );

    startMockVisitAndExam();
  });

  testWidgets(
      'complete button shows a snackbar is the user has not added'
      ' anything to the patient\'s exam', (WidgetTester tester) async {
    await mockNetworkImages(() async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: const CompleteButton(buttonText: 'Complete'),
      );

      expect(find.byType(SILPrimaryButton), findsOneWidget);
      expect(find.text('Complete'), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.completeButtonKey), findsOneWidget);

      await tester.tap(find.byKey(AppWidgetKeys.completeButtonKey));
      await tester.pump();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Please add some items to this patient\'s exam'),
          findsOneWidget);

      // Update the store and the UI
      ViewSummaryStore().viewSummaryButton.add(true);
      await tester.pump();

      await tester.tap(find.byKey(AppWidgetKeys.completeButtonKey));
      await tester.pumpAndSettle();

      // verify the app navigated
      expect(find.byType(PatientExamSummary), findsOneWidget);
    });
  });
}
