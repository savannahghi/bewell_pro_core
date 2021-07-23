import 'package:async_redux/async_redux.dart';
import 'package:flutter/widgets.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/pages/patient_search_page/patient_search_factory.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/pages/patient_search_page/patient_search_viewModel.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/pages/patient_search_page/patient_search_widget.dart';

/// Connects the store to the [PatientSearchWidget]
///
/// Each time the state changes, it creates a view-model, and compares it
/// with the view-model created with the previous state.
/// Only if the view-model changed, the connector rebuilds.
class PatientSearchConnector extends StatelessWidget {
  const PatientSearchConnector();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<CoreState, PatientSearchViewModel>(
      vm: () => PatientSearchViewModelFactory(this),
      builder: (BuildContext context, PatientSearchViewModel vm) =>
          PatientSearchWidget(
        phoneNumberFormValidator: vm.phoneNumberFormValidator,
        searchPatientFunction: vm.searchPatientFunction,
        patientEdgeList: vm.patientEdgeList,
        searchResult: vm.searchResult,
        validateAndSearch: vm.validateAndSearch,
      ),
    );
  }
}
