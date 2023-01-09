// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/ui_components/src/buttons.dart';
import 'package:sghi_core/ui_components/src/inputs.dart';
import 'package:sghi_core/ui_components/src/platform_loader.dart';

// Project imports:
import 'package:bewell_pro_core/application/core/services/input_validators.dart';
import 'package:bewell_pro_core/application/redux/actions/misc_state_actions/batch_update_misc_state_action.dart';
import 'package:bewell_pro_core/application/redux/actions/onboarding_actions/verify_pin_action.dart';
import 'package:bewell_pro_core/application/redux/flags/flags.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/application/redux/view_models/core_state_view_model.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/domain/core/value_objects/enums.dart';

class VerifyPin extends StatelessWidget {
  const VerifyPin({required this.pinVerificationType});

  final PinVerificationType pinVerificationType;

  Future<void> verifyPinFunction(
      BuildContext context, String pin, GlobalKey<FormState> formKey) async {
    if (formKey.currentState!.validate()) {
      StoreProvider.dispatch<CoreState>(
        context,
        VerifyPinAction(
          context: context,
          isChangingPin: pinVerificationType == PinVerificationType.pinChange,
          pin: pin,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    String enteredPin = '';

    return StoreConnector<CoreState, CoreStateViewModel>(
      converter: (Store<CoreState> store) =>
          CoreStateViewModel.fromStore(store),
      builder: (BuildContext context, CoreStateViewModel vm) {
        return Column(
          children: <Widget>[
            Form(
              key: _formKey,
              child: SILFormTextField(
                key: AppWidgetKeys.createPinFormFieldKey,
                borderColor: Colors.grey.withOpacity(0.5),
                maxLength: 4,
                maxLines: 1,
                keyboardType: TextInputType.number,
                obscureText: true,
                hintText: loginHintPin,
                labelText: verificationTextPin,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                validator: (String? v) => InputValidators.validatePin(value: v),
                onChanged: (String val) {
                  if (vm.state.miscState!.invalidPin!) {
                    StoreProvider.dispatch<CoreState>(
                      context,
                      BatchUpdateMiscStateAction(invalidPin: false),
                    );
                  }

                  enteredPin = val;
                },
              ),
            ),
            mediumVerticalSizedBox,
            if (vm.state.miscState!.invalidPin!) ...<Widget>[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.3),
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                ),
                child: const Text(verifyPinPrompt),
              ),
              mediumVerticalSizedBox,
            ],

            // verify pin
            if (!vm.state.wait!.isWaitingFor(verifyPinFlag))
              SizedBox(
                width: double.infinity,
                height: 48,
                child: SILPrimaryButton(
                  buttonKey: AppWidgetKeys.verifyPinKey,
                  onPressed: () =>
                      verifyPinFunction(context, enteredPin, _formKey),
                  buttonColor: Theme.of(context).primaryColor,
                  borderColor: Colors.transparent,
                  text: verifyPinText,
                ),
              ),
            if (vm.state.wait!.isWaitingFor(verifyPinFlag)) ...<Widget>[
              smallVerticalSizedBox,
              smallVerticalSizedBox,
              const SILPlatformLoader(),
            ],
            mediumVerticalSizedBox,
          ],
        );
      },
    );
  }
}
