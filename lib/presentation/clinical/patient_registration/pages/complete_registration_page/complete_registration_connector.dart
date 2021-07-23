import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';

import 'complete_registration_view_model.dart';
import 'complete_registration_view_model_factory.dart';
import 'complete_registration_widget.dart';

class CompleteRegistrationConnector extends StatelessWidget {
  const CompleteRegistrationConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<CoreState, CompleteRegistrationViewModel>(
      vm: () => CompleteRegistrationViewModelFactory(this),
      builder: (BuildContext context, CompleteRegistrationViewModel vm) {
        return CompleteRegistrationWidget(
          onStartVisit: vm.onStartVisit,
          updatePatientRecord: vm.updatePatientRecord,
        );
      },
    );
  }
}
