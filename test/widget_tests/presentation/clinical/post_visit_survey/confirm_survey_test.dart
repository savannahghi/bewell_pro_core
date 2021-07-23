import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/pages/patient_search_page.dart';
import 'package:bewell_pro_core/presentation/clinical/post_visit_survey/confirm_survey_page.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('ConfirmSurvey', () {
    final Store<CoreState> store =
        Store<CoreState>(initialState: CoreState.initial());

    testWidgets('should skip curvey correctly', (WidgetTester tester) async {
      await mockNetworkImages(() async {
        await buildTestWidget(
            tester: tester, store: store, widget: ConfirmSurveyPage());
        expect(find.byKey(AppWidgetKeys.takeSurveyButtonKey), findsOneWidget);
        expect(find.byKey(AppWidgetKeys.skipSurveyButtonKey), findsOneWidget);

        await tester.tap(find.byKey(AppWidgetKeys.skipSurveyButtonKey));
        await tester.pumpAndSettle();

        expect(find.byType(PatientSearchPage), findsOneWidget);
      });
    });

    testWidgets(' renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
          tester: tester, store: store, widget: ConfirmSurveyPage());

      expect(find.byKey(AppWidgetKeys.takeSurveyButtonKey), findsOneWidget);
      await tester.tap(find.byKey(AppWidgetKeys.takeSurveyButtonKey));
      await tester.pumpAndSettle();

      // confirm navigation to post vist survey page
      expect(find.text(missingItemText), findsOneWidget);

      addTearDown(() {
        tester.binding.window.clearDevicePixelRatioTestValue();
        tester.binding.window.clearPhysicalSizeTestValue();
      });
    });
    testWidgets(' renders correctly in small screen',
        (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = tabletLandscape;
      await buildTestWidget(
          tester: tester, store: store, widget: ConfirmSurveyPage());

      expect(find.byKey(AppWidgetKeys.takeSurveyButtonKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.skipSurveyButtonKey), findsOneWidget);

      addTearDown(() {
        tester.binding.window.clearDevicePixelRatioTestValue();
        tester.binding.window.clearPhysicalSizeTestValue();
      });
    });
  });
}
