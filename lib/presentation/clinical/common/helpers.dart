import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/application/redux/actions/clinical_state_actions/update_start_visit_type_action.dart';
import 'package:bewell_pro_core/domain/clinical/entities/contact_point.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/contact_point_system_enum.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/start_visit_type_enum.dart';
import 'package:bewell_pro_core/domain/core/value_objects/events.dart';
import 'package:bewell_pro_core/domain/core/value_objects/type_defs.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/visit/start_cont_visit/send_otp_action.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/visit/start_cont_visit/start_visit_dialog_widget.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:flutter_graphql_client/graph_client.dart';

/// start a visit
///   This includes starting a new episode of care
///   update the app state
Future<void> startVisitDialog(
    BuildContext context, OnStartVisit onStartVisit) async {
  final StartVisitType? startVisitType = await showDialog<StartVisitType?>(
    context: context,
    builder: (BuildContext context) => StartVisitDialogWidget(),
  );

  switch (startVisitType) {
    case StartVisitType.emergencyOverride:
      onStartVisit.call(context, StartVisitType.emergencyOverride);
      break;
    case StartVisitType.requestAccess:
      onStartVisit.call(context, StartVisitType.requestAccess);
      break;
    default:
      throw const UserException(
          'failed to start visit startVisit type not defined');
  }
}

void startVisitByType(
    BuildContext context, StartVisitType startVisitType, CoreState state) {
  // navigate to the page for starting a visit
  switch (startVisitType) {
    case StartVisitType.requestAccess:
      {
        triggerEvent(startVisitRequestAccessEvent, context);
        startVisitByRequestAccess(context, getPhoneNumber(state));
        break;
      }
    case StartVisitType.emergencyOverride:
      {
        triggerEvent(startVisitEmergencyOverrideEvent, context);
        final String? phoneContact =
            state.userState?.userProfile?.primaryPhoneNumber?.getValue();
        startVisitByEmergencyOverride(context, phoneContact);
        break;
      }
  }
}

String? getPhoneNumber(CoreState state) {
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

  return phoneNumbers.first?.value;
}

void startVisitByRequestAccess(BuildContext context, String? phoneContact) {
  final IGraphQlClient? client = AppWrapperBase.of(context)?.graphQLClient;

  if (phoneContact == null) {
    throw const UserException(
        'failed to send otp, user patient phone number not found');
  }

  StoreProvider.dispatch<CoreState>(context,
      UpdateStartVisitTypeAction(startVisitType: StartVisitType.requestAccess));
  sendOTP(context, client, phoneContact);
}

void startVisitByEmergencyOverride(BuildContext context, String? phoneContact) {
  final IGraphQlClient? client = AppWrapperBase.of(context)?.graphQLClient;

  if (phoneContact == null) {
    throw const UserException(
        'failed to send OTP, phone number is not available');
  }
  StoreProvider.dispatch<CoreState>(
    context,
    UpdateStartVisitTypeAction(
        startVisitType: StartVisitType.emergencyOverride),
  );

  sendOTP(context, client, phoneContact);
}

Future<void> sendOTP(
    BuildContext context, IGraphQlClient? client, String phoneContact) async {
  StoreProvider.dispatch<CoreState>(
      context, SendOTPAction(client: client, phoneContact: phoneContact));
}

enum EmailFormStatus { ok, invalid }

/// Checks whether data has been entered into any of the ExtraInformation
/// inputs.
///
/// The left side contains information about marital status.
///
/// The right side contains information about the status of the email input
dartz.Either<bool, EmailFormStatus> validateExtraInformationData({
  required Map<String, dynamic> data,
  required GlobalKey<FormState> extraInfoKey,
}) {
  final bool isMaritalStatusOk =
      data['maritalStatus'] != null && data['maritalStatus'] != 'UNK';

  final bool emailOptIn = data['emailOptIn'] as bool;

  if (emailOptIn) {
    if (extraInfoKey.currentState!.validate()) {
      return dartz.right(EmailFormStatus.ok);
    } else {
      return dartz.right(EmailFormStatus.invalid);
    }
  } else {
    return dartz.left(isMaritalStatusOk);
  }
}
