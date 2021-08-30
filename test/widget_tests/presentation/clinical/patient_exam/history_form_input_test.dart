import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_contexts.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/domain/core/value_objects/type_defs.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_history/history_form_input.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_history/patient_history_form.dart';
import 'package:app_wrapper/app_wrapper.dart';

import '../../../../mocks/mocks.dart';

void main() {
  final Store<CoreState> store =
      Store<CoreState>(initialState: CoreState.initial());

  const String payload = 'history payload';
  const bool isRequired = true;
  const String title = 'Family & Social History';
  final List<dynamic> register = <dynamic>[];
  const HistoryPayloadType type = HistoryPayloadType.family;

  UpdatePatientHistoryPayload? updatePayload(
      HistoryPayloadType type, String? value) {}

  testWidgets('History Form Input renders correctly',
      (WidgetTester tester) async {
    startMockVisitAndExam();
    await tester.pumpWidget(
      StoreProvider<CoreState>(
        store: store,
        child: AppWrapper(
          appName: AppBrand().appName.value,
          appContexts: testAppContexts,
          graphQLClient: mockGraphQlClient,
          child: MaterialApp(
            home: Scaffold(
                body: HistoryFormInput(
              inputKey: AppWidgetKeys.medicalHistoryDescriptionTextKey,
              isRequired: isRequired,
              initialInputData: payload,
              callbackRegister: register,
              title: title,
              type: type,
              updateInputDataFunction: updatePayload,
            )),
          ),
        ),
      ),
    );

    expect(find.byType(HistoryFormInput), findsOneWidget);
    expect(find.text(title), findsOneWidget);
  });

  testWidgets('displays patient history information',
      (WidgetTester tester) async {
    startMockVisitAndExam();
    await tester.pumpWidget(
      StoreProvider<CoreState>(
        store: store,
        child: AppWrapper(
          appName: AppBrand().appName.value,
          graphQLClient: mockGraphQlClient,
          appContexts: testAppContexts,
          child: MaterialApp(
            home: Scaffold(
                body: HistoryFormInput(
              inputKey: AppWidgetKeys.medicalHistoryDescriptionTextKey,
              isRequired: isRequired,
              initialInputData: payload,
              callbackRegister: register,
              title: title,
              type: type,
              updateInputDataFunction: updatePayload,
            )),
          ),
        ),
      ),
    );

    expect(find.byType(HistoryFormInput), findsOneWidget);
    expect(find.text(title), findsOneWidget);
    expect(find.byType(TextButton), findsOneWidget);

    await tester.tap(find.byType(TextButton));
    await tester.pumpAndSettle();

    expect(find.text(payload), findsOneWidget);
  });
}
