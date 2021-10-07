// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/actions/navigation_actions/navigation_action.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/asset_strings.dart';
import 'package:bewell_pro_core/presentation/admin/widgets/coming_soon_page.dart';
import 'package:bewell_pro_core/presentation/core/help_center/pages/help_center_page.dart';
import 'package:bewell_pro_core/presentation/core/home/widgets/sil_bottom_navigation_bar.dart';
import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('SILBottomNavigatorBar', () {
    final Store<CoreState> store =
        Store<CoreState>(initialState: CoreState.initial());

    setUp(() {
      AppBrand().appLogo.add(cameraIconUrl);
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
            widget: const SILBottomNavigatorBar());

        expect(find.text(navHomeText), findsOneWidget);

        await tester.tap(find.text(navHomeText));
        await tester.pumpAndSettle();

        expect(find.text(navGetHelpText), findsOneWidget);

        await tester.tap(find.text(navGetHelpText));
        await tester.pumpAndSettle();

        expect(find.byType(HelpCenterPage), findsOneWidget);
      });
    });
    testWidgets('renders correctly as SIL employee',
        (WidgetTester tester) async {
      await store.dispatch(NavigationAction(
          drawerSelectedIndex: -1,
          primaryActions: primaryActionsMockedData,
          secondaryActions: secondaryActionsMockedData));

      await mockNetworkImages(() async {
        await buildTestWidget(
            tester: tester,
            store: store,
            widget: const SILBottomNavigatorBar());

        expect(find.text(navHomeText), findsOneWidget);

        await tester.tap(find.text(navHomeText));
        await tester.pumpAndSettle();

        expect(find.byType(ScaffoldMessenger), findsOneWidget);

        expect(find.text(navConsumerText), findsOneWidget);

        await tester.tap(find.text(navConsumerText));
        await tester.pumpAndSettle();

        expect(find.byType(ComingSoon), findsOneWidget);
      });
    });
  });
}
