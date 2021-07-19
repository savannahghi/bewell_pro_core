import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_connection.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/visit/start_cont_visit/start_cont_visit_factory.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/visit/start_cont_visit/start_cont_visit_view_model.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/visit/start_cont_visit/start_cont_visit_widget.dart';

/// connects [StartContinueVisitWidget] to the [StartContinueVisitViewModel]
class StartContinueVisitConnector extends StatelessWidget {
  const StartContinueVisitConnector({required this.patientEdge});

  final PatientEdge? patientEdge;
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, StartContinueVisitViewModel>(
      vm: () => StartContinueVisitViewModelFactory(this),
      builder: (BuildContext context, StartContinueVisitViewModel vm) =>
          StartContinueVisitWidget(
        patientEdge: vm.patientEdge,
        startVisit: vm.startVisit,
        continueVisit: vm.continueVisit,
        isWaiting: vm.isWaiting,
      ),
    );
  }
}
