import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/search_card/patient_search_card_connector.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/search_card/patient_search_card_viewModel.dart';

class PatientSearchCardFactory
    extends VmFactory<AppState, PatientSearchCardConnector> {
  PatientSearchCardFactory(PatientSearchCardConnector widget) : super(widget);

  @override
  PatientSearchCardViewModel fromStore() {
    return PatientSearchCardViewModel(patientEdge: widget?.patientEdge);
  }
}
