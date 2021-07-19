import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';
import 'package:bewell_pro_core/application/redux/states/clinical_state.dart';
import 'package:bewell_pro_core/domain/clinical/entities/contact_point.dart';
import 'package:bewell_pro_core/domain/clinical/entities/human_name.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_payload.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/patient_gender_enum.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/bewell_patient_profile_connector.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/bewell_patient_profile_page.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('BewellPatientProfilePage', () {
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
    testWidgets('displays correctly', (WidgetTester tester) async {
      await tester.runAsync(() async {
        await mockNetworkImages(() async {
          await buildTestWidget(
            tester: tester,
            store: store,
            widget: const BewellPatientProfilePage(),
          );

          expect(find.byType(BewellPatientProfileConnector), findsOneWidget);
        });
      });
    });
  });
}
