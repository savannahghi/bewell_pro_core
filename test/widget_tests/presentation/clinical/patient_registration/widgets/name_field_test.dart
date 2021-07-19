import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/clinical/patient_registration/basic_details_form_manager.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/widgets/name_field.dart';

import '../../../../../mocks/test_helpers.dart';

void main() {
  group('NameField', () {
    late BasicDetailsFormManager formManager;
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
      formManager = BasicDetailsFormManager();
    });

    testWidgets('should show error text when user leaves field empty',
        (WidgetTester tester) async {
      const String testName = 'John';
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: NameField(
          fieldHintText: firstNameHint,
          formHintText: enterFirstName,
          formFieldKey: AppWidgetKeys.firstNameKey,
          stream: formManager.firstName,
          sink: formManager.inFirstName,
        ),
      );

      final Finder textField = find.byType(TextField);
      expect(textField, findsOneWidget);

      expect(find.text(firstNameHint), findsOneWidget);
      expect(find.text(enterFirstName), findsOneWidget);

      await tester.enterText(textField, testName);
      expect(find.text(testName), findsOneWidget);

      await tester.enterText(textField, '');
      await tester.pump();
      expect(find.text(fieldCannotBeEmptyText), findsOneWidget);
    });
  });
}
