import 'dart:convert';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/entities.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_graphql_client/graph_utils.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/application/redux/actions/navigation_actions/navigation_action.dart';
import 'package:bewell_pro_core/application/redux/actions/user_state_actions/batch_update_user_state_action.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/domain/core/value_objects/asset_strings.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/pages/patient_exam.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/drawer_header.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/pages/patient_search_page.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/pages/phone_login_page.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/widgets/phone_login.dart';
import 'package:bewell_pro_core/presentation/onboarding/profile/pages/user_profile_page.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';
import 'package:http/http.dart';
import 'package:misc_utilities/misc.dart';
import 'package:misc_utilities/number_constants.dart';
import 'package:misc_utilities/responsive_widget.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:shared_themes/constants.dart';
import 'package:shared_ui_components/buttons.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('Helpers', () {
    late Store<CoreState> store;

    setUp(() {
      store = Store<CoreState>(initialState: CoreState.initial());
    });

    final MockGraphQlClient mockGraphQlClient = MockGraphQlClient.withResponse(
        'idToken', 'endpoint', Response('', 200));

    testWidgets('should send OTP verification code',
        (WidgetTester tester) async {
      String? otp;
      await buildTestWidget(
          tester: tester,
          store: store,
          widget: SILPrimaryButton(
            onPressed: () async {
              final String newOtp = await GraphQlUtils().sendOtp(
                client: mockGraphQlClient,
                phoneNumber: '0712345678',
                email: 'demo@gmail.com',
                logTitle: 'utils_test: sendOTP',
              );
              otp = newOtp;
            },
            text: 'Send Code',
          ));

      expect(otp, null);
      expect(find.byType(SILPrimaryButton), findsOneWidget);
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pump();
      expect(otp, '123456');
    });

    testWidgets('should fail to send OTP verification code',
        (WidgetTester tester) async {
      String? otp;
      await buildTestWidget(
          tester: tester,
          store: store,
          widget: SILPrimaryButton(
            onPressed: () async {
              final String newOtp = await GraphQlUtils().sendOtp(
                client: mockGraphQlClient,
                phoneNumber: '071',
                email: 'demo1@gmail.com',
                logTitle: 'utils_test: sendOTP',
              );
              otp = newOtp;
            },
            text: 'Send Code',
          ));

      expect(find.byType(SILPrimaryButton), findsOneWidget);
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pump();
      expect(otp, '123456');
    });

    testWidgets('getUploadId Function should return correct response',
        (WidgetTester tester) async {
      dynamic response;

      await buildTestWidget(
          tester: tester,
          store: store,
          widget: Builder(builder: (BuildContext context) {
            StoreProvider.dispatch<CoreState>(
                context,
                BatchUpdateUserStateAction(
                    userProfile: UserProfile(
                        userBioData: BioData(
                            firstName: testFirstName,
                            lastName: testLastName))));
            return SILPrimaryButton(
              buttonKey: AppWidgetKeys.silPrimaryButtonKey,
              onPressed: () async {
                response = await getUploadId(
                    context: context,
                    fileData: <String, dynamic>{'null': null});
              },
              text: 'Search',
            );
          }));

      expect(find.byKey(AppWidgetKeys.silPrimaryButtonKey), findsOneWidget);
      await tester.tap(find.byKey(AppWidgetKeys.silPrimaryButtonKey));
      await tester.pump();

      expect(response, 'err');
    });

    testWidgets('logoutFunction navigates to Login page',
        (WidgetTester tester) async {
      await buildTestWidget(
          tester: tester,
          store: store,
          widget: Builder(
            builder: (BuildContext context) {
              return SILPrimaryButton(
                onPressed: () async {
                  await logoutUser(context);
                },
              );
            },
          ));

      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.byType(PhoneLoginPage), findsOneWidget);
    });

    testWidgets('postVisitSurveyCompleteButton renders correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (BuildContext context) {
              return postVisitSurveyCompleteButton(() {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('I am a snackbar')));
              }, context);
            },
          ),
        ),
      ));

      expect(find.text('Continue'), findsOneWidget);

      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pump();

      expect(find.byType(SnackBar), findsOneWidget);
    });
  });

  group('checkData', () {
    testWidgets('should work correctly', (WidgetTester tester) async {
      ExamChangeObject().onAddTestListener.add(false);
      int counter = 0;
      expect(ExamChangeObject().onAddTestListener.value, false);

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Builder(builder: (BuildContext context) {
            return SILPrimaryButton(
              text: 'submitText',
              onPressed: () => checkData(
                  context: context,
                  data: <String, String>{'BeWell': 'Test'},
                  errorMsg: 'Error',
                  listener: ExamChangeObject().onAddTestListener,
                  listenerValue: true,
                  popContext: false,
                  successCallback: () {
                    counter = counter + 1;
                  },
                  successMsg: 'Success'),
            );
          }),
        ),
      ));

      await tester.tap(find.text('submitText'));
      await tester.pump();

      expect(ExamChangeObject().onAddTestListener.value, true);
      expect(counter, 1);
      expect(find.text('Success'), findsOneWidget);
      expect(find.byType(SnackBar), findsOneWidget);
    });

    testWidgets('should close successfully', (WidgetTester tester) async {
      ExamChangeObject().onAddTestListener.add(false);
      int counter = 0;
      expect(ExamChangeObject().onAddTestListener.value, false);

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Center(
            child: Builder(builder: (BuildContext context) {
              return SILPrimaryButton(
                text: 'submitText',
                onPressed: () => checkData(
                    context: context,
                    data: <String, String>{'BeWell': 'Test'},
                    errorMsg: 'Error',
                    listener: ExamChangeObject().onAddTestListener,
                    listenerValue: true,
                    popContext: true,
                    successCallback: () {
                      counter = counter + 1;
                    },
                    successMsg: 'PopContext'),
              );
            }),
          ),
        ),
      ));

      await tester.tap(find.text('submitText'));
      await tester.pump();

      expect(ExamChangeObject().onAddTestListener.value, true);
      expect(counter, 0);
    });

    testWidgets('should return errorMsg', (WidgetTester tester) async {
      ExamChangeObject().onAddTestListener.add(false);
      int counter = 0;
      expect(ExamChangeObject().onAddTestListener.value, false);

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Center(
            child: Builder(builder: (BuildContext context) {
              return SILPrimaryButton(
                text: 'submitText',
                onPressed: () => checkData(
                    context: context,
                    data: null,
                    errorMsg: 'Error',
                    listener: ExamChangeObject().onAddTestListener,
                    listenerValue: true,
                    popContext: true,
                    successCallback: () {
                      counter = counter + 1;
                    },
                    successMsg: ''),
              );
            }),
          ),
        ),
      ));

      await tester.tap(find.text('submitText'));
      await tester.pump();

      expect(ExamChangeObject().onAddTestListener.value, false);
      expect(counter, 0);
      expect(find.text('Error'), findsOneWidget);
      expect(find.byType(SnackBar), findsOneWidget);
    });
  });

  group('SurveyBottomSheet', () {
    testWidgets('renders correctly on a small screen',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (BuildContext context) {
              return SurveyBottomSheet(context).build(context);
            },
          ),
        ),
      ));

      expect(find.text(thankYouForYourFeedback), findsOneWidget);
      expect(find.text('Continue'), findsOneWidget);
    });

    testWidgets('renders correctly on a large screen',
        (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = tabletLandscape;

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (BuildContext context) {
              return SurveyBottomSheet(context).build(context);
            },
          ),
        ),
      ));

      expect(find.text(thankYouForYourFeedback), findsOneWidget);
      expect(find.text('Continue'), findsOneWidget);

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });

    testWidgets(
        'navigates to patient identification page when continue button is pressed',
        (WidgetTester tester) async {
      final Store<CoreState> store =
          Store<CoreState>(initialState: CoreState.initial());

      await mockNetworkImages(() async {
        await buildTestWidget(
            tester: tester,
            store: store,
            widget: Builder(
              builder: (BuildContext context) {
                return SurveyBottomSheet(context).build(context);
              },
            ));
        await tester.tap(find.text('Continue'));
        await tester.pumpAndSettle();

        expect(find.byType(PatientSearchPage), findsOneWidget);
      });
    });
  });

  group('User profile RouteTest', () {
    final Store<CoreState> store =
        Store<CoreState>(initialState: CoreState.initial());
    testWidgets(
        'should render user profile correctly when change pin in  tapped',
        (WidgetTester tester) async {
      store.dispatch(BatchUpdateUserStateAction(
          userProfile: UserProfile(
        primaryPhoneNumber: testPhoneNumber,
      )));

      await mockNetworkImages(() async {
        await buildTestWidget(
          tester: tester,
          store: store,
          widget: Builder(builder: (BuildContext context) {
            return UserProfilePage();
          }),
        );

        //account

        await tester.tap(find.text(changePINText));
        await tester.pump();

        expect(find.text(changePINText), findsOneWidget);
      });
    });

    testWidgets(
        'should render user profile correctly when change pin in not tapped',
        (WidgetTester tester) async {
      store.dispatch(BatchUpdateUserStateAction(
          userProfile: UserProfile(
        primaryPhoneNumber: testPhoneNumber,
      )));

      await mockNetworkImages(() async {
        await buildTestWidget(
          tester: tester,
          store: store,
          widget: Builder(builder: (BuildContext context) {
            return UserProfilePage();
          }),
        );

        //account

        await tester.tap(find.text(contactInfo));
        await tester.pump();

        expect(find.text(contactInfo), findsOneWidget);
      });
    });

    testWidgets('should return a recording doctor',
        (WidgetTester tester) async {
      store.dispatch(
        BatchUpdateUserStateAction(
          userProfile: UserProfile(
            userBioData: BioData(
              firstName: Name.withValue('bewell'),
              lastName: Name.withValue('pro'),
            ),
          ),
        ),
      );

      late String? doctor;

      await buildTestWidget(
          tester: tester,
          store: store,
          widget: Builder(builder: (BuildContext context) {
            return GestureDetector(
              onTap: () => doctor = getRecordingDoctor(context),
            );
          }));

      //account

      await tester.tap(find.byType(GestureDetector));
      await tester.pump();

      expect(doctor, isNotNull);
      expect(doctor, 'Bewell Pro');
    });
  });

  group('getInitialPageRoute', () {
    final Store<CoreState> store =
        Store<CoreState>(initialState: CoreState.initial());

    testWidgets(
        'should return phoneLoginRoute if a user is signed in and the token'
        ' has expired for more than 12 hours', (WidgetTester tester) async {
      /// modify change the expiry time to >10 minutes in the future
      final DateTime hours = DateTime.now().subtract(const Duration(hours: 22));

      await store.dispatch(
        BatchUpdateUserStateAction(
          isSignedIn: true,
          tokenExpiryTime: hours.toIso8601String(),
        ),
      );

      late String? route;

      await buildTestWidget(
          tester: tester,
          store: store,
          widget: Builder(builder: (BuildContext context) {
            return GestureDetector(
              onTap: () async =>
                  route = await getInitialRoute(context: context),
            );
          }));

      // normal when the token is UNKNOWN

      await tester.tap(find.byType(GestureDetector));
      await tester.pump();

      expect(route, isNotNull);
      expect(route, phoneLoginRoute);
    });

    testWidgets(
        'should return pinVerificationRoute if a user is signed in and the token'
        ' has just expired for less than 12 hours',
        (WidgetTester tester) async {
      /// modify change the expiry time to >10 minutes in the future
      final DateTime hours = DateTime.now().subtract(const Duration(hours: 9));

      await store.dispatch(
        BatchUpdateUserStateAction(
          isSignedIn: true,
          tokenExpiryTime: hours.toIso8601String(),
        ),
      );

      late String? route;

      await buildTestWidget(
          tester: tester,
          store: store,
          widget: Builder(builder: (BuildContext context) {
            return GestureDetector(
              onTap: () async =>
                  route = await getInitialRoute(context: context),
            );
          }));

      // normal when the token is UNKNOWN

      await tester.tap(find.byType(GestureDetector));
      await tester.pump();

      expect(route, isNotNull);
      expect(route, pinVerificationRoute);
    });

    testWidgets(
        'should return the correct onboarding path if a user is signed in '
        'and the token is valid', (WidgetTester tester) async {
      /// modify change the expiry time to >10 minutes in the future
      final DateTime hours = DateTime.now().add(const Duration(minutes: 12));

      await store.dispatch(
        BatchUpdateUserStateAction(
          isSignedIn: true,
          tokenExpiryTime: hours.toIso8601String(),
        ),
      );

      late String? route;

      await buildTestWidget(
          tester: tester,
          store: store,
          widget: Builder(builder: (BuildContext context) {
            return GestureDetector(
              onTap: () async =>
                  route = await getInitialRoute(context: context),
            );
          }));

      // normal when the token is UNKNOWN

      await tester.tap(find.byType(GestureDetector));
      await tester.pump();

      expect(route, isNotNull);
      expect(route, '/userNames');
    });
  });

  group('addNHIF', () {
    final Store<CoreState> store =
        Store<CoreState>(initialState: CoreState.initial());
    testWidgets('should save nhif member number (happy case)',
        (WidgetTester tester) async {
      final NHIFInformationObject nhifInformation = NHIFInformationObject();

      nhifInformation.patientID.add('fda0f399-57c8-4a31-9308-2d01eb767f96');
      nhifInformation.membershipNumber.add('15285455');
      nhifInformation.frontImageContentType.add('15285455');
      nhifInformation.frontImageBase64.add('15285455');

      await buildTestWidget(
        tester: tester,
        widget: Builder(builder: (BuildContext context) {
          return Scaffold(
            body: SILPrimaryButton(
              buttonKey: const Key('add_NHIF'),
              onPressed: () async {
                await addNHIF(
                    context: context, nhifInformation: nhifInformation);
              },
              text: 'addNHIF',
            ),
          );
        }),
        store: store,
      );

      await tester.pump();
      // tap add member number button
      await tester.tap(find.byKey(const Key('add_NHIF')));
      await tester.pumpAndSettle();
      // verify nhif member number saved
      expect(find.text('NHIF saved'), findsOneWidget);
      expect(find.byType(SnackBar), findsOneWidget);
    });

    testWidgets(
        'should fail to save nhif member number if mutation returned error response (sad case)',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
            json.encode(
              <String, dynamic>{'error': 'Unable to save NHIF Member number'},
            ),
            400),
      );

      final NHIFInformationObject nhifInformation = NHIFInformationObject();

      nhifInformation.patientID.add('fda0f399-57c8-4a31-9308-2d01eb767f96');
      nhifInformation.membershipNumber.add('15285455');
      nhifInformation.frontImageContentType.add('15285455');
      nhifInformation.frontImageBase64.add('15285455');

      await buildTestWidget(
        tester: tester,
        graphQlClient: mockShortGraphQlClient,
        widget: Builder(builder: (BuildContext context) {
          return Scaffold(
            body: SILPrimaryButton(
              buttonKey: const Key('add_NHIF'),
              onPressed: () async {
                await addNHIF(
                    context: context, nhifInformation: nhifInformation);
              },
              text: 'addNHIF',
            ),
          );
        }),
        store: store,
      );

      await tester.pump();
      // tap add member number button
      await tester.tap(find.byKey(const Key('add_NHIF')));
      await tester.pumpAndSettle();
      // verify nhif member number saved
      expect(find.text('Ok, thanks'), findsOneWidget);
      expect(find.byType(SnackBar), findsOneWidget);
    });

    testWidgets(
        'should skip saving nhif member number if variables are nto provided (neutral case)',
        (WidgetTester tester) async {
      final NHIFInformationObject nhifInformation = NHIFInformationObject();
      // reset variables
      nhifInformation.patientID.add(null);
      nhifInformation.membershipNumber.add(null);
      nhifInformation.frontImageContentType.add('null');
      nhifInformation.frontImageBase64.add('null');

      /// Widget Setup
      await buildTestWidget(
        tester: tester,
        widget: Builder(builder: (BuildContext context) {
          return Scaffold(
            body: SILPrimaryButton(
              buttonKey: const Key('add_NHIF'),
              onPressed: () async {
                await addNHIF(
                    context: context, nhifInformation: nhifInformation);
              },
              text: 'addNHIF',
            ),
          );
        }),
        store: store,
      );

      await tester.pump();
      // tap add member number button
      await tester.tap(find.byKey(const Key('add_NHIF')));
      await tester.pumpAndSettle();
      // verify nhif member number saved
      expect(find.text('Skipping NHIF'), findsOneWidget);
      expect(find.byType(SnackBar), findsOneWidget);
    });
  });

  group('getAuthTokenStatus', () {
    late Store<CoreState> store;

    setUp(() {
      store = Store<CoreState>(initialState: CoreState.initial());
    });

    testWidgets(
        'should return AuthTokenStatus.requiresLogin if '
        'tokenExpiryFromState is UNKNOWN', (WidgetTester tester) async {
      late AuthTokenStatus? tokenStatus;

      await buildTestWidget(
          tester: tester,
          store: store,
          widget: Builder(builder: (BuildContext context) {
            return GestureDetector(
              onTap: () async =>
                  tokenStatus = await getAuthTokenStatus(context: context),
            );
          }));

      // normal when the token is UNKNOWN

      await tester.tap(find.byType(GestureDetector));
      await tester.pump();

      expect(tokenStatus, isNotNull);
      expect(tokenStatus, AuthTokenStatus.requiresLogin);
    });

    testWidgets(
        'should return AuthTokenStatus.okay if '
        'tokenExpiryFromState is more than 10 minutes',
        (WidgetTester tester) async {
      /// modify change the expiry time to >10 minutes in the future
      final DateTime futureTwelveMinutes =
          DateTime.now().add(const Duration(minutes: 12));

      await store.dispatch(
        BatchUpdateUserStateAction(
            isSignedIn: true,
            tokenExpiryTime: futureTwelveMinutes.toIso8601String()),
      );

      late AuthTokenStatus? tokenStatus;

      await buildTestWidget(
          tester: tester,
          store: store,
          widget: Builder(builder: (BuildContext context) {
            return GestureDetector(
              onTap: () async =>
                  tokenStatus = await getAuthTokenStatus(context: context),
            );
          }));

      // normal when the token is UNKNOWN

      await tester.tap(find.byType(GestureDetector));
      await tester.pump();

      expect(tokenStatus, isNotNull);
      expect(tokenStatus, AuthTokenStatus.okay);
    });

    testWidgets(
        'should refresh token and return AuthTokenStatus.ok if '
        'tokenExpiryFromState is more than 0 and less than 10 minutes',
        (WidgetTester tester) async {
      /// modify change the expiry time to >10 minutes in the future
      final DateTime futureEightMinutes =
          DateTime.now().add(const Duration(minutes: 8));

      await store.dispatch(
        BatchUpdateUserStateAction(
            isSignedIn: true,
            tokenExpiryTime: futureEightMinutes.toIso8601String()),
      );

      late AuthTokenStatus? tokenStatus;

      await buildTestWidget(
          tester: tester,
          store: store,
          widget: Builder(builder: (BuildContext context) {
            return GestureDetector(
              onTap: () async =>
                  tokenStatus = await getAuthTokenStatus(context: context),
            );
          }));

      // normal when the token is UNKNOWN

      await tester.tap(find.byType(GestureDetector));
      await tester.pump();

      expect(tokenStatus, isNotNull);
      expect(tokenStatus, AuthTokenStatus.okay);
    });

    testWidgets(
        'should refresh token and return AuthTokenStatus.requiresPin if '
        'tokenExpiryFromState has passed by less than 12 hours',
        (WidgetTester tester) async {
      /// modify change the expiry time to >10 minutes in the future
      final DateTime futureEightHours =
          DateTime.now().subtract(const Duration(hours: 8));

      await store.dispatch(
        BatchUpdateUserStateAction(
            isSignedIn: true,
            tokenExpiryTime: futureEightHours.toIso8601String()),
      );

      late AuthTokenStatus? tokenStatus;

      await buildTestWidget(
          tester: tester,
          store: store,
          widget: Builder(builder: (BuildContext context) {
            return GestureDetector(
              onTap: () async =>
                  tokenStatus = await getAuthTokenStatus(context: context),
            );
          }));

      // normal when the token is UNKNOWN

      await tester.tap(find.byType(GestureDetector));
      await tester.pump();

      expect(tokenStatus, isNotNull);
      expect(tokenStatus, AuthTokenStatus.requiresPin);
    });

    testWidgets(
        'should refresh token and return AuthTokenStatus.requiresLogin if '
        'tokenExpiryFromState has passed by more than 12 hours',
        (WidgetTester tester) async {
      /// modify change the expiry time to >10 minutes in the future
      final DateTime hours = DateTime.now().subtract(const Duration(hours: 22));

      await store.dispatch(
        BatchUpdateUserStateAction(tokenExpiryTime: hours.toIso8601String()),
      );

      late AuthTokenStatus? tokenStatus;

      await buildTestWidget(
          tester: tester,
          store: store,
          widget: Builder(builder: (BuildContext context) {
            return GestureDetector(
              onTap: () async =>
                  tokenStatus = await getAuthTokenStatus(context: context),
            );
          }));

      // normal when the token is UNKNOWN

      await tester.tap(find.byType(GestureDetector));
      await tester.pump();

      expect(tokenStatus, isNotNull);
      expect(tokenStatus, AuthTokenStatus.requiresLogin);
    });
  });

  testWidgets(
      'triggerNavigationEvent navigate to phone login page when'
      ' shouldRemoveUntil is true', (WidgetTester tester) async {
    await buildTestWidget(
      tester: tester,
      graphQlClient: mockGraphQlClient,
      widget: const SizedBox(),
    );

    final BuildContext context = tester.element(find.byType(SizedBox));

    triggerNavigationEvent(
        context: context, route: phoneLoginRoute, shouldRemoveUntil: true);

    await tester.pumpAndSettle();

    expect(find.byType(PhoneLogin), findsOneWidget);
  });

  testWidgets(
      'triggerNavigationEvent navigate to phone login page when'
      ' shouldReplace is true', (WidgetTester tester) async {
    await buildTestWidget(
      tester: tester,
      graphQlClient: mockGraphQlClient,
      widget: const SizedBox(),
    );

    final BuildContext context = tester.element(find.byType(SizedBox));

    triggerNavigationEvent(
        context: context, route: phoneLoginRoute, shouldReplace: true);

    await tester.pumpAndSettle();

    expect(find.byType(PhoneLogin), findsOneWidget);
  });

  testWidgets('should open info bottom sheet and perform interactions',
      (WidgetTester tester) async {
    await buildTestWidget(
      tester: tester,
      widget: Builder(builder: (BuildContext context) {
        return GestureDetector(
          onTap: () async {
            await showInfoBottomSheet(
              context: context,
              modalContent: const Text('Modal content'),
              imagePath: bewellAppBarLogo,
            );
          },
        );
      }),
    );

    // open the bottom sheet
    await tester.tap(find.byType(GestureDetector));
    await tester.pumpAndSettle();

    // confirm it is open
    expect(find.byKey(AppWidgetKeys.bottomSheetInfoContainer), findsOneWidget);

    // close the bottom sheet
    await tester.tap(find.byKey(AppWidgetKeys.closeInfoBottomSheet));
    await tester.pumpAndSettle();

    expect(find.byKey(AppWidgetKeys.bottomSheetInfoContainer), findsNothing);

    // open the bottom sheet
    await tester.tap(find.byType(GestureDetector));
    await tester.pumpAndSettle();

    // confirm it is open
    expect(find.byKey(AppWidgetKeys.bottomSheetInfoContainer), findsOneWidget);

    // close the bottom sheet
    await tester
        .tap(find.byKey(AppWidgetKeys.bottomSheetInfoContainerContentKey));
    await tester.pumpAndSettle();

    expect(find.byKey(AppWidgetKeys.bottomSheetInfoContainer), findsNothing);
  });

  group('ReviewOfSystems', () {
    testWidgets('should save selectedDrawer and open active drawer',
        (WidgetTester tester) async {
      final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

      const ReviewSystems system = ReviewSystems.respiratory;

      /// Should add the selectedDrawer to scaffold & open it
      await buildTestWidget(
          tester: tester,
          widget: PatientExam(
            testChild: Scaffold(
              key: scaffoldKey,
              body: Center(
                child: GestureDetector(
                  key: AppWidgetKeys.gestureKey,
                  onTap: () => openPatientExamDrawer(
                      context: scaffoldKey.currentState!.context,
                      system: system),
                ),
              ),
            ),
          ));

      expect(find.byKey(AppWidgetKeys.gestureKey), findsOneWidget);
      await tester.tap(find.byKey(AppWidgetKeys.gestureKey));
      await tester.pump(const Duration(seconds: 3));
      // verify drawer is open
      expect(find.text('Congest'), findsOneWidget);
      expect(find.byType(SILDrawerHeader), findsOneWidget);
    });
  });

  group('getResponsivePadding', () {
    testWidgets('returns the correct padding for Mobile',
        (WidgetTester tester) async {
      double padding = 0;
      await buildTestWidget(
        tester: tester,
        widget: Builder(builder: (BuildContext context) {
          padding = getResponsivePadding(context: context);
          return const SizedBox();
        }),
      );

      await tester.pumpAndSettle();
      expect(padding, number15);
    });

    testWidgets(
        'returns the correct padding for Tablet without secondary actions',
        (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = tabletLandscape;

      double padding = 0;
      double preferredPadding = 0;
      await buildTestWidget(
        tester: tester,
        widget: Builder(builder: (BuildContext context) {
          StoreProvider.dispatch<CoreState>(
            context,
            NavigationAction(
              secondaryActions: secondaryActionsEmptyMockedData,
            ),
          );
          padding = getResponsivePadding(context: context);
          preferredPadding =
              ResponsiveWidget.preferredPaddingOnStretchedScreens(
                  context: context);
          return const SizedBox();
        }),
      );

      await tester.pumpAndSettle();
      expect(padding, preferredPadding);

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });

    testWidgets('returns the correct padding for Tablet with secondary actions',
        (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = tabletLandscape;

      double padding = 0;
      await buildTestWidget(
        tester: tester,
        widget: Builder(builder: (BuildContext context) {
          StoreProvider.dispatch<CoreState>(
            context,
            NavigationAction(
              secondaryActions: secondaryActionsMockedData,
            ),
          );
          padding = getResponsivePadding(context: context);
          return const SizedBox();
        }),
      );

      await tester.pumpAndSettle();
      expect(padding, number20);

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });
  });

  group('showAlertSnackBar', () {
    testWidgets('shows default error message if message passed is null',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: Builder(
          builder: (BuildContext context) {
            return TextButton(
              onPressed: () {
                showAlertSnackBar(context: context);
              },
              child: const Text('Ok'),
            );
          },
        ),
      );
      await tester.pump();

      final Finder okText = find.text('Ok');
      expect(okText, findsOneWidget);

      await tester.tap(okText);
      await tester.pump();

      final Finder snackBar = find.descendant(
        of: find.byType(SnackBar),
        matching: find.text(UserFeedBackTexts.getErrorMessage()),
      );
      expect(snackBar, findsOneWidget);
    });
  });

  testWidgets('showDebugModeBanner works', (WidgetTester tester) async {
    late bool showBanner;
    await buildTestWidget(
      tester: tester,
      widget: Builder(
        builder: (BuildContext context) {
          return TextButton(
            onPressed: () {
              showBanner =
                  showDebugModeBanner(<AppContext>[AppContext.AppTest]);
            },
            child: const Text('Ok'),
          );
        },
      ),
    );
    await tester.pump();
    expect(find.byType(TextButton), findsOneWidget);
    await tester.tap(find.byType(TextButton));
    await tester.pumpAndSettle();
    expect(showBanner, true);
  });
}
