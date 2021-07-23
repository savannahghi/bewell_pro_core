import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/redux/actions/user_state_actions/batch_update_user_state_action.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/core/global_search/sil_search.dart';
import 'package:bewell_pro_core/presentation/core/home/pages/home_page.dart';
import 'package:bewell_pro_core/presentation/core/home/widgets/feed_component_wrapper.dart';
import 'package:bewell_pro_core/presentation/core/home/widgets/session_timeout.dart';
import 'package:bewell_pro_core/presentation/core/home/widgets/sil_bottom_navigation_bar.dart';
import 'package:fake_async/fake_async.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('HomePage', () {
    late Store<CoreState> store;

    setUp(() {
      store = Store<CoreState>(initialState: CoreState.initial());
    });

    testWidgets('should render and refresh correctly',
        (WidgetTester tester) async {
      final UserFeedStore userFeed = UserFeedStore();
      await mockNetworkImages(() async {
        await buildTestWidget(
          store: store,
          tester: tester,
          widget: const HomePage(),
        );
        await tester.pump(const Duration(seconds: 5));

        expect(find.byType(Builder), findsWidgets);
        expect(
            find.byKey(AppWidgetKeys.homePageGestureDetectorKey), findsWidgets);
        expect(find.byType(SILBottomNavigatorBar), findsOneWidget);

        await tester.tap(find.byKey(AppWidgetKeys.homePageGestureDetectorKey));
        await tester.pumpAndSettle();

        expect(find.byType(RefreshIndicator), findsOneWidget);
        expect(find.byType(SILSearch), findsOneWidget);
        expect(find.byType(FeedComponentWrapper), findsOneWidget);

        await tester.fling(
            find.byType(SILSearch), const Offset(0.0, 300.0), 1000.0);
        await tester.pumpAndSettle();
        expect(userFeed.refreshFeed.value, false);
      });
    });

    testWidgets('onWillPop callback works', (WidgetTester tester) async {
      bool isExited = false;

      SystemChannels.platform.setMockMethodCallHandler((MethodCall call) async {
        if (call.method == 'SystemNavigator.pop') {
          isExited = true;
        }
      });

      await mockNetworkImages(() async {
        await buildTestWidget(
          store: store,
          tester: tester,
          widget: const HomePage(),
        );

        // Use didPopRoute() to simulate the system back button. Check that
        // didPopRoute() indicates that the notification was handled.
        final dynamic widgetsAppState = tester.state(find.byType(WidgetsApp));
        expect(await widgetsAppState.didPopRoute(), isTrue);
        await tester.pumpAndSettle();

        // Confirm modal exit barrier is displayed
        expect(find.byKey(AppWidgetKeys.homePageGestureDetectorKey),
            findsOneWidget);
        expect(find.text(confirmExitPrompt), findsOneWidget);
        expect(find.text(exitBtnText), findsOneWidget);
        expect(find.text(stayBtnText), findsOneWidget);

        // Confirm stay button pops & home is still in view
        await tester.tap(find.text(stayBtnText));
        await tester.pumpAndSettle();
        expect(find.byKey(AppWidgetKeys.homePageGestureDetectorKey),
            findsOneWidget);
        expect(find.byKey(AppWidgetKeys.homePageGestureDetectorKey),
            findsOneWidget);
        expect(find.text(confirmExitPrompt), findsNothing);
        expect(find.text(exitBtnText), findsNothing);
        expect(find.text(stayBtnText), findsNothing);

        // Confirm Exit option leaves
        expect(await widgetsAppState.didPopRoute(), isTrue);
        await tester.pumpAndSettle();
        await tester.tap(find.text(exitBtnText));
        await tester.pumpAndSettle();
        expect(isExited, isTrue);
      });
    });

    testWidgets('tapping logout on session prompt logs out user',
        (WidgetTester tester) async {
      final DateTime initialTokenExpiry =
          DateTime.now().add(const Duration(seconds: 5));

      store.dispatch(
        BatchUpdateUserStateAction(
          tokenExpiryTime: initialTokenExpiry.toIso8601String(),
        ),
      );

      final FakeAsync fakeAsync = FakeAsync();

      fakeAsync.run((FakeAsync self) async {
        await mockNetworkImages(() async {
          await buildTestWidget(
            store: store,
            tester: tester,
            widget: const HomePage(sessionTimeout: 1, modalCountdown: 1),
          );
          await tester.pumpAndSettle();
          fakeAsync.elapse(const Duration(seconds: 1));
          await tester.pumpAndSettle();
          expect(find.byType(SessionTimeoutAlert), findsOneWidget);

          final Finder logoutFinder = find.text(logoutText);
          expect(logoutFinder, findsOneWidget);
          await tester.tap(logoutFinder);
          await tester.pumpAndSettle();
          expect(store.state.userState?.tokenExpiryTime, UNKNOWN);
        });
      });
      fakeAsync.flushMicrotasks();
    });

    testWidgets(
        'should have correct padding when secondaryActions isEmpty and '
        'DeviceType is not Mobile', (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = tabletLandscape;

      await mockNetworkImages(() async {
        await buildTestWidget(
          store: store,
          tester: tester,
          widget: const HomePage(),
        );

        await tester.pump(const Duration(seconds: 5));

        expect(find.byType(Builder), findsWidgets);
        expect(
            find.byKey(AppWidgetKeys.homePageGestureDetectorKey), findsWidgets);
        expect(find.byType(SILBottomNavigatorBar), findsOneWidget);
      });

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });
  });
}
