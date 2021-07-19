import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';

import 'bewell_patient_profile_connector.dart';

class BewellPatientProfilePage extends StatelessWidget {
  const BewellPatientProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UserExceptionDialog<AppState>(
      child: const BewellPatientProfileConnector(),
    );
  }
}
