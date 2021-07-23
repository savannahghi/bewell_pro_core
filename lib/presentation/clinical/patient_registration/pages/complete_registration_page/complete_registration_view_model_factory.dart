import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_connection.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_payload.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/start_visit_type_enum.dart';
import 'package:bewell_pro_core/presentation/clinical/common/helpers.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/visit/start_cont_visit/save_patient_record_action.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';

import 'complete_registration_connector.dart';
import 'complete_registration_view_model.dart';

class CompleteRegistrationViewModelFactory
    extends VmFactory<CoreState, CompleteRegistrationConnector> {
  CompleteRegistrationViewModelFactory(CompleteRegistrationConnector widget)
      : super(widget);

  @override
  Vm fromStore() {
    return CompleteRegistrationViewModel(
      onStartVisit: onStartVisit,
      updatePatientRecord: updatePatientRecord,
    );
  }

  void onStartVisit(BuildContext context, StartVisitType startVisitType) {
    startVisitByType(context, startVisitType, state);
    dispatch(NavigateAction<CoreState>.pushNamed(startVisitRoute));
  }

  void updatePatientRecord(PatientPayload payload) {
    final PatientEdge patientEdge = PatientEdge(
        hasOpenEpisodes: payload.hasOpenEpisodes, node: payload.patientRecord);

    // save the record of the patient to start visit for
    dispatch(SavePatientRecordAction(patientEdge: patientEdge));
  }
}
