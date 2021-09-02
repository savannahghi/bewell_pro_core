import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_connection.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/search_card/patient_search_card_factory.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/search_card/patient_search_card_viewModel.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/search_card/patient_search_card_widget.dart';

class PatientSearchCardConnector extends StatelessWidget {
  const PatientSearchCardConnector({required this.patientEdge});

  final PatientEdge? patientEdge;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<CoreState, PatientSearchCardViewModel>(
      vm: () => PatientSearchCardFactory(this),
      distinct: true,
      builder: (BuildContext context, PatientSearchCardViewModel vm) {
        return PatientSearchCardWidget(patientEdge: vm.patientEdge);
      },
    );
  }
}
