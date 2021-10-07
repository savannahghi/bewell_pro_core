// Flutter imports:
import 'package:flutter/widgets.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/entities.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/actions/user_state_actions/batch_update_user_state_action.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/presentation/onboarding/profile/communication_settings.dart';
import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('Communications page:', () {
    final Store<CoreState> store =
        Store<CoreState>(initialState: CoreState.initial());

    testWidgets('should render correctly', (WidgetTester tester) async {
      await mockNetworkImages(() async {
        await buildTestWidget(
          store: store,
          tester: tester,
          widget: Builder(builder: (BuildContext context) {
            store.dispatch(BatchUpdateUserStateAction(
              userProfile: UserProfile(
                  primaryPhoneNumber: testPhoneNumber,
                  userBioData: BioData(
                      firstName: testFirstName,
                      lastName: testLastName,
                      gender: testGender,
                      dateOfBirth: testDOB)),
            ));
            return CommunicationSettingsPage();
          }),
        );
        expect(find.byType(CommunicationSettingsPage), findsOneWidget);
        expect(find.byType(SingleChildScrollView), findsOneWidget);
        expect(find.byType(Hero), findsOneWidget);
        expect(find.text(pageHeader), findsOneWidget);
        expect(find.text(emailTitle), findsOneWidget);
        expect(find.text(messagesTitle), findsOneWidget);
        expect(find.text(whatsAppTitle), findsOneWidget);
        expect(find.text(pushTitle), findsOneWidget);
      });
    });

    testWidgets('should change communications settings correctly',
        (WidgetTester tester) async {
      const bool expectedBeforeAllowEmail = false;
      bool? actualAllowEmail;

      await mockNetworkImages(() async {
        await buildTestWidget(
          store: store,
          tester: tester,
          widget: Builder(builder: (BuildContext context) {
            actualAllowEmail =
                store.state.userState!.communicationSettings!.allowEmail;
            store.dispatch(BatchUpdateUserStateAction(
              userProfile: UserProfile(
                  primaryPhoneNumber: testPhoneNumber,
                  userBioData: BioData(
                    firstName: testFirstName,
                    lastName: testLastName,
                    gender: testGender,
                    dateOfBirth: testDOB,
                  )),
            ));
            return CommunicationSettingsPage();
          }),
        );
      });

      expect(actualAllowEmail, expectedBeforeAllowEmail);

      expect(find.text(emailTitle), findsOneWidget);
      await tester.tap(find.text(emailTitle));
      await tester.pumpAndSettle();

      expect(find.byType(CommunicationSettingsPage), findsOneWidget);
    });
  });
}
