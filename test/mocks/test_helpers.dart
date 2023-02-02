// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:async_redux/async_redux.dart';
import 'package:sghi_core/app_wrapper/enums.dart';
import 'package:sghi_core/domain_objects/entities/bio_data.dart';
import 'package:sghi_core/domain_objects/entities/user_profile.dart';
import 'package:sghi_core/domain_objects/value_objects/name.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sghi_core/ui_components/src/buttons.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/actions/user_state_actions/batch_update_user_state_action.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_contexts.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/domain_constants.dart';
import 'package:bewell_pro_core/presentation/router/router_generator.dart';
import 'mocks.dart';

/// [buildTestWidget] is a widget wrapper used for testing
/// It wraps the widget with a `StoreProvider`, `AppWrapperBase`, `MaterialApp` and a `Scaffold`
/// Helps to avoid repetition across test files requiring the above widgets
///
/// The function will create a store for you if you don't provide one
Future<void> buildTestWidget({
  required WidgetTester tester,
  required Widget widget,
  Store<CoreState>? store,
  IGraphQlClient? graphQlClient,
  List<NavigatorObserver>? navigatorObservers,
  Widget? endDrawer,
  Duration? duration,
  List<AppContext>? appContexts,
}) async {
  final Store<CoreState> _store =
      Store<CoreState>(initialState: CoreState.initial());
  NavigateAction.setNavigatorKey(globalAppNavigatorKey);

  await tester.pumpWidget(
    AppWrapperBase(
      graphQLClient: graphQlClient ?? mockGraphQlClient,
      appName: AppBrand().appName.value,
      appContexts: appContexts ?? testAppContexts,
      deviceCapabilities: deviceCapabilities,
      child: StoreProvider<CoreState>(
        store: store ?? _store,
        child: MaterialApp(
          onGenerateRoute: RouteGenerator.generateRoute,
          navigatorKey: globalAppNavigatorKey,
          navigatorObservers: navigatorObservers ?? <NavigatorObserver>[],
          home: Scaffold(
            endDrawer: endDrawer,
            body: widget,
          ),
        ),
      ),
    ),
    duration,
  );
}

/// [buildDrawerTestWidget] is a widget wrapper used for testing clinical drawers.
/// It wraps the widget with a `StoreProvider`, `AppWrapperBase`,
/// `MaterialApp` and a `Scaffold`
///
/// It provides a [endDrawer] property to the `Scaffold` with the current active drawer.
/// Tap [SILPrimaryButton] to open drawer.
///
/// This widget also opens the drawer for you so that you can begin your
/// widget interactions immediately
Future<void> buildDrawerTestWidget(WidgetTester tester, DrawerType drawerType,
    {Store<CoreState>? store, IGraphQlClient? graphQlClient}) async {
  await buildTestWidget(
    tester: tester,
    graphQlClient: graphQlClient,
    store: store,
    endDrawer: SizedBox(
      width: tabletPortrait.width,
      height: tabletPortrait.height,
      child: Drawer(
        child: ListView(
          children: <Widget>[
            activeDrawer(
              drawer: drawerType.name,
            )
          ],
        ),
      ),
    ),
    widget: Builder(
      builder: (BuildContext context) {
        StoreProvider.dispatch<CoreState>(
            context,
            BatchUpdateUserStateAction(
              userProfile: UserProfile(
                userBioData: BioData(
                    firstName: Name.withValue('Bewell'),
                    lastName: Name.withValue('Test')),
              ),
            ));
        return SILPrimaryButton(
          text: drawerTestRootText,
          onPressed: () => Scaffold.of(context).openEndDrawer(),
        );
      },
    ),
  );
}

StoreTester<CoreState> createStoreTester() {
  final Store<CoreState> store =
      Store<CoreState>(initialState: CoreState.initial());
  return StoreTester<CoreState>.from(
    store,
    testInfoPrinter: (TestInfo<dynamic> testInfo) {},
  );
}

Future<void> advanceAndPump({
  required Widget widget,
  required WidgetTester tester,
  required void Function(Duration) updateTime,
  Store<CoreState>? store,
  IGraphQlClient? graphQlClient,
  List<NavigatorObserver>? navigatorObservers,
  Duration duration = Duration.zero,
}) async {
  updateTime(duration);

  await buildTestWidget(
    tester: tester,
    widget: widget,
    duration: duration,
    store: store,
    graphQlClient: graphQlClient,
    navigatorObservers: navigatorObservers,
  );
  await tester.pumpAndSettle();
}
