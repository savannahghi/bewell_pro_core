import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/states/user_registration_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/pages/basic_details.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/pages/patient_registration.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/patient_registration_steps.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  late Store<CoreState> store;

  setUp(() {
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
                  userType: '',
                  userRegistrationMutation: '',
                  primaryRouteName: ''),
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
                userType: '',
                userRegistrationMutation: '',
                primaryRouteName: ''),
          ));

      expect(find.byType(PatientRegistrationSteps), findsOneWidget);

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });
  });
}
