import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/application/redux/flags/flags.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/pages/patient_search_page/patient_search_connector.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/pages/patient_search_page/patient_search_viewModel.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/pages/patient_search_page/patient_search_widget.dart';

/// Creates [PatientSearchViewModel] a view model
class PatientSearchViewModelFactory
    extends VmFactory<CoreState, PatientSearchConnector> {
  PatientSearchViewModelFactory(PatientSearchConnector widget) : super(widget);
  @override
  PatientSearchViewModel fromStore() {
    return PatientSearchViewModel(
      searchPatientFunction: searchPatientFunction,
      patientEdgeList: state.clinicalState?.patientSearchResult,
      searchResult: searchResultWidget(),
      onFieldSubmit: searchPatientFunction,
    );
  }

  // determines widget to show in search result
  SearchResultWidgetEnum searchResultWidget() {
    if (state.wait?.isWaitingFor(searchingPatientByPhoneNumberIsWaiting) ??
        false) {
      return SearchResultWidgetEnum.loadingIndicator;
    } else if (state.clinicalState?.patientSearchFound != null &&
        state.clinicalState?.patientSearchFound == false &&
        state.clinicalState?.patientSearchNumber != null) {
      return SearchResultWidgetEnum.searchNotFound;
    } else if (state.clinicalState?.patientSearchNumber != null &&
        state.clinicalState?.patientSearchResult != null &&
        state.clinicalState?.patientSearchFound != null &&
        state.clinicalState?.patientSearchFound == true) {
      return SearchResultWidgetEnum.patientSearchCard;
    } else {
      return SearchResultWidgetEnum.searchGuide;
    }
  }
}
