// Flutter imports:
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:async_redux/async_redux.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/flags/flags.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/clinical/entities/OTP_episode_creation_input.dart';
import 'package:bewell_pro_core/domain/clinical/entities/break_glass_episode_creation_input.dart';
import 'package:bewell_pro_core/domain/clinical/entities/contact_point.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/contact_point_system_enum.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/start_visit_type_enum.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/visit/start_visit_page/resend_otp_action.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/visit/start_visit_page/start_visit_connector.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/visit/start_visit_page/start_visit_emergency_action.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/visit/start_visit_page/start_visit_request_access_action.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/visit/start_visit_page/start_visit_viewModel.dart';

/// viewModel factory for [StartVisitViewModel]
class StartVisitViewModelFactory
    extends VmFactory<CoreState, StartVisitConnector> {
  StartVisitViewModelFactory(StartVisitConnector widget) : super(widget);

  @override
  Vm fromStore() {
    return StartVisitViewModel(
      showError: showError() ?? false,
      startVisit: startVisit,
      phoneNumber: visitPhoneNumber() ?? '',
      hasCompletedEnteringOtp:
          state.wait?.isWaitingFor(hasCompletedEnteringOTPFlag) ?? false,
      isResendingOtp: state.wait?.isWaitingFor(isResendingOTPFlag) ?? false,
      resendOtp: resendOtp,
      startVisitType: state.clinicalState!.startVisitType!,
    );
  }

  void resendOtp(BuildContext context, int step) {
    final String? phoneNumber = this.visitPhoneNumber();
    final IGraphQlClient? client = AppWrapperBase.of(context)?.graphQLClient;

    dispatch(
        ResendOtpAction(phoneNumber: phoneNumber, client: client, step: step));
  }

  bool? showError() {
    return state.miscState?.invalidPin;
  }

  void startVisit(BuildContext context, String otpCode) {
    final StartVisitType? startVisitType = state.clinicalState?.startVisitType;
    switch (startVisitType) {
      case StartVisitType.requestAccess:
        startVisitByRequestAccess(context, otpCode);
        break;
      case StartVisitType.emergencyOverride:
        startVisitByEmergency(context, otpCode);
        break;
      default:
        throw const UserException(
            'failed to start visit, start visit type not found');
    }
  }

  void startVisitByRequestAccess(BuildContext context, String otpCode) {
    final String? patientID =
        state.clinicalState?.patientPayload?.patientRecord?.id;
    if (patientID == null) {
      throw const UserException('failed to start visit, patient ID not found');
    }

    const String providerCode =
        '123'; // TODO: get the real provider code from the state

    final String? msisdn = state
        .clinicalState?.patientPayload?.patientRecord?.telecom?.first?.value;

    if (msisdn == null) {
      throw const UserException(
          'failed to start visit patient phone number not found');
    }

    final OTPEpisodeCreationInput otpEpisodeCreationInput =
        OTPEpisodeCreationInput(
      patientID: patientID,
      providerCode: providerCode,
      msisdn: msisdn,
      otp: otpCode,
      fullAccess: false,
    );

    final IGraphQlClient? client = AppWrapperBase.of(context)?.graphQLClient;

    dispatch(StartVisitByRequestAccessAction(
        client: client, otpEpisodeCreationInput: otpEpisodeCreationInput));
  }

  void startVisitByEmergency(BuildContext context, String otpCode) {
    final IGraphQlClient? client = AppWrapperBase.of(context)?.graphQLClient;

    final String? patientID =
        state.clinicalState?.patientPayload?.patientRecord?.id;
    if (patientID == null) {
      throw const UserException('failed to start visit, patient ID not found');
    }
    const String providerCode = '123';
    const String practitionerUID = '12';
    final String? providerPhone =
        state.userState?.userProfile?.primaryPhoneNumber?.getValue();
    if (providerPhone == null) {
      throw const UserException(
          'failed to start visit, provider phone number not found');
    }

    final String? patientPhone = getPatientPhoneNumber();
    if (patientPhone == null) {
      throw const UserException(
          'failed to start visit, patient phone number not found');
    }

    final BreakGlassEpisodeCreationInput breakGlassEpisodeCreationInput =
        BreakGlassEpisodeCreationInput(
            patientID: patientID,
            providerCode: providerCode,
            practitionerUID: practitionerUID,
            providerPhone: providerPhone,
            otp: otpCode,
            fullAccess: false,
            patientPhone: patientPhone);

    dispatch(StartVisitEmergencyAction(
        client: client,
        breakGlassEpisodeCreationInput: breakGlassEpisodeCreationInput));
  }

  // the phone number used to start visit.
  //
  // can be the patient's phone number of doctor's number depending on the kind records access
  String? visitPhoneNumber() {
    final StartVisitType? startVisitType = state.clinicalState?.startVisitType;

    switch (startVisitType) {
      case StartVisitType.requestAccess:
        return getPatientPhoneNumber();
      case StartVisitType.emergencyOverride:
        return state.userState?.userProfile?.primaryPhoneNumber?.getValue();
      default:
        return null;
    }
  }

  // get patient Phone Number from state
  String? getPatientPhoneNumber() {
    final List<ContactPoint?>? telecoms =
        state.clinicalState?.patientPayload?.patientRecord?.telecom;

    if (telecoms == null) {
      // no phone numbers in patient record
      return null;
    }

    final List<ContactPoint?> phoneNumbers = telecoms
        .where((ContactPoint? contactPoint) =>
            contactPoint?.system == ContactPointSystemEnum.phone)
        .toList();

    if (phoneNumbers.isEmpty) {
      // no phone numbers in patient record
      return null;
    }

    final String? phoneNumber = phoneNumbers.first?.value;

    return phoneNumber;
  }
}
