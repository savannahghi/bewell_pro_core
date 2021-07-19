import 'package:flutter/material.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/domain/core/value_objects/type_defs.dart';
import 'package:shared_ui_components/buttons.dart';

/// Handles resending otp
/// Options include via [SMS Text] or via [Whatsapp]
/// An integer is passed to `callback` = >(int) either as 1 or 2
/// 1 => send opt to WhatsApp
/// 2 => send otp to sms text
class ResendOTPOptions extends StatefulWidget {
  final ResendOTPCallback resendOTPCallback;

  const ResendOTPOptions({required this.resendOTPCallback});

  @override
  _ResendOTPOptionsState createState() => _ResendOTPOptionsState();
}

class _ResendOTPOptionsState extends State<ResendOTPOptions> {
  bool showResendButtons = false;

  void showButtons() {
    setState(() {
      showResendButtons = !showResendButtons;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      runSpacing: 20,
      spacing: 10,
      children: <Widget>[
        if (!showResendButtons)
          SILPrimaryButton(
            buttonKey: AppWidgetKeys.resendOtpButton,
            borderColor: Colors.transparent,
            buttonColor: Theme.of(context).primaryColor,
            onPressed: () => showButtons(),
            text: resendCodeText,
          ),
        if (showResendButtons) ...<Widget>[
          SILSecondaryButton(
            buttonKey: AppWidgetKeys.resendWithWhatsApp,
            buttonColor: Theme.of(context).primaryColor,
            borderColor: Theme.of(context).primaryColor,
            onPressed: () => widget.resendOTPCallback(1),
            text: whatsAppText,
          ),
          SILSecondaryButton(
            buttonKey: AppWidgetKeys.resendWithNormalText,
            buttonColor: Theme.of(context).primaryColor,
            borderColor: Theme.of(context).primaryColor,
            onPressed: () => widget.resendOTPCallback(2),
            text: normalText,
          ),
        ],
      ],
    );
  }
}
