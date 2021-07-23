import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/application/redux/states/clinical_state.dart';
import 'package:bewell_pro_core/domain/clinical/entities/contact_point.dart';
import 'package:bewell_pro_core/domain/clinical/entities/human_name.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_payload.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/patient_gender_enum.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_exam_tiles.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/bewell_primary_patient_banner.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/start_continue_exam_banner.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

import '../../../../../mocks/mocks.dart';
import '../../../../../mocks/test_helpers.dart';

void main() {
  late Store<CoreState> store;

  setUp(() {
    store = Store<CoreState>(
      initialState: CoreState.initial().copyWith(
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
    'StartOrContinueExamBanner renders correctly on continue an exam',
    (WidgetTester tester) async {
      await mockNetworkImages(
        () async {
          await buildTestWidget(
            tester: tester,
            store: store,
            widget: const StartOrContinueExamBanner(
              isChecking: false,
              shouldContinueExam: true,
              patientName: 'leo',
            ),
          );

          await tester.pump();

          expect(find.text('Continue Patient Exam'), findsOneWidget);
          expect(find.byKey(AppWidgetKeys.startContinueExamWrapperButtonKey),
              findsOneWidget);

          await tester
              .tap(find.byKey(AppWidgetKeys.startContinueExamWrapperButtonKey));
          await tester.pumpAndSettle();

          expect(find.byType(BeWellPrimaryPatientBanner), findsOneWidget);
          expect(find.byType(PatientExamTiles), findsOneWidget);
        },
      );
    },
  );

  testWidgets(
    'StartOrContinueExamBanner renders correctly on starting an exam ',
    (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: const StartOrContinueExamBanner(
          isChecking: false,
          shouldContinueExam: false,
          patientName: 'leo',
        ),
      );

      expect(find.text('Start Exam'), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.startContinueExamWrapperButtonKey),
          findsOneWidget);

      await tester
          .tap(find.byKey(AppWidgetKeys.startContinueExamWrapperButtonKey));
      await tester.pumpAndSettle(const Duration(seconds: 3));

      expect(find.text('Start Exam'), findsNothing);

      expect(find.byType(PatientExamTiles), findsOneWidget);
    },
  );

  testWidgets(
    'StartOrContinueExamBanner renders correctly in large screen',
    (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = const Size(1280, 720);

      await buildTestWidget(
        tester: tester,
        store: store,
        widget: const StartOrContinueExamBanner(
          isChecking: false,
          shouldContinueExam: true,
          patientName: 'leo',
        ),
      );

      expect(find.byKey(AppWidgetKeys.startContinueExamWrapperButtonKey),
          findsOneWidget);

      await tester
          .tap(find.byKey(AppWidgetKeys.startContinueExamWrapperButtonKey));

      await tester.pumpAndSettle();

      expect(find.byType(BeWellPrimaryPatientBanner), findsOneWidget);
      expect(find.byType(PatientExamTiles), findsOneWidget);

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    },
  );
}
