// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

// Project imports:
import 'package:bewell_pro_core/application/core/graphql/mutations.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/application/redux/states/user_registration_state.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/asset_strings.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/pages/basic_details.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/pages/patient_registration.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/patient_registration_steps.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';
import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  late Store<CoreState> store;

  setUp(() {
    AppBrand().appLogo.add(cameraIconUrl);
    final CoreState state = CoreState.initial();
    store = Store<CoreState>(initialState: state);
  });

  group('PatientRegistration', () {
    testWidgets('should render the patient registration UI',
        (WidgetTester tester) async {
      await mockNetworkImages(() async {
        await buildTestWidget(
            tester: tester,
            store: store,
            widget: PatientRegistration(
              userRegistrationState: UserRegistrationState(
                userType: patientStr,
                userRegistrationMutation: registerPatientQuery,
                userResponse: patientRegistrationResponse,
                primaryRouteName: patientsPageRoute,
                secondaryRouteName: patientIdentificationRoute,
              ),
            ));

        final Finder basicDetailsPage = find.byType(BasicDetailsWidget);

        expect(basicDetailsPage, findsOneWidget);
      });
    });

    testWidgets('should show steps on a large screen',
        (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = tabletLandscape;

      await buildTestWidget(
          tester: tester,
          store: store,
          widget: PatientRegistration(
            userRegistrationState: UserRegistrationState(
              userType: patientStr,
              userRegistrationMutation: registerPatientQuery,
              userResponse: patientRegistrationResponse,
              primaryRouteName: patientsPageRoute,
              secondaryRouteName: patientIdentificationRoute,
            ),
          ));

      expect(find.byType(PatientRegistrationSteps), findsOneWidget);

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });
  });
}
