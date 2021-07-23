import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/application/redux/view_model_factories/patient_profile/bewell_patient_profile_view_model_factory.dart';
import 'package:bewell_pro_core/application/redux/view_models/clinical/patient_profile/bewell_patient_view_model.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/bewell_patient_profile_widget.dart';

class BewellPatientProfileConnector extends StatelessWidget {
  const BewellPatientProfileConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<CoreState, BewellPatientProfileViewModel>(
      vm: () => BewellPatientProfileViewModelFactory(this),
      builder: (BuildContext context, BewellPatientProfileViewModel vm) {
        return BewellPatientProfileWidget(onStartVisit: vm.onStartVisit);
      },
    );
  }
}
