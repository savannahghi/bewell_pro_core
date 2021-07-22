import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/core/graphql/mutations.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/common/widgets/bewell_submit_dialog.dart';
import 'package:shared_ui_components/buttons.dart';

import 'package:http/http.dart' as http;
import 'package:shared_ui_components/platform_loader.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('Bewell submit dialog', () {
    final Store<AppState> store =
        Store<AppState>(initialState: AppState.initial());

    testWidgets('renders correctly', (WidgetTester tester) async {
      Map<String, dynamic> data = <String, dynamic>{};
      final Map<String, dynamic> result = <String, dynamic>{
        'createFHIRCondition': <String, dynamic>{
          'resource': <String, String>{
            'ID': '49690e3e-1313-435d-9ef7-a8d1040198cb'
          }
        }
      };

      await buildTestWidget(
        tester: tester,
        store: store,
        widget: Builder(builder: (BuildContext context) {
          return SILPrimaryButton(
            onPressed: () async {
              data = await showDialog(
                context: context,
                useRootNavigator: false,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return BewellSubmitDialog(
                    data: addDiagnosisVariables(
                      clinicalStatus: 'clinicalStatus',
                      dateRecorded: 'dateRecorded',
                      selectedDiagnosis: 'selectedCondition',
                      recordingDoctor: 'recordingDoctor',
                      doctorNotes: 'doctorNotes',
                      patientReference: 'patientHCID',
                      diagnosisCode: 'some-code',
                      encounterReference: 'encounterID',
                    ),
                    query: addConditionMutation,
                  );
                },
              ) as Map<String, dynamic>;
            },
          );
        }),
      );

      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();

      expect(data, result);
    });

    testWidgets('shows the loading indicator when loading',
        (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = tabletLandscape;

      final NHIFInformationObject nhifInformation = NHIFInformationObject();
      nhifInformation.patientID.add(testPatientId);
      nhifInformation.membershipNumber.add('15285455');
      nhifInformation.frontImageBase64.add('15285455');
      nhifInformation.frontImageContentType.add('15285455');

      final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
              'idToken',
              'endpoint',
              http.Response(
                  json.encode(<String, dynamic>{
                    'data': <String, dynamic>{
                      'loading': true,
                      'addNHIF': <String, dynamic>{
                        'patientRecord': <String, dynamic>{
                          'ID': 'fda0f399-57c8-4a31-9308-2d01eb767f96'
                        }
                      }
                    }
                  }),
                  201));

      await buildTestWidget(
        graphQlClient: mockShortGraphQlClient,
        tester: tester,
        store: store,
        widget: Builder(builder: (BuildContext context) {
          return BewellSubmitDialog(
            data: nhifInformation.data,
            query: addPatientNHIFMutation,
          );
        }),
      );

      await tester.pump(const Duration(seconds: 5));

      expect(find.byKey(AppWidgetKeys.displayLoadingLargeCenterKey),
          findsOneWidget);
      expect(find.byType(SILPlatformLoader), findsOneWidget);
      expect(find.text(loadingText), findsOneWidget);

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });

    testWidgets(
        'should properly process an error when an error response '
        'is returned from the api', (WidgetTester tester) async {
      final MockShortGraphQlClient aaa = MockShortGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          http.Response(
              json.encode(<String, dynamic>{
                'data': <String, dynamic>{'error': 'some error ocurred'}
              }),
              200));

      Map<String, dynamic> data = <String, dynamic>{};

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: aaa,
        widget: Builder(builder: (BuildContext context) {
          return SILPrimaryButton(
            onPressed: () async {
              data = await showDialog(
                context: context,
                useRootNavigator: false,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return BewellSubmitDialog(
                    data: addDiagnosisVariables(
                      clinicalStatus: 'clinicalStatus',
                      dateRecorded: 'dateRecorded',
                      selectedDiagnosis: 'selectedCondition',
                      recordingDoctor: 'recordingDoctor',
                      doctorNotes: 'doctorNotes',
                      patientReference: 'patientHCID',
                      encounterReference: 'encounterID',
                      diagnosisCode: 'some-code',
                    ),
                    query: addConditionMutation,
                  );
                },
              ) as Map<String, dynamic>;
            },
          );
        }),
      );

      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();

      expect(data.containsKey('error'), true);
      expect(data['error'], 'some error ocurred');
      expect(find.byType(SILPrimaryButton), findsOneWidget);
    });
  });
}
