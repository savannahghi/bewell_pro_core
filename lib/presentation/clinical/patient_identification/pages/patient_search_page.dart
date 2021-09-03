import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/actions/user_state_actions/logout_action.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/pages/patient_search_page/patient_search_connector.dart';
import 'package:bewell_pro_core/presentation/core/home/models/bottom_navigation_bar_items.dart';
import 'package:bewell_pro_core/presentation/core/widgets/app_scaffold.dart';

/// screen for providing information about a patient.
///  search for a patient using their phone number.
class PatientSearchPage extends StatelessWidget {
  final ReduxAction<CoreState> logoutAction;
  PatientSearchPage({
    ReduxAction<CoreState>? logoutAction,
  }) : logoutAction = logoutAction ?? LogoutAction();
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      key: AppWidgetKeys.patientIdentificationScaffoldKey,
      logoutAction: logoutAction,
      currentBottomNavIndex: BottomNavIndex.patients.index,
      body:
          UserExceptionDialog<CoreState>(child: const PatientSearchConnector()),
    );
  }
}
