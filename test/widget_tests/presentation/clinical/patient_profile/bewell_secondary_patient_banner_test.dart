// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:sghi_core/shared_themes/constants.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/bewell_secondary_patient_banner.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/secondary_banner_allergies.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/secondary_banner_conditions.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/secondary_banner_medication.dart';
import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('Secondary Patient Banner', () {
    Store<CoreState> store =
        Store<CoreState>(initialState: CoreState.initial());

    setUpAll(() {
      startMockVisitAndExam();
    });

    tearDownAll(() {
      store = Store<CoreState>(initialState: CoreState.initial());
      TimelineInfoObject().reset();
    });

    testWidgets('renders correctly when data returned is null',
        (WidgetTester tester) async {
      final SecondaryBannerInfoObject secondaryBannerInfoObject =
          SecondaryBannerInfoObject();
      secondaryBannerInfoObject.reset();

      final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(json.encode(<String, dynamic>{'data': null}), 200),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockShortGraphQlClient,
        widget: BeWellSecondaryPatientBanner(),
      );

      expect(secondaryBannerInfoObject.allergiesList.value!.isEmpty, true);
      expect(secondaryBannerInfoObject.problemsList.value!.isEmpty, true);
      expect(secondaryBannerInfoObject.medicationsList.value!.isEmpty, true);
    });
    testWidgets('renders correctly when there is an error',
        (WidgetTester tester) async {
      final SecondaryBannerInfoObject secondaryBannerInfoObject =
          SecondaryBannerInfoObject();
      secondaryBannerInfoObject.reset();
      final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(json.encode(<String, dynamic>{'error': 'timeout'}), 408),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockShortGraphQlClient,
        widget: BeWellSecondaryPatientBanner(),
      );

      expect(secondaryBannerInfoObject.allergiesList.value!.isEmpty, true);
      expect(secondaryBannerInfoObject.problemsList.value!.isEmpty, true);
      expect(secondaryBannerInfoObject.medicationsList.value!.isEmpty, true);
    });

    testWidgets('refreshes correctly', (WidgetTester tester) async {
      SecondaryBannerInfoObject().reset();
      final SecondaryBannerChangeObject secondaryBannerChangeObject =
          SecondaryBannerChangeObject();

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockGraphQlClient,
        widget: BeWellSecondaryPatientBanner(),
      );

      secondaryBannerChangeObject.conditionsListener.add(true);
      expect(find.byType(SecondaryBannerConditions), findsOneWidget);
      await tester.tap(find.text(medicationsString));
      await tester.pumpAndSettle();

      expect(find.byType(SecondaryBannerConditions), findsNothing);
      expect(find.byType(SecondaryBannerMedications), findsOneWidget);

      expect(BeWellSecondaryPatientBannerState.getHeightAndFilterData(2),
          kProblemItemHeight * 1);

      await tester.tap(find.text(allergiesString));
      await tester.pumpAndSettle();

      expect(find.byType(SecondaryBannerConditions), findsNothing);
      expect(find.byType(SecondaryBannerAllergies), findsOneWidget);

      expect(BeWellSecondaryPatientBannerState.getHeightAndFilterData(1),
          kProblemItemHeight * 1);

      await tester.tap(find.text(conditionsString));
      await tester.pumpAndSettle();

      expect(BeWellSecondaryPatientBannerState.getHeightAndFilterData(0),
          kProblemItemHeight * 1);
    });
    testWidgets(
        'navigates through the tabs correctly and gets the correct length',
        (WidgetTester tester) async {
      SecondaryBannerInfoObject().reset();

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockGraphQlClient,
        widget: BeWellSecondaryPatientBanner(),
      );
      expect(find.byType(SecondaryBannerConditions), findsOneWidget);
      await tester.tap(find.text(medicationsString));
      await tester.pumpAndSettle();

      expect(find.byType(SecondaryBannerConditions), findsNothing);
      expect(find.byType(SecondaryBannerMedications), findsOneWidget);

      expect(BeWellSecondaryPatientBannerState.getHeightAndFilterData(2),
          kProblemItemHeight * 1);

      await tester.tap(find.text(allergiesString));
      await tester.pumpAndSettle();

      expect(find.byType(SecondaryBannerConditions), findsNothing);
      expect(find.byType(SecondaryBannerAllergies), findsOneWidget);

      expect(BeWellSecondaryPatientBannerState.getHeightAndFilterData(1),
          kProblemItemHeight * 1);

      await tester.tap(find.text(conditionsString));
      await tester.pumpAndSettle();

      expect(BeWellSecondaryPatientBannerState.getHeightAndFilterData(0),
          kProblemItemHeight * 1);
    });
  });
}
