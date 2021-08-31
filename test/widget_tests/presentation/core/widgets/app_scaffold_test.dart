import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/asset_strings.dart';
import 'package:domain_objects/entities.dart';
import 'package:bewell_pro_core/application/redux/actions/navigation_actions/navigation_action.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/pages/patient_registration.dart';
import 'package:bewell_pro_core/presentation/core/home/pages/home_page.dart';
import 'package:bewell_pro_core/presentation/core/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/redux/actions/user_state_actions/batch_update_user_state_action.dart';
import 'package:bewell_pro_core/presentation/core/home/models/bottom_navigation_bar_items.dart';
import 'package:bewell_pro_core/presentation/core/home/widgets/sil_app_bar.dart';
import 'package:bewell_pro_core/presentation/core/home/widgets/sil_bottom_navigation_bar.dart';
import 'package:bewell_pro_core/presentation/core/widgets/app_scaffold.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:shared_ui_components/buttons.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  setUp(() {
    AppBrand().appLogo.add(cameraIconUrl);
  });

  testWidgets('should render correctly when all widgets are passed in',
      (WidgetTester tester) async {
    final Store<CoreState> store =
        Store<CoreState>(initialState: CoreState.initial());

    await mockNetworkImages(() async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: AppScaffold(
          currentBottomNavIndex: BottomNavIndex.patients.index,
          endDrawer: const SizedBox(child: Text('End drawer')),
          floatingActionButton: const SizedBox(child: Text('End drawer')),
          body: SILPrimaryButton(
            onPressed: () {},
          ),
        ),
      );

      expect(find.byType(AppDrawer), findsNothing);
      expect(find.byType(SILPrimaryButton), findsOneWidget);
      expect(find.byType(Scaffold), findsNWidgets(2));
      expect(find.byType(SilAppBar), findsOneWidget);
      expect(find.byType(SILBottomNavigatorBar), findsOneWidget);
      expect(find.text('End drawer'), findsOneWidget);
    });
  });

  testWidgets('app drawer humburger renders correctly',
      (WidgetTester tester) async {
    final Store<CoreState> store =
        Store<CoreState>(initialState: CoreState.initial());

    await store.dispatch(
      NavigationAction(
          drawerSelectedIndex: -1,
          primaryActions: primaryActionsMockedData,
          secondaryActions: secondaryActionsMockedData),
    );

    await mockNetworkImages(() async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: Builder(
          builder: (BuildContext context) {
            StoreProvider.dispatch<CoreState>(
              context,
              BatchUpdateUserStateAction(
                  auth: AuthCredentialResponse(isAdmin: true)),
            );
            return AppScaffold(
              currentBottomNavIndex: BottomNavIndex.patients.index,
              endDrawer: const SizedBox(child: Text('End drawer')),
              floatingActionButton: const SizedBox(child: Text('End drawer')),
              body: SILPrimaryButton(
                onPressed: () {},
              ),
            );
          },
        ),
      );

      await tester.pump();

      expect(store.state.userState!.auth!.isAdmin, true);

      expect(find.byType(AppDrawer), findsNothing);
      expect(find.byKey(AppWidgetKeys.navDrawerMenuKey), findsOneWidget);
      await tester.tap(find.byKey(AppWidgetKeys.navDrawerMenuKey));
      await tester.pumpAndSettle();

      expect(find.byType(AppDrawer), findsOneWidget);

      expect(find.byKey(AppWidgetKeys.navDrawerCloseKey), findsOneWidget);
      await tester.tap(find.byKey(AppWidgetKeys.navDrawerCloseKey));
      await tester.pumpAndSettle();

      expect(find.byType(AppDrawer), findsNothing);
    });
  });

  testWidgets('app bar back button renders correctly',
      (WidgetTester tester) async {
    final Store<CoreState> store =
        Store<CoreState>(initialState: CoreState.initial());

    await store.dispatch(
      NavigationAction(
          drawerSelectedIndex: -1,
          primaryActions: primaryActionsMockedData,
          secondaryActions: secondaryActionsMockedData),
    );

    await mockNetworkImages(() async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: Builder(
          builder: (BuildContext context) {
            StoreProvider.dispatch<CoreState>(
              context,
              BatchUpdateUserStateAction(
                  auth: AuthCredentialResponse(isAdmin: true)),
            );
            return AppScaffold(
              endDrawer: const SizedBox(child: Text('End drawer')),
              floatingActionButton: const SizedBox(child: Text('End drawer')),
              body: SILPrimaryButton(
                onPressed: () {},
              ),
            );
          },
        ),
      );

      await tester.pump();

      expect(store.state.userState!.auth!.isAdmin, true);

      expect(find.byType(AppDrawer), findsNothing);
      expect(find.byKey(AppWidgetKeys.navDrawerMenuKey), findsOneWidget);
      await tester.tap(find.byKey(AppWidgetKeys.navDrawerMenuKey));
      await tester.pumpAndSettle();

      expect(find.byType(AppDrawer), findsOneWidget);

      // Tap Patient item
      expect(find.text(navDrawerPatientText), findsOneWidget);
      await tester.tap(find.text(navDrawerPatientText));
      await tester.pumpAndSettle();

      // Tap Patient Registration under Patient item
      expect(find.text(navDrawerPatientRegistrationText), findsOneWidget);

      await tester.tap(find.text(navDrawerPatientRegistrationText));
      await tester.pumpAndSettle();

      expect(find.byType(PatientRegistration), findsOneWidget);

      //Tap back button
      expect(find.byKey(AppWidgetKeys.navDrawerBackKey), findsOneWidget);
      await tester.tap(find.byKey(AppWidgetKeys.navDrawerBackKey));
      await tester.pumpAndSettle();

      expect(find.byType(PatientRegistration), findsNothing);
      expect(find.byType(HomePage), findsOneWidget);
    });
  });

  testWidgets('should render on Tablet correctly', (WidgetTester tester) async {
    final Store<CoreState> store =
        Store<CoreState>(initialState: CoreState.initial());

    tester.binding.window.devicePixelRatioTestValue = 1.0;
    tester.binding.window.physicalSizeTestValue = tabletLandscape;

    await store.dispatch(
      NavigationAction(
          drawerSelectedIndex: -1,
          primaryActions: primaryActionsMockedData,
          secondaryActions: secondaryActionsMockedData),
    );

    await buildTestWidget(
      tester: tester,
      store: store,
      widget: Builder(
        builder: (BuildContext context) {
          StoreProvider.dispatch<CoreState>(
            context,
            BatchUpdateUserStateAction(
                auth: AuthCredentialResponse(isAdmin: true)),
          );
          return AppScaffold(
            currentBottomNavIndex: BottomNavIndex.patients.index,
            endDrawer: const SizedBox(child: Text('End drawer')),
            floatingActionButton: const SizedBox(child: Text('End drawer')),
            body: SILPrimaryButton(
              onPressed: () {},
            ),
          );
        },
      ),
    );

    await tester.pump();

    expect(find.byType(AppDrawer), findsOneWidget);
    expect(find.byType(SILPrimaryButton), findsOneWidget);
    expect(find.byType(Scaffold), findsNWidgets(3));
    expect(find.byType(SilAppBar), findsOneWidget);
    expect(find.byType(SILBottomNavigatorBar), findsOneWidget);
    expect(find.text('End drawer'), findsOneWidget);

    addTearDown(() {
      tester.binding.window.clearPhysicalSizeTestValue();
      tester.binding.window.clearDevicePixelRatioTestValue();
    });
  });
}
