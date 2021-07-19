import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/redux/actions/navigation_actions/navigation_action.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/guide_box.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/search_guide.dart';

import '../../../../../mocks/mocks.dart';
import '../../../../../mocks/test_helpers.dart';

void main() {
  testWidgets('search guide renders correctly', (WidgetTester tester) async {
    final Store<AppState> store =
        Store<AppState>(initialState: AppState.initial());

    await buildTestWidget(
      tester: tester,
      store: store,
      widget: SearchGuide(),
    );

    expect(find.byType(GuideBox), findsWidgets);
    expect(find.byIcon(Icons.search), findsOneWidget);
  });
  testWidgets('GuideBox renders correctly', (WidgetTester tester) async {
    final IconData iconData = Icons.account_box;

    await tester.pumpWidget(MaterialApp(
        home: GuideBox(iconData: iconData, description: '', title: 'top')));
    expect(find.byType(Positioned), findsWidgets);
    expect(find.text('top'), findsOneWidget);
    expect(find.byIcon(Icons.account_box), findsOneWidget);
  });

  testWidgets(
      'search guide renders correctly on tablet without secondary actions',
      (WidgetTester tester) async {
    final Store<AppState> store =
        Store<AppState>(initialState: AppState.initial());

    tester.binding.window.devicePixelRatioTestValue = 1.0;
    tester.binding.window.physicalSizeTestValue = tabletLandscape;

    await store.dispatch(
      NavigationAction(
          drawerSelectedIndex: -1,
          primaryActions: primaryActionsMockedData,
          secondaryActions: secondaryActionsEmptyMockedData),
    );

    await buildTestWidget(
      tester: tester,
      store: store,
      widget: SearchGuide(),
    );

    expect(find.byType(GuideBox), findsWidgets);
    expect(find.byIcon(Icons.search), findsOneWidget);
    expect(find.byType(Expanded), findsWidgets);

    addTearDown(() {
      tester.binding.window.clearPhysicalSizeTestValue();
      tester.binding.window.clearDevicePixelRatioTestValue();
    });
  });

  testWidgets('search guide renders correctly on tablet with secondary actions',
      (WidgetTester tester) async {
    final Store<AppState> store =
        Store<AppState>(initialState: AppState.initial());

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
      widget: SearchGuide(),
    );

    expect(find.byType(GuideBox), findsWidgets);
    expect(find.byIcon(Icons.search), findsOneWidget);
    expect(find.byType(Expanded), findsNothing);

    addTearDown(() {
      tester.binding.window.clearPhysicalSizeTestValue();
      tester.binding.window.clearDevicePixelRatioTestValue();
    });
  });
}
