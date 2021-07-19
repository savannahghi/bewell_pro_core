import 'package:flutter_test/flutter_test.dart';
import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/treatment_plan/patient_exam_item_large.dart';
import '../../../../../../mocks/mocks.dart';
import '../../../../../../mocks/test_helpers.dart';

void main() {
  final Store<AppState> store =
      Store<AppState>(initialState: AppState.initial());

  testWidgets('PatientExamTestItemLarge renders correctly ...',
      (WidgetTester tester) async {
    tester.binding.window.devicePixelRatioTestValue = 1.0;
    tester.binding.window.physicalSizeTestValue = tabletLandscape;

    int counter = 0;

    await buildTestWidget(
      tester: tester,
      store: store,
      widget: PatientExamTestItemLarge(
        patientName: '',
        recordedDate: '',
        requestingDoctor: '',
        testName: '',
        testStatus: '',
        onRetireTestCallback: () {
          counter = counter + 1;
        },
      ),
    );

    expect(find.byKey(AppWidgetKeys.patientExamTestsRetireLargeScreenButtonKey),
        findsOneWidget);
    await tester.tap(
        find.byKey(AppWidgetKeys.patientExamTestsRetireLargeScreenButtonKey));
    await tester.pumpAndSettle();

    expect(counter, 1);

    addTearDown(() {
      tester.binding.window.clearPhysicalSizeTestValue();
      tester.binding.window.clearDevicePixelRatioTestValue();
    });
  });
}
