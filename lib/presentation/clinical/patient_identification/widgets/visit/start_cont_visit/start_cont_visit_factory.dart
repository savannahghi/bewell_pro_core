import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/application/redux/actions/clinical_state_actions/update_start_visit_type_action.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';
import 'package:bewell_pro_core/domain/clinical/entities/contact_point.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/contact_point_system_enum.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/start_visit_type_enum.dart';
import 'package:bewell_pro_core/domain/core/value_objects/events.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/pages/patient_search_page/update_patient_found_action.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/pages/patient_search_page/update_search_param_action.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/visit/continue_visit_action.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/visit/start_cont_visit/save_patient_record_action.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/visit/start_cont_visit/send_otp_action.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/visit/start_cont_visit/start_cont_visit_view_model.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/visit/start_cont_visit/start_continue_visit_connector.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:flutter_graphql_client/graph_client.dart';

/// creates [StartContinueVisitViewModel]
class StartContinueVisitViewModelFactory
    extends VmFactory<AppState, StartContinueVisitConnector> {
  StartContinueVisitViewModelFactory(StartContinueVisitConnector widget)
      : super(widget);

  @override
  StartContinueVisitViewModel fromStore() {
    return StartContinueVisitViewModel(
      patientEdge: widget?.patientEdge,
      startVisit: startVisit,
      continueVisit: (BuildContext context) => continueVisit(context),
      isWaiting: state.wait?.isWaiting ?? false,
    );
  }

  // start a patient's visit
  void startVisit(BuildContext context, StartVisitType startVisitType) {
    // save the record of the patient to start visit for
    dispatch(SavePatientRecordAction(patientEdge: widget?.patientEdge));

    // clear the patient search
    dispatch(UpdateSearchParamAction(phoneNumber: null));
    dispatch(UpdatePatientPatientFoundAction(searchFound: null));

    // navigate to the page for starting a visit
    switch (startVisitType) {
      case StartVisitType.requestAccess:
        {
          startVisitByRequestAccess(context, getPhoneNumber());
          break;
        }
      case StartVisitType.emergencyOverride:
        {
          final String? phoneContact =
              state.userState?.userProfile?.primaryPhoneNumber?.getValue();
          startVisitByEmergencyOverride(context, phoneContact);
          break;
        }
    }
    dispatch(NavigateAction<AppState>.pushNamed(startVisitRoute));
  }

  void startVisitByRequestAccess(BuildContext context, String? phoneContact) {
    final IGraphQlClient? client = AppWrapperBase.of(context)?.graphQLClient;

    if (phoneContact == null) {
      throw const UserException(
          'failed to send otp, user patient phone number not found');
    }
    dispatch(UpdateStartVisitTypeAction(
        startVisitType: StartVisitType.requestAccess));
    sendOTP(client, phoneContact);
  }

  void startVisitByEmergencyOverride(
      BuildContext context, String? phoneContact) {
    final IGraphQlClient? client = AppWrapperBase.of(context)?.graphQLClient;

    if (phoneContact == null) {
      throw const UserException(
          'failed to send OTP, phone number is not available');
    }
    dispatch(UpdateStartVisitTypeAction(
        startVisitType: StartVisitType.emergencyOverride));
    sendOTP(client, phoneContact);
  }

  Future<void> sendOTP(IGraphQlClient? client, String phoneContact) async {
    dispatch(SendOTPAction(client: client, phoneContact: phoneContact));
  }

  /// continue a patient's visit
  ///   the visit was already started
  Future<void> continueVisit(BuildContext context) async {
    // save the record of the patient to continue visit for
    dispatch(SavePatientRecordAction(patientEdge: widget?.patientEdge));

    // clear the patient search
    dispatch(UpdateSearchParamAction(phoneNumber: null));
    dispatch(UpdatePatientPatientFoundAction(searchFound: null));

    final IGraphQlClient? client = AppWrapperBase.of(context)?.graphQLClient;
    publishEvent(continueVisitEvent, context);
    await dispatch(ContinueVisitAction(client: client!));
  }

  /// the current patient's phone number
  String? getPhoneNumber() {
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
}
