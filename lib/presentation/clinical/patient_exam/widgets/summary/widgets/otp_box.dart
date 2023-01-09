// Flutter imports:
import 'package:flutter/material.dart';
import 'package:sghi_core/domain_objects/value_objects/unknown.dart';

// Package imports:
import 'package:sghi_core/misc_utilities/responsive_widget.dart';
import 'package:quiver/async.dart';
import 'package:sghi_core/shared_themes/colors.dart';
import 'package:sghi_core/shared_themes/spaces.dart';
import 'package:sghi_core/ui_components/src/inputs.dart';
import 'package:sghi_core/ui_components/src/platform_loader.dart';

// Project imports:
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/presentation/clinical/common/widgets/countdown_timer_widget.dart';

class OtpBox extends StatefulWidget {
  const OtpBox({
    required this.phoneNumber,
    required this.resendOtp,
    required this.showError,
    required this.endingExam,
    required this.endVisit,
    this.countdownTimer,
  });

  final String? phoneNumber;
  final CountdownTimer? countdownTimer;
  final void Function(BuildContext context, int step) resendOtp;
  final bool showError;
  final bool endingExam;
  final Function(BuildContext context, String otp) endVisit;

  @override
  _OtpBoxState createState() => _OtpBoxState();
}

class _OtpBoxState extends State<OtpBox> {
  late TextEditingController pinController;
  late FocusNode pinFocusNode;
  late int timerCounter;

  late CountdownTimer countDownTimer;

  @override
  void initState() {
    super.initState();
    pinFocusNode = FocusNode();
    pinController = TextEditingController();
    activeCounter();
  }

  @override
  void dispose() {
    pinController.dispose();
    pinFocusNode.dispose();
    countDownTimer.cancel();
    super.dispose();
  }

  void activeCounter() {
    if (widget.countdownTimer == null) {
      countDownTimer = CountdownTimer(
        const Duration(seconds: 30),
        const Duration(seconds: 1),
      );
    } else {
      countDownTimer = widget.countdownTimer!;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = ResponsiveWidget.isSmallScreen(context);

    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(isSmallScreen ? 10.0 : 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              size15VerticalSizedBox,
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: healthcloudAccentColor.withOpacity(0.2)),
                child: const Center(
                    child: Icon(Icons.security,
                        size: 50, color: healthcloudAccentColor)),
              ),
              size15VerticalSizedBox,
              Text(
                signOffText,
                style: Theme.of(context).textTheme.headline6,
              ),
              size15VerticalSizedBox,
              Text(
                signOffVerificationText,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                widget.phoneNumber ?? UNKNOWN,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    fontWeight: FontWeight.w600, color: healthcloudAccentColor),
              ),
              if (isSmallScreen)
                smallVerticalSizedBox
              else
                largeVerticalSizedBox,
              SILPinCodeTextField(
                controller: pinController,
                focusNode: pinFocusNode,
                autoFocus: true,
                maxLength: 6,
                pinBoxWidth: 34,
                pinBoxHeight: 38,
                wrapAlignment: WrapAlignment.spaceAround,
                onDone: (String otp) async {
                  widget.endVisit(context, otp);
                  pinController.clear();
                  pinFocusNode.requestFocus();
                },
                onTextChanged: (String v) async {
                  if (v.length == 6) {
                    // todo: implement autofill sms code logic here
                  }
                },
              ),
              SizedBox(height: isSmallScreen ? 10.0 : 25),
              if (widget.endingExam) const SILPlatformLoader(),
              if (widget.showError) ...<Widget>[
                Text(
                  enterValidCodeText,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(color: red),
                ),
                size15VerticalSizedBox
              ],
              mediumVerticalSizedBox,
              CountdownTimerWidget(
                countdownTimer: countDownTimer,
                resendOtp: (int step) {
                  widget.resendOtp(context, step);
                },
              ),
              mediumVerticalSizedBox,
            ],
          ),
        ),
      ],
    );
  }
}
