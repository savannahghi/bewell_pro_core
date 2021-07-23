import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/redux/actions/navigation_actions/navigation_action.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/admin/widgets/coming_soon_page.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/pages/patient_search_page.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/pages/patient_registration.dart';
import 'package:bewell_pro_core/presentation/core/help_center/pages/help_center_page.dart';
import 'package:bewell_pro_core/presentation/core/home/models/bottom_navigation_bar_items.dart';
import 'package:bewell_pro_core/presentation/core/widgets/app_drawer.dart';
import 'package:bewell_pro_core/presentation/core/widgets/nav_drawer_content.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('AppDrawer', () {
    late Store<CoreState> store;

    store = Store<CoreState>(initialState: CoreState.initial());

    testWidgets('should render permanently on Tablet',
        (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = tabletLandscape;

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
          widget: const AppDrawer(
            permanentlyDisplay: true,
          ),
        );

        expect(find.byKey(AppWidgetKeys.navDrawerCloseKey), findsNothing);

        // Tap Patient item
        expect(find.text(navDrawerPatientText), findsOneWidget);
        await tester.tap(find.text(navDrawerPatientText));
        await tester.pumpAndSettle();

        // Tap Patient Indentification Item under Patient
        expect(find.text(navDrawerPatientIdentificationText), findsOneWidget);

        await tester.tap(find.text(navDrawerPatientIdentificationText));
        await tester.pumpAndSettle();

        expect(find.byType(PatientSearchPage), findsOneWidget);

        addTearDown(() {
          tester.binding.window.clearPhysicalSizeTestValue();
          tester.binding.window.clearDevicePixelRatioTestValue();
        });
      });
    });

    testWidgets('should render on Mobile', (WidgetTester tester) async {
      await store.dispatch(
        NavigationAction(
            drawerSelectedIndex: -1,
            primaryActions: primaryActionsMockedData,
            secondaryActions: secondaryActionsMockedData),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        widget: const AppDrawer(
          permanentlyDisplay: false,
        ),
      );

      // Tap Patient item
      expect(find.text(navDrawerPatientText), findsOneWidget);
      await tester.tap(find.text(navDrawerPatientText));
      await tester.pumpAndSettle();

      // Tap Patient Indentification Item under Patient
      expect(find.text(navDrawerPatientIdentificationText), findsOneWidget);

      await tester.tap(find.text(navDrawerPatientIdentificationText));
      await tester.pumpAndSettle();

      expect(find.byType(PatientSearchPage), findsOneWidget);
    });

    testWidgets('should close on Mobile', (WidgetTester tester) async {
      await store.dispatch(
        NavigationAction(
            drawerSelectedIndex: -1,
            primaryActions: primaryActionsMockedData,
            secondaryActions: secondaryActionsMockedData),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        widget: const AppDrawer(
          permanentlyDisplay: false,
        ),
      );

      //tap close icon
      expect(find.byKey(AppWidgetKeys.navDrawerCloseKey), findsOneWidget);
      await tester.tap(find.byKey(AppWidgetKeys.navDrawerCloseKey));
      await tester.pumpAndSettle();

      expect(find.byType(NavDrawerContent), findsNothing);
    });

    testWidgets('should navigate to patient registration',
        (WidgetTester tester) async {
      await store.dispatch(
        NavigationAction(
            drawerSelectedIndex: -1,
            primaryActions: primaryActionsMockedData,
            secondaryActions: secondaryActionsMockedData),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        widget: const AppDrawer(
          permanentlyDisplay: false,
        ),
      );

      // Tap Patient item
      expect(find.text(navDrawerPatientText), findsOneWidget);
      await tester.tap(find.text(navDrawerPatientText));
      await tester.pumpAndSettle();

      // Tap Patient Registration under Patient item
      expect(find.text(navDrawerPatientRegistrationText), findsOneWidget);

      await tester.tap(find.text(navDrawerPatientRegistrationText));
      await tester.pumpAndSettle();

      expect(find.byType(PatientRegistration), findsOneWidget);
    });

    testWidgets('should navigate to get help center',
        (WidgetTester tester) async {
      await store.dispatch(
        NavigationAction(
            drawerSelectedIndex: -1,
            primaryActions: primaryActionsMockedData,
            secondaryActions: secondaryActionsMockedData),
      );

      defaultSecondaryNavItems = secondaryActionsMockedData;

      await buildTestWidget(
        tester: tester,
        store: store,
        widget: const AppDrawer(
          permanentlyDisplay: true,
        ),
        graphQlClient: mockGraphQlClient,
      );

      // Tap Help item
      expect(find.text(navGetHelpText), findsOneWidget);
      await tester.tap(find.text(navGetHelpText));
      await tester.pumpAndSettle();

      expect(find.byType(HelpCenterPage), findsOneWidget);
    });

    testWidgets('should navigate to Coming Soon Page on an Nested actions',
        (WidgetTester tester) async {
      await store.dispatch(
        NavigationAction(
            drawerSelectedIndex: -1,
            primaryActions: primaryActionsMockedData,
            secondaryActions: secondaryActionsMockedData),
      );

      defaultSecondaryNavItems = secondaryActionsMockedData;

      await mockNetworkImages(() async {
        await buildTestWidget(
          tester: tester,
          store: store,
          widget: const AppDrawer(
            permanentlyDisplay: true,
          ),
        );

        expect(find.text('About'), findsOneWidget);
        await tester.tap(find.text('About'));
        await tester.pumpAndSettle();

        expect(find.text('About Us'), findsOneWidget);
        await tester.tap(find.text('About Us'));
        await tester.pumpAndSettle();

        expect(find.byType(ComingSoon), findsOneWidget);
      });
    });

    testWidgets('should search secondary actions', (WidgetTester tester) async {
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
        widget: const AppDrawer(
          permanentlyDisplay: true,
        ),
      );

      expect(find.byKey(AppWidgetKeys.navDrawerSearchKey), findsOneWidget);
      await tester.tap(find.byKey(AppWidgetKeys.navDrawerSearchKey));
      await tester.pumpAndSettle();

      await tester.enterText(
          find.byKey(AppWidgetKeys.navDrawerSearchKey), navDrawerPatientText);
      await tester.pumpAndSettle();

      expect(find.byType(ListTile), findsOneWidget);

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });

    testWidgets('should add to favourite', (WidgetTester tester) async {
      await store.dispatch(
        NavigationAction(
            drawerSelectedIndex: -1,
            primaryActions: primaryActionsMockedData,
            secondaryActions: secondaryActionsMockedData),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        widget: const AppDrawer(
          permanentlyDisplay: false,
        ),
      );

      expect(find.byType(AppDrawer), findsOneWidget);

      //drag list tile
      await tester.drag(find.byType(SlidableDrawerActionPane).first,
          const Offset(500.0, 0.0));
      await tester.pumpAndSettle();
      expect(find.byType(IconSlideAction), findsOneWidget);
      await tester.tap(find.byType(IconSlideAction));
      await tester.pumpAndSettle();
      expect(find.byType(ScaffoldMessenger), findsOneWidget);

      //drag Extensionlist tile
      await tester.drag(
          find.byType(ExpansionTile).first, const Offset(500.0, 0.0));
      await tester.pumpAndSettle();
      expect(find.byType(IconSlideAction), findsOneWidget);
      await tester.tap(find.byType(IconSlideAction));
      await tester.pumpAndSettle();
      expect(find.byType(ScaffoldMessenger), findsOneWidget);
    });
  });
}
