// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:sghi_core/ui_components/src/buttons.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/actions/navigation_actions/user_registration_action.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_payload.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/start_visit_type_enum.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/domain/core/value_objects/asset_strings.dart';
import 'package:bewell_pro_core/domain/core/value_objects/type_defs.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/pages/patient_search_page.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/pages/basic_details.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/pages/complete_registration_page/complete_registration_widget.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/pages/patient_registration_container.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';
import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  late Store<CoreState> store;
  late TabController controller;
  late PatientRegistrationContainer container;

  PatientRegistrationContainer buildWidget({
    OnStartVisit? onStartVisit,
    void Function(PatientPayload)? updatePatientRecord,
  }) {
    return PatientRegistrationContainer(
      tabController: controller,
      child: CompleteRegistrationWidget(
        onStartVisit:
            onStartVisit ?? (BuildContext context, StartVisitType type) {},
        updatePatientRecord: updatePatientRecord ?? (PatientPayload payload) {},
      ),
    );
  }

  setUp(() {
    store = Store<CoreState>(initialState: CoreState.initial());
    controller = TabController(length: 4, vsync: const TestVSync());
    container = buildWidget();
  });

  testWidgets('complete registration renders correctly ',
      (WidgetTester tester) async {
    AppBrand().appLogo.add(cameraIconUrl);

    final PatientPayload patientData = PatientPayload.fromJson(
        registeredPatientData['registerPatient'] as Map<String, dynamic>);

    container.currentPatient.updatePatient(patientData);

    await mockNetworkImages(() async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: container,
      );

      expect(find.byType(SILSecondaryButton), findsOneWidget);

      await tester.tap(find.byType(SILSecondaryButton));
      await tester.pumpAndSettle();

      expect(find.byType(PatientSearchPage), findsOneWidget);
      AppBrand().appLogo.add('');
    });
  });

  testWidgets(
      'complete registration renders correctly on tapping startVisit button',
      (WidgetTester tester) async {
    final PatientPayload patientData = PatientPayload.fromJson(
        registeredPatientData['registerPatient'] as Map<String, dynamic>);

    int startVisitCount = 0;

    container = buildWidget(
      onStartVisit: (BuildContext context, StartVisitType startVisitType) =>
          startVisitCount++,
    );

    container.currentPatient.updatePatient(patientData);

    await buildTestWidget(
      tester: tester,
      store: store,
      widget: container,
    );

    expect(startVisitCount, 0);

    final Finder startVisitBtn =
        find.byKey(AppWidgetKeys.completeRegistrationAndStartVisitKey);
    expect(startVisitBtn, findsOneWidget);

    await tester.tap(startVisitBtn);
    await tester.pumpAndSettle();

    final Finder requestAccessBtn = find.byKey(AppWidgetKeys.requestAccessKey);
    expect(requestAccessBtn, findsOneWidget);

    await tester.tap(requestAccessBtn);
    await tester.pumpAndSettle();

    expect(startVisitCount, 1);
  });

  testWidgets('navigates when registration is complete',
      (WidgetTester tester) async {
    AppBrand().appLogo.add(cameraIconUrl);
    store.dispatch(
      UserRegistrationAction(
        userType: patientStr,
        primaryRouteName: addPatientRoute,
      ),
    );

    final PatientPayload patientData = PatientPayload.fromJson(
        registeredPatientData['registerPatient'] as Map<String, dynamic>);

    int startVisitCount = 0;

    container = buildWidget(
      onStartVisit: (BuildContext context, StartVisitType startVisitType) =>
          startVisitCount++,
    );

    container.currentPatient.updatePatient(patientData);

    await buildTestWidget(
      tester: tester,
      store: store,
      widget: container,
    );

    expect(startVisitCount, 0);

    final Finder startVisitBtn =
        find.byKey(AppWidgetKeys.completeRegistrationAndStartVisitKey);
    expect(startVisitBtn, findsOneWidget);

    await tester.tap(startVisitBtn);
    await tester.pumpAndSettle();

    final Finder basicDetails = find.byType(BasicDetailsWidget);
    expect(basicDetails, findsOneWidget);
  });
}
