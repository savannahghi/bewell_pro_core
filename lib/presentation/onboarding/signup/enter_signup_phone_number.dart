import 'package:async_redux/async_redux.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/application/core/services/onboarding.dart';
import 'package:bewell_pro_core/application/redux/actions/misc_state_actions/batch_update_misc_state_action.dart';
import 'package:bewell_pro_core/application/redux/actions/user_state_actions/signup_with_phone_number_action.dart';
import 'package:bewell_pro_core/application/redux/flags/flags.dart';

import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/application/redux/view_models/core_state_view_model.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';

import 'package:bewell_pro_core/presentation/onboarding/login/widgets/error_alert_box.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:shared_themes/colors.dart';
import 'package:misc_utilities/misc.dart';
import 'package:shared_themes/spaces.dart';

import 'package:shared_themes/text_themes.dart';
import 'package:shared_ui_components/buttons.dart';
import 'package:shared_ui_components/inputs.dart';
import 'package:shared_ui_components/platform_loader.dart';

/// Renders [SILPhoneInput] to allow user to enter phone number for signing in with
class EnterSignUpPhoneNo extends StatefulWidget {
  @override
  _EnterSignUpPhoneNoState createState() => _EnterSignUpPhoneNoState();
}

class _EnterSignUpPhoneNoState extends State<EnterSignUpPhoneNo> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController phoneNumberInputController =
      TextEditingController();

  String formattedPhoneNumber = UNKNOWN;

  /// Navigates user back to the login page i.e. incase they have an account already
  void navigateToLogin() {
    triggerNavigationEvent(context: context, route: phoneLoginRoute);

    StoreProvider.dispatch<CoreState>(
      context,
      BatchUpdateMiscStateAction(
        accountExists: false,
        acceptedTerms: false,
      ),
    );
    return;
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<CoreState, CoreStateViewModel>(
      converter: (Store<CoreState> store) =>
          CoreStateViewModel.fromStore(store),
      distinct: true,
      builder: (BuildContext context, CoreStateViewModel vm) {
        return Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              mediumVerticalSizedBox,
              SILPhoneInput(
                inputController: phoneNumberInputController,
                phoneNumberFormatter: formatPhoneNumber,
                enabled: true,
                labelText: phoneNumberInputLabelText,
                labelStyle: TextThemes.boldSize16Text(),
                onChanged: (String? value) {
                  if (vm.state.miscState!.accountExists!) {
                    toggleUserExists(context: context, value: false);
                  }

                  /// The reason for this is that the phone number is formatted
                  //  When this function is called
                  setState(() {
                    if (value != null) {
                      formattedPhoneNumber = value;
                    }
                  });
                },
              ),
              mediumVerticalSizedBox,
              if (vm.state.miscState!.accountExists!) ...<Widget>[
                ErrorAlertBox(
                  message: phoneExists,
                  actionSpan: TextSpan(
                    text: accountSignIn,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => navigateToLogin(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(decoration: TextDecoration.underline),
                  ),
                ),
                smallVerticalSizedBox,
              ],

              size15VerticalSizedBox,

              /// CheckBox to prompt user to allow use of their phone for communications
              CheckboxListTile(
                key: AppWidgetKeys.signupCheckboxConsentToPhoneComms,
                value: vm.state.miscState!.acceptedTerms,
                activeColor: healthcloudPrimaryColor,
                controlAffinity: ListTileControlAffinity.leading,
                title: Text(verifyPhoneMap[commConsent]!),
                onChanged: (bool? value) {
                  setState(() {
                    StoreProvider.dispatch<CoreState>(
                      context,
                      BatchUpdateMiscStateAction(acceptedTerms: value),
                    );
                  });
                },
              ),

              size15VerticalSizedBox,
              if (!vm.state.wait!
                  .isWaitingFor(checkUserExistsFlag)) ...<Widget>[
                mediumVerticalSizedBox,
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: SILPrimaryButton(
                    buttonKey: AppWidgetKeys.silPrimaryButtonKey,
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await StoreProvider.dispatch<CoreState>(
                            context,
                            SignupWithPhoneNumberAction(
                                phoneNumber: formattedPhoneNumber,
                                context: context));
                      }
                    },
                    buttonColor: Theme.of(context).primaryColor,
                    borderColor: Theme.of(context).primaryColor,
                    text: continueText,
                  ),
                )
              ],
              mediumVerticalSizedBox,
              Center(
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: alreadyHaveAnAccount,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      TextSpan(
                        text: loginText,
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: Theme.of(context).primaryColorDark),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => navigateToLogin(),
                      )
                    ],
                  ),
                ),
              ),
              mediumVerticalSizedBox,
              if (vm.state.wait!.isWaitingFor(checkUserExistsFlag)) ...<Widget>[
                const SILPlatformLoader(),
                mediumVerticalSizedBox,
              ],
              mediumVerticalSizedBox,
              SizedBox(
                height: 48,
                width: double.infinity,
                child: TextButton(
                  key: AppWidgetKeys.landingPageNavigationKey,
                  onPressed: () => navigateToLogin(),
                  child: const Opacity(
                    opacity: 0.6,
                    child: Text(loginBack),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
