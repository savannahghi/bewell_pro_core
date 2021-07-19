import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/entities.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/redux/actions/navigation_actions/navigation_action.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/presentation/admin/widgets/coming_soon_page.dart';
import 'package:bewell_pro_core/presentation/core/help_center/pages/help_center_page.dart';
import 'package:bewell_pro_core/presentation/core/home/widgets/sil_bottom_navigation_bar.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('SILBottomNavigatorBar', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('renders default items with empty primary actions',
        (WidgetTester tester) async {
      await store.dispatch(NavigationAction(
          drawerSelectedIndex: -1,
          secondaryActions: secondaryActionsMockedData));

      await mockNetworkImages(() async {
        await buildTestWidget(
          tester: tester,
          store: store,
          widget: const SILBottomNavigatorBar(),
        );

        expect(find.text(navHomeText), findsOneWidget);

        await tester.tap(find.text(navHomeText));
        await tester.pumpAndSettle();

        expect(find.text(navGetHelpText), findsOneWidget);

        await tester.tap(find.text(navGetHelpText));
        await tester.pumpAndSettle();

        expect(find.byType(HelpCenterPage), findsOneWidget);
      });
    });

    testWidgets('should navigate to coming soon page if nav item route is null',
        (WidgetTester tester) async {
      final NavigationItem nullRouteNavItem = NavigationItem(
        id: '12345',
        title: navGetHelpText,
        isFavourite: true,
        icon: NavigationIcon(
          id: '1u7E6vQxZ7Le4ZyodCuXTSDaPLs',
          iconUrl:
              'https://assets.healthcloud.co.ke/actions/svg/help_navaction.svg',
          iconTitle: 'Help',
          iconDescription: 'Help Navigation action',
        ),
      );

      final List<NavigationItem> navItems = <NavigationItem>[
        nullRouteNavItem,
        NavigationItem(
          id: '234432',
          title: 'Agent',
          route: '',
          icon: NavigationIcon(
              id: '1u7E6vQxZ7Le4ZyodCuXTSDaPLs',
              iconUrl:
                  'https://assets.healthcloud.co.ke/actions/svg/agent_navaction.svg',
              iconTitle: 'Agent',
              iconDescription: 'Agent Navigation action'),
          isFavourite: true,
        ),
      ];

      await mockNetworkImages(() async {
        await buildTestWidget(
          tester: tester,
          store: store,
          widget: SILBottomNavigatorBar(navigationItems: navItems),
        );

        final Finder helpTextFinder = find.text(navGetHelpText);
        expect(helpTextFinder, findsOneWidget);

        await tester.tap(helpTextFinder);
        await tester.pumpAndSettle();

        expect(find.byType(ComingSoon), findsOneWidget);
      });
    });
  });
}
