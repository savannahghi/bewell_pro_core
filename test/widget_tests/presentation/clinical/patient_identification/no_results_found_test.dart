import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/asset_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:async_redux/async_redux.dart';

import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/no_results_found.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/pages/patient_registration.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

import 'package:shared_ui_components/buttons.dart';

import '../../../../mocks/test_helpers.dart';

void main() {
  group('no results found page', () {
    final Store<CoreState> store =
        Store<CoreState>(initialState: CoreState.initial());

    testWidgets('search again button works', (WidgetTester tester) async {
      AppBrand().appLogo.add(cameraIconUrl);

      await mockNetworkImages(() async {
        await buildTestWidget(
            tester: tester,
            store: store,
            widget: Builder(
              builder: (BuildContext context) {
                return const NoPatientFound(searchString: 'lorem');
              },
            ));
        expect(find.byType(SingleChildScrollView), findsOneWidget);
        expect(find.text('No match was found for lorem'), findsOneWidget);
        expect(find.byType(SILPrimaryButton), findsOneWidget);

        // tap search again btn
        expect(find.byKey(AppWidgetKeys.silPrimaryButtonKey), findsOneWidget);
        await tester.tap(find.byKey(AppWidgetKeys.silPrimaryButtonKey));
        await tester.pumpAndSettle();

        // verify navigation was successful
        expect(find.byType(PatientRegistration), findsOneWidget);
        expect(find.byType(NoPatientFound), findsNothing);

        AppBrand().appLogo.add('');
      });
    });

    testWidgets('search again button works when recoverCallback is not null',
        (WidgetTester tester) async {
      double count = 0;

      await buildTestWidget(
          tester: tester,
          store: store,
          widget: Builder(
            builder: (BuildContext context) {
              return NoPatientFound(
                searchString: 'lorem',
                recoverCallback: () {
                  count++;
                },
              );
            },
          ));
      expect(find.byType(SingleChildScrollView), findsOneWidget);
      expect(find.text('No match was found for lorem'), findsOneWidget);
      expect(find.byType(SILPrimaryButton), findsOneWidget);

      // tap search again btn
      expect(find.byKey(AppWidgetKeys.silPrimaryButtonKey), findsOneWidget);
      await tester.tap(find.byKey(AppWidgetKeys.silPrimaryButtonKey));
      await tester.pumpAndSettle();

      expect(count, 1);
      expect(find.byType(PatientRegistration), findsNothing);
      expect(find.byType(NoPatientFound), findsOneWidget);
    });
  });
}
