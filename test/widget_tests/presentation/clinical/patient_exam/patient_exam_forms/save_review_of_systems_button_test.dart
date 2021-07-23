import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:bewell_pro_core/application/redux/actions/user_state_actions/batch_update_user_state_action.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/clinical_exam_forms/save_review_of_systems_button.dart';
import 'package:domain_objects/entities.dart';
import 'package:http/http.dart';

import '../../../../../mocks/mocks.dart';
import '../../../../../mocks/test_helpers.dart';

void main() {
  group('SaveReviewOfSystemsButton', () {
    late Store<CoreState> store;

    setUp(() {
      store = Store<CoreState>(initialState: CoreState.initial());
      startMockVisitAndExam();
      ExamChangeObject().reviewOfSystemsChangeListener.add(false);
    });

    final ExamCompositionObject examComposition = ExamCompositionObject();
    const String reviewCompositionID = '2cbb619e-682d-446c-b782-5c547093a702';

    final Map<String, dynamic> createCompositionData = <String, dynamic>{
      'description': 'something',
      'symptomNoneKnown': 'false',
      'symptomEdema': 'false',
      'symptomChestPain': 'false',
      'symptomDOE': 'false',
      'symptomPalp': 'false',
      'symptomPND': 'false',
      'symptomDiaphore': 'false',
    };
    final Map<String, dynamic> updateCompositionData = <String, dynamic>{
      'id': reviewCompositionID,
      'description': 'something',
      'symptomNoneKnown': 'false',
      'symptomEdema': 'false',
      'symptomChestPain': 'false',
      'symptomDOE': 'false',
      'symptomPalp': 'false',
      'symptomPND': 'false',
      'symptomDiaphore': 'false',
    };

    testWidgets('should create a ReviewComposition correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        graphQlClient: mockGraphQlClient,
        tester: tester,
        store: store,
        widget: Builder(builder: (BuildContext context) {
          store.dispatch(BatchUpdateUserStateAction(
            userProfile: UserProfile(
                userBioData: BioData(
              firstName: testFirstName,
              lastName: testLastName,
            )),
          ));
          return SaveReviewOfSystemsButton(
            compositionData: createCompositionData,
            examCompositionObject: examComposition.heentTwo,
          );
        }),
      );

      await tester.pumpAndSettle();

      // verify UI renders correctly
      expect(find.byKey(AppWidgetKeys.silSecondaryButton), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey),
          findsOneWidget);

      // tap save button
      await tester
          .tap(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey));
      await tester.pumpAndSettle();

      // verify composition was created successfully
      expect(ExamCompositionObject().reviewCompositionID.value.toString(),
          reviewCompositionID);
      expect(ExamChangeObject().reviewOfSystemsChangeListener.value, true);

      // verify SaveReviewOfSystemsButton is closed
      expect(find.byType(SaveReviewOfSystemsButton), findsNothing);
    });

    testWidgets('should updates ReviewComposition correctly',
        (WidgetTester tester) async {
      store.dispatch(BatchUpdateUserStateAction(
        userProfile: UserProfile(
            userBioData: BioData(
          firstName: testFirstName,
          lastName: testLastName,
        )),
      ));

      await buildTestWidget(
        graphQlClient: mockGraphQlClient,
        tester: tester,
        store: store,
        widget: SaveReviewOfSystemsButton(
          compositionData: updateCompositionData,
          examCompositionObject: examComposition.heentTwo,
        ),
      );

      await tester.pumpAndSettle();

      // verify UI renders correctly
      expect(find.byKey(AppWidgetKeys.silSecondaryButton), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey),
          findsOneWidget);

      // tap save button
      await tester
          .tap(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey));
      await tester.pumpAndSettle();

      // verify composition was created successfully
      expect(ExamCompositionObject().reviewCompositionID.value.toString(),
          reviewCompositionID);
      expect(ExamChangeObject().reviewOfSystemsChangeListener.value, true);
    });

    testWidgets('should fail to update a composition',
        (WidgetTester tester) async {
      ExamCompositionObject().reviewCompositionID.add('some-composition-id');

      final MockShortGraphQlClient _client =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
            json.encode(
              <String, dynamic>{
                'data': <String, String>{'error': 'some error ocurred'}
              },
            ),
            200),
      );

      store.dispatch(BatchUpdateUserStateAction(
        userProfile: UserProfile(
            userBioData: BioData(
          firstName: testFirstName,
          lastName: testLastName,
        )),
      ));

      await buildTestWidget(
        graphQlClient: _client,
        tester: tester,
        store: store,
        widget: SaveReviewOfSystemsButton(
          compositionData: updateCompositionData,
          examCompositionObject: examComposition.heentTwo,
        ),
      );

      // verify UI renders correctly
      expect(find.byKey(AppWidgetKeys.silSecondaryButton), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey),
          findsOneWidget);

      // tap save button
      await tester
          .tap(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey));
      await tester.pumpAndSettle();

      expect(ExamChangeObject().reviewOfSystemsChangeListener.value, false);
    });

    testWidgets('should pop when cancel button is pressed',
        (WidgetTester tester) async {
      await buildTestWidget(
        graphQlClient: mockGraphQlClient,
        tester: tester,
        store: store,
        widget: Builder(builder: (BuildContext context) {
          store.dispatch(BatchUpdateUserStateAction(
            userProfile: UserProfile(
                userBioData: BioData(
              firstName: testFirstName,
              lastName: testLastName,
            )),
          ));
          return SaveReviewOfSystemsButton(
            compositionData: createCompositionData,
            examCompositionObject: examComposition.heentTwo,
          );
        }),
      );

      await tester.pumpAndSettle();

      // verify UI renders correctly
      expect(find.byKey(AppWidgetKeys.silSecondaryButton), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey),
          findsOneWidget);

      // tap cancel button
      await tester.tap(find.byKey(AppWidgetKeys.silSecondaryButton));
      await tester.pumpAndSettle();

      // verify SaveReviewOfSystemsButton is closed
      expect(find.byType(SaveReviewOfSystemsButton), findsNothing);
    });
  });
}
