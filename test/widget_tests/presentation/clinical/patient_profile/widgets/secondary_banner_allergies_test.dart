import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/clinical/entities/allergy_intolerance_relay_connection.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/secondary_banner_allergies.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/secondary_banner_zero_experience.dart';

import '../../../../../mocks/mocks.dart';
import '../../../../../mocks/test_helpers.dart';

void main() {
  final Store<CoreState> store =
      Store<CoreState>(initialState: CoreState.initial());

  final SecondaryBannerInfoObject secondaryBannerInfoObject =
      SecondaryBannerInfoObject();

  setUpAll(() {
    startMockVisitAndExam();
  });

  testWidgets('SecondaryBannerAllergies renders correctly ',
      (WidgetTester tester) async {
    // allergyStreamController.add(allergyIntoleranceRelayConnectionMockedData);
    secondaryBannerInfoObject.allergiesList.add(
        AllergyIntoleranceRelayConnection.fromJson(
                allergyIntoleranceRelayConnectionMockedData)
            .edges);

    await buildTestWidget(
        tester: tester, store: store, widget: const SecondaryBannerAllergies());
    await tester.pump();

    expect(find.byType(SecondaryBannerZeroState), findsNothing);
    expect(
        find.byKey(AppWidgetKeys.retireSecondaryAllergy).first, findsOneWidget);

    await tester.tap(find.byKey(AppWidgetKeys.retireSecondaryAllergy).first);
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

  testWidgets('SecondaryBannerAllergies renders correctly in large screen ',
      (WidgetTester tester) async {
    tester.binding.window.devicePixelRatioTestValue = 1.0;
    tester.binding.window.physicalSizeTestValue = const Size(1280, 720);

    secondaryBannerInfoObject.allergiesList.add(
        AllergyIntoleranceRelayConnection.fromJson(
                allergyIntoleranceRelayConnectionMockedData)
            .edges);

    await buildTestWidget(
        tester: tester, store: store, widget: const SecondaryBannerAllergies());
    await tester.pump();

    expect(find.byType(SecondaryBannerZeroState), findsNothing);
    expect(
        find.byKey(AppWidgetKeys.retireSecondaryAllergy).first, findsOneWidget);

    await tester.tap(find.byKey(AppWidgetKeys.retireSecondaryAllergy).first);
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
      'SecondaryBannerAllergies renders correctly on pressing cancel on retire modal',
      (WidgetTester tester) async {
    secondaryBannerInfoObject.allergiesList.add(
        AllergyIntoleranceRelayConnection.fromJson(
                allergyIntoleranceRelayConnectionMockedData)
            .edges);

    await buildTestWidget(
        tester: tester, store: store, widget: const SecondaryBannerAllergies());
    await tester.pump();

    expect(find.byType(SecondaryBannerZeroState), findsNothing);
    expect(
        find.byKey(AppWidgetKeys.retireSecondaryAllergy).first, findsOneWidget);

    await tester.tap(find.byKey(AppWidgetKeys.retireSecondaryAllergy).first);
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
