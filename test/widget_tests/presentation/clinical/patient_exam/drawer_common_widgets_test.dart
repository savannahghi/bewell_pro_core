// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_ui_components/buttons.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawer_common_widgets/drawer_search_input.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawer_common_widgets/drawer_selected_item.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  final Store<CoreState> store =
      Store<CoreState>(initialState: CoreState.initial());

  testWidgets('DrawerSelectedItem renders correctly ...',
      (WidgetTester tester) async {
    await buildTestWidget(
      tester: tester,
      store: store,
      widget: DrawerSelectedItem(
        selectedItemTitleString: 'diagnosis',
        onCancelCallback: () {},
        selectedItem: 'Respiratory',
      ),
    );

    expect(find.text('Respiratory'), findsOneWidget);
    expect(find.byType(SILSecondaryButton), findsOneWidget);
  });

  testWidgets('DrawerSearchInput renders correctly',
      (WidgetTester tester) async {
    final TextEditingController controller = TextEditingController();
    final StreamController<dynamic> _streamController =
        StreamController<dynamic>();

    await buildTestWidget(
      tester: tester,
      store: store,
      widget: DrawerSearchInput(
        controller: controller,
        isItemSelected: true,
        labelText: 'Allergy',
        streamController: _streamController,
        suffixIconCallback: () {},
      ),
    );

    expect(find.text('Allergy'), findsOneWidget);
    expect(find.byType(TextFormField), findsOneWidget);
    expect(find.byIcon(Icons.close), findsOneWidget);

    addTearDown(() {
      _streamController.close();
    });
  });
}
