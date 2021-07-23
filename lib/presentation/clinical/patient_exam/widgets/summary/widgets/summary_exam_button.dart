import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/entities.dart';
import 'package:flutter/material.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/application/redux/flags/flags.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';
import 'package:bewell_pro_core/application/redux/view_models/app_state_view_model.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/summary/summary_action.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/constants.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_ui_components/buttons.dart';
import 'package:shared_ui_components/platform_loader.dart';

import 'otp_box_connector.dart';

class SaveExamSummaryButton extends StatefulWidget {
  const SaveExamSummaryButton({Key? key, this.sendOtpCallBack})
      : super(key: key);

  final Function(String? doctorsEmail, String? phoneNumber)? sendOtpCallBack;

  @override
  _SaveExamSummaryButtonState createState() => _SaveExamSummaryButtonState();
}

class _SaveExamSummaryButtonState extends State<SaveExamSummaryButton> {
  bool disabled = false;
  String _content = signOffButtonText;

  Future<void> _sendOtp(String? doctorsEmail, String? phoneNumber) async {
    if (!disabled) {
      setState(() {
        _content = sendingOTP;
        disabled = true;
      });

      final String phoneNumber = StoreProvider.state<AppState>(context)!
          .userState!
          .userProfile!
          .primaryPhoneNumber!
          .getValue();

      await StoreProvider.dispatch<AppState>(
        context,
        SummaryAction(
            context: context,
            disabled: disabled,
            doctorsEmail: doctorsEmail,
            phoneNumber: phoneNumber),
      );

      setState(() {
        _content = signOffAndComplete;
        disabled = false;
      });

      final Map<String, dynamic>? endExam = await showDialog(
        context: context,
        useRootNavigator: false,
        builder: (BuildContext context) {
          return const SimpleDialog(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
            titlePadding: EdgeInsets.zero,
            children: <Widget>[OtpBoxConnector()],
          );
        },
      );

      if (endExam != null) {
        if (endExam['status'] == true) {
          SnackBarListenersChangeObject().onCloseSummaryListener.add(true);
          await triggerNavigationEvent(
              context: context, route: patientProfilePageRoute);
        }
      } else {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              backgroundColor: black,
              content: Text(
                signOffCancel,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: white),
              ),
              duration: const Duration(seconds: kShortSnackBarDuration),
            ),
          );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppStateViewModel>(
      converter: (Store<AppState> store) => AppStateViewModel.fromStore(store),
      builder: (BuildContext context, AppStateViewModel vm) {
        final UserProfile? userProfile = vm.state.userState!.userProfile;
        final String? phoneNumber = userProfile?.primaryPhoneNumber?.getValue();
        final String? doctorsEmail =
            userProfile?.primaryEmailAddress?.getValue();

        return SILPrimaryButton(
          buttonKey: AppWidgetKeys.signOffExamSaveButton,
          buttonColor: healthcloudPrimaryColor,
          customPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          onPressed: () =>
              widget.sendOtpCallBack?.call(doctorsEmail, phoneNumber) ??
              _sendOtp(doctorsEmail, phoneNumber),
          text: _content,
          customChild: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                _content,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: white, fontWeight: FontWeight.bold),
              ),
              if (vm.state.wait!.isWaitingFor(summaryExamFlag)) ...<Widget>[
                smallHorizontalSizedBox,
                const SizedBox(
                  height: 15,
                  width: 15,
                  child: SILPlatformLoader(color: Colors.white),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
