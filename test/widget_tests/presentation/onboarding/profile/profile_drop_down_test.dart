import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';
import 'package:bewell_pro_core/application/redux/states/user_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/core/home/widgets/profile_drop_down.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/pages/phone_login_page.dart';
import 'package:bewell_pro_core/presentation/onboarding/profile/pages/user_profile_page.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:domain_objects/entities.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:misc_utilities/event_bus.dart';

import '../../../../mocks/test_helpers.dart';

void main() {
  group('ProfileDropDown', () {
    final EventBus eventBus = EventBus();

    testWidgets('should open & display Profile & logout option',
        (WidgetTester tester) async {
      Store<AppState> store;
      final AppState state = AppState.initial();
      store = Store<AppState>(initialState: state);
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: ProfileDropDown(),
      );
      expect(find.byKey(AppWidgetKeys.popupMenuButtonKey), findsOneWidget);

      await tester.tap(find.byKey(AppWidgetKeys.popupMenuButtonKey));
      await tester.pumpAndSettle();
      expect(
          find.byKey(AppWidgetKeys.profilePopMenuItemKeyKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.logoutPopMenuItemKeyKey), findsOneWidget);
    });

    testWidgets('should logout user when logout option is selected',
        (WidgetTester tester) async {
      Store<AppState> store;
      final AppState state = AppState.initial();
      store = Store<AppState>(initialState: state);
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: ProfileDropDown(),
      );
      expect(find.byKey(AppWidgetKeys.popupMenuButtonKey), findsOneWidget);

      // open dropdown
      await tester.tap(find.byKey(AppWidgetKeys.popupMenuButtonKey));
      await tester.pumpAndSettle();

      // verify dropdown options are displayed
      expect(find.byKey(AppWidgetKeys.logoutPopMenuItemKeyKey), findsOneWidget);
      expect(
          find.byKey(AppWidgetKeys.profilePopMenuItemKeyKey), findsOneWidget);

      // tap logout menuItem
      await tester.tap(find.byKey(AppWidgetKeys.logoutPopMenuItemKeyKey));
      await tester.pumpAndSettle(const Duration(seconds: 5));

      // verify user is logged out
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.byType(ProfileDropDown), findsNothing);

      // verify user is navigated to phoneLogin page
      expect(find.byType(PhoneLoginPage), findsOneWidget);
    });

    testWidgets('logoutButton works correctly', (WidgetTester tester) async {
      await mockNetworkImages(() async {
        Store<AppState> store;
        final AppState state = AppState(
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
                firstName: Name.withValue(''),
                lastName: Name.withValue(''),
                dateOfBirth: UNKNOWN,
                gender: Gender.male,
              ),
            ),
          ),
        );

        store = Store<AppState>(initialState: state);

        await buildTestWidget(
          eventBus: eventBus,
          tester: tester,
          store: store,
          widget: ProfileDropDown(),
        );

        expect(find.byKey(AppWidgetKeys.popupMenuButtonKey), findsOneWidget);

        // open dropdown
        await tester.tap(find.byKey(AppWidgetKeys.popupMenuButtonKey));
        await tester.pumpAndSettle();

        // verify dropdown options are displayed
        expect(
            find.byKey(AppWidgetKeys.logoutPopMenuItemKeyKey), findsOneWidget);
        expect(
            find.byKey(AppWidgetKeys.profilePopMenuItemKeyKey), findsOneWidget);

        // tap profile menuItem
        await tester.tap(find.byKey(AppWidgetKeys.profilePopMenuItemKeyKey));
        await tester.pumpAndSettle(const Duration(seconds: 5));

        // verify navigates to profile
        expect(find.byType(UserProfilePage), findsOneWidget);
        expect(find.byType(ProfileDropDown), findsNothing);
      });
    });
  });
}
