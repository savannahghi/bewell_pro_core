// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:sghi_core/shared_themes/colors.dart';
import 'package:sghi_core/shared_themes/text_themes.dart';
import 'package:sghi_core/ui_components/src/buttons.dart';

// Project imports:
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';

class VerifiedPhoneNumber extends StatelessWidget {
  const VerifiedPhoneNumber({
    Key? key,
    required this.sendingOtp,
    required this.verifyOTP,
    required this.otpReceiver,
  }) : super(key: key);

  final bool sendingOtp;

  final Function verifyOTP;

  final String otpReceiver;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(width: 0.1, color: redAccent),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.spaceBetween,
            runSpacing: 10,
            children: <Widget>[
              RichText(
                key: AppWidgetKeys.verifyPhoneRichTextKey,
                text: TextSpan(children: <InlineSpan>[
                  TextSpan(
                      text: verifyPhoneNumber,
                      style: Theme.of(context).textTheme.bodyText1),
                  TextSpan(
                    text: asteriskSymbol,
                    style: TextThemes.heavySize18Text(Colors.redAccent),
                  )
                ]),
              ),
              Text(
                mobileOptInText(otpReceiver),
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: Colors.grey),
              ),
              SILPrimaryButton(
                buttonKey: AppWidgetKeys.addNextOfKinSendOtpButtonKey,
                onPressed: () => verifyOTP(),
                text: sendingOtp ? sendingOTP : verifyPhoneBtnText,
              ),
            ]),
      ),
    );
  }
}
