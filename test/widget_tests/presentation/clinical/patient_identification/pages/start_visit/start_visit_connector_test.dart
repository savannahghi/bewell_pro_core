// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/entities.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiver/async.dart';
import 'package:quiver/testing/time.dart';
import 'package:shared_ui_components/buttons.dart';
import 'package:shared_ui_components/platform_loader.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/flags/flags.dart';
import 'package:bewell_pro_core/application/redux/states/clinical_state.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/application/redux/states/misc_state.dart';
import 'package:bewell_pro_core/application/redux/states/user_state.dart';
import 'package:bewell_pro_core/domain/clinical/entities/OTP_episode_creation_input.dart';
import 'package:bewell_pro_core/domain/clinical/entities/break_glass_episode_creation_input.dart';
import 'package:bewell_pro_core/domain/clinical/entities/contact_point.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_payload.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/contact_point_system_enum.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/start_visit_type_enum.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/common/widgets/countdown_timer_widget.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/visit/start_visit_page/start_visit_connector.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/visit/start_visit_page/start_visit_emergency_action.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/visit/start_visit_page/start_visit_request_access_action.dart';
import '../../../../../../mocks/mock_redux_actions.dart';
import '../../../../../../mocks/test_helpers.dart';

void main() {
  group('StartVisitConnector', () {
    late int now;

    setUp(() {
      now = DateTime.now().microsecondsSinceEpoch;
    });

    testWidgets('successfully start a visit by request access',
        (WidgetTester widgetTester) async {
      const String phoneNumber = '0712345678';
      const String patientID = 'some_unique_id';
      const String providerCode = '123';
      const String otpCode = '123456';

      final OTPEpisodeCreationInput otpEpisodeCreationInput =
          OTPEpisodeCreationInput(
        patientID: patientID,
        providerCode: providerCode,
        msisdn: phoneNumber,
        otp: otpCode,
        fullAccess: false,
      );

      final MockStore<CoreState> mockStore = MockStore<CoreState>(
        initialState: CoreState(
          clinicalState: ClinicalState(
            startVisitType: StartVisitType.requestAccess,
            patientPayload: PatientPayload(
              patientRecord: Patient(
                id: patientID,
                telecom: <ContactPoint>[
                  ContactPoint(
                    value: phoneNumber,
                    system: ContactPointSystemEnum.phone,
                  ),
                ],
              ),
            ),
          ),
        ),
        mocks: <Type, dynamic>{
          StartVisitByRequestAccessAction: MockStartVisitByRequestAccessAction()
        },
      );

      await buildTestWidget(
        store: mockStore,
        tester: widgetTester,
        widget: const StartVisitConnector(),
      );

      // enter the PIN
      final Finder pinCodeTextField =
          find.byKey(AppWidgetKeys.silPinCodeTextFieldKey);
      await widgetTester.enterText(pinCodeTextField, otpCode);
      await widgetTester.pumpAndSettle();

      expect(MockStartVisitByRequestAccessAction.otpEpisodeCreationInput,
          otpEpisodeCreationInput);
    });

    testWidgets('start visit by request access when patient ID is null ',
        (WidgetTester widgetTester) async {
      final MockStore<CoreState> mockStore = MockStore<CoreState>(
        initialState: CoreState(
          clinicalState: ClinicalState(
            startVisitType: StartVisitType.requestAccess,
          ),
        ),
      );

      await buildTestWidget(
        store: mockStore,
        tester: widgetTester,
        widget: const StartVisitConnector(),
      );

      // enter the PIN
      final Finder pinCodeTextField =
          find.byKey(AppWidgetKeys.silPinCodeTextFieldKey);
      await widgetTester.enterText(pinCodeTextField, '123456');
      await widgetTester.pumpAndSettle();

      final UserException userException =
          widgetTester.takeException() as UserException;

      expect(userException.msg, 'failed to start visit, patient ID not found');
    });

    testWidgets(
        'start visit by request access when patient phone number is null',
        (WidgetTester widgetTester) async {
      final MockStore<CoreState> mockStore = MockStore<CoreState>(
        initialState: CoreState(
          clinicalState: ClinicalState(
            startVisitType: StartVisitType.requestAccess,
            patientPayload: PatientPayload(
              patientRecord: Patient(
                id: 'some_unique_id',
              ),
            ),
          ),
        ),
      );

      await buildTestWidget(
        store: mockStore,
        tester: widgetTester,
        widget: const StartVisitConnector(),
      );

      // enter the PIN
      final Finder pinCodeTextField =
          find.byKey(AppWidgetKeys.silPinCodeTextFieldKey);
      await widgetTester.enterText(pinCodeTextField, '123456');
      await widgetTester.pumpAndSettle();

      final UserException userException =
          widgetTester.takeException() as UserException;

      expect(userException.msg,
          'failed to start visit patient phone number not found');
    });

    testWidgets('start visit by emergency when patient ID is null ',
        (WidgetTester widgetTester) async {
      const String phoneNumber = '0712345678';

      final MockStore<CoreState> mockStore = MockStore<CoreState>(
        initialState: CoreState(
          clinicalState: ClinicalState(
            startVisitType: StartVisitType.emergencyOverride,
          ),
          userState: UserState(
            userProfile: UserProfile(
              primaryPhoneNumber: PhoneNumber.withValue(phoneNumber),
            ),
          ),
        ),
      );

      await buildTestWidget(
        store: mockStore,
        tester: widgetTester,
        widget: const StartVisitConnector(),
      );

      // enter the PIN
      final Finder pinCodeTextField =
          find.byKey(AppWidgetKeys.silPinCodeTextFieldKey);
      await widgetTester.enterText(pinCodeTextField, '123456');
      await widgetTester.pumpAndSettle();

      final UserException userException =
          widgetTester.takeException() as UserException;

      expect(userException.msg, 'failed to start visit, patient ID not found');
    });

    testWidgets('successfully start a visit by emergency override',
        (WidgetTester widgetTester) async {
      const String phoneNumber = '0712345678';
      const String patientID = 'some_unique_id';
      const String providerCode = '123';
      const String otpCode = '123456';
      const String practitionerUID = '12';
      const String providerPhone = '0787654321';

      final BreakGlassEpisodeCreationInput breakGlassEpisodeCreationInput =
          BreakGlassEpisodeCreationInput(
        patientID: patientID,
        providerCode: providerCode,
        practitionerUID: practitionerUID,
        providerPhone: providerPhone,
        otp: otpCode,
        fullAccess: false,
        patientPhone: phoneNumber,
      );

      final MockStore<CoreState> mockStore = MockStore<CoreState>(
        initialState: CoreState(
          clinicalState: ClinicalState(
            startVisitType: StartVisitType.emergencyOverride,
            patientPayload: PatientPayload(
              patientRecord: Patient(
                id: patientID,
                telecom: <ContactPoint>[
                  ContactPoint(
                    value: phoneNumber,
                    system: ContactPointSystemEnum.phone,
                  ),
                ],
              ),
            ),
          ),
          userState: UserState(
            userProfile: UserProfile(
              primaryPhoneNumber: PhoneNumber.withValue(providerPhone),
            ),
          ),
        ),
        mocks: <Type, dynamic>{
          StartVisitEmergencyAction: MockStartVisitEmergencyAction()
        },
      );

      await buildTestWidget(
        store: mockStore,
        tester: widgetTester,
        widget: const StartVisitConnector(),
      );

      // enter the PIN
      final Finder pinCodeTextField =
          find.byKey(AppWidgetKeys.silPinCodeTextFieldKey);
      await widgetTester.enterText(pinCodeTextField, otpCode);
      await widgetTester.pumpAndSettle();

      expect(MockStartVisitEmergencyAction.breakGlassEpisodeCreationInput,
          breakGlassEpisodeCreationInput);
    });
    testWidgets(
        'successfully start a visit by emergency override using resend OTP',
        (WidgetTester tester) async {
      const String phoneNumber = '0712345678';
      const String patientID = 'some_unique_id';
      const String providerCode = '123';
      const String otpCode = '123456';
      const String practitionerUID = '12';
      const String providerPhone = '0787654321';

      final BreakGlassEpisodeCreationInput breakGlassEpisodeCreationInput =
          BreakGlassEpisodeCreationInput(
        patientID: patientID,
        providerCode: providerCode,
        practitionerUID: practitionerUID,
        providerPhone: providerPhone,
        otp: otpCode,
        fullAccess: false,
        patientPhone: phoneNumber,
      );

      final MockStore<CoreState> mockStore = MockStore<CoreState>(
        initialState: CoreState(
          clinicalState: ClinicalState(
            startVisitType: StartVisitType.emergencyOverride,
            patientPayload: PatientPayload(
              patientRecord: Patient(
                id: patientID,
                telecom: <ContactPoint>[
                  ContactPoint(
                    value: phoneNumber,
                    system: ContactPointSystemEnum.phone,
                  ),
                ],
              ),
            ),
          ),
          userState: UserState(
            userProfile: UserProfile(
              primaryPhoneNumber: PhoneNumber.withValue(providerPhone),
            ),
          ),
        ),
        mocks: <Type, dynamic>{
          StartVisitEmergencyAction: MockStartVisitEmergencyAction()
        },
      );

      final FakeStopwatch fakeStopwatch = FakeStopwatch(
        () => now,
        const Duration(seconds: 1).inMicroseconds,
      );

      final CountdownTimer timer = CountdownTimer(
        const Duration(seconds: 30),
        const Duration(seconds: 1),
        stopwatch: fakeStopwatch,
      );

      final Widget widget = StartVisitConnector(countdownTimer: timer);

      await advanceAndPump(
        widget: widget,
        tester: tester,
        store: mockStore,
        updateTime: (Duration duration) => now = now + duration.inMicroseconds,
      );

      // verify UI renders correctly
      expect(find.byKey(AppWidgetKeys.silPinCodeTextFieldKey), findsOneWidget);

      //simulate 31 seconds
      await advanceAndPump(
        widget: widget,
        tester: tester,
        store: mockStore,
        updateTime: (Duration duration) => now = now + duration.inMicroseconds,
        duration: const Duration(seconds: 31),
      );

      expect(find.text('Resend Code'), findsOneWidget);
      expect(find.byType(SILPrimaryButton), findsOneWidget);

      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();

      expect(find.text('Resend via text'), findsOneWidget);
      await tester.tap(find.text('Resend via text'));

      // enter the PIN
      final Finder pinCodeTextField =
          find.byKey(AppWidgetKeys.silPinCodeTextFieldKey);
      await tester.enterText(pinCodeTextField, otpCode);
      await tester.pumpAndSettle();

      expect(MockStartVisitEmergencyAction.breakGlassEpisodeCreationInput,
          breakGlassEpisodeCreationInput);
    });
    testWidgets('start visit by emergency when provider phone number is null',
        (WidgetTester widgetTester) async {
      const String phoneNumber = '0712345678';

      final MockStore<CoreState> mockStore = MockStore<CoreState>(
        initialState: CoreState(
          clinicalState: ClinicalState(
            startVisitType: StartVisitType.emergencyOverride,
            patientPayload: PatientPayload(
              patientRecord: Patient(
                id: 'some_unique_id',
                telecom: <ContactPoint>[
                  ContactPoint(
                    value: phoneNumber,
                    system: ContactPointSystemEnum.phone,
                  ),
                ],
              ),
            ),
          ),
          userState: UserState(
            userProfile: UserProfile(),
          ),
        ),
      );

      await buildTestWidget(
        store: mockStore,
        tester: widgetTester,
        widget: const StartVisitConnector(),
      );

      // enter the PIN
      final Finder pinCodeTextField =
          find.byKey(AppWidgetKeys.silPinCodeTextFieldKey);
      await widgetTester.enterText(pinCodeTextField, '123456');
      await widgetTester.pumpAndSettle();

      final UserException userException =
          widgetTester.takeException() as UserException;

      expect(userException.msg,
          'failed to start visit, provider phone number not found');
    });

    testWidgets('start visit by emergency when patient phone number is null',
        (WidgetTester widgetTester) async {
      const String phoneNumber = '0712345678';

      final MockStore<CoreState> mockStore = MockStore<CoreState>(
        initialState: CoreState(
          clinicalState: ClinicalState(
            startVisitType: StartVisitType.emergencyOverride,
            patientPayload: PatientPayload(
              patientRecord: Patient(
                id: 'some_unique_id',
              ),
            ),
          ),
          userState: UserState(
            userProfile: UserProfile(
              primaryPhoneNumber: PhoneNumber.withValue(phoneNumber),
            ),
          ),
        ),
      );

      await buildTestWidget(
        store: mockStore,
        tester: widgetTester,
        widget: const StartVisitConnector(),
      );

      // enter the PIN
      final Finder pinCodeTextField =
          find.byKey(AppWidgetKeys.silPinCodeTextFieldKey);
      await widgetTester.enterText(pinCodeTextField, '123456');
      await widgetTester.pumpAndSettle();

      final UserException userException =
          widgetTester.takeException() as UserException;

      expect(userException.msg,
          'failed to start visit, patient phone number not found');
    });

    testWidgets('when state has showError', (WidgetTester widgetTester) async {
      const String phoneNumber = '0712345678';
      final Store<CoreState> store = Store<CoreState>(
        initialState: CoreState(
          clinicalState: ClinicalState(
            startVisitType: StartVisitType.requestAccess,
            patientPayload: PatientPayload(
              patientRecord: Patient(
                telecom: <ContactPoint>[
                  ContactPoint(
                    value: phoneNumber,
                    system: ContactPointSystemEnum.phone,
                  ),
                ],
              ),
            ),
          ),
          miscState: MiscState(invalidPin: true),
        ),
      );

      await buildTestWidget(
        store: store,
        tester: widgetTester,
        widget: const StartVisitConnector(),
      );

      expect(find.byKey(AppWidgetKeys.silPinCodeTextFieldKey), findsOneWidget);
      expect(find.text(phoneNumber), findsOneWidget);
      expect(find.text(enterVerificationCode), findsOneWidget);

      expect(find.byType(CountdownTimerWidget), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.backButton), findsOneWidget);

      expect(find.text(enterValidCodeText), findsOneWidget);
    });

    testWidgets('when showing loading indicator',
        (WidgetTester widgetTester) async {
      const String phoneNumber = '0712345678';
      final Store<CoreState> store = Store<CoreState>(
        initialState: CoreState(
          clinicalState: ClinicalState(
            startVisitType: StartVisitType.requestAccess,
            patientPayload: PatientPayload(
              patientRecord: Patient(
                telecom: <ContactPoint>[
                  ContactPoint(
                    value: phoneNumber,
                    system: ContactPointSystemEnum.phone,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      store.dispatch(WaitAction<CoreState>.add(hasCompletedEnteringOTPFlag));
      store.dispatch(WaitAction<CoreState>.add(isResendingOTPFlag));

      await buildTestWidget(
        store: store,
        tester: widgetTester,
        widget: const StartVisitConnector(),
      );

      expect(find.byKey(AppWidgetKeys.silPinCodeTextFieldKey), findsOneWidget);
      expect(find.text(phoneNumber), findsOneWidget);
      expect(find.text(enterVerificationCode), findsOneWidget);

      expect(find.byType(CountdownTimerWidget), findsNothing);
      expect(find.byKey(AppWidgetKeys.backButton), findsOneWidget);

      expect(find.text(resendingOTPText), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.resendInTextKey), findsOneWidget);
      expect(find.byType(SILPlatformLoader), findsOneWidget);
    });

    testWidgets('when has completed entering OTP',
        (WidgetTester widgetTester) async {
      const String phoneNumber = '0712345678';
      final Store<CoreState> store = Store<CoreState>(
        initialState: CoreState(
          clinicalState: ClinicalState(
            startVisitType: StartVisitType.requestAccess,
            patientPayload: PatientPayload(
              patientRecord: Patient(
                telecom: <ContactPoint>[
                  ContactPoint(
                    value: phoneNumber,
                    system: ContactPointSystemEnum.phone,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      store.dispatch(WaitAction<CoreState>.add(hasCompletedEnteringOTPFlag));

      await buildTestWidget(
        store: store,
        tester: widgetTester,
        widget: const StartVisitConnector(),
      );

      expect(find.byKey(AppWidgetKeys.silPinCodeTextFieldKey), findsOneWidget);
      expect(find.text(phoneNumber), findsOneWidget);
      expect(find.text(enterVerificationCode), findsOneWidget);

      expect(find.byType(CountdownTimerWidget), findsNothing);
      expect(find.byKey(AppWidgetKeys.backButton), findsOneWidget);

      expect(find.text(verifyPhoneNumberText), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.resendInTextKey), findsOneWidget);
      expect(find.byType(SILPlatformLoader), findsOneWidget);
    });

    testWidgets('when has completed entering OTP is false',
        (WidgetTester widgetTester) async {
      const String phoneNumber = '0712345678';
      final Store<CoreState> store = Store<CoreState>(
        initialState: CoreState(
          clinicalState: ClinicalState(
            startVisitType: StartVisitType.requestAccess,
            patientPayload: PatientPayload(
              patientRecord: Patient(
                telecom: <ContactPoint>[
                  ContactPoint(
                    value: phoneNumber,
                    system: ContactPointSystemEnum.phone,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      store.dispatch(WaitAction<CoreState>.add(isResendingOTPFlag));

      await buildTestWidget(
        store: store,
        tester: widgetTester,
        widget: const StartVisitConnector(),
      );

      expect(find.byKey(AppWidgetKeys.silPinCodeTextFieldKey), findsOneWidget);
      expect(find.text(phoneNumber), findsOneWidget);
      expect(find.text(enterVerificationCode), findsOneWidget);

      expect(find.byType(CountdownTimerWidget), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.backButton), findsOneWidget);

      expect(find.text(resendingOTPText), findsOneWidget);
      expect(find.byKey(AppWidgetKeys.resendInTextKey), findsOneWidget);
      expect(find.byType(SILPlatformLoader), findsOneWidget);
    });
  });
}
