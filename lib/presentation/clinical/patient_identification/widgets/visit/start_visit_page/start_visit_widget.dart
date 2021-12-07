// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:misc_utilities/responsive_widget.dart';
import 'package:quiver/async.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:shared_ui_components/inputs.dart';
import 'package:shared_ui_components/platform_loader.dart';

// Project imports:
import 'package:bewell_pro_core/domain/clinical/value_objects/start_visit_type_enum.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/common/widgets/countdown_timer_widget.dart';

/// send and verify an otp code input
class StartVisitWidget extends StatefulWidget {
  const StartVisitWidget({
    required this.showError,
    required this.startVisit,
    required this.phoneNumber,
    required this.hasCompletedEnteringOTP,
    required this.isResendingOTP,
    required this.resendOtp,
    required this.startVisitType,
    this.countdownTimer,
  });

  final void Function(BuildContext context, String otpCode) startVisit;
  final void Function(BuildContext context, int step) resendOtp;
  final CountdownTimer? countdownTimer;
  final bool hasCompletedEnteringOTP;
  final bool isResendingOTP;
  final String phoneNumber;
  final bool showError;
  final StartVisitType startVisitType;

  @override
  State<StatefulWidget> createState() => _StartVisitWidget();
}

class _StartVisitWidget extends State<StartVisitWidget> {
  /// Used to control the otp pin code input field
  TextEditingController pinController = TextEditingController();

  /// Used to request focus when the user enters a wrong code
  FocusNode pinFocusNode = FocusNode();

  @override
  void dispose() {
    widget.countdownTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isEmergencyOverride =
        widget.startVisitType == StartVisitType.emergencyOverride;
    final Widget dialog = Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Column(
        children: <Widget>[
          Text(
            enterVerificationCode,
            style: TextThemes.boldSize18Text(),
          ),
          smallVerticalSizedBox,
          Text(
            verificationCodeSent(isEmergency: isEmergencyOverride),
            textAlign: TextAlign.center,
            style: TextThemes.normalSize15Text().copyWith(height: 1.5),
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
            key: AppWidgetKeys.silPinCodeTextFieldKey,
            controller: pinController,
            focusNode: pinFocusNode,
            autoFocus: true,
            maxLength: 6,
            pinBoxWidth: 35,
            onDone: (String otpCode) {
              widget.startVisit(context, otpCode);
              pinController.clear();
              pinFocusNode.requestFocus();
            },
            onTextChanged: (String v) async {
              if (v.length == 6) {
                // todo: implement autofill sms code logic here
              }
            },
          ),
          mediumVerticalSizedBox,
          if (widget.showError) ...<Widget>[
            Text(
              enterValidCodeText,
              textAlign: TextAlign.center,
              style:
                  Theme.of(context).textTheme.bodyText2!.copyWith(color: red),
            ),
            size15VerticalSizedBox
          ],
          smallVerticalSizedBox,
          if (!widget.hasCompletedEnteringOTP)
            CountdownTimerWidget(
              countdownTimer: widget.countdownTimer,
              resendOtp: (int step) {
                widget.resendOtp(context, step);
              },
            ),
          if (widget.hasCompletedEnteringOTP ||
              widget.isResendingOTP) ...<Widget>[
            Text(
              widget.isResendingOTP ? resendingOTPText : verifyPhoneNumberText,
              style: Theme.of(context).textTheme.subtitle2,
              key: AppWidgetKeys.resendInTextKey,
            ),
            smallVerticalSizedBox,
            const SILPlatformLoader(),
          ],
          smallVerticalSizedBox,

          /// Back button
          SizedBox(
            width: double.infinity,
            height: 48,
            child: TextButton(
              key: AppWidgetKeys.backButton,
              onPressed: () => Navigator.of(context).pop(),
              child: Opacity(
                opacity: 0.5,
                child: Text(
                  loginBack,
                  style: TextThemes.boldSize16Text(),
                ),
              ),
            ),
          )
        ],
      ),
    );

    return ResponsiveWidget.isLargeScreen(context)
        ? Center(child: dialog)
        : dialog;
  }
}
