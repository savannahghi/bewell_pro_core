// Flutter imports:
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/clinical/entities/medication_edge.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/secondary_banner_medication.dart';
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

  testWidgets(
    'SecondaryBannerMedications renders correctly',
    (WidgetTester tester) async {
      secondaryBannerInfoObject.medicationsList
          .add(MedicationRelayConnection.fromJson(medicationMockedData).edges);

      await buildTestWidget(
          tester: tester,
          store: store,
          widget: const SecondaryBannerMedications());
      await tester.pump();

      expect(find.byType(SecondaryBannerZeroState), findsNothing);
      expect(find.byKey(AppWidgetKeys.retireSecondaryMedication).first,
          findsOneWidget);

      await tester
          .tap(find.byKey(AppWidgetKeys.retireSecondaryMedication).first);
      await tester.pumpAndSettle();

      expect(find.byKey(AppWidgetKeys.retireReasonFormField), findsOneWidget);

      await tester
          .showKeyboard(find.byKey(AppWidgetKeys.retireReasonFormField));
      await tester.enterText(
          find.byKey(AppWidgetKeys.retireReasonFormField), 'retire');
      await tester.pumpAndSettle();

      expect(find.text('retire'), findsOneWidget);

      await tester.tap(find.byKey(AppWidgetKeys.retireHelperButtonKey));
      await tester.pumpAndSettle();

      expect(find.byKey(AppWidgetKeys.retireHelperButtonKey), findsNothing);
    },
  );

  testWidgets(
    'SecondaryBannerMedications renders correctly on large screen',
    (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = const Size(1540, 720);

      secondaryBannerInfoObject.medicationsList
          .add(MedicationRelayConnection.fromJson(medicationMockedData).edges);

      await buildTestWidget(
          tester: tester,
          store: store,
          widget: const SecondaryBannerMedications());
      await tester.pump();

      expect(find.byType(SecondaryBannerZeroState), findsNothing);
      expect(find.byKey(AppWidgetKeys.retireSecondaryMedication).first,
          findsOneWidget);

      await tester
          .tap(find.byKey(AppWidgetKeys.retireSecondaryMedication).first);
      await tester.pumpAndSettle();

      expect(find.byKey(AppWidgetKeys.retireReasonFormField), findsOneWidget);

      await tester
          .showKeyboard(find.byKey(AppWidgetKeys.retireReasonFormField));
      await tester.enterText(
          find.byKey(AppWidgetKeys.retireReasonFormField), 'retire');
      await tester.pumpAndSettle();

      expect(find.text('retire'), findsOneWidget);

      expect(find.byKey(AppWidgetKeys.retireHelperButtonKey), findsOneWidget);

      await tester.tap(find.byKey(AppWidgetKeys.retireHelperButtonKey));
      await tester.pumpAndSettle();

      expect(find.byKey(AppWidgetKeys.retireHelperButtonKey), findsNothing);

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    },
  );

  testWidgets(
    'SecondaryBannerMedications renders correctly on pressing cancel on retire modal',
    (WidgetTester tester) async {
      secondaryBannerInfoObject.medicationsList
          .add(MedicationRelayConnection.fromJson(medicationMockedData).edges);

      await buildTestWidget(
          tester: tester,
          store: store,
          widget: const SecondaryBannerMedications());
      await tester.pump();

      expect(find.byType(SecondaryBannerZeroState), findsNothing);
      expect(find.byKey(AppWidgetKeys.retireSecondaryMedication).first,
          findsOneWidget);

      await tester
          .tap(find.byKey(AppWidgetKeys.retireSecondaryMedication).first);
      await tester.pumpAndSettle();

      expect(find.byKey(AppWidgetKeys.retireReasonFormField), findsOneWidget);

      await tester
          .showKeyboard(find.byKey(AppWidgetKeys.retireReasonFormField));
      await tester.enterText(
          find.byKey(AppWidgetKeys.retireReasonFormField), 'retire');
      await tester.pumpAndSettle();

      expect(find.text('retire'), findsOneWidget);

      await tester.tap(find.byKey(AppWidgetKeys.retireCancelButtonKey));
      await tester.pumpAndSettle();

      expect(find.byKey(AppWidgetKeys.retireCancelButtonKey), findsNothing);
    },
  );
}
