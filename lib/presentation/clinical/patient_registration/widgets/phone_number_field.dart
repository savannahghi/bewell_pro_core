// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:sghi_core/misc_utilities/misc.dart';
import 'package:sghi_core/misc_utilities/responsive_widget.dart';
import 'package:quiver/async.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sghi_core/shared_themes/colors.dart';
import 'package:sghi_core/shared_themes/constants.dart';
import 'package:sghi_core/shared_themes/spaces.dart';
import 'package:sghi_core/shared_themes/text_themes.dart';
import 'package:sghi_core/ui_components/src/badge.dart';
import 'package:sghi_core/ui_components/src/buttons.dart';
import 'package:sghi_core/ui_components/src/inputs.dart';

// Project imports:
import 'package:bewell_pro_core/application/clinical/patient_registration/phone_number_form_manager.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/domain/core/entities/verify_phone_dialog_status.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/theme/form_styles.dart';
import '../verify_phone_dialog.dart';

class PhoneNumberFieldWidget extends StatefulWidget {
  final PhoneNumberFormManager formManager;
  final String otpReceiver;
  final bool disabled;
  final String? preFilled;
  final Function? verifyPhone;
  final CountdownTimer? countdownTimer;

  const PhoneNumberFieldWidget({
    required this.formManager,
    required this.otpReceiver,
    this.preFilled,
    this.verifyPhone,
    this.countdownTimer,
    bool? disabled,
  }) : disabled = disabled ?? false;

  @override
  _PhoneNumberFieldWidgetState createState() => _PhoneNumberFieldWidgetState();
}

class _PhoneNumberFieldWidgetState extends State<PhoneNumberFieldWidget> {
  late StreamSubscription<Iterable<String>> phoneNumberChangeSub;
  late TextEditingController inputController;

  @override
  void initState() {
    super.initState();
    phoneNumberChangeSub = _listenToPhoneNumberChanges();
    inputController = TextEditingController();
  }

  @override
  void dispose() {
    phoneNumberChangeSub.cancel();
    inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = ResponsiveWidget.isSmallScreen(context);

    final SILFormTextField textField = SILFormTextField(
      enabled: !widget.disabled,
      controller: TextEditingController(text: widget.preFilled),
    );

    final SILPhoneInput phoneInput = SILPhoneInput(
      //TODO: SILPhoneInput setting initial value does not work
      // initialValue: snapshot.hasData ? snapshot.data! : null,
      phoneNumberFormatter: formatPhoneNumber,
      inputController: inputController,
      labelText: phoneNumberInputLabelText,
      labelStyle: TextThemes.boldSize16Text(),
      onChanged: (String? value) {
        if (value != null) {
          widget.formManager.inPhoneNumber.add(value);
        }
      },
    );

    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.topLeft,
          child: widget.disabled
              ? const TextFormHintText(hintText: phoneHint)
              : const RequiredTextFormHintText(
                  hintText: phoneHint,
                ),
        ),
        smallVerticalSizedBox,
        if (widget.preFilled != null) textField else phoneInput,
        smallVerticalSizedBox,
        StreamBuilder<PhoneNumberVerifiedState>(
            stream: widget.formManager.isPhoneVerified,
            builder: (BuildContext context,
                AsyncSnapshot<PhoneNumberVerifiedState> snapshot) {
              if (snapshot.hasData) {
                final PhoneNumberVerifiedState? verifiedState = snapshot.data;

                if (verifiedState != null && verifiedState.isPhoneVerified) {
                  return const Align(
                    alignment: Alignment.centerRight,
                    child: SILBadge(text: verifiedPhoneNumber),
                  );
                } else {
                  return Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.1, color: redAccent),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                      child: isSmallScreen
                          ? Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              alignment: WrapAlignment.spaceBetween,
                              runSpacing: 10,
                              children: <Widget>[
                                RichText(
                                  key: AppWidgetKeys.verifyPhoneRichTextKey,
                                  text: TextSpan(children: <InlineSpan>[
                                    TextSpan(
                                        text: verifyPhoneNumber,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1),
                                    TextSpan(
                                      text: asteriskSymbol,
                                      style: TextThemes.heavySize18Text(
                                          Colors.redAccent),
                                    )
                                  ]),
                                ),
                                Text(
                                  mobileOptInText(widget.otpReceiver),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(color: Colors.grey),
                                ),
                                SILPrimaryButton(
                                  buttonKey: AppWidgetKeys.verifyButtonKey,
                                  onPressed: () {
                                    widget.verifyPhone != null
                                        ? widget.verifyPhone?.call()
                                        : _verifyPhone();
                                  },
                                  text: verifiedState!.isSendingOtp
                                      ? sendingOTP
                                      : verifyPhoneBtnText,
                                ),
                              ],
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      RichText(
                                        key: AppWidgetKeys
                                            .verifyPhoneRichTextKey,
                                        text: TextSpan(
                                          children: <InlineSpan>[
                                            TextSpan(
                                                text: verifyPhoneNumber,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1),
                                            TextSpan(
                                              text: asteriskSymbol,
                                              style: TextThemes.heavySize18Text(
                                                  Colors.redAccent),
                                            )
                                          ],
                                        ),
                                      ),
                                      Flexible(
                                        child: SILPrimaryButton(
                                          buttonKey:
                                              AppWidgetKeys.verifyButtonKey,
                                          onPressed: () {
                                            widget.verifyPhone != null
                                                ? widget.verifyPhone?.call()
                                                : _verifyPhone();
                                          },
                                          text: verifiedState!.isSendingOtp
                                              ? sendingOTP
                                              : verifyPhoneBtnText,
                                        ),
                                      ),
                                    ]),
                                Text(mobileOptInText(widget.otpReceiver),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(color: Colors.grey)),
                              ],
                            ),
                    ),
                  );
                }
              }
              return const SizedBox();
            }),
      ],
    );
  }

  Future<void> _verifyPhone() async {
    widget.formManager.inIsPhoneVerified.add(
        PhoneNumberVerifiedState(isSendingOtp: true, isPhoneVerified: false));

    final String phoneNumber = widget.formManager.phoneNumberValue!;
    final String? otp = await widget.formManager.verifyPhone(context);

    VerifyPhoneDialogStatus? status;

    if (otp != null) {
      status = await showDialog<VerifyPhoneDialogStatus>(
        context: context,
        useRootNavigator: false,
        builder: (BuildContext context) {
          return SimpleDialog(
            elevation: 0,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            titlePadding: EdgeInsets.zero,
            children: <Widget>[
              VerifyPhoneDialog(
                phoneNumber: phoneNumber,
                otpCode: otp,
                resendOtp: widget.formManager.resendOtp,
                countdownTimer: widget.countdownTimer,
                otpReceiver: widget.otpReceiver,
              ),
            ],
          );
        },
      );
    }

    if (status != null && status.isVerified) {
      widget.formManager.inMobileOptIn.add(true);
      widget.formManager.inVerificationCode.add(status.otp);
      widget.formManager.inIsPhoneVerified.add(
          PhoneNumberVerifiedState(isSendingOtp: false, isPhoneVerified: true));
    } else {
      showAlertSnackBar(
          context: context,
          message: UserFeedBackTexts.getErrorMessage(sendingTheOtp));

      widget.formManager.inIsPhoneVerified.add(PhoneNumberVerifiedState(
          isSendingOtp: false, isPhoneVerified: false));
    }
  }

  StreamSubscription<Iterable<String>> _listenToPhoneNumberChanges() {
    return widget.formManager.phoneNumber
        .startWith('')
        .pairwise()
        .listen((Iterable<String> numbers) {
      if (numbers.first.isEmpty) {
        widget.formManager.inIsPhoneVerified.add(PhoneNumberVerifiedState(
            isPhoneVerified: false, isSendingOtp: false));
      } else {
        final bool isNotEqual = numbers.first.compareTo(numbers.last) != 0;

        if (isNotEqual) {
          widget.formManager.inIsPhoneVerified.add(PhoneNumberVerifiedState(
              isPhoneVerified: false, isSendingOtp: false));
          widget.formManager.inVerificationCode.add('');

          showAlertSnackBar(
            context: context,
            message: verifyPhoneChangedPrompt,
          );
        }
      }
    });
  }
}
