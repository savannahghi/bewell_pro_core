import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/redux/states/user_state.dart';

void main() {
  group('UserState:', () {
    final Map<String, dynamic> userStateJson = <String, dynamic>{
      'userProfile': <String, dynamic>{
        'id': 'UNKNOWN',
        'userName': 'UNKNOWN',
        'primaryPhone': null,
        'primaryEmailAddress': 'unknown@bewell.co.ke',
        'secondaryPhoneNumbers': null,
        'secondaryEmailAddresses': null,
        'terms_accepted': false,
        'suspended': false,
        'photoUploadID': 'UNKNOWN',
        'covers': null,
        'userBioData': <String, dynamic>{
          'firstName': 'UNKNOWN',
          'lastName': 'UNKNOWN',
          'dateOfBirth': 'UNKNOWN',
          'gender': 'unknown'
        },
        'homeAddress': null,
        'workAddress': null,
        'referralLink': null,
        'assistant': null,
      },
      'customerProfile': null,
      'communicationSettings': <String, dynamic>{
        'profileID': 'UNKNOWN',
        'allowWhatsApp': false,
        'allowTextSMS': false,
        'allowPush': false,
        'allowEmail': false
      },
      'auth': <String, dynamic>{
        'customToken': 'UNKNOWN',
        'id_token': 'UNKNOWN',
        'is_admin': false,
        'expires_in': 'UNKNOWN',
        'refresh_token': 'UNKNOWN',
        'uid': 'UNKNOWN',
        'is_anonymous': true,
        'can_experiment': false,
        'change_pin': null
      },
      'isSignedIn': false,
      'inActivitySetInTime': 'UNKNOWN',
      'tokenExpiryTime': 'UNKNOWN',
      'signedInTime': 'UNKNOWN',
    };

    final Map<String, dynamic> modifiedUserStateJson = <String, dynamic>{
      'userProfile': <String, dynamic>{
        'primaryEmailAddress': 'unknown@bewell.co.ke',
        'userBioData': <String, dynamic>{
          'firstName': 'Be.Well',
          'lastName': 'By Slade360',
          'dateOfBirth': 'UNKNOWN',
          'gender': 'unknown'
        },
      },
      'auth': <String, dynamic>{
        'customToken': 'some-custom-token',
        'id_token': 'some-id-token',
        'is_anonymous': true,
        'can_experiment': false
      },
    };

    test('should serialize user state json correctly', () {
      final UserState userState = UserState.initial();

      expect(userState.toJson(), userStateJson);

      final UserState modifiedUserState =
          UserState.fromJson(modifiedUserStateJson);

      expect(modifiedUserState.userProfile!.userBioData!.firstName!.getValue(),
          'Be.Well');
      expect(modifiedUserState.auth!.customToken, 'some-custom-token');
    });
  });
}
