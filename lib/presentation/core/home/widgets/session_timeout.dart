// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:quiver/async.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_ui_components/buttons.dart';

// Project imports:
import 'package:bewell_pro_core/application/redux/actions/navigation_actions/update_navigation_action.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';

class SessionTimeoutAlert extends StatefulWidget {
  const SessionTimeoutAlert({
    Key? key,
    required this.modalCountdown,
    required this.recordingDoctorSurName,
    this.countdownTimer,
  }) : super(key: key);

  final int modalCountdown;
  final String? recordingDoctorSurName;
  final CountdownTimer? countdownTimer;

  @override
  _SessionTimeoutAlertState createState() => _SessionTimeoutAlertState();
}

class _SessionTimeoutAlertState extends State<SessionTimeoutAlert> {
  late CountdownTimer _countdownTimer;

  @override
  void initState() {
    super.initState();
    _countdownTimer = widget.countdownTimer ??
        CountdownTimer(
          Duration(seconds: widget.modalCountdown),
          const Duration(seconds: 1),
        );

    if (!_countdownTimer.isRunning) {
      Navigator.pop(context, 'logout');
    }
  }

  @override
  void dispose() {
    closeTimers();
    super.dispose();
  }

  void closeTimers() {
    _countdownTimer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(10),
      child: StatefulBuilder(
        builder: (BuildContext context, dynamic setState) {
          return Column(
            children: <Widget>[
              Text(
                'Attention ${widget.recordingDoctorSurName}',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: healthcloudPrimaryColor,
                    ),
              ),
              size15VerticalSizedBox,
              StreamBuilder<CountdownTimer>(
                stream: _countdownTimer,
                builder: (BuildContext context,
                    AsyncSnapshot<CountdownTimer> snapshot) {
                  if (snapshot.hasData) {
                    final int remaining = snapshot.data!.remaining.inSeconds;
                    return Text(
                      logoutTimerText(remaining),
                      style: Theme.of(context).textTheme.subtitle2,
                    );
                  }

                  return const SizedBox();
                },
              ),
              size15VerticalSizedBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SILSecondaryButton(
                    buttonKey: AppWidgetKeys.logoutBtnKey,
                    onPressed: () async {
                      closeTimers();
                      Navigator.pop(context, 'logout');
                    },
                    customPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    buttonColor: red,
                    borderColor: red,
                    text: logoutText,
                    textColor: red,
                  ),
                  mediumHorizontalSizedBox,
                  SILPrimaryButton(
                    buttonKey: AppWidgetKeys.stayBtnKey,
                    buttonColor: healthcloudAccentColor,
                    onPressed: () async {
                      closeTimers();
                      //Refreshes navigation
                      await StoreProvider.dispatch<CoreState>(
                          context,
                          UpdateNavigationAction(
                              context: context, favouriteUpdate: false));
                      Navigator.pop(context, 'stay');
                    },
                    text: stayLoggedInText,
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
