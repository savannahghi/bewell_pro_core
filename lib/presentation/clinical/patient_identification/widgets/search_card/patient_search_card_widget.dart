// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:misc_utilities/responsive_widget.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/spaces.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_connection.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/patient_search_card_info.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/visit/start_cont_visit/start_continue_visit_connector.dart';

class PatientSearchCardWidget extends StatelessWidget {
  const PatientSearchCardWidget({required this.patientEdge});

  final PatientEdge? patientEdge;

  @override
  Widget build(BuildContext context) {
    final bool isLargeScreen = ResponsiveWidget.isLargeScreen(context);

    final List<Widget> _children = <Widget>[
      PatientSearchCardInfo(patient: patientEdge?.node),
      size15HorizontalSizedBox,
      UserExceptionDialog<CoreState>(
        child: StartContinueVisitConnector(patientEdge: patientEdge),
      )
    ];

    return Card(
      elevation: 0.2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      color: patientIDResultCardColor,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: patientSearchBorderColor),
          borderRadius: BorderRadius.circular(5),
        ),
        child: isLargeScreen
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: _children,
              )
            : Column(children: _children),
      ),
    );
  }
}
