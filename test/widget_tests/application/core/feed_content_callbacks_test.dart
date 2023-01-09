// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:sghi_core/domain_objects/entities/user_profile.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:sghi_core/domain_objects/value_objects/phone_number.dart';
import 'package:sghi_core/user_feed/src/domain/value_objects/constants.dart';

// Project imports:
import 'package:bewell_pro_core/application/core/services/feed_content_callbacks.dart';
import 'package:bewell_pro_core/application/redux/actions/user_state_actions/batch_update_user_state_action.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/presentation/onboarding/profile/profile_contact_details.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  group('getFeedActionCallbacks function', () {
    const Key key = Key('test_navigation_button');
    final Store<CoreState> store =
        Store<CoreState>(initialState: CoreState.initial());
    testWidgets('navigates to ProfileContactDetails',
        (WidgetTester tester) async {
      await store.dispatch(BatchUpdateUserStateAction(
          userProfile: UserProfile(
        primaryPhoneNumber: PhoneNumber.withValue('+2547123455678'),
      )));

      await mockNetworkImages(() async {
        await buildTestWidget(
            tester: tester,
            store: store,
            widget: Builder(builder: (BuildContext context) {
              final Map<String, Function> callbacks =
                  getFeedActionCallbacks(context: context);
              final Function callback = callbacks[kVerifyEmail]!;
              return Center(
                child: ElevatedButton(
                  key: key,
                  onPressed: () => callback(),
                  child: const Text(''),
                ),
              );
            }));
        await tester.tap(find.byKey(key));
        await tester.pumpAndSettle();

        expect(find.byType(ProfileContactDetails), findsOneWidget);
      });
    });

    testWidgets('displays Snackbar', (WidgetTester tester) async {
      await buildTestWidget(
          tester: tester,
          store: store,
          widget: Builder(builder: (BuildContext context) {
            final Map<String, Function> callbacks =
                getFeedActionCallbacks(context: context);
            final Function callback = callbacks[kCompleteProfile]!;
            return Center(
              child: ElevatedButton(
                key: key,
                onPressed: () => callback(),
                child: const Text(''),
              ),
            );
          }));

      await tester.tap(find.byKey(key));
      await tester.pumpAndSettle();

      expect(find.text('Coming soon'), findsOneWidget);
    });
  });
}
