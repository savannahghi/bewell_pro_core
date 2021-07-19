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
import 'package:bewell_pro_core/domain/clinical/value_objects/start_visit_type_enum.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/domain/core/value_objects/type_defs.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/bewell_patient_profile_widget.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/start_or_continue_exam_wrapper.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/bewell_secondary_patient_banner.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('patient profile page', () {
    BewellPatientProfileWidget buildWidget({
      OnStartVisit? onStartVisit,
    }) {
      return BewellPatientProfileWidget(
        onStartVisit:
            onStartVisit ?? (BuildContext context, StartVisitType type) {},
      );
    }

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

    testWidgets('should display snackbar correctly if an exam was completed',
        (WidgetTester tester) async {
      int startVisitCount = 0;
      final SnackBarListenersChangeObject snackBarObject =
          SnackBarListenersChangeObject();

      snackBarObject.onCloseSummaryListener.add(true);

      await mockNetworkImages(() async {
        await buildTestWidget(
          tester: tester,
          store: store,
          widget: buildWidget(
            onStartVisit:
                (BuildContext context, StartVisitType startVisitType) =>
                    startVisitCount++,
          ),
        );
        await tester.pumpAndSettle();

        expect(find.byType(SnackBar), findsOneWidget);
      });
    });

    testWidgets('should render correctly', (WidgetTester tester) async {
      int startVisitCount = 0;

      await buildTestWidget(
        tester: tester,
        store: store,
        widget: buildWidget(
          onStartVisit: (BuildContext context, StartVisitType startVisitType) =>
              startVisitCount++,
        ),
      );
      await tester.pumpAndSettle();

      final Finder patientExamWrapper = find.byType(StartOrContinueExamWrapper);
      final Finder patientBanner = find.byType(StartOrContinueExamWrapper);
      final Finder secondaryBanner = find.byType(BeWellSecondaryPatientBanner);

      expect(patientExamWrapper, findsOneWidget);
      expect(secondaryBanner, findsOneWidget);
      expect(patientBanner, findsOneWidget);

      expect(find.byKey(AppWidgetKeys.requestAccessVisitsKey), findsOneWidget);

      await tester.tap(find.text(requestAccessToPastVisitString));
      await tester.pumpAndSettle();

      final Finder requestAccessBtn =
          find.byKey(AppWidgetKeys.requestAccessKey);
      expect(requestAccessBtn, findsOneWidget);

      await tester.tap(requestAccessBtn);
      await tester.pumpAndSettle();

      expect(startVisitCount, 1);
    });

    testWidgets('should render correctly with show all access',
        (WidgetTester tester) async {
      final TimelineInfoObject timelineInfoObject = TimelineInfoObject();
      timelineInfoObject.patientsWithGrantedAccess.add('some id');

      int startVisitCount = 0;

      await buildTestWidget(
        tester: tester,
        store: store,
        widget: buildWidget(
          onStartVisit: (BuildContext context, StartVisitType startVisitType) =>
              startVisitCount++,
        ),
      );
      await tester.pumpAndSettle();

      final Finder patientExamWrapper = find.byType(StartOrContinueExamWrapper);
      final Finder patientBanner = find.byType(StartOrContinueExamWrapper);
      final Finder secondaryBanner = find.byType(BeWellSecondaryPatientBanner);

      expect(patientExamWrapper, findsOneWidget);
      expect(secondaryBanner, findsOneWidget);
      expect(patientBanner, findsOneWidget);
      expect(timelineInfoObject.showAll.value, false);

      expect(find.byKey(AppWidgetKeys.requestAccessVisitsKey), findsOneWidget);

      await tester.tap(find.text(requestAccessToPastVisitString));
      await tester.pumpAndSettle();

      final Finder requestAccessBtn =
          find.byKey(AppWidgetKeys.requestAccessKey);
      expect(requestAccessBtn, findsOneWidget);

      await tester.tap(requestAccessBtn);
      await tester.pumpAndSettle();

      expect(startVisitCount, 1);
    });
  });
}
