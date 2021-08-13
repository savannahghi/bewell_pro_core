import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/clinical/patient_registration/basic_details_form_manager.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/failures/generic_exception.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/widgets/name_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../mocks/test_helpers.dart';

void main() {
  group('NameField', () {
    late BasicDetailsFormManager formManager;
    late Store<CoreState> store;

    setUp(() {
      store = Store<CoreState>(initialState: CoreState.initial());
      formManager = BasicDetailsFormManager();
    });

    testWidgets('should show error text when user leaves field empty',
        (WidgetTester tester) async {
      const String testName = 'John';

      await buildTestWidget(
        tester: tester,
        store: store,
        widget: StreamBuilder<String>(
          stream: formManager.firstName,
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            return NameField(
              formFieldKey: AppWidgetKeys.firstNameKey,
              onChanged: (String value) => formManager.inFirstName.add(value),
              fieldHintText: firstNameHint,
              formHintText: enterFirstName,
              error: (snapshot.hasError)
                  ? (snapshot.error as GenericException?)?.message
                  : null,
            );
          },
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
