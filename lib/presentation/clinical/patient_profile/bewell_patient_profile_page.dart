// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'bewell_patient_profile_connector.dart';

class BewellPatientProfilePage extends StatelessWidget {
  const BewellPatientProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UserExceptionDialog<CoreState>(
      child: const BewellPatientProfileConnector(),
    );
  }
}
