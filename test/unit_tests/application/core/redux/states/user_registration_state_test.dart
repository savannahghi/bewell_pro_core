// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:bewell_pro_core/application/core/graphql/mutations.dart';
import 'package:bewell_pro_core/application/redux/states/user_registration_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';

void main() {
  group('UserRegistrationState:', () {
    test('should convert state from/to json', () async {
      final UserRegistrationState state = UserRegistrationState.initial();
      final Map<String, dynamic> userRegistrationStateJson = <String, dynamic>{
        'userType': patientStr,
        'userRegistrationMutation': registerPatientQuery,
        'userResponse': patientRegistrationResponse,
        'primaryRouteName': patientsPageRoute,
        'secondaryRouteName': patientIdentificationRoute,
      };

      expect(state.userType, patientStr);
      expect(state.userRegistrationMutation, registerPatientQuery);
      expect(state.primaryRouteName, patientsPageRoute);
      expect(state.secondaryRouteName, patientIdentificationRoute);
      expect(state.userResponse, patientRegistrationResponse);

      final UserRegistrationState state2 = state.copyWith.call(
        userType: patientStr,
        userRegistrationMutation: registerPatientQuery,
        userResponse: patientRegistrationResponse,
        primaryRouteName: patientsPageRoute,
        secondaryRouteName: patientIdentificationRoute,
      );

      expect(state2.userType, patientStr);
      expect(state2.userRegistrationMutation, registerPatientQuery);
      expect(state2.primaryRouteName, patientsPageRoute);
      expect(state2.secondaryRouteName, patientIdentificationRoute);
      expect(state2.userResponse, patientRegistrationResponse);

      final UserRegistrationState state3 =
          UserRegistrationState.fromJson(userRegistrationStateJson);
      expect(state3, isA<UserRegistrationState>());

      expect(state3.userType, patientStr);
      expect(state3.userRegistrationMutation, registerPatientQuery);
      expect(state3.primaryRouteName, patientsPageRoute);
      expect(state3.secondaryRouteName, patientIdentificationRoute);
      expect(state3.userResponse, patientRegistrationResponse);
    });
  });
}
