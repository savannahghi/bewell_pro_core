// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:shared_ui_components/buttons.dart';

// Project imports:
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/domain/core/value_objects/asset_strings.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/pages/patient_search_page.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/search_guide.dart';
import '../../../../../../mocks/mocks.dart';
import '../../../../../../mocks/test_helpers.dart';

void main() {
  testWidgets('patient search page renders correctly',
      (WidgetTester widgetTester) async {
    AppBrand().appLogo.add(cameraIconUrl);

    await mockNetworkImages(() async {
      await buildTestWidget(
        tester: widgetTester,
        widget: PatientSearchPage(),
      );

      expect(find.byKey(AppWidgetKeys.patientIdentificationTitleKey),
          findsOneWidget);

      expect(find.byKey(AppWidgetKeys.patientSearchInputKey), findsOneWidget);

      expect(find.byKey(AppWidgetKeys.patientSearchDoneKey), findsOneWidget);

      expect(find.byType(SearchGuide), findsOneWidget);

      AppBrand().appLogo.add('');
    });
  });

  testWidgets('should trigger PatientSearchByPhoneAction',
      (WidgetTester tester) async {
    final CoreState state = CoreState.initial();
    final Store<CoreState> store = Store<CoreState>(initialState: state);

    await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockGraphQlClient,
        widget: Scaffold(
          body: Builder(builder: (BuildContext context) {
            return SILPrimaryButton(
              onPressed: () {
                searchPatientFunction(context, '+254721123456');
              },
              text: 'press',
            );
          }),
        ));

    expect(find.text('press'), findsOneWidget);
    await tester.tap(find.text('press'));
    await tester.pumpAndSettle();

    expect(store.state.clinicalState!.patientSearchNumber, '+254721123456');
    expect(store.state.clinicalState!.patientSearchFound, true);
  });
}
