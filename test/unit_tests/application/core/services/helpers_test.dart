import 'dart:async';
import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/domain/clinical/entities/problem_allergy_summary.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:dart_fcm/dart_fcm.dart';
import 'package:flutter_graphql_client/graph_client.dart';

import '../../../../mocks/mock_utils.dart';
import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';
import 'helpers_test.mocks.dart';

@GenerateMocks(<Type>[SILFCM])
void main() {
  group('getRelationFromString', () {
    test('returns the correct NextOfKinRelation', () {
      expect(getRelationFromString(NextOfKinRelation.Emergency_Contact.name),
          NextOfKinRelation.Emergency_Contact);
      expect(getRelationFromString(NextOfKinRelation.Employer.name),
          NextOfKinRelation.Employer);
      expect(getRelationFromString(NextOfKinRelation.Next_of_Kin.name),
          NextOfKinRelation.Next_of_Kin);
      expect(getRelationFromString(NextOfKinRelation.Federal_Agency.name),
          NextOfKinRelation.Federal_Agency);
      expect(getRelationFromString(NextOfKinRelation.Insurance_Company.name),
          NextOfKinRelation.Insurance_Company);
      expect(getRelationFromString(NextOfKinRelation.State_Agency.name),
          NextOfKinRelation.State_Agency);
      expect(getRelationFromString(NextOfKinRelation.Unknown.name),
          NextOfKinRelation.Unknown);
      expect(getRelationFromString(NextOfKinRelation.Other.name),
          NextOfKinRelation.Other);
    });
  });

  group('getGenderFromString', () {
    test('returns the correct Gender', () {
      expect(getGenderFromString(Gender.male.name), Gender.male);
      expect(getGenderFromString(Gender.female.name), Gender.female);
      expect(getGenderFromString(Gender.unknown.name), Gender.unknown);
      expect(getGenderFromString(Gender.unknown.name), Gender.unknown);
    });
  });

  group('sendOtpRequest', () {
    final MockGraphQlClient graphQlClient = MockGraphQlClient.withResponse(
        'idToken', 'endpoint', Response('', 200));
    const String testPhoneNumber = '+254798363893';

    test('returns otp if request completed successfully', () async {
      final String? otp = await sendOtpRequest(
        graphQlClient: graphQlClient,
        phoneNumber: testPhoneNumber,
      );

      expect(otp, '123456');
    });

    test('returns null if phone number is empty or UNKNOWN', () async {
      String? otp = await sendOtpRequest(
        graphQlClient: graphQlClient,
        phoneNumber: '',
      );
      expect(otp, isNull);

      otp = await sendOtpRequest(
        graphQlClient: graphQlClient,
        phoneNumber: UNKNOWN,
      );

      expect(otp, isNull);
    });
  });

  test(
    'generateProblemAllergySummary generate a proper summary based on the '
    ' data provided',
    () {
      final Map<String, dynamic> nullData = <String, dynamic>{
        'problemSummary': null,
        'allergySummary': null,
      };

      ProblemAllergySummary summary = ProblemAllergySummary.fromJson(nullData);

      expect(summary.problemSummary, null);
      expect(summary.allergySummary, null);

      GenerateProblemAllergySummaryData processedSummary =
          generateProblemAllergySummary(summary.problemSummary, 'conditions');
      expect(processedSummary.problemOrAllergyString, 'No known conditions');
      expect(processedSummary.remainingItemsString, '');

      final Map<String, dynamic> emptyData = <String, dynamic>{
        'problemSummary': <String>[],
        'allergySummary': <String>[],
      };

      summary = ProblemAllergySummary.fromJson(emptyData);

      expect(summary.problemSummary, <String>[]);
      expect(summary.allergySummary, <String>[]);

      processedSummary =
          generateProblemAllergySummary(summary.problemSummary, 'allergies');
      expect(processedSummary.problemOrAllergyString, 'No known allergies');
      expect(processedSummary.remainingItemsString, '');

      final Map<String, dynamic> data = <String, dynamic>{
        'problemSummary': <String>['Diabetes'],
        'allergySummary': <String>['Penicillin'],
      };

      summary = ProblemAllergySummary.fromJson(data);

      expect(summary.problemSummary, <String>['Diabetes']);
      expect(summary.allergySummary, <String>['Penicillin']);

      processedSummary =
          generateProblemAllergySummary(summary.problemSummary, 'allergies');
      expect(processedSummary.problemOrAllergyString, 'Diabetes');
      expect(processedSummary.remainingItemsString, '');

      final Map<String, dynamic> dataWithTwoAllergies = <String, dynamic>{
        'problemSummary': <String>['Diabetes', 'Accidental Cut'],
      };

      summary = ProblemAllergySummary.fromJson(dataWithTwoAllergies);

      expect(summary.problemSummary, <String>['Diabetes', 'Accidental Cut']);
      expect(summary.allergySummary, null);

      processedSummary =
          generateProblemAllergySummary(summary.problemSummary, 'allergies');
      expect(
          processedSummary.problemOrAllergyString, 'Diabetes, Accidental Cut');
      expect(processedSummary.remainingItemsString, '');

      final Map<String, dynamic> dataWithMoreThanTwoAllergies =
          <String, dynamic>{
        'problemSummary': <String>['Diabetes', 'Accidental Cut', 'Malaria'],
      };

      summary = ProblemAllergySummary.fromJson(dataWithMoreThanTwoAllergies);

      expect(summary.problemSummary,
          <String>['Diabetes', 'Accidental Cut', 'Malaria']);
      expect(summary.allergySummary, null);

      processedSummary =
          generateProblemAllergySummary(summary.problemSummary, 'allergies');
      expect(
          processedSummary.problemOrAllergyString, 'Diabetes, Accidental Cut');
      expect(processedSummary.remainingItemsString, '1 more...');
    },
  );

  test('should save a device token', () async {
    setupFirebaseAuthMocks();

    await Firebase.initializeApp();

    final MockSILFCM fcm = MockSILFCM();

    expect(() async => saveDeviceToken(client: mockGraphQlClient, fcm: fcm),
        returnsNormally);
  });

  group('genericSearchFunction', () {
    test('should return results upon search', () async {
      final IGraphQlClient client = MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{
                'listConcepts': <dynamic>[
                  <String, dynamic>{
                    'concept_class': 'Drug',
                    'datatype': 'N/A',
                    'id': '81243',
                    'display_name': 'OSPA PROTEIN',
                  }
                ],
              }
            }),
            200),
      );

      final StreamController<dynamic> streamController =
          StreamController<dynamic>.broadcast();

      final Stream<dynamic> _stream =
          streamController.stream.asBroadcastStream();

      _stream.listen((dynamic event) {});

      expectLater(
        _stream,
        emitsInOrder(<dynamic>[
          <String, dynamic>{'loading': true},
          <String, dynamic>{
            'listConcepts': <dynamic>[
              <String, dynamic>{
                'concept_class': 'Drug',
                'datatype': 'N/A',
                'id': '81243',
                'display_name': 'OSPA PROTEIN',
              }
            ],
          }
        ]),
      );

      await genericSearchFunction(
        searchParam: 'PROTEIN',
        conceptClass: ConceptClass.drug,
        client: client,
        streamController: streamController,
      );

      addTearDown(() {
        streamController.close();
      });
    });

    test('should search using a param and return null', () async {
      final IGraphQlClient client = MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(json.encode(<String, dynamic>{'data': null}), 200),
      );

      final StreamController<dynamic> streamController =
          StreamController<dynamic>.broadcast();

      final Stream<dynamic> _stream =
          streamController.stream.asBroadcastStream();

      _stream.listen((dynamic event) {});

      expectLater(
        _stream,
        emitsInOrder(<dynamic>[
          <String, dynamic>{'loading': true},
          null,
        ]),
      );

      await genericSearchFunction(
        searchParam: 'nullSearchParam',
        conceptClass: ConceptClass.drug,
        client: client,
        streamController: streamController,
      );

      addTearDown(() {
        streamController.close();
      });
    });

    test('should add an error to the stream controller when it occurs',
        () async {
      final IGraphQlClient client = MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
            json.encode(<String, dynamic>{'error': 'some error ocurred'}), 200),
      );

      final StreamController<dynamic> streamController =
          StreamController<dynamic>.broadcast();

      final Stream<dynamic> _stream =
          streamController.stream.asBroadcastStream();

      _stream.listen((dynamic event) {}, onError: (dynamic emittedError) {
        expect(emittedError, isA<Map<String, dynamic>>());
        expect(emittedError, <String, dynamic>{'error': 'some error ocurred'});
      });

      expectLater(
        _stream,
        emitsInOrder(<dynamic>[
          emits(<String, dynamic>{'loading': true}),
          emitsError(<String, dynamic>{'error': 'some error ocurred'}),
        ]),
      );

      await genericSearchFunction(
        searchParam: 'some param',
        conceptClass: ConceptClass.drug,
        client: client,
        streamController: streamController,
      );

      // confirm that the error was added to the stream

      addTearDown(() {
        streamController.close();
      });
    });
  });

  group('publishEvent', () {
    const MethodChannel channel =
        MethodChannel('plugins.flutter.io/firebase_analytics');

    MethodCall? methodCall;

    setUp(() async {
      channel.setMockMethodCallHandler((MethodCall m) async {
        methodCall = m;
      });
    });

    tearDown(() {
      channel.setMockMethodCallHandler(null);
      methodCall = null;
    });

    testWidgets(
        'should publish event to Firebase analytics correctly successfully',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: const SizedBox(),
      );

      final BuildContext context = tester.element(find.byType(SizedBox));

      publishEvent('some-event', context);

      expect(methodCall, isNotNull);
      expect(methodCall!.method, 'logEvent');
      expect(methodCall!.arguments['parameters']['flavour'], 'PRO');
    });
  });

  testWidgets(
      'formatKEPhoneNumber should return a correcly formatted Kenyan PhoneNumber',
      (WidgetTester tester) async {
    // Test Cases => Actual
    const String fullKEPhone1 = '+254723073552';
    const String fullKEPhone2 = '254723073552';
    const String kePhone3 = '0723073552';
    const String kePhone5 = '723073552';

    // Formatted Numbers
    final String internationalKEPhone1 = formatKEPhoneNumber(fullKEPhone1);
    final String internationalKEPhone2 = formatKEPhoneNumber(fullKEPhone2);

    final String internationalKEPhone3 = formatKEPhoneNumber(kePhone3);
    final String internationalKEPhone5 = formatKEPhoneNumber(kePhone5);

    // Verify returns correct format
    expect(internationalKEPhone1, fullKEPhone1);
    expect(internationalKEPhone2, fullKEPhone1);

    expect(internationalKEPhone3, fullKEPhone1);
    expect(internationalKEPhone5, fullKEPhone1);
  });
}
