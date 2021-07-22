import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';
import 'package:bewell_pro_core/domain/clinical/entities/condition_edge.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/secondary_banner_conditions.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/secondary_banner_zero_experience.dart';

import '../../../../../mocks/mocks.dart';
import '../../../../../mocks/test_helpers.dart';

void main() {
  final Store<AppState> store =
      Store<AppState>(initialState: AppState.initial());

  final SecondaryBannerInfoObject secondaryBannerInfoObject =
      SecondaryBannerInfoObject();

  setUpAll(() {
    startMockVisitAndExam();
  });

  testWidgets('SecondaryBannerConditions renders correctly ',
      (WidgetTester tester) async {
    secondaryBannerInfoObject.problemsList.add(
        ConditionRelayConnection.fromJson(conditionRelayConnectionMock).edges);

    await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockGraphQlClient,
        widget: const SecondaryBannerConditions());
    await tester.pump();

    expect(find.byType(SecondaryBannerZeroState), findsNothing);
    expect(find.byKey(AppWidgetKeys.retireSecondaryCondition).first,
        findsOneWidget);

    await tester.tap(find.byKey(AppWidgetKeys.retireSecondaryCondition).first);
    await tester.pumpAndSettle();

    expect(find.byKey(AppWidgetKeys.retireReasonFormField), findsOneWidget);

    await tester.showKeyboard(find.byKey(AppWidgetKeys.retireReasonFormField));
    await tester.enterText(
        find.byKey(AppWidgetKeys.retireReasonFormField), 'retire');

    await tester.pumpAndSettle();

    expect(find.text('retire'), findsOneWidget);

    await tester.tap(find.byKey(AppWidgetKeys.retireHelperButtonKey));
    await tester.pumpAndSettle();

    expect(find.byKey(AppWidgetKeys.retireHelperButtonKey), findsNothing);
  });

  testWidgets('SecondaryBannerConditions renders correctly in large screen ',
      (WidgetTester tester) async {
    tester.binding.window.devicePixelRatioTestValue = 1.0;
    tester.binding.window.physicalSizeTestValue = const Size(1280, 720);

    secondaryBannerInfoObject.problemsList.add(
        ConditionRelayConnection.fromJson(conditionRelayConnectionMock).edges);

    await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockGraphQlClient,
        widget: const SecondaryBannerConditions());
    await tester.pump();

    expect(find.byType(SecondaryBannerZeroState), findsNothing);
    expect(find.byKey(AppWidgetKeys.retireSecondaryCondition).first,
        findsOneWidget);

    await tester.tap(find.byKey(AppWidgetKeys.retireSecondaryCondition).first);
    await tester.pumpAndSettle();

    expect(find.byKey(AppWidgetKeys.retireReasonFormField), findsOneWidget);

    await tester.showKeyboard(find.byKey(AppWidgetKeys.retireReasonFormField));
    await tester.enterText(
        find.byKey(AppWidgetKeys.retireReasonFormField), 'retire');

    await tester.pumpAndSettle();

    expect(find.text('retire'), findsOneWidget);

    await tester.tap(find.byKey(AppWidgetKeys.retireHelperButtonKey));
    await tester.pumpAndSettle();

    expect(find.byKey(AppWidgetKeys.retireHelperButtonKey), findsNothing);

    addTearDown(() {
      tester.binding.window.clearPhysicalSizeTestValue();
      tester.binding.window.clearDevicePixelRatioTestValue();
    });
  });

  testWidgets(
      'SecondaryBannerConditions renders correctly on pressing cancel on retire modal',
      (WidgetTester tester) async {
    secondaryBannerInfoObject.problemsList.add(
        ConditionRelayConnection.fromJson(conditionRelayConnectionMock).edges);

    await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockGraphQlClient,
        widget: const SecondaryBannerConditions());
    await tester.pump();

    expect(find.byType(SecondaryBannerZeroState), findsNothing);
    expect(find.byKey(AppWidgetKeys.retireSecondaryCondition).first,
        findsOneWidget);

    await tester.tap(find.byKey(AppWidgetKeys.retireSecondaryCondition).first);
    await tester.pumpAndSettle();

    expect(find.byKey(AppWidgetKeys.retireReasonFormField), findsOneWidget);

    await tester.showKeyboard(find.byKey(AppWidgetKeys.retireReasonFormField));
    await tester.enterText(
        find.byKey(AppWidgetKeys.retireReasonFormField), 'retire');

    await tester.pumpAndSettle();

    expect(find.text('retire'), findsOneWidget);

    await tester.tap(find.byKey(AppWidgetKeys.retireCancelButtonKey));
    await tester.pumpAndSettle();

    expect(find.byKey(AppWidgetKeys.retireCancelButtonKey), findsNothing);
  });
}
