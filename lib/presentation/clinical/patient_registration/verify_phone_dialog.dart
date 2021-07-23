import 'package:flutter/material.dart';
import 'package:bewell_pro_core/domain/core/entities/verify_phone_dialog_status.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/common/widgets/countdown_timer_widget.dart';
import 'package:quiver/async.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_ui_components/inputs.dart';
import 'package:shared_ui_components/platform_loader.dart';

class VerifyPhoneDialog extends StatefulWidget {
  const VerifyPhoneDialog({
    required this.otpCode,
    required this.phoneNumber,
    required this.resendOtp,
    required this.otpReceiver,
    this.countdownTimer,
  });

  final String otpCode;

  /// This is required because of the following:
  ///
  /// - In case the user decides to resend the OTP (main one)
  /// - To be used to indicate the phone number in which the OTP code was
  /// sent to
  final String phoneNumber;

  final String otpReceiver;
  final CountdownTimer? countdownTimer;
  final Future<String> Function(BuildContext context, int step) resendOtp;

  @override
  _VerifyPhoneDialogState createState() => _VerifyPhoneDialogState();
}

class _VerifyPhoneDialogState extends State<VerifyPhoneDialog> {
  bool hasCompletedEnteringOTP = false;
  bool isResendingOTP = false;

  /// Used to control the input field
  TextEditingController pinController = TextEditingController();

  /// Used to request focus when the user enters a wrong code
  FocusNode pinFocusNode = FocusNode();

  bool showErr = false;
  late int timerCounter;

  String _newOtpCode = '';

  late CountdownTimer countDownTimer;

  @override
  void initState() {
    super.initState();
    activeCounter();
    _newOtpCode = widget.otpCode;
  }

  @override
  void dispose() {
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

  void resetCounter() {
    countDownTimer.cancel();
    activeCounter();
  }

  /// Takes in context and returns a function to send retry OTP
  Future<void> resendOTP(BuildContext context, int step) async {
    setState(() {
      isResendingOTP = true;
    });

    final String otp = await widget.resendOtp(context, step);

    setState(() {
      _newOtpCode = otp;
      isResendingOTP = false;
      hasCompletedEnteringOTP = false;
      resetCounter();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        key: AppWidgetKeys.verifyPhoneDialogColumnKey,
        children: <Widget>[
          smallVerticalSizedBox,
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: healthcloudAccentColor.withOpacity(0.3),
            ),
            child: const Center(
              child: Icon(
                Icons.security,
                size: 40,
                color: healthcloudAccentColor,
              ),
            ),
          ),
          size15VerticalSizedBox,
          Text(enterVerificationCode,
              style: Theme.of(context).textTheme.headline6),
          smallVerticalSizedBox,
          Text(
            enterVerificationCodeSent(widget.otpReceiver),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          smallVerticalSizedBox,
          Text(
            widget.phoneNumber,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                fontWeight: FontWeight.w600, color: healthcloudAccentColor),
          ),
          mediumVerticalSizedBox,
          SILPinCodeTextField(
            key: AppWidgetKeys.otpVerifyInput,
            controller: pinController,
            autoFocus: true,
            maxLength: 6,
            pinBoxWidth: 34,
            pinBoxHeight: 38,
            wrapAlignment: WrapAlignment.spaceAround,
            onDone: (String v) async {
              final String otpCode = _newOtpCode;
              if (v == otpCode) {
                setState(() {
                  _newOtpCode = v;
                  hasCompletedEnteringOTP = true;
                  showErr = false;
                });

                Navigator.of(context, rootNavigator: true).pop(
                  VerifyPhoneDialogStatus(otp: _newOtpCode, isVerified: true),
                );

                return;
              } else {
                setState(() {
                  showErr = true;

                  // clear the text editing controller and request focus
                  // on the first input box
                  pinController.clear();
                  pinFocusNode.requestFocus();
                });
              }
            },
            onTextChanged: (String v) async {
              if (v.length == 6) {
                // todo: implement autofill sms code logic here
              }
            },
          ),
          mediumVerticalSizedBox,
          if (showErr) ...<Widget>[
            Text(
              enterValidCodeText,
              textAlign: TextAlign.center,
              style:
                  Theme.of(context).textTheme.bodyText2!.copyWith(color: red),
            ),
            size15VerticalSizedBox
          ],
          smallVerticalSizedBox,
          if (!hasCompletedEnteringOTP)
            CountdownTimerWidget(
              countdownTimer: countDownTimer,
              resendOtp: (int step) {
                resendOTP(context, step);
              },
            ),
          if (hasCompletedEnteringOTP || isResendingOTP) ...<Widget>[
            Text(
              isResendingOTP ? resendingOTPText : verifyPhoneNumberText,
              style: Theme.of(context).textTheme.subtitle2,
              key: AppWidgetKeys.resendInTextKey,
            ),
            smallVerticalSizedBox,
            const SILPlatformLoader()
          ]
        ],
      ),
    );
  }
}
