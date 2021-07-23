import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/pages/complete_registration_page/complete_registration_connector.dart';

class CompleteRegistrationPage extends StatelessWidget {
  const CompleteRegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UserExceptionDialog<CoreState>(
      child: const CompleteRegistrationConnector(),
    );
  }
}
