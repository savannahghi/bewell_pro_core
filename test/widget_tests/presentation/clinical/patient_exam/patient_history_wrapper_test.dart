import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/models/exam_composition.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawers/drawer_utils/drawer_save_button.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_history/patient_history_form.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_history/patient_history_wrapper.dart';
import 'package:http/http.dart' as http;

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('PatientHistoryWrapper', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets(
        'renders widget with text couldNotFindSnapshotError when request has an error',
        (WidgetTester tester) async {
      final MockShortGraphQlClient graphQlClient =
          MockShortGraphQlClient.withResponse(
              'idToken',
              'endpoint',
              http.Response(
                  json.encode(<String, String>{'error': 'Generic error'}),
                  400));

      await buildTestWidget(
          tester: tester,
          store: store,
          graphQlClient: graphQlClient,
          widget: PatientHistoryWrapper());

      // This additional pump is used to ensure that the broadcast updates the subscribed widget
      await tester.pump(const Duration(milliseconds: 17));

      expect(find.text(couldNotFindSnapshotError), findsOneWidget);
    });

    testWidgets(
        'renders PatientHistoryForm when response has no patient history compositions',
        (WidgetTester tester) async {
      final MockShortGraphQlClient graphQlClient =
          MockShortGraphQlClient.withResponse(
              'idToken',
              'endpoint',
              http.Response(
                  json.encode(<String, dynamic>{
                    'data': <String, dynamic>{
                      'searchFHIRComposition': <String, List<dynamic>>{
                        'edges': <Map<String, dynamic>>[
                          <String, dynamic>{
                            'node': <String, String>{
                              'Title': CompositionTypeTitle.reviewOfSystems.name
                            }
                          }
                        ]
                      }
                    }
                  }),
                  200));

      await buildTestWidget(
          tester: tester,
          store: store,
          graphQlClient: graphQlClient,
          widget: PatientHistoryWrapper());

      // This additional pump is used to ensure that the broadcast updates
      // the subscribed widget
      await tester.pump(const Duration(milliseconds: 17));

      expect(find.byType(PatientHistoryForm), findsOneWidget);
    });

    testWidgets('renders PatientHistoryForm when Composition Section is null',
        (WidgetTester tester) async {
      startMockVisitAndExam();
      final MockShortGraphQlClient graphQlClient =
          MockShortGraphQlClient.withResponse(
              'idToken',
              'endpoint',
              http.Response(
                  json.encode(<String, dynamic>{
                    'data': <String, dynamic>{
                      'searchFHIRComposition': <String, dynamic>{
                        'edges': <dynamic>[
                          <String, dynamic>{
                            'node': <String, dynamic>{
                              'ClinicalStatus': <String, dynamic>{
                                'Text': 'Active'
                              },
                              'Category': <dynamic>[
                                <String, dynamic>{'Text': 'encounter-diagnosis'}
                              ],
                              'RecordedDate': '2021-02-03',
                              'Recorder': <String, dynamic>{
                                'Display': 'john doe'
                              },
                              'Code': <String, dynamic>{
                                'Text': 'Adverse reaction to flu shot'
                              },
                              'Title': 'patient-history',
                              'Composition': <dynamic>[
                                <String, dynamic>{
                                  'title': 'rpatientHistory',
                                }
                              ]
                            }
                          },
                        ]
                      },
                      'createFHIRComposition': <String, dynamic>{
                        'resource': <String, String>{
                          'ID': '2cbb619e-682d-446c-b782-5c547093a702'
                        }
                      }
                    },
                  }),
                  200));

      await buildTestWidget(
          tester: tester,
          store: store,
          graphQlClient: graphQlClient,
          widget: PatientHistoryWrapper());

      // This additional pump is used to ensure that the broadcast updates the subscribed widget
      await tester.pump(const Duration(milliseconds: 17));
      await tester.pumpAndSettle();

      expect(find.byType(PatientHistoryForm), findsOneWidget);

      await tester
          .tap(find.byKey(AppWidgetKeys.illnessHistoryDescriptionTextKey));
      await tester.pump();

      await tester.enterText(
          find.byKey(AppWidgetKeys.illnessHistoryDescriptionTextKey),
          'blood pressure');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      await tester.tap(find.byType(DrawerSaveButton));
      await tester.pumpAndSettle();

      expect(find.byType(PatientHistoryForm), findsOneWidget);
    });
  });
}
