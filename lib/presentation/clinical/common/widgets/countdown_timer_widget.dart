// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:quiver/async.dart';
import 'package:sghi_core/shared_themes/colors.dart';

// Project imports:
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/resend_otp.dart';

class CountdownTimerWidget extends StatefulWidget {
  const CountdownTimerWidget({
    Key? key,
    required this.resendOtp,
    this.countdownTimer,
  }) : super(key: key);

  final CountdownTimer? countdownTimer;
  final void Function(int) resendOtp;

  @override
  _CountdownTimerWidgetState createState() => _CountdownTimerWidgetState();
}

class _CountdownTimerWidgetState extends State<CountdownTimerWidget> {
  late CountdownTimer _countdownTimer;

  @override
  void initState() {
    super.initState();
    _activeCounter();
  }

  void _activeCounter() {
    _countdownTimer = widget.countdownTimer ??
        CountdownTimer(
          const Duration(seconds: 30),
          const Duration(seconds: 1),
        );
  }

  @override
  void dispose() {
    _countdownTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CountdownTimer>(
      key: AppWidgetKeys.countDownTimerKey,
      stream: _countdownTimer,
      builder: (BuildContext context, AsyncSnapshot<CountdownTimer> snapshot) {
        if (snapshot.hasData) {
          final Duration remaining = snapshot.data!.remaining;
          return remaining.inSeconds > 0
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      child: Text(
                        remainingSecondsText(remaining.inSeconds),
                        style: const TextStyle(color: black54, fontSize: 15),
                        key: AppWidgetKeys.resendInTextKey,
                      ),
                    ),
                  ],
                )
              : Align(
                  key: AppWidgetKeys.resendButtonsKey,
                  child: ResendOTPOptions(
                    resendOTPCallback: widget.resendOtp,
                  ),
                );
        }
        return const SizedBox();
      },
    );
  }
}
