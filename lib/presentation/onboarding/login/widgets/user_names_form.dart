// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_ui_components/buttons.dart';
import 'package:shared_ui_components/inputs.dart';
import 'package:shared_ui_components/platform_loader.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/actions/onboarding_actions/update_user_names_action.dart';
import 'package:bewell_pro_core/application/redux/flags/flags.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/application/redux/view_models/core_state_view_model.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/domain/core/value_objects/numbers_constants.dart';

class UserNamesForm extends StatefulWidget {
  @override
  _UserNamesFormState createState() => _UserNamesFormState();
}

class _UserNamesFormState extends State<UserNamesForm> {
  late String firstName;
  late String lastName;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> updateUserNamesFunction() async {
    if (_formKey.currentState!.validate()) {
      StoreProvider.dispatch<CoreState>(
        context,
        UpdateUserNamesAction(
          context: context,
          updatedFirstName: firstName,
          updatedLastName: lastName,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<CoreState, CoreStateViewModel>(
      converter: (Store<CoreState> store) =>
          CoreStateViewModel.fromStore(store),
      builder: (BuildContext context, CoreStateViewModel vm) {
        return Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              mediumVerticalSizedBox,
              SILFormTextField(
                key: AppWidgetKeys.silTextFieldFNameKey,
                autoFocus: true,
                enabled: !vm.state.wait!.isWaitingFor(updateNamesFlag),
                labelText: yourFirstName,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return firstNameRequired;
                  }
                  return null;
                },
                onChanged: (String value) {
                  firstName = value;
                },
              ),
              mediumVerticalSizedBox,
              SILFormTextField(
                key: AppWidgetKeys.silTextFieldLNameKey,
                labelText: yourLastName,
                enabled: !vm.state.wait!.isWaitingFor(updateNamesFlag),
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return lastNameRequired;
                  }
                  return null;
                },
                onChanged: (String value) {
                  lastName = value;
                },
              ),
              if (!vm.state.wait!.isWaitingFor(updateNamesFlag)) ...<Widget>[
                largeVerticalSizedBox,
                SizedBox(
                  width: double.infinity,
                  height: number48,
                  child: SILPrimaryButton(
                    buttonKey: AppWidgetKeys.silPrimaryButtonKey,
                    onPressed: () => updateUserNamesFunction(),
                    customRadius: 4,
                    buttonColor: Theme.of(context).colorScheme.secondary,
                    text: continueText,
                  ),
                ),
              ],
              if (vm.state.wait!.isWaitingFor(updateNamesFlag)) ...<Widget>[
                largeVerticalSizedBox,
                const SILPlatformLoader(),
              ],
            ],
          ),
        );
      },
    );
  }
}
