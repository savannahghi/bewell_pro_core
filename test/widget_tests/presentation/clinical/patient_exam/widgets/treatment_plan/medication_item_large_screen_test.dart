// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/treatment_plan/medication_item_large_screen.dart';
import '../../../../../../mocks/mocks.dart';
import '../../../../../../mocks/test_helpers.dart';

void main() {
  final Store<CoreState> store =
      Store<CoreState>(initialState: CoreState.initial());

  testWidgets('MedicationItemLargeScreen renders correctly ...',
      (WidgetTester tester) async {
    tester.binding.window.devicePixelRatioTestValue = 1.0;
    tester.binding.window.physicalSizeTestValue = tabletLandscape;

    int counter = 0;

    await buildTestWidget(
      tester: tester,
      store: store,
      widget: MedicationItemLargeScreen(
        medicationName: 'Paracetamol',
        prescription: '12',
        requester: 'Abdi Adan',
        retireMedicationFunc: () {
          counter = counter + 1;
        },
      ),
    );

    expect(
        find.byKey(AppWidgetKeys.retireMedicationsLargeScreen), findsOneWidget);
    await tester.tap(find.byKey(AppWidgetKeys.retireMedicationsLargeScreen));
    await tester.pumpAndSettle();

    expect(counter, 1);

    addTearDown(() {
      tester.binding.window.clearPhysicalSizeTestValue();
      tester.binding.window.clearDevicePixelRatioTestValue();
    });
  });
}
