// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/medications/bewell_select_input.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('AddTest', () {
    final Store<CoreState> store =
        Store<CoreState>(initialState: CoreState.initial());

    final List<String> routeOptions = <String>[
      'Capsules',
      'Oral',
      'Injection',
      'Sublingual',
      'Nasal',
    ];

    testWidgets('verify cancel selected test item works',
        (WidgetTester tester) async {
      int counter = 0;
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: BeWellSelectInput(
          onChanged: (String? v) {
            counter = counter + 1;
          },
          options: routeOptions,
          value: '',
          dropDownInputKey: const Key('Press'),
        ),
      );

      /// Verify renders
      expect(find.text('Capsules'), findsOneWidget);
      expect(find.text('Oral'),
          findsOneWidget); // Finds One Widget when dropdown is closed
      /// Open dropdown
      await tester.tap(find.byKey(const Key('Press')));
      await tester.pumpAndSettle();

      /// Confirm dropdown is open & Select oral value
      expect(find.text('Oral'), findsWidgets);
      await tester.tap(find.text('Oral').last);
      await tester.pumpAndSettle();

      /// Verify dropdown value changed
      expect(find.text('Capsules'), findsOneWidget);
      expect(counter, 2);
      expect(find.text('Oral'), findsOneWidget);
    });
  });
}
