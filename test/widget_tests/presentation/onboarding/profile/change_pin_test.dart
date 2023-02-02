// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/actions/user_state_actions/batch_update_user_state_action.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/widgets/onboarding_scaffold.dart';
import 'package:bewell_pro_core/presentation/onboarding/profile/change_pin.dart';
import 'package:bewell_pro_core/presentation/onboarding/profile/pages/user_profile_page.dart';
import 'package:sghi_core/domain_objects/entities/auth_credential_response.dart';
import 'package:sghi_core/domain_objects/entities/user_profile.dart';
import '../../../../mocks/mock_utils.dart';
import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  setupFirebaseAuthMocks();
  group('ProfileChangePin', () {
    setUp(() async {
      await Firebase.initializeApp();
    });
    late Store<CoreState> store;

    setUp(() {
      store = Store<CoreState>(initialState: CoreState.initial());
    });

    testWidgets('ProfileChangePin renders correctly',
        (WidgetTester tester) async {
      store.dispatch(BatchUpdateUserStateAction(
          userProfile: UserProfile(primaryPhoneNumber: testPhoneNumber),
          auth: AuthCredentialResponse(isChangePin: false)));

      await mockNetworkImages(() async {
        await buildTestWidget(
          tester: tester,
          store: store,
          widget: const ProfileChangePin(),
        );

        expect(find.byType(OnboardingScaffold), findsOneWidget);
        expect(find.text(changePinTitle), findsOneWidget);
        expect(find.text(changePinMessage), findsOneWidget);

        // tap cancel button

        final GestureDetector saveButton = find
            .widgetWithText(GestureDetector, verificationCancelText)
            .evaluate()
            .first
            .widget as GestureDetector;
        saveButton.onTap!();

        await tester.pumpAndSettle();

        expect(find.byType(UserProfilePage), findsOneWidget);
      });
    });
  });
}
