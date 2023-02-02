// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sghi_core/ui_components/src/buttons.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawers/add_blood_pressure_drawer.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('drawer header', () {
    final Store<CoreState> store =
        Store<CoreState>(initialState: CoreState.initial());
    testWidgets('renders correctly and closes correctly',
        (WidgetTester tester) async {
      await buildDrawerTestWidget(tester, DrawerType.bloodPressure,
          store: store);

      // verify UI renders correctly
      expect(find.byType(SILPrimaryButton), findsOneWidget);

      // Tap btn to open drawer
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();

      expect(find.byType(IconButton), findsOneWidget);
      expect(find.text('Add Blood Pressure Reading'), findsOneWidget);
      expect(find.byType(IconButton), findsOneWidget);
      expect(find.byIcon(Icons.close), findsOneWidget);

      await tester.tap(find.byKey(AppWidgetKeys.closeDrawerButtonKey));
      await tester.pumpAndSettle();

      expect(find.byType(AddBloodPressure), findsNothing);
    });
  });
}
