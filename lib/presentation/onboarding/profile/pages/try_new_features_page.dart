import 'package:flutter/material.dart';
import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/actions/user_state_actions/batch_update_user_state_action.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:domain_objects/entities.dart';
import 'package:shared_ui_components/try_new_features_widget.dart';
import 'package:user_profile/helpers.dart';

class TryNewFeaturesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: BuildTryNewFeatures(),
        ),
      ),
    );
  }
}

class BuildTryNewFeatures extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SILTryNewFeaturesWidget(
      settingsFunc: ({bool? value}) async {
        // call api
        await setupAsExperimentParticipant(
          context: context,
          participate: value!,
        );

        StoreProvider.dispatch<CoreState>(
          context,
          BatchUpdateUserStateAction(
            auth: AuthCredentialResponse(canExperiment: value),
          ),
        );
      },
      canExperiment: StoreProvider.state<CoreState>(context)!
          .userState!
          .auth!
          .canExperiment,
    );
  }
}
