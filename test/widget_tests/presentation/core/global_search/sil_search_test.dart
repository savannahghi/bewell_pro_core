import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/redux/actions/navigation_actions/navigation_action.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';
import 'package:bewell_pro_core/application/redux/states/user_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/pages/patient_search_page.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/pages/patient_registration.dart';
import 'package:bewell_pro_core/presentation/core/global_search/models/search_result.dart';
import 'package:bewell_pro_core/presentation/core/global_search/models/search_suggestion.dart';
import 'package:bewell_pro_core/presentation/core/global_search/sil_search.dart';
import 'package:bewell_pro_core/presentation/core/global_search/widgets/search_widget.dart';
import 'package:bewell_pro_core/presentation/core/help_center/pages/help_center_page.dart';
import 'package:bewell_pro_core/presentation/onboarding/profile/widgets/profile_master_detail.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:domain_objects/entities.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('sil search and search widget pages', () {
    final Store<AppState> store =
        Store<AppState>(initialState: AppState.initial());
    final SearchWidget delegate = SearchWidget();
    final List<SearchResult> suggestionList = <SearchResult>[];

    // finders
    final Finder searchGestureDetectorFinder =
        find.byKey(AppWidgetKeys.searchGestureDetector);
    final Finder backButtonFinder = find.byKey(AppWidgetKeys.backKey);
    final Finder searchAbsorbFinder = find.byKey(AppWidgetKeys.searchAbsorb);
    final Finder appSearchInputFinder =
        find.byKey(AppWidgetKeys.appSearchInputKey);
    final Finder searchCancelFinder = find.byKey(AppWidgetKeys.searchCancel);
    final Finder emptySuggestionListFinder =
        find.byKey(AppWidgetKeys.emptySuggestionListKey);
    final Finder suggestionListKey =
        find.byKey(AppWidgetKeys.suggestionListKey);
    final Finder suggestionListViewFinder =
        find.byKey(AppWidgetKeys.suggestionListViewKey);

    final StreamController<dynamic> streamController =
        StreamController<dynamic>.broadcast();

    final Stream<dynamic> _stream = streamController.stream.asBroadcastStream();

    _stream.listen((dynamic event) {});

    testWidgets('render correctly', (WidgetTester tester) async {
      await buildTestWidget(store: store, tester: tester, widget: SILSearch());

      expect(find.byType(Container), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.rowKey), findsOneWidget);
    });

    testWidgets('back button navigates correctly', (WidgetTester tester) async {
      await buildTestWidget(store: store, tester: tester, widget: SILSearch());

      expect(searchGestureDetectorFinder, findsOneWidget);
      await tester.tap(searchGestureDetectorFinder);
      await tester.pumpAndSettle();
      expect(backButtonFinder, findsOneWidget);

      await tester.tap(backButtonFinder);
      await tester.pumpAndSettle();
      expect(find.byType(SILSearch), findsOneWidget);
    });

    testWidgets('help center recent search item navigates correctly',
        (WidgetTester tester) async {
      await mockNetworkImages(() async {
        await buildTestWidget(
            store: store, tester: tester, widget: SILSearch());

        // verify UI renders correctly
        expect(searchGestureDetectorFinder, findsOneWidget);

        // tap on search box
        await tester.tap(searchGestureDetectorFinder);
        await tester.pumpAndSettle();

        // verify recent searches show
        expect(find.text('Recent Searches'), findsOneWidget);
        expect(find.text(helpCenter), findsOneWidget);
        expect(find.text(userProfile), findsOneWidget);

        //tap help center list tile
        await tester.tap(find.text(helpCenter));
        await tester.pumpAndSettle();

        //verify navigation
        expect(find.text('Be.Well support center'), findsOneWidget);
      });
    });

    testWidgets('profile recent search item navigates correctly',
        (WidgetTester tester) async {
      final Store<AppState> store = Store<AppState>(
        initialState: AppState(
          navigationState: Navigation(
              drawerSelectedIndex: -1,
              primaryActions: primaryActionsMockedData,
              secondaryActions: secondaryActionsMockedData,
              bottomBarSelectedIndex: -1),
          userState: UserState(
            userProfile: UserProfile(
              userBioData: BioData(
                firstName: testFirstName,
                lastName: testLastName,
                dateOfBirth: testDate,
                gender: testGender,
              ),
              primaryEmailAddress: testEmailAddress,
              primaryPhoneNumber: testPhoneNumber,
            ),
          ),
        ),
      );

      await mockNetworkImages(() async {
        await buildTestWidget(
          tester: tester,
          store: store,
          widget: Builder(builder: (BuildContext context) {
            return SILSearch();
          }),
        );
        // verify UI renders correctly
        expect(searchGestureDetectorFinder, findsOneWidget);

        // tap on search box
        await tester.tap(searchGestureDetectorFinder);
        await tester.pumpAndSettle();

        // verify recent searches show
        expect(find.text('Recent Searches'), findsOneWidget);
        expect(find.text(helpCenter), findsOneWidget);
        expect(find.text(userProfile), findsOneWidget);

        //tap profile list tile
        await tester.tap(find.text(userProfile));
        await tester.pumpAndSettle();

        //verify navigation
        expect(find.text('Recent Searches'), findsNothing);
      });
    });

    testWidgets('profile suggested item navigates correctly',
        (WidgetTester tester) async {
      final Store<AppState> store = Store<AppState>(
        initialState: AppState(
          navigationState: Navigation(
              drawerSelectedIndex: -1,
              primaryActions: primaryActionsMockedData,
              secondaryActions: secondaryActionsMockedData,
              bottomBarSelectedIndex: -1),
          userState: UserState(
            userProfile: UserProfile(
              userBioData: BioData(
                firstName: testFirstName,
                lastName: testLastName,
                dateOfBirth: testDate,
                gender: testGender,
              ),
              primaryEmailAddress: testEmailAddress,
              primaryPhoneNumber: testPhoneNumber,
            ),
          ),
        ),
      );
      await mockNetworkImages(() async {
        await buildTestWidget(
            store: store, tester: tester, widget: SILSearch());

        // verify UI renders correctly
        expect(searchGestureDetectorFinder, findsOneWidget);
        expect(searchAbsorbFinder, findsOneWidget);
        expect(appSearchInputFinder, findsOneWidget);

        // tap on search box
        await tester.tap(searchGestureDetectorFinder);
        await tester.pumpAndSettle();

        // enter text
        tester.binding.testTextInput.enterText('profile');
        expect(find.text(userProfile), findsOneWidget);

        //tap profile list tile
        await tester.tap(find.text(userProfile));
        await tester.pumpAndSettle();

        //verify navigation
        expect(find.text('Recent Searches'), findsNothing);
      });
    });

    testWidgets('find patient suggested item navigates correctly',
        (WidgetTester tester) async {
      final Store<AppState> store = Store<AppState>(
        initialState: AppState(
          navigationState: Navigation(
              drawerSelectedIndex: -1,
              primaryActions: primaryActionsMockedData,
              secondaryActions: secondaryActionsMockedData,
              bottomBarSelectedIndex: 0),
          userState: UserState(
            userProfile: UserProfile(
              userBioData: BioData(
                firstName: testFirstName,
                lastName: testLastName,
                dateOfBirth: testDate,
                gender: testGender,
              ),
              primaryEmailAddress: testEmailAddress,
              primaryPhoneNumber: testPhoneNumber,
            ),
          ),
        ),
      );

      await buildTestWidget(store: store, tester: tester, widget: SILSearch());

      // verify UI renders correctly
      expect(searchGestureDetectorFinder, findsOneWidget);
      expect(searchAbsorbFinder, findsOneWidget);
      expect(appSearchInputFinder, findsOneWidget);

      // tap on search box
      await tester.tap(searchGestureDetectorFinder);
      await tester.pumpAndSettle();

      // enter text
      tester.binding.testTextInput.enterText('find patient');
      await tester.pumpAndSettle();

      expect(find.text(patientFind), findsOneWidget);

      //tap patient search list tile
      await tester.tap(find.text(patientFind));
      await tester.pumpAndSettle();

      // //verify navigation
      expect(find.text('Recent Searches'), findsNothing);
    });

    testWidgets('add patient suggested item navigates correctly',
        (WidgetTester tester) async {
      final Store<AppState> store = Store<AppState>(
        initialState: AppState(
          navigationState: Navigation(
              drawerSelectedIndex: -1,
              primaryActions: primaryActionsMockedData,
              secondaryActions: secondaryActionsMockedData,
              bottomBarSelectedIndex: 0),
          userState: UserState(
            userProfile: UserProfile(
              userBioData: BioData(
                firstName: testFirstName,
                lastName: testLastName,
                dateOfBirth: testDate,
                gender: testGender,
              ),
              primaryEmailAddress: testEmailAddress,
              primaryPhoneNumber: testPhoneNumber,
            ),
          ),
        ),
      );
      await buildTestWidget(store: store, tester: tester, widget: SILSearch());

      // verify UI renders correctly
      expect(searchGestureDetectorFinder, findsOneWidget);
      expect(searchAbsorbFinder, findsOneWidget);
      expect(appSearchInputFinder, findsOneWidget);

      // tap on search box
      await tester.tap(searchGestureDetectorFinder);
      await tester.pumpAndSettle();

      // enter text
      tester.binding.testTextInput.enterText('add patient');
      await tester.pumpAndSettle();

      expect(find.text(patientAdd), findsOneWidget);

      //tap patient search list tile
      await tester.tap(find.text(patientAdd));
      await tester.pumpAndSettle();

      //verify navigation
      expect(find.text('Recent Searches'), findsNothing);
    });

    testWidgets('search text field opens search delegate page on tap',
        (WidgetTester tester) async {
      await buildTestWidget(store: store, tester: tester, widget: SILSearch());

      expect(searchAbsorbFinder, findsOneWidget);
      expect(appSearchInputFinder, findsOneWidget);

      await tester.enterText(appSearchInputFinder, 'Profile');
      expect(searchGestureDetectorFinder, findsOneWidget);

      await tester.tap(searchGestureDetectorFinder);
      await tester.pumpAndSettle();

      expect(find.text(whatWouldYouLikeToDo), findsNothing);
      expect(searchCancelFinder, findsOneWidget);

      await tester.tap(searchCancelFinder);
      await tester.pump();

      expect(appSearchInputFinder, findsOneWidget);
      expect(find.text(whatWouldYouLikeToDo), findsOneWidget);
    });

    testWidgets('return no suggestions', (WidgetTester tester) async {
      await buildTestWidget(store: store, tester: tester, widget: SILSearch());

      expect(searchAbsorbFinder, findsOneWidget);
      expect(appSearchInputFinder, findsOneWidget);

      await tester.enterText(appSearchInputFinder, 'Profile');
      expect(searchGestureDetectorFinder, findsOneWidget);

      await tester.tap(searchGestureDetectorFinder);
      await tester.pump();

      expect(delegate.query, '');
      expect(suggestionList, hasLength(0));
    });

    testWidgets('return recent searches with empty query',
        (WidgetTester tester) async {
      await buildTestWidget(store: store, tester: tester, widget: SILSearch());

      expect(searchAbsorbFinder, findsOneWidget);
      expect(appSearchInputFinder, findsOneWidget);

      await tester.enterText(appSearchInputFinder, 'Profile');
      expect(searchGestureDetectorFinder, findsOneWidget);

      await tester.tap(searchGestureDetectorFinder);
      await tester.pump();

      expect(delegate.query, '');
      expect(suggestionList, hasLength(0));
      expect(recentSearches, recentSearches);
    });

    testWidgets(
        'navigates to help center when recent searches(help center) is tapped',
        (WidgetTester tester) async {
      await buildTestWidget(store: store, tester: tester, widget: SILSearch());

      expect(searchAbsorbFinder, findsOneWidget);

      expect(appSearchInputFinder, findsOneWidget);
      await tester.enterText(appSearchInputFinder, 'Profile');
      expect(searchGestureDetectorFinder, findsOneWidget);

      await tester.tap(searchGestureDetectorFinder);
      await tester.pumpAndSettle();

      expect(delegate.query, '');
      expect(suggestionList, hasLength(0));
      expect(recentSearches, recentSearches);
      expect(find.text(helpCenter), findsOneWidget);
    });

    testWidgets(
        'navigates to profile page when recent searches(my profile) is tapped',
        (WidgetTester tester) async {
      await buildTestWidget(store: store, tester: tester, widget: SILSearch());

      expect(searchAbsorbFinder, findsOneWidget);
      expect(appSearchInputFinder, findsOneWidget);

      await tester.enterText(appSearchInputFinder, 'Profile');
      expect(searchGestureDetectorFinder, findsOneWidget);

      await tester.tap(searchGestureDetectorFinder);
      await tester.pumpAndSettle();

      expect(delegate.query, '');
      expect(suggestionList, hasLength(0));
      expect(recentSearches, recentSearches);

      expect(find.text(userProfile), findsOneWidget);
    });

    testWidgets('return search suggestions', (WidgetTester tester) async {
      await buildTestWidget(store: store, tester: tester, widget: SILSearch());

      expect(searchAbsorbFinder, findsOneWidget);
      expect(appSearchInputFinder, findsOneWidget);

      await tester.enterText(appSearchInputFinder, 'Profile');
      expect(searchGestureDetectorFinder, findsOneWidget);

      await tester.tap(searchGestureDetectorFinder);
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'profile');
      await tester.pump();

      expect(searchSuggestions, searchSuggestions);
      expect(find.text('profile'), findsOneWidget);
    });

    testWidgets('return text when suggestion list is empty',
        (WidgetTester tester) async {
      await buildTestWidget(store: store, tester: tester, widget: SILSearch());

      expect(searchAbsorbFinder, findsOneWidget);
      expect(appSearchInputFinder, findsOneWidget);

      await tester.enterText(appSearchInputFinder, 'Profile');
      expect(searchGestureDetectorFinder, findsOneWidget);

      await tester.tap(searchGestureDetectorFinder);
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'someLongSuggestion');
      await tester.pumpAndSettle();
      expect(emptySuggestionListFinder, findsOneWidget);
    });

    testWidgets('return list when suggestion list is not empty',
        (WidgetTester tester) async {
      final Store<AppState> store = Store<AppState>(
        initialState: AppState(
          navigationState: Navigation(
              drawerSelectedIndex: -1,
              primaryActions: primaryActionsMockedData,
              secondaryActions: secondaryActionsMockedData,
              bottomBarSelectedIndex: -1),
          userState: UserState(
            userProfile: UserProfile(
              userBioData: BioData(
                firstName: testFirstName,
                lastName: testLastName,
                dateOfBirth: testDate,
                gender: testGender,
              ),
              primaryEmailAddress: testEmailAddress,
              primaryPhoneNumber: testPhoneNumber,
            ),
          ),
        ),
      );
      await buildTestWidget(store: store, tester: tester, widget: SILSearch());

      expect(searchAbsorbFinder, findsOneWidget);
      expect(appSearchInputFinder, findsOneWidget);

      await tester.enterText(appSearchInputFinder, 'Profile');
      expect(searchGestureDetectorFinder, findsOneWidget);

      await tester.tap(searchGestureDetectorFinder);
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'search for a patient');
      await tester.pump();

      expect(suggestionListKey, findsOneWidget);
    });

    testWidgets('navigates to profile page when suggestion list tile is tapped',
        (WidgetTester tester) async {
      await buildTestWidget(store: store, tester: tester, widget: SILSearch());

      expect(searchAbsorbFinder, findsOneWidget);
      expect(appSearchInputFinder, findsOneWidget);

      await tester.enterText(appSearchInputFinder, 'Profile');
      expect(searchGestureDetectorFinder, findsOneWidget);

      await tester.tap(searchGestureDetectorFinder);
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'my profile');
      await tester.pump();

      expect(suggestionListKey, findsOneWidget);
      expect(suggestionListViewFinder, findsOneWidget);
    });

    testWidgets(
        'navigates to help center page when suggestion list tile is tapped',
        (WidgetTester tester) async {
      await buildTestWidget(store: store, tester: tester, widget: SILSearch());

      expect(searchAbsorbFinder, findsOneWidget);
      expect(appSearchInputFinder, findsOneWidget);

      await tester.enterText(appSearchInputFinder, 'Profile');
      expect(searchGestureDetectorFinder, findsOneWidget);

      await tester.tap(searchGestureDetectorFinder);
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'help');
      await tester.pump();

      expect(suggestionListKey, findsOneWidget);
      expect(suggestionListViewFinder, findsOneWidget);
      await tester.tap(suggestionListViewFinder);

      await tester.pumpAndSettle();

      expect(find.byKey(AppWidgetKeys.helpCenterListViewKey), findsOneWidget);
    });

    testWidgets(
        'navigates to search patient page when suggestion list tile is tapped',
        (WidgetTester tester) async {
      final Store<AppState> store = Store<AppState>(
        initialState: AppState(
          navigationState: Navigation(
              drawerSelectedIndex: -1,
              primaryActions: primaryActionsMockedData,
              secondaryActions: secondaryActionsMockedData,
              bottomBarSelectedIndex: -1),
          userState: UserState(
            userProfile: UserProfile(
              userBioData: BioData(
                firstName: testFirstName,
                lastName: testLastName,
                dateOfBirth: testDate,
                gender: testGender,
              ),
              primaryEmailAddress: testEmailAddress,
              primaryPhoneNumber: testPhoneNumber,
            ),
          ),
        ),
      );
      await buildTestWidget(store: store, tester: tester, widget: SILSearch());

      expect(searchAbsorbFinder, findsOneWidget);
      expect(appSearchInputFinder, findsOneWidget);

      await tester.enterText(appSearchInputFinder, 'Profile');
      expect(searchGestureDetectorFinder, findsOneWidget);

      await tester.tap(searchGestureDetectorFinder);
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'search patient');
      await tester.pump();

      expect(suggestionListKey, findsOneWidget);
      expect(suggestionListViewFinder, findsOneWidget);
    });

    testWidgets(
        'navigates to register patient page when suggestion list tile is tapped',
        (WidgetTester tester) async {
      final Store<AppState> store = Store<AppState>(
        initialState: AppState(
          navigationState: Navigation(
              drawerSelectedIndex: -1,
              primaryActions: primaryActionsMockedData,
              secondaryActions: secondaryActionsMockedData,
              bottomBarSelectedIndex: -1),
          userState: UserState(
            userProfile: UserProfile(
              userBioData: BioData(
                firstName: testFirstName,
                lastName: testLastName,
                dateOfBirth: testDate,
                gender: testGender,
              ),
              primaryEmailAddress: testEmailAddress,
              primaryPhoneNumber: testPhoneNumber,
            ),
          ),
        ),
      );
      await buildTestWidget(store: store, tester: tester, widget: SILSearch());

      expect(searchAbsorbFinder, findsOneWidget);
      expect(appSearchInputFinder, findsOneWidget);

      await tester.enterText(appSearchInputFinder, 'Profile');
      expect(searchGestureDetectorFinder, findsOneWidget);

      await tester.tap(searchGestureDetectorFinder);
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'add patient');
      await tester.pump();

      expect(suggestionListKey, findsOneWidget);
      expect(suggestionListViewFinder, findsOneWidget);
    });

    testWidgets('return text when query length < 2',
        (WidgetTester tester) async {
      await buildTestWidget(store: store, tester: tester, widget: SILSearch());

      expect(searchAbsorbFinder, findsOneWidget);
      expect(appSearchInputFinder, findsOneWidget);

      await tester.enterText(appSearchInputFinder, 'Profile');
      expect(searchGestureDetectorFinder, findsOneWidget);

      await tester.tap(searchGestureDetectorFinder);
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 's');
      await tester.pump();

      await tester.testTextInput.receiveAction(TextInputAction.search);
      await tester.pump();

      expect(
          find.byKey(AppWidgetKeys.smallQueryBuildResultKey), findsOneWidget);
    });

    testWidgets('return search results when query is empty',
        (WidgetTester tester) async {
      await buildTestWidget(store: store, tester: tester, widget: SILSearch());

      expect(searchAbsorbFinder, findsOneWidget);
      expect(appSearchInputFinder, findsOneWidget);

      await tester.enterText(appSearchInputFinder, 'Profile');
      expect(searchGestureDetectorFinder, findsOneWidget);

      await tester.tap(searchGestureDetectorFinder);
      await tester.pumpAndSettle();

      await tester.showKeyboard(find.byType(TextField));
      await tester.testTextInput.receiveAction(TextInputAction.search);
      await tester.pump();

      expect(
          find.byKey(AppWidgetKeys.emptyQueryBuildResultKey), findsOneWidget);
    });

    testWidgets('return search results when query is not empty',
        (WidgetTester tester) async {
      await buildTestWidget(store: store, tester: tester, widget: SILSearch());

      expect(searchAbsorbFinder, findsOneWidget);
      expect(appSearchInputFinder, findsOneWidget);

      await tester.enterText(appSearchInputFinder, 'Profile');
      expect(searchGestureDetectorFinder, findsOneWidget);

      await tester.tap(searchGestureDetectorFinder);
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'search patient');
      await tester.pump();

      await tester.testTextInput.receiveAction(TextInputAction.search);
      await tester.pump();

      expect(searchResults, searchResults);
    });

    testWidgets('return text when result list is empty',
        (WidgetTester tester) async {
      await buildTestWidget(store: store, tester: tester, widget: SILSearch());

      expect(searchAbsorbFinder, findsOneWidget);
      expect(appSearchInputFinder, findsOneWidget);

      await tester.enterText(appSearchInputFinder, 'Profile');
      expect(searchGestureDetectorFinder, findsOneWidget);

      await tester.tap(searchGestureDetectorFinder);
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'someLongSuggestion');
      await tester.pump();

      await tester.testTextInput.receiveAction(TextInputAction.search);
      await tester.pump();

      expect(find.byKey(AppWidgetKeys.emptyResultListKey), findsOneWidget);
    });

    testWidgets('return list when result list is not empty',
        (WidgetTester tester) async {
      final Store<AppState> store = Store<AppState>(
        initialState: AppState(
          navigationState: Navigation(
              drawerSelectedIndex: -1,
              primaryActions: primaryActionsMockedData,
              secondaryActions: secondaryActionsMockedData,
              bottomBarSelectedIndex: -1),
          userState: UserState(
            userProfile: UserProfile(
              userBioData: BioData(
                firstName: testFirstName,
                lastName: testLastName,
                dateOfBirth: testDate,
                gender: testGender,
              ),
              primaryEmailAddress: testEmailAddress,
              primaryPhoneNumber: testPhoneNumber,
            ),
          ),
        ),
      );
      await buildTestWidget(store: store, tester: tester, widget: SILSearch());

      expect(searchAbsorbFinder, findsOneWidget);
      expect(appSearchInputFinder, findsOneWidget);

      await tester.enterText(appSearchInputFinder, 'Profile');
      expect(searchGestureDetectorFinder, findsOneWidget);

      await tester.tap(searchGestureDetectorFinder);
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'patient registration');
      await tester.pump();

      await tester.testTextInput.receiveAction(TextInputAction.search);
      await tester.pump();

      expect(find.byKey(AppWidgetKeys.emptyResultListKey), findsNothing);
    });

    testWidgets('navigates to profile page when result list tile is tapped',
        (WidgetTester tester) async {
      final Store<AppState> store = Store<AppState>(
        initialState: AppState(
          navigationState: Navigation(
              drawerSelectedIndex: -1,
              primaryActions: primaryActionsMockedData,
              secondaryActions: secondaryActionsMockedData,
              bottomBarSelectedIndex: -1),
          userState: UserState(
            userProfile: UserProfile(
              userBioData: BioData(
                firstName: testFirstName,
                lastName: testLastName,
                dateOfBirth: testDate,
                gender: testGender,
              ),
              primaryEmailAddress: testEmailAddress,
              primaryPhoneNumber: testPhoneNumber,
              secondaryPhoneNumbers: <PhoneNumber>[
                PhoneNumber.withValue('+2547123455678')
              ],
              secondaryEmailAddresses: <EmailAddress>[testEmailAddress],
            ),
          ),
        ),
      );

      await mockNetworkImages(() async {
        await buildTestWidget(
            store: store, tester: tester, widget: SILSearch());

        expect(searchAbsorbFinder, findsOneWidget);
        expect(appSearchInputFinder, findsOneWidget);

        await tester.enterText(appSearchInputFinder, 'Profile');
        expect(searchGestureDetectorFinder, findsOneWidget);

        await tester.tap(searchGestureDetectorFinder);
        await tester.pumpAndSettle();

        await tester.enterText(find.byType(TextField), 'prof');
        await tester.pump();

        await tester.testTextInput.receiveAction(TextInputAction.search);
        await tester.pump();

        expect(find.byKey(AppWidgetKeys.resultOnTapKey), findsOneWidget);

        await tester.tap(find.text('My Profile').last);
        await tester.pumpAndSettle();

        expect(find.byType(ProfileMasterDetail), findsOneWidget);
      });
    });

    testWidgets('navigates to help center page when result list tile is tapped',
        (WidgetTester tester) async {
      await buildTestWidget(store: store, tester: tester, widget: SILSearch());

      expect(searchAbsorbFinder, findsOneWidget);
      expect(appSearchInputFinder, findsOneWidget);

      await tester.enterText(appSearchInputFinder, 'Profile');
      expect(searchGestureDetectorFinder, findsOneWidget);

      await tester.tap(searchGestureDetectorFinder);
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'help');
      await tester.pump();

      await tester.testTextInput.receiveAction(TextInputAction.search);
      await tester.pump();

      expect(find.byKey(AppWidgetKeys.resultOnTapKey), findsOneWidget);

      await tester.tap(find.text('Be.Well Help Center').last);
      await tester.pumpAndSettle();

      expect(find.byType(HelpCenterPage), findsOneWidget);
    });

    testWidgets(
        'navigates to search patient page when result list tile is tapped',
        (WidgetTester tester) async {
      final Store<AppState> store = Store<AppState>(
        initialState: AppState(
          navigationState: Navigation(
              drawerSelectedIndex: -1,
              primaryActions: primaryActionsMockedData,
              secondaryActions: secondaryActionsMockedData,
              bottomBarSelectedIndex: 0),
          userState: UserState(
            userProfile: UserProfile(
              userBioData: BioData(
                firstName: testFirstName,
                lastName: testLastName,
                dateOfBirth: testDate,
                gender: testGender,
              ),
              primaryEmailAddress: testEmailAddress,
              primaryPhoneNumber: testPhoneNumber,
              secondaryPhoneNumbers: <PhoneNumber>[
                PhoneNumber.withValue('+2547123455678')
              ],
              secondaryEmailAddresses: <EmailAddress>[testEmailAddress],
            ),
          ),
        ),
      );
      await buildTestWidget(store: store, tester: tester, widget: SILSearch());

      expect(searchAbsorbFinder, findsOneWidget);
      expect(appSearchInputFinder, findsOneWidget);

      await tester.enterText(appSearchInputFinder, 'Profile');
      expect(searchGestureDetectorFinder, findsOneWidget);

      await tester.tap(searchGestureDetectorFinder);
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'find a patient');
      await tester.pump();

      await tester.testTextInput.receiveAction(TextInputAction.search);
      await tester.pump();

      expect(find.byKey(AppWidgetKeys.resultOnTapKey), findsOneWidget);

      await tester.tap(find.text('Find Patient').last);
      await tester.pumpAndSettle();

      expect(find.byType(PatientSearchPage), findsOneWidget);
    });

    testWidgets(
        'navigates to patient registration page when result list tile is tapped',
        (WidgetTester tester) async {
      final Store<AppState> store = Store<AppState>(
        initialState: AppState(
          navigationState: Navigation(
              drawerSelectedIndex: -1,
              primaryActions: primaryActionsMockedData,
              secondaryActions: secondaryActionsMockedData,
              bottomBarSelectedIndex: 0),
          userState: UserState(
            userProfile: UserProfile(
              userBioData: BioData(
                firstName: testFirstName,
                lastName: testLastName,
                dateOfBirth: testDate,
                gender: testGender,
              ),
              primaryEmailAddress: testEmailAddress,
              primaryPhoneNumber: testPhoneNumber,
              secondaryPhoneNumbers: <PhoneNumber>[
                PhoneNumber.withValue('+2547123455678')
              ],
              secondaryEmailAddresses: <EmailAddress>[testEmailAddress],
            ),
          ),
        ),
      );

      await buildTestWidget(store: store, tester: tester, widget: SILSearch());

      expect(searchAbsorbFinder, findsOneWidget);
      expect(appSearchInputFinder, findsOneWidget);

      await tester.enterText(appSearchInputFinder, 'Profile');
      expect(searchGestureDetectorFinder, findsOneWidget);

      await tester.tap(searchGestureDetectorFinder);
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'add a patient');
      await tester.pump();

      await tester.testTextInput.receiveAction(TextInputAction.search);
      await tester.pump();

      expect(find.byKey(AppWidgetKeys.emptyResultListKey), findsNothing);
      expect(find.text('Add Patient'), findsNWidgets(2));

      await tester.tap(find.text('Add Patient').last);
      await tester.pumpAndSettle();

      expect(find.byType(PatientRegistration), findsOneWidget);
    });

    testWidgets(
        'navigates to help center page when suggestion list tile is tapped on user with secondary actions',
        (WidgetTester tester) async {
      await buildTestWidget(
          store: store,
          tester: tester,
          widget: Builder(builder: (BuildContext context) {
            store.dispatch(
              NavigationAction(
                  drawerSelectedIndex: -1,
                  primaryActions: primaryActionsMockedData,
                  secondaryActions: secondaryActionsMockedData),
            );
            return SILSearch();
          }));

      expect(searchAbsorbFinder, findsOneWidget);
      expect(appSearchInputFinder, findsOneWidget);

      await tester.enterText(appSearchInputFinder, 'Profile');
      expect(searchGestureDetectorFinder, findsOneWidget);

      await tester.tap(searchGestureDetectorFinder);
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'help');
      await tester.pump();

      expect(suggestionListKey, findsOneWidget);
      expect(suggestionListViewFinder, findsOneWidget);
      await tester.tap(suggestionListViewFinder);

      await tester.pumpAndSettle();

      expect(find.byKey(AppWidgetKeys.helpCenterListViewKey), findsOneWidget);
    });
  });
}
