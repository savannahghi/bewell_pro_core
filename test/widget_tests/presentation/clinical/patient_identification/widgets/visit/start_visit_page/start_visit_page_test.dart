import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/entities.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/application/redux/states/clinical_state.dart';
import 'package:bewell_pro_core/application/redux/states/user_state.dart';
import 'package:bewell_pro_core/domain/clinical/entities/contact_point.dart';
import 'package:bewell_pro_core/domain/clinical/entities/human_name.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_payload.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/patient_gender_enum.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/start_visit_type_enum.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/visit/start_visit_page/start_visit_page.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/widgets/onboarding_scaffold.dart';

import '../../../../../../../mocks/mocks.dart';
import '../../../../../../../mocks/test_helpers.dart';

void main() {
  late Store<CoreState> store;

  setUp(() {
    final UserState userState = UserState.initial().copyWith(
      userProfile: UserProfile.initial().copyWith(
        primaryEmailAddress: testEmailAddress,
        primaryPhoneNumber: testPhoneNumber,
      ),
    );

    final ClinicalState clinicalState = ClinicalState(
      patientPayload: PatientPayload(
        patientRecord: Patient(
          name: <HumanName>[HumanName(text: 'Doe John')],
          telecom: <ContactPoint>[ContactPoint(value: '+254798000000')],
          gender: PatientGenderEnum.male,
        ),
      ),
      startVisitType: StartVisitType.requestAccess,
    );

    store = Store<CoreState>(
      initialState: CoreState.initial().copyWith(
        userState: userState,
        clinicalState: clinicalState,
      ),
    );
  });
  testWidgets('Start visit page renders correctly',
      (WidgetTester tester) async {
    await buildTestWidget(
      tester: tester,
      store: store,
      widget: const StartVisitPage(),
    );

    // verify UI renders correctly
    expect(find.byType(OnboardingScaffold), findsOneWidget);
    expect(find.text(startVisitText), findsOneWidget);
  });
}
