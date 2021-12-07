// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/entities.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/application/redux/states/user_state.dart';
import 'package:bewell_pro_core/presentation/onboarding/profile/pages/edit_profile_page.dart';
import 'package:bewell_pro_core/presentation/onboarding/profile/widgets/edit_profile_form.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('EditProfilePage', () {
    Store<CoreState> store;
    final CoreState state = CoreState(
      wait: Wait(),
      userState: UserState(
          userProfile: UserProfile(
        id: UNKNOWN,
        username: Name.withValue('Bewell-test'),
        termsAccepted: true,
        suspended: false,
        photoUploadID: UNKNOWN,
        primaryPhoneNumber: PhoneNumber.withValue('+254798000000'),
        userBioData: BioData(
          firstName: Name.withValue('bewell'),
          lastName: Name.withValue('test'),
          dateOfBirth: UNKNOWN,
          gender: Gender.male,
        ),
      )),
    );

    store = Store<CoreState>(initialState: state);
    testWidgets('should render correctly', (WidgetTester tester) async {
      await mockNetworkImages(() async {
        await buildTestWidget(
            store: store, tester: tester, widget: EditProfilePage());

        expect(find.byType(Hero), findsOneWidget);
        expect(find.byType(EditProfileForm), findsOneWidget);
      });
    });
  });
}
