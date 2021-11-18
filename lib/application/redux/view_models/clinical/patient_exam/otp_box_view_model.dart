// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';

class OtpBoxViewModel extends Vm {
  final bool completed;
  final bool endingExam;
  final bool showErr;
  final String? phoneNumber;
  final void Function(BuildContext, int) resendOtp;
  final void Function(BuildContext context, String otp) endVisit;

  OtpBoxViewModel({
    required this.completed,
    required this.endingExam,
    required this.showErr,
    required this.phoneNumber,
    required this.resendOtp,
    required this.endVisit,
  }) : super(equals: <Object>[completed, endingExam, showErr]);
}
