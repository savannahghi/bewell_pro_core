import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bewell_pro_core/application/core/services/input_validators.dart';
import 'package:bewell_pro_core/application/core/services/onboarding.dart';
import 'package:bewell_pro_core/application/redux/actions/misc_state_actions/batch_update_misc_state_action.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/application/redux/view_models/core_state_view_model.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/domain/core/value_objects/numbers_constants.dart';
import 'package:misc_utilities/misc.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_ui_components/buttons.dart';
import 'package:shared_ui_components/inputs.dart';
import 'package:shared_ui_components/platform_loader.dart';

class SetAndConfirmPinWidget extends StatelessWidget {
  final ReduxAction<CoreState>? logoutAction;

  SetAndConfirmPinWidget({
    required this.flag,
    required this.setPinStatus,
    this.logoutAction,
  });

  final String flag;
  final SetPinStatus setPinStatus;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  /// Used to validate the PIN provided, ensures both pins match and values
  /// aren't empty
  ///
  /// Updates state with the createPin and confirmPin values
  Future<void> validatePinFunction({
    required BuildContext context,
    required GlobalKey<FormState> formKey,
    required String pin,
    required String confirmPin,
  }) async {
    if (formKey.currentState!.validate()) {
      StoreProvider.dispatch<CoreState>(
        context,
        BatchUpdateMiscStateAction(createPin: pin, confirmPin: confirmPin),
      );
      await validateEnteredPin(
        context: context,
        flag: flag,
        setPinStatus: setPinStatus,
        logoutAction: logoutAction,
      );
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(snackbar(content: setConfirmPinPrompt));
    }
  }

  @override
  Widget build(BuildContext context) {
    String? _confirmPin;
    String? _pin;

    return StoreConnector<CoreState, CoreStateViewModel>(
      converter: (Store<CoreState> store) =>
          CoreStateViewModel.fromStore(store),
      builder: (BuildContext context, CoreStateViewModel vm) {
        return Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              /// Enter PIN input
              SILFormTextField(
                key: AppWidgetKeys.createPinFormFieldKey,
                borderColor: Colors.grey.withOpacity(0.5),
                maxLength: 4,
                maxLines: 1,
                keyboardType: TextInputType.number,
                obscureText: true,
                hintText: loginTextPin,
                labelText: loginCreatePin,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                validator: (String? value) =>
                    InputValidators.validatePin(value: value),
                onChanged: (String val) => _pin = val,
              ),

              mediumVerticalSizedBox,

              /// Confirm PIN input
              SILFormTextField(
                key: AppWidgetKeys.confirmPinFormFieldKey,
                borderColor: Colors.grey.withOpacity(0.5),
                maxLength: 4,
                maxLines: 1,
                keyboardType: TextInputType.number,
                obscureText: true,
                hintText: loginEnterPin,
                labelText: loginEnterPinAgain,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                validator: (String? value) {
                  return InputValidators.validatePin(
                    value: value,
                    initiallyEnteredPin: _pin,
                  );
                },
                onChanged: (String val) => _confirmPin = val,
              ),

              size40VerticalSizedBox,

              if (!vm.state.wait!.isWaitingFor(flag))
                SizedBox(
                  width: double.infinity,
                  height: number48,
                  child: SILPrimaryButton(
                    buttonKey: AppWidgetKeys.setPinKey,
                    customRadius: 4,
                    onPressed: () async => validatePinFunction(
                      context: context,
                      formKey: _formKey,
                      pin: _pin!,
                      confirmPin: _confirmPin!,
                    ),
                    buttonColor: Theme.of(context).primaryColor,
                    borderColor: Theme.of(context).primaryColor,
                    text: continueText,
                  ),
                ),
              mediumVerticalSizedBox,
              if (vm.state.wait!.isWaitingFor(flag)) ...<Widget>[
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
