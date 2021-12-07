// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_ui_components/buttons.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/states/clinical_state.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/clinical/entities/contact_point.dart';
import 'package:bewell_pro_core/domain/clinical/entities/human_name.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_payload.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/patient_gender_enum.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/domain/core/value_objects/asset_strings.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/diagnosis/patient_diagnosis_table.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/pages/patient_exam.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_exam_buttons/complete_button.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_exam_buttons/exam_item_add_button.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_exam_diagnosis.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_exam_tiles.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_exam_titles/patient_exam_card_title.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/bewell_patient_profile_page.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/bewell_primary_patient_banner.dart';
import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('Patient_exam', () {
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

    testWidgets('should render correctly on largeScreen',
        (WidgetTester tester) async {
      AppBrand().appLogo.add(cameraIconUrl);

      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = tabletLandscape;

      await mockNetworkImages(() async {
        await buildTestWidget(
            tester: tester, store: store, widget: PatientExam());

        /// Verify renders correctly
        expect(find.byType(BeWellPrimaryPatientBanner), findsOneWidget);
        expect(find.byType(PatientExamTiles), findsOneWidget);
        expect(find.byKey(AppWidgetKeys.patientExamBackButton), findsOneWidget);
        expect(find.byType(CompleteButton), findsOneWidget);

        /// Tap Back Button
        await tester.tap(find.byKey(AppWidgetKeys.patientExamBackButton));
        await tester.pumpAndSettle();

        expect(find.byType(ExpansionTile), findsWidgets);
        AppBrand().appLogo.add('');

        addTearDown(() {
          tester.binding.window.clearPhysicalSizeTestValue();
          tester.binding.window.clearDevicePixelRatioTestValue();
        });
      });
    });

    testWidgets('PatientExamDiagnosis should render correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
          tester: tester, store: store, widget: PatientExamDiagnosis());

      expect(find.byType(PatientExamCardTitle), findsOneWidget);
      expect(find.byType(PatientDiagnosisTable), findsOneWidget);
      expect(find.byType(ExamItemAddButton), findsOneWidget);
    });

    testWidgets('PatientExam should open endDrawer',
        (WidgetTester tester) async {
      AppBrand().appLogo.add(cameraIconUrl);

      final BehaviorSubject<DrawerType> selectedDrawer =
          BehaviorSubject<DrawerType>();
      final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

      selectedDrawer.add(DrawerType.problem);
      await buildTestWidget(
          tester: tester,
          store: store,
          widget: Builder(builder: (BuildContext context) {
            return Scaffold(key: scaffoldKey, body: PatientExam());
          }));

      await tester.pump();

      expect(find.text(ongoingConditionsText), findsOneWidget);
      expect(find.byType(ExamItemAddButton), findsWidgets);
      expect(find.text(addConditionText), findsWidgets);
      expect(selectedDrawer.value, DrawerType.problem);

      scaffoldKey.currentState?.openDrawer();
      await tester.pump();

      await tester.tap(find.text(addConditionText));
      await tester.pumpAndSettle();

      expect(find.byType(Drawer), findsOneWidget);
      AppBrand().appLogo.add('');
    });

    testWidgets('PatientExam back button navigates',
        (WidgetTester tester) async {
      AppBrand().appLogo.add(cameraIconUrl);

      await buildTestWidget(
          tester: tester, store: store, widget: Scaffold(body: PatientExam()));

      expect(find.byKey(AppWidgetKeys.patientExamBackButton), findsOneWidget);
      expect(find.text(backText), findsOneWidget);

      final SILSecondaryButton backButton = find
          .widgetWithText(SILSecondaryButton, backText)
          .evaluate()
          .first
          .widget as SILSecondaryButton;
      backButton.onPressed!();
      await tester.pumpAndSettle();

      expect(find.byType(BewellPatientProfilePage), findsOneWidget);
      expect(find.byType(BeWellPrimaryPatientBanner), findsOneWidget);

      AppBrand().appLogo.add('');
    });

    testWidgets('PatientExam should open endDrawer on a larger screen',
        (WidgetTester tester) async {
      AppBrand().appLogo.add(cameraIconUrl);

      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = tabletLandscape;
      final BehaviorSubject<DrawerType> selectedDrawer =
          BehaviorSubject<DrawerType>();
      final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

      selectedDrawer.add(DrawerType.problem);
      await buildTestWidget(
          tester: tester,
          store: store,
          widget: Builder(builder: (BuildContext context) {
            return Scaffold(key: scaffoldKey, body: PatientExam());
          }));

      await tester.pump();

      expect(find.text(ongoingConditionsText), findsOneWidget);
      expect(find.byType(ExamItemAddButton), findsWidgets);
      expect(find.text(addConditionText), findsWidgets);
      expect(selectedDrawer.value, DrawerType.problem);

      scaffoldKey.currentState?.openDrawer();
      await tester.pump();

      await tester.tap(find.text(addConditionText));
      await tester.pumpAndSettle();

      expect(find.byType(Drawer), findsWidgets);

      AppBrand().appLogo.add('');

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });
  });
}
