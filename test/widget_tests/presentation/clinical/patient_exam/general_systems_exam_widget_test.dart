// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:sghi_core/ui_components/src/buttons.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/models/exam_composition.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawers/drawer_utils/drawer_save_button.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_examination/general_systems_exam_widget.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_examination/symptom_widget.dart';
import 'package:bewell_pro_core/presentation/core/widgets/generic_timeout_widget.dart';
import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('General Examination', () {
    setUpAll(() {
      startMockVisitAndExam();
    });

    late Store<CoreState> store;

    setUp(() {
      store = Store<CoreState>(initialState: CoreState.initial());
    });

    const String genExamTitle = 'General exam';
    const String weightStatusTitle = 'Weight status';

    final GeneralExamObject _generalExamObject = GeneralExamObject();
    final ExamCompositionObject examCompositionObject = ExamCompositionObject();

    const String compositionTitle = 'general-examination';
    const String patientRef = 'Patient/4b179736-f31a-4c55-986c-0c0785717748';
    const String patientName = 'Be Well';
    const String encounterRef =
        'Encounter/5377d069-cb0a-4fde-a3a3-d654e1710dab';
    final Map<String, dynamic> searchFHIRConditionMap = <String, dynamic>{
      'edges': <dynamic>[
        <String, dynamic>{
          'node': <String, dynamic>{
            'ID': 'f50e702a-963b-4825-82a3-f8746ee0e893',
            'Status': 'preliminary',
            'Type': <String, dynamic>{
              'Text': 'Consult Note',
              'Coding': <dynamic>[
                <String, dynamic>{
                  'System': 'http://loinc.org',
                  'Code': '11488-4',
                  'Display': 'Consult Note',
                  'UserSelected': false
                }
              ]
            },
            'Category': <dynamic>[
              <String, dynamic>{
                'Text': 'Consult Note',
                'Coding': <dynamic>[
                  <String, dynamic>{
                    'System': 'http://loinc.org',
                    'Code': '11488-4',
                    'Display': 'Consult Note',
                    'UserSelected': false
                  }
                ]
              }
            ],
            'Author': <dynamic>[
              <String, dynamic>{'Reference': null, 'Display': 'Abiud Orina'}
            ],
            'Title': 'general-examination',
            'Section': <dynamic>[
              <String, dynamic>{
                'Title': 'generalExam',
                'Text': <String, dynamic>{
                  'Status': 'generated',
                  'Div': json.encode(genExamJSON)
                }
              }
            ]
          }
        },
      ]
    };

    testWidgets(
        'should show a timeout widget when there is a timeout while fetching general systems exam',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(json.encode(<String, dynamic>{'error': 'timeout'}), 408),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        widget: const GeneralSystemsExamWidget(),
        graphQlClient: mockShortGraphQlClient,
      );
      await tester.pump();

      expect(find.byType(GenericTimeoutWidget), findsOneWidget);
      await tester.tap(find.byKey(AppWidgetKeys.genericTimeOutKey));
      await tester.pump();
      expect(find.byType(GenericTimeoutWidget), findsOneWidget);
    });

    testWidgets('should show zero state when searchFHIRComposition is null',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'searchFHIRComposition': null}
          }),
          200,
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        widget: const GeneralSystemsExamWidget(),
        graphQlClient: mockGraphQlClient,
      );

      expect(find.text(genExamTitle), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.feverCheckBoxKey), findsOneWidget);

      expect(find.text('Notes'), findsWidgets);
      expect(find.byKey(AppWidgetKeys.genExamNotesKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey),
          findsOneWidget);

      await tester.tap(find.byKey(AppWidgetKeys.genExamNotesKey));
      await tester.enterText(
          find.byKey(AppWidgetKeys.genExamNotesKey), 'notes');
      await tester.pump();

      await tester.tap(find.byKey(AppWidgetKeys.weightGainCheckBoxKey));

      // tap save button
      await tester.tap(find.byType(DrawerSaveButton));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
    });

    testWidgets('should show general exam form  when data is null',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
          json.encode(<String, dynamic>{'data': null}),
          200,
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        widget: const GeneralSystemsExamWidget(),
        graphQlClient: mockGraphQlClient,
      );

      // verify UI renders correctly
      expect(find.text(genExamTitle), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.feverCheckBoxKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.nauseaCheckBoxKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.rashCheckBoxKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.fatigueCheckBoxKey), findsOneWidget);
      expect(find.text(weightStatusTitle), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.weightGainCheckBoxKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.weightLossCheckBoxKey), findsOneWidget);
    });

    testWidgets('should create a new composition correctly',
        (WidgetTester tester) async {
      ExamCompositionObject().generalCompositionID.add('');

      final MockShortGraphQlClient mockGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'searchFHIRComposition': null,
              'updateFHIRComposition': null,
              'createFHIRComposition': <String, dynamic>{
                'resource': <String, String>{
                  'ID': '2cbb619e-682d-446c-b782-5c547093a702'
                }
              },
            }
          }),
          200,
        ),
      );

      await buildTestWidget(
        tester: tester,
        graphQlClient: mockGraphQlClient,
        widget: const GeneralSystemsExamWidget(),
      );

      // verify UI renders correctly
      expect(find.byKey(AppWidgetKeys.genExamNotesKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey),
          findsOneWidget);

      // check all checkboxes
      await tester.tap(find.byKey(AppWidgetKeys.feverCheckBoxKey));
      await tester.tap(find.byKey(AppWidgetKeys.nauseaCheckBoxKey));

      // confirm checkbox values are changed
      expect(_generalExamObject.symptoms['fever'], true);
      expect(_generalExamObject.symptoms['nausea'], true);

      // enter notes
      await tester.tap(find.byKey(AppWidgetKeys.genExamNotesKey));
      await tester.enterText(find.byKey(AppWidgetKeys.genExamNotesKey), 'text');

      // tap save button
      await tester.tap(find.byType(DrawerSaveButton));
      await tester.pumpAndSettle();

      expect(
          examCompositionObject.compositionTitle.value?.name, compositionTitle);
      expect(examCompositionObject.patientRef.value, patientRef);
      expect(examCompositionObject.patientName.value, patientName);
      expect(examCompositionObject.encounterRef.value, encounterRef);
    });

    testWidgets('should update an existing composition correctly',
        (WidgetTester tester) async {
      ExamCompositionObject()
          .generalCompositionID
          .add(testGeneralCompositionID);

      final MockShortGraphQlClient mockGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'searchFHIRComposition': null,
              'updateFHIRComposition': <String, dynamic>{
                'resource': <String, String>{
                  'ID': '2cbb619e-682d-446c-b782-5c547093a702'
                }
              },
              'createFHIRComposition': null,
            }
          }),
          200,
        ),
      );

      await buildTestWidget(
        tester: tester,
        graphQlClient: mockGraphQlClient,
        widget: const GeneralSystemsExamWidget(),
      );

      // verify UI renders correctly
      expect(find.byKey(AppWidgetKeys.genExamNotesKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey),
          findsOneWidget);

      // check all checkboxes
      await tester.tap(find.byKey(AppWidgetKeys.feverCheckBoxKey));
      await tester.tap(find.byKey(AppWidgetKeys.nauseaCheckBoxKey));

      // confirm checkbox values are changed
      expect(_generalExamObject.symptoms['fever'], true);
      expect(_generalExamObject.symptoms['nausea'], true);

      // enter notes
      await tester.tap(find.byKey(AppWidgetKeys.genExamNotesKey));
      await tester.enterText(find.byKey(AppWidgetKeys.genExamNotesKey), 'text');

      // tap save button
      await tester.tap(find.byType(DrawerSaveButton));
      await tester.pumpAndSettle();

      expect(
          examCompositionObject.compositionTitle.value?.name, compositionTitle);
      expect(examCompositionObject.patientRef.value, patientRef);
      expect(examCompositionObject.patientName.value, patientName);
      expect(examCompositionObject.encounterRef.value, encounterRef);
    });

    testWidgets('should render correctly with no data and save',
        (WidgetTester tester) async {
      ExamCompositionObject()
          .generalCompositionID
          .add(testGeneralCompositionID);

      final MockShortGraphQlClient mockGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'searchFHIRComposition': null,
              'updateFHIRComposition': <String, dynamic>{
                'resource': <String, String>{
                  'ID': '2cbb619e-682d-446c-b782-5c547093a702'
                }
              },
            }
          }),
          200,
        ),
      );

      await buildTestWidget(
        tester: tester,
        graphQlClient: mockGraphQlClient,
        widget: const GeneralSystemsExamWidget(),
      );

      // verify UI renders correctly
      expect(find.text(genExamTitle), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.feverCheckBoxKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.nauseaCheckBoxKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.rashCheckBoxKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.fatigueCheckBoxKey), findsOneWidget);
      expect(find.text(weightStatusTitle), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.weightGainCheckBoxKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.weightLossCheckBoxKey), findsOneWidget);
      expect(find.text('Notes'), findsWidgets);
      expect(find.byKey(AppWidgetKeys.genExamNotesKey), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.patientExamDrawerSaveButtonKey),
          findsOneWidget);

      // check all checkboxes
      await tester.tap(find.byKey(AppWidgetKeys.feverCheckBoxKey));
      await tester.tap(find.byKey(AppWidgetKeys.nauseaCheckBoxKey));
      await tester.tap(find.byKey(AppWidgetKeys.rashCheckBoxKey));
      await tester.tap(find.byKey(AppWidgetKeys.fatigueCheckBoxKey));
      await tester.tap(find.byKey(AppWidgetKeys.weightGainCheckBoxKey));
      await tester.tap(find.byKey(AppWidgetKeys.weightLossCheckBoxKey));

      // confirm checkbox values are changed
      expect(_generalExamObject.symptoms['fever'], true);
      expect(_generalExamObject.symptoms['nausea'], true);
      expect(_generalExamObject.symptoms['rash'], true);
      expect(_generalExamObject.symptoms['fatigue'], true);

      // enter notes
      await tester.tap(find.byKey(AppWidgetKeys.genExamNotesKey));
      await tester.enterText(find.byKey(AppWidgetKeys.genExamNotesKey), 'text');

      // tap save button
      await tester.tap(find.byType(DrawerSaveButton));
      await tester.pumpAndSettle();

      expect(
          examCompositionObject.compositionTitle.value?.name, compositionTitle);
      expect(examCompositionObject.patientRef.value, patientRef);
      expect(examCompositionObject.patientName.value, patientName);
      expect(examCompositionObject.encounterRef.value, encounterRef);
    });

    testWidgets('should render correctly with data when snapshot has data',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: const GeneralSystemsExamWidget(),
      );

      await tester.pump();

      expect(find.byType(GeneralSystemsExamWidget), findsOneWidget);
      expect(find.byType(SymptomWidget), findsWidgets);

      expect(find.text('Fever'), findsOneWidget);
      expect(find.text('Weight gain'), findsOneWidget);
      expect(find.text('Consultation'), findsOneWidget);
    });

    testWidgets(
        'should retire patient\'s general exam when deleteFHIRComposition is not null and is true ',
        (WidgetTester tester) async {
      ExamCompositionObject()
          .generalCompositionID
          .add(testGeneralCompositionID);

      await buildTestWidget(
          tester: tester,
          store: store,
          widget: const GeneralSystemsExamWidget());

      await tester.pump(Duration.zero);

      expect(find.byType(GeneralSystemsExamWidget), findsOneWidget);
      expect(find.byType(SILSecondaryButton), findsOneWidget);

      await tester.tap(find.byType(SILSecondaryButton));
      await tester.pumpAndSettle();

      final Finder reason = find.byKey(AppWidgetKeys.retireReasonFormField);
      expect(reason, findsOneWidget);
      await tester.enterText(reason, 'Already Cured');
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(AppWidgetKeys.retireHelperButtonKey));
      await tester.pump();

      await tester.pump();
      expect(_generalExamObject.symptoms.values.every((bool element) => false),
          isFalse);

      expect(_generalExamObject.description.value, isNull);
      await tester.pump();

      expect(find.byType(SnackBar), findsOneWidget);
    });

    testWidgets(
        'should retire patient\'s general exam when deleteFHIRComposition returns null',
        (WidgetTester tester) async {
      ExamCompositionObject()
          .generalCompositionID
          .add(testGeneralCompositionID);
      final MockShortGraphQlClient mockGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'searchFHIRComposition': searchFHIRConditionMap,
              'deleteFHIRComposition': null
            }
          }),
          200,
        ),
      );

      await buildTestWidget(
          tester: tester,
          store: store,
          graphQlClient: mockGraphQlClient,
          widget: const GeneralSystemsExamWidget());

      await tester.pump();

      expect(find.byType(GeneralSystemsExamWidget), findsOneWidget);
      expect(find.byType(SILSecondaryButton), findsOneWidget);

      await tester.tap(find.byType(SILSecondaryButton));
      await tester.pumpAndSettle();

      final Finder reason = find.byKey(AppWidgetKeys.retireReasonFormField);
      expect(reason, findsOneWidget);
      await tester.enterText(reason, 'Already Cured');
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(AppWidgetKeys.retireHelperButtonKey));
      await tester.pump();

      await tester.pump();
      expect(_generalExamObject.symptoms.values.every((bool element) => false),
          isFalse);

      expect(_generalExamObject.description.value, isNull);
      await tester.pump();

      expect(find.byType(SnackBar), findsOneWidget);
    });

    testWidgets('should fail to retire a patient\'s general exam',
        (WidgetTester tester) async {
      ExamCompositionObject()
          .generalCompositionID
          .add(testGeneralCompositionID);

      await buildTestWidget(
          tester: tester, widget: const GeneralSystemsExamWidget());

      await tester.pumpAndSettle();

      expect(find.byType(GeneralSystemsExamWidget), findsOneWidget);
      expect(find.byType(SILSecondaryButton), findsOneWidget);

      await tester.tap(find.byType(SILSecondaryButton));
      await tester.pump();

      final Finder reason = find.byKey(AppWidgetKeys.retireReasonFormField);
      expect(reason, findsOneWidget);
      await tester.enterText(reason, 'Already Cured');
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(AppWidgetKeys.retireHelperButtonKey));
      await tester.pump();
      await tester.pump();
      await tester.pump();

      expect(find.byType(SnackBar), findsOneWidget);
    });
  });
}
