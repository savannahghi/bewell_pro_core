import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';
import 'package:bewell_pro_core/domain/clinical/entities/contact_point.dart';
import 'package:bewell_pro_core/domain/clinical/entities/human_name.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_payload.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/no_next_of_kin_found.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/pages/next_of_kin.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/pages/patient_registration_container.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/widgets/next_of_kin_result_card.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/widgets/self_next_of_kin_search.dart';
import 'package:http/http.dart' as http;
import 'package:shared_themes/colors.dart';
import 'package:shared_ui_components/inputs.dart';

import '../../../../../mocks/mocks.dart';
import '../../../../../mocks/test_helpers.dart';

void main() {
  group('next of Kin', () {
    const String testPhoneNumber = '798000000';

    late Store<AppState> store;
    late TabController controller;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
      controller = TabController(length: 4, vsync: const TestVSync());
    });

    testWidgets('error results in NoNextOfKinFound card being shown',
        (WidgetTester tester) async {
      final Patient patient = Patient(
        name: <HumanName>[HumanName(text: 'John')],
      );
      final PatientPayload payload = PatientPayload(patientRecord: patient);
      final PatientRegistrationContainer container =
          PatientRegistrationContainer(
        tabController: controller,
        child: const NextOfKin(),
      );
      container.currentPatient.updatePatient(payload);

      final Map<String, String> error = <String, String>{'error': 'Test error'};
      final MockShortSILGraphQlClient silGraphQlClient =
          _getMockclientWithResponse(error);

      await buildTestWidget(
        store: store,
        tester: tester,
        graphQlClient: silGraphQlClient,
        widget: container,
      );

      await _inputPhoneNumber(tester, testPhoneNumber);

      final Finder noNextOfKinWidget = find.byType(NoNextOfKinFound);
      expect(noNextOfKinWidget, findsOneWidget);
    });

    testWidgets('data results in NextOfKinResultCard being shown',
        (WidgetTester tester) async {
      final List<Map<String, dynamic>> edges = <Map<String, dynamic>>[
        <String, dynamic>{
          'hasOpenEpisodes': false,
          'node': <String, dynamic>{
            'ID': '123456789',
            'Active': true,
            'Gender': 'male',
            'BirthDate': '01012000',
            'Telecom': <Map<String, String>>[
              <String, String>{
                'System': 'info@healthcloud.co.ke',
                'Value': '+254712345678',
              }
            ],
            'Name': <dynamic>[
              <String, dynamic>{
                'Given': <String>['John'],
                'Family': 'Doe',
                'Use': 'official',
                'Text': 'Doe, John',
                'Prefix': null,
                'Suffix': null,
                'Period': <String, String>{
                  'start': '2020-12-16T14:26:50+02:00',
                  'End': '2121-03-02T14:26:50+02:00',
                }
              }
            ],
          }
        },
        <String, dynamic>{
          'hasOpenEpisodes': false,
          'node': <String, dynamic>{
            'ID': '789456123',
            'Active': true,
            'Gender': 'female',
            'BirthDate': '01012000',
            'Telecom': <Map<String, String>>[
              <String, String>{
                'System': 'info2@healthcloud.co.ke',
                'Value': '+254789456123',
              }
            ],
            'Name': <dynamic>[
              <String, dynamic>{
                'Given': <String>['Jane'],
                'Family': 'Doe',
                'Use': 'official',
                'Text': 'Doe, Jane',
                'Prefix': null,
                'Suffix': null,
                'Period': <String, String>{
                  'start': '2020-12-16T14:26:50+02:00',
                  'End': '2121-03-02T14:26:50+02:00',
                }
              }
            ],
          }
        }
      ];

      final Map<String, dynamic> data = _getPatientDataWithEdges(edges);
      final MockShortSILGraphQlClient silGraphQlClient =
          _getMockclientWithResponse(data);

      await buildTestWidget(
        store: store,
        tester: tester,
        graphQlClient: silGraphQlClient,
        widget: PatientRegistrationContainer(
          tabController: controller,
          child: const NextOfKin(),
        ),
      );

      await _inputPhoneNumber(tester, testPhoneNumber);

      final Finder nextOfKinResultCard = find.byType(NextOfKinResultCard);
      expect(nextOfKinResultCard, findsNWidgets(edges.length));
    });

    testWidgets(
        'edges with inactive records results in NoNextOfKinFound being shown',
        (WidgetTester tester) async {
      final List<Map<String, dynamic>> edges = <Map<String, dynamic>>[
        <String, dynamic>{
          'hasOpenEpisodes': false,
          'node': <String, dynamic>{
            'ID': '123456789',
            'Active': false,
            'Gender': 'male',
            'BirthDate': '01012000',
            'Telecom': <Map<String, String>>[
              <String, String>{
                'System': 'info@healthcloud.co.ke',
                'Value': '+254712345678',
              }
            ],
            'Name': <dynamic>[
              <String, dynamic>{
                'Given': <String>['John'],
                'Family': 'Doe',
                'Use': 'official',
                'Text': 'Doe, John',
                'Prefix': null,
                'Suffix': null,
                'Period': <String, String>{
                  'start': '2020-12-16T14:26:50+02:00',
                  'End': '2121-03-02T14:26:50+02:00',
                }
              }
            ],
          }
        },
        <String, dynamic>{
          'hasOpenEpisodes': false,
          'node': <String, dynamic>{
            'ID': '789456123',
            'Active': false,
            'Gender': 'female',
            'BirthDate': '01012000',
            'Telecom': <Map<String, String>>[
              <String, String>{
                'System': 'info2@healthcloud.co.ke',
                'Value': '+254789456123',
              }
            ],
            'Name': <dynamic>[
              <String, dynamic>{
                'Given': <String>['Jane'],
                'Family': 'Doe',
                'Use': 'official',
                'Text': 'Doe, Jane',
                'Prefix': null,
                'Suffix': null,
                'Period': <String, String>{
                  'start': '2020-12-16T14:26:50+02:00',
                  'End': '2121-03-02T14:26:50+02:00',
                }
              }
            ],
          }
        }
      ];

      final Map<String, dynamic> data = _getPatientDataWithEdges(edges);
      final MockShortSILGraphQlClient silGraphQlClient =
          _getMockclientWithResponse(data);

      await buildTestWidget(
        store: store,
        tester: tester,
        graphQlClient: silGraphQlClient,
        widget: PatientRegistrationContainer(
          tabController: controller,
          child: const NextOfKin(),
        ),
      );

      await _inputPhoneNumber(tester, testPhoneNumber);

      final Finder nextOfKinResultCard = find.byType(NextOfKinResultCard);
      final Finder noNextOfKinWidget = find.byType(NoNextOfKinFound);

      expect(nextOfKinResultCard, findsNothing);
      expect(noNextOfKinWidget, findsOneWidget);
    });

    testWidgets('no edges results in NoNextOfKinFound being shown',
        (WidgetTester tester) async {
      final Map<String, dynamic> data =
          _getPatientDataWithEdges(<Map<String, dynamic>>[]);
      final MockShortSILGraphQlClient silGraphQlClient =
          _getMockclientWithResponse(data);

      await buildTestWidget(
        store: store,
        tester: tester,
        graphQlClient: silGraphQlClient,
        widget: PatientRegistrationContainer(
          tabController: controller,
          child: const NextOfKin(),
        ),
      );

      await _inputPhoneNumber(tester, testPhoneNumber);

      final Finder noNextOfKinWidget = find.byType(NoNextOfKinFound);
      expect(noNextOfKinWidget, findsOneWidget);
    });

    testWidgets('null records results in NoNextOfKinFound being shown',
        (WidgetTester tester) async {
      final Map<String, dynamic> data = <String, dynamic>{
        'data': <String, dynamic>{
          'findPatients': null,
        },
      };
      final MockShortSILGraphQlClient silGraphQlClient =
          _getMockclientWithResponse(data);

      await buildTestWidget(
        store: store,
        tester: tester,
        graphQlClient: silGraphQlClient,
        widget: PatientRegistrationContainer(
          tabController: controller,
          child: const NextOfKin(),
        ),
      );

      await _inputPhoneNumber(tester, testPhoneNumber);

      final Finder noNextOfKinWidget = find.byType(NoNextOfKinFound);
      expect(noNextOfKinWidget, findsOneWidget);
    });

    testWidgets(
        'same telephone number results in SelfNextOfKinSearch being shown',
        (WidgetTester tester) async {
      final List<Map<String, dynamic>> edges = <Map<String, dynamic>>[
        <String, dynamic>{
          'hasOpenEpisodes': false,
          'node': <String, dynamic>{
            'ID': '123456789',
            'Active': false,
            'Gender': 'male',
            'BirthDate': '01012000',
            'Telecom': <Map<String, String>>[
              <String, String>{
                'System': 'info@healthcloud.co.ke',
                'Value': '+254$testPhoneNumber',
              }
            ],
            'Name': <dynamic>[
              <String, dynamic>{
                'Given': <String>['John'],
                'Family': 'Doe',
                'Use': 'official',
                'Text': 'Doe, John',
                'Prefix': null,
                'Suffix': null,
                'Period': <String, String>{
                  'start': '2020-12-16T14:26:50+02:00',
                  'End': '2121-03-02T14:26:50+02:00',
                }
              }
            ],
          }
        },
      ];
      final Map<String, dynamic> data = _getPatientDataWithEdges(edges);

      final Patient patient = Patient(
          telecom: <ContactPoint>[ContactPoint(value: '+254$testPhoneNumber')]);
      final PatientPayload payload = PatientPayload(patientRecord: patient);
      final PatientRegistrationContainer container =
          PatientRegistrationContainer(
        tabController: controller,
        child: const NextOfKin(),
      );
      container.currentPatient.updatePatient(payload);

      await buildTestWidget(
        store: store,
        tester: tester,
        graphQlClient: _getMockclientWithResponse(data),
        widget: container,
      );

      await _inputPhoneNumber(tester, testPhoneNumber);

      final Finder selfNextOfKinSearch = find.byType(SelfNextOfKinSearch);
      expect(selfNextOfKinSearch, findsOneWidget);
    });

    testWidgets('pressing back button navigates to basic details',
        (WidgetTester tester) async {
      final TabController controller =
          TabController(length: 4, vsync: const TestVSync());

      final PatientRegistrationContainer patientRegContainer =
          PatientRegistrationContainer(
        tabController: controller,
        child: const NextOfKin(),
      );

      await buildTestWidget(
        store: store,
        tester: tester,
        widget: patientRegContainer,
      );

      final Finder backButton =
          find.byKey(AppWidgetKeys.previousActionButtonKey);
      expect(backButton, findsOneWidget);

      await tester.tap(backButton);
      await tester.pumpAndSettle();

      expect(patientRegContainer.currentIndex,
          PatientRegistrationContainer.basicDetailsIndex);
    });

    testWidgets('next button is disabled until all form fields are filled',
        (WidgetTester tester) async {
      final Map<String, dynamic> data =
          _getPatientDataWithEdges(<Map<String, dynamic>>[]);
      final MockShortSILGraphQlClient silGraphQlClient =
          _getMockclientWithResponse(data);

      await buildTestWidget(
        store: store,
        tester: tester,
        graphQlClient: silGraphQlClient,
        widget: PatientRegistrationContainer(
          tabController: controller,
          child: const NextOfKin(),
        ),
      );

      final Finder nextButton = find.byKey(AppWidgetKeys.nextActionButtonKey);
      expect(nextButton, findsOneWidget);

      Color? color =
          (nextButton.evaluate().first.widget as FloatingActionButton)
              .backgroundColor;
      expect(color, Colors.grey);

      await _inputPhoneNumber(tester, testPhoneNumber);
      color = (nextButton.evaluate().first.widget as FloatingActionButton)
          .backgroundColor;
      expect(color, healthcloudPrimaryColor);
    });

    testWidgets('tapping next button shows snackbar',
        (WidgetTester tester) async {
      final Map<String, dynamic> data =
          _getPatientDataWithEdges(<Map<String, dynamic>>[]);
      final MockShortSILGraphQlClient silGraphQlClient =
          _getMockclientWithResponse(data);

      await buildTestWidget(
        store: store,
        tester: tester,
        graphQlClient: silGraphQlClient,
        widget: PatientRegistrationContainer(
          tabController: controller,
          child: const NextOfKin(),
        ),
      );

      final Finder nextButton = find.byKey(AppWidgetKeys.nextActionButtonKey);
      expect(nextButton, findsOneWidget);

      await _inputPhoneNumber(tester, testPhoneNumber);
      final Color? color =
          (nextButton.evaluate().first.widget as FloatingActionButton)
              .backgroundColor;
      expect(color, healthcloudPrimaryColor);

      await tester.tap(nextButton);
      await tester.pumpAndSettle();

      expect(find.text(nextOfKinNotAddedText), findsOneWidget);
    });
  });
}

Future<void> _inputPhoneNumber(
    WidgetTester tester, String testPhoneNumber) async {
  final Finder phoneInput = find.byType(SILPhoneInput);
  await tester.enterText(phoneInput, testPhoneNumber);
  await tester.pump();
  await tester.pump(const Duration(milliseconds: 500));
}

MockShortSILGraphQlClient _getMockclientWithResponse(
    Map<String, dynamic> data) {
  final http.Response mockResponse = http.Response(json.encode(data), 200);

  final MockShortSILGraphQlClient silGraphQlClient =
      MockShortSILGraphQlClient.withResponse(
          'idToken', 'endpoint', mockResponse);
  return silGraphQlClient;
}

Map<String, dynamic> _getPatientDataWithEdges(
    List<Map<String, dynamic>> edges) {
  final Map<String, dynamic> data = <String, dynamic>{
    'data': <String, dynamic>{
      'findPatients': <String, dynamic>{
        'edges': edges,
      },
    },
  };
  return data;
}
