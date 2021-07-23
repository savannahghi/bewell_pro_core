import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/redux/actions/user_state_actions/batch_update_user_state_action.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/application/redux/states/user_state.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/pages/pin_verification_page.dart';
import 'package:bewell_pro_core/presentation/onboarding/profile/communication_settings.dart';
import 'package:bewell_pro_core/presentation/onboarding/profile/pages/try_new_features_page.dart';
import 'package:bewell_pro_core/presentation/onboarding/profile/pages/user_profile_page.dart';
import 'package:domain_objects/entities.dart';
import 'package:bewell_pro_core/presentation/onboarding/profile/profile_contact_details.dart';
import 'package:bewell_pro_core/presentation/onboarding/profile/widgets/profile_detail.dart';
import 'package:bewell_pro_core/presentation/onboarding/profile/widgets/profile_master_detail.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:user_profile/term_and_conditions.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('UserProfile Page', () {
    late Store<CoreState> store;

    setUp(() {
      store = Store<CoreState>(initialState: CoreState.initial());
    });

    Future<void> buildPage(
        WidgetTester tester, NavigatorObserver navigatorObserver) async {
      store.dispatch(
        BatchUpdateUserStateAction(
            userProfile: UserProfile(
          primaryPhoneNumber: testPhoneNumber,
        )),
      );

      await mockNetworkImages(() async {
        await buildTestWidget(
          tester: tester,
          store: store,
          widget: Builder(builder: (BuildContext context) {
            return UserProfilePage();
          }),
          navigatorObservers: <NavigatorObserver>[navigatorObserver],
        );
      });
    }

    testWidgets('should render tablet widgets', (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = tabletPortrait;

      store.dispatch(
        BatchUpdateUserStateAction(
          userProfile: UserProfile(
            userBioData: BioData(
              firstName: testFirstName,
              lastName: testLastName,
              gender: testGender,
              dateOfBirth: testDOB,
            ),
            primaryPhoneNumber: testPhoneNumber,
          ),
        ),
      );

      await mockNetworkImages(() async {
        await buildTestWidget(
          tester: tester,
          store: store,
          widget: Builder(builder: (BuildContext context) {
            return UserProfilePage();
          }),
        );
      });

      await tester.pumpAndSettle();

      expect(find.byKey(AppWidgetKeys.profileMasterDetailRowKey), findsWidgets);
      expect(find.byType(ProfileMasterDetail), findsOneWidget);
      expect(find.byType(ProfileDetail), findsOneWidget);

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });

    testWidgets('SILProfileBanner arrow back btn navigates correctly',
        (WidgetTester tester) async {
      final MockNavigatorObserver mockObserver = MockNavigatorObserver();

      Store<CoreState> testStore;
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
              firstName: Name.withValue(''),
              lastName: Name.withValue(''),
              dateOfBirth: UNKNOWN,
              gender: Gender.male,
            ),
          ),
        ),
      );

      testStore = Store<CoreState>(initialState: state);

      await mockNetworkImages(() async {
        await buildTestWidget(
          navigatorObservers: <NavigatorObserver>[mockObserver],
          tester: tester,
          store: testStore,
          widget: Builder(builder: (BuildContext context) {
            return UserProfilePage();
          }),
        );
      });

      expect(find.byIcon(Icons.arrow_back), findsOneWidget);
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();

      // verify navigation was successful
      expect(find.byType(UserProfilePage), findsNothing);
    });

    testWidgets('tapping contactInfo navigates correctly',
        (WidgetTester tester) async {
      final List<Route<dynamic>?> routes = <Route<dynamic>?>[];

      final TestNavigatorObserver navigatorObserver = TestNavigatorObserver(
        onPush: (Route<dynamic>? route, Route<dynamic>? previousRoute) {
          if (route?.settings.name != '/') {
            routes.add(route);
          }
        },
      );

      await buildPage(tester, navigatorObserver);
      final Finder contactInfoFinder = find.text(contactInfo);
      expect(contactInfoFinder, findsOneWidget);
      await tester.tap(contactInfoFinder);
      expect(routes[0], isA<MaterialPageRoute<ProfileContactDetails>>());
    });

    testWidgets('tapping change pin navigates correctly',
        (WidgetTester tester) async {
      final List<Route<dynamic>?> routes = <Route<dynamic>?>[];

      final TestNavigatorObserver navigatorObserver = TestNavigatorObserver(
        onPush: (Route<dynamic>? route, Route<dynamic>? previousRoute) {
          if (route?.settings.name != '/') {
            routes.add(route);
          }
        },
      );

      await buildPage(tester, navigatorObserver);
      expect(find.text(changePINText), findsOneWidget);
      await tester.tap(find.text(changePINText));
      expect(routes[0], isA<MaterialPageRoute<PinVerificationPage>>());
    });

    testWidgets('tapping communication settings navigates correctly',
        (WidgetTester tester) async {
      final List<Route<dynamic>?> routes = <Route<dynamic>?>[];

      final TestNavigatorObserver navigatorObserver = TestNavigatorObserver(
        onPush: (Route<dynamic>? route, Route<dynamic>? previousRoute) {
          if (route?.settings.name != '/') {
            routes.add(route);
          }
        },
      );

      await buildPage(tester, navigatorObserver);
      expect(find.text(communicationSettingsText), findsOneWidget);
      await tester.tap(find.text(communicationSettingsText));
      expect(routes[0], isA<MaterialPageRoute<CommunicationSettingsPage>>());
    });

    testWidgets('tapping try new features navigates correctly',
        (WidgetTester tester) async {
      final List<Route<dynamic>?> routes = <Route<dynamic>?>[];

      final TestNavigatorObserver navigatorObserver = TestNavigatorObserver(
        onPush: (Route<dynamic>? route, Route<dynamic>? previousRoute) {
          if (route?.settings.name != '/') {
            routes.add(route);
          }
        },
      );

      await buildPage(tester, navigatorObserver);
      expect(find.text(tryNewFeaturesText), findsOneWidget);
      await tester.tap(find.text(tryNewFeaturesText));
      expect(routes[0], isA<MaterialPageRoute<TryNewFeaturesPage>>());
    });

    testWidgets('tapping terms of service navigates correctly',
        (WidgetTester tester) async {
      final List<Route<dynamic>?> routes = <Route<dynamic>?>[];

      final TestNavigatorObserver navigatorObserver = TestNavigatorObserver(
        onPush: (Route<dynamic>? route, Route<dynamic>? previousRoute) {
          if (route?.settings.name != '/') {
            routes.add(route);
          }
        },
      );

      await buildPage(tester, navigatorObserver);
      expect(find.text(termsOfServiceText), findsOneWidget);
      await tester.ensureVisible(find.text(termsOfServiceText));
      await tester.tap(find.text(termsOfServiceText));
      expect(routes[0], isA<MaterialPageRoute<TermsAndConditionsPage>>());
    });

    testWidgets(
        'tapping terms of service on a large screen navigates correctly',
        (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = tabletLandscape;

      final List<Route<dynamic>?> routes = <Route<dynamic>?>[];

      final TestNavigatorObserver navigatorObserver = TestNavigatorObserver(
        onPush: (Route<dynamic>? route, Route<dynamic>? previousRoute) {
          if (route?.settings.name != '/') {
            routes.add(route);
          }
        },
      );

      await buildPage(tester, navigatorObserver);
      expect(find.text(termsOfServiceText), findsOneWidget);
      await tester.ensureVisible(find.text(termsOfServiceText));
      await tester.tap(find.text(termsOfServiceText));
      expect(routes[0], isA<MaterialPageRoute<TermsAndConditionsPage>>());

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });

    testWidgets('should render user profile correctly in large screen',
        (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = tabletLandscape;

      final ProfileSubject profileSubject = ProfileSubject();

      store.dispatch(BatchUpdateUserStateAction(
          userProfile: UserProfile(
        primaryPhoneNumber: testPhoneNumber,
      )));

      await mockNetworkImages(() async {
        await buildTestWidget(
            tester: tester, store: store, widget: UserProfilePage());

        //verify UI renders correctly
        expect(find.text(changePINText), findsWidgets);
        expect(find.text(contactInfo), findsNWidgets(2));
        expect(find.text(communicationSettingsText), findsWidgets);
        expect(find.text(tryNewFeaturesText), findsWidgets);
        expect(find.text(termsOfServiceText), findsWidgets);

        /// verify contact info navigates
        await tester.tap(find.byKey(const Key(contactInfo)));
        await tester.pump();
        expect(profileSubject.selectedTile.value, contactInfo);

        await tester.tap(find.byKey(const Key(changePINText)));
        await tester.pump();
        expect(profileSubject.selectedTile.value, contactInfo);

        await tester.tap(find.byKey(const Key(changePINText)));
        await tester.pump();
        expect(profileSubject.selectedTile.value, contactInfo);

        await tester.tap(find.byKey(const Key(communicationSettingsText)));
        await tester.pump();
        expect(profileSubject.selectedTile.value, contactInfo);

        await tester.tap(find.byKey(const Key(tryNewFeaturesText)));
        await tester.pump();
        expect(profileSubject.selectedTile.value, contactInfo);

        await tester.tap(find.byKey(const Key(termsOfServiceText)));
        await tester.pump();
        expect(profileSubject.selectedTile.value, contactInfo);

        addTearDown(() {
          tester.binding.window.clearPhysicalSizeTestValue();
          tester.binding.window.clearDevicePixelRatioTestValue();
        });
      });
    });
  });
}
