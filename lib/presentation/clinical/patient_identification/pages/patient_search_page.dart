import 'package:async_redux/async_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/pages/patient_search_page/patient_search_connector.dart';
import 'package:bewell_pro_core/presentation/core/home/models/bottom_navigation_bar_items.dart';
import 'package:bewell_pro_core/presentation/core/widgets/app_scaffold.dart';

/// screen for providing information about a patient.
///  search for a patient using their phone number.
class PatientSearchPage extends StatelessWidget {
  const PatientSearchPage();
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      key: AppWidgetKeys.patientIdentificationScaffoldKey,
      currentBottomNavIndex: BottomNavIndex.patients.index,
      body:
          UserExceptionDialog<AppState>(child: const PatientSearchConnector()),
    );
  }
}
