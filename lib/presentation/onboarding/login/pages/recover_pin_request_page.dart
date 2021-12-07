// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:misc_utilities/misc.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:shared_ui_components/buttons.dart';
import 'package:shared_ui_components/inputs.dart';
import 'package:shared_ui_components/platform_loader.dart';

// Project imports:
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/application/redux/actions/misc_state_actions/batch_update_misc_state_action.dart';
import 'package:bewell_pro_core/application/redux/actions/onboarding_actions/request_pin_reset_action.dart';
import 'package:bewell_pro_core/application/redux/flags/flags.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/application/redux/view_models/core_state_view_model.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/widgets/error_alert_box.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';

class RecoverPinRequest extends StatelessWidget {
  final TextEditingController phoneNumberInputController =
      TextEditingController();

  Future<void> requestPinResetFunction(
      BuildContext context, String phoneNumber) async {
    if (phoneNumber.isNotEmpty) {
      await StoreProvider.dispatch<CoreState>(
        context,
        RequestPinResetAction(context: context, phoneNumber: phoneNumber),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    late String _phoneNumber;

    return StoreConnector<CoreState, CoreStateViewModel>(
      converter: (Store<CoreState> store) =>
          CoreStateViewModel.fromStore(store),
      builder: (BuildContext context, CoreStateViewModel vm) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SILPhoneInput(
              inputController: phoneNumberInputController,
              phoneNumberFormatter: formatPhoneNumber,
              labelText: phoneNumberInputLabelText,
              labelStyle: TextThemes.boldSize16Text(),
              onChanged: (String? value) {
                if (vm.state.miscState!.unKnownPhoneNo != null) {
                  StoreProvider.dispatch<CoreState>(
                    context,
                    BatchUpdateMiscStateAction(unKnownPhoneNo: false),
                  );
                }
                if (value != null) _phoneNumber = value;
              },
            ),
            mediumVerticalSizedBox,
            if (vm.state.miscState!.unKnownPhoneNo != false) ...<Widget>[
              const ErrorAlertBox(message: noAccount, actionSpan: null),
              mediumVerticalSizedBox,
            ],
            if (vm.state.wait!.isWaitingFor(requestPinResetFlag)) ...<Widget>[
              const SILPlatformLoader(),
              smallVerticalSizedBox,
            ],
            if (!vm.state.wait!.isWaitingFor(requestPinResetFlag)) ...<Widget>[
              smallVerticalSizedBox,
              SizedBox(
                width: double.infinity,
                height: 48,
                child: SILPrimaryButton(
                  onPressed: () =>
                      requestPinResetFunction(context, _phoneNumber),
                  buttonColor: Theme.of(context).primaryColor,
                  text: continueText,
                ),
              ),
            ],
            largeVerticalSizedBox,
            Center(
              child: TextButton(
                key: AppWidgetKeys.recoverRequestBackButton,
                onPressed: () async {
                  await triggerNavigationEvent(
                      context: context,
                      route: phoneLoginRoute,
                      shouldReplace: true);
                },
                child: const Opacity(opacity: 0.5, child: Text(loginBack)),
              ),
            )
          ],
        );
      },
    );
  }
}
