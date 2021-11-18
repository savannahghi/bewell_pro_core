// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/application/redux/view_models/clinical/patient_profile/bewell_patient_view_model.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/start_visit_type_enum.dart';
import 'package:bewell_pro_core/presentation/clinical/common/helpers.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/bewell_patient_profile_connector.dart';

class BewellPatientProfileViewModelFactory
    extends VmFactory<CoreState, BewellPatientProfileConnector> {
  BewellPatientProfileViewModelFactory(BewellPatientProfileConnector widget)
      : super(widget);

  @override
  Vm fromStore() {
    return BewellPatientProfileViewModel(onStartVisit: onStartVisit);
  }

  void onStartVisit(BuildContext context, StartVisitType startVisitType) {
    startVisitByType(context, startVisitType, state);
  }
}
