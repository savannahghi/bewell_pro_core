import 'package:bewell_pro_core/application/core/graphql/mutations.dart';
import 'package:bewell_pro_core/application/redux/states/user_registration_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UserRegistrationState:', () {
    test('should convert state from/to json', () async {
      final UserRegistrationState state = UserRegistrationState.initial();
      final Map<String, dynamic> userRegistrationStateJson = <String, dynamic>{
        'userType': patientStr,
        'userRegistrationMutation': registerPatientQuery,
        'primaryRouteName': patientsPageRoute,
      };

      expect(state.userType, patientStr);
      expect(state.userRegistrationMutation, registerPatientQuery);
      expect(state.primaryRouteName, patientsPageRoute);

      final UserRegistrationState state2 = state.copyWith.call(
        userType: patientStr,
        userRegistrationMutation: registerPatientQuery,
        primaryRouteName: patientsPageRoute,
      );

      expect(state2.userType, patientStr);
      expect(state2.userRegistrationMutation, registerPatientQuery);
      expect(state2.primaryRouteName, patientsPageRoute);

      final UserRegistrationState state3 =
          UserRegistrationState.fromJson(userRegistrationStateJson);
      expect(state3, isA<UserRegistrationState>());

      expect(state3.userType, patientStr);
      expect(state3.userRegistrationMutation, registerPatientQuery);
      expect(state3.primaryRouteName, patientsPageRoute);
    });
  });
}
