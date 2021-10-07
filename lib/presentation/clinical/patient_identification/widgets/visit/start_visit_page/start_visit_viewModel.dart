// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:bewell_pro_core/domain/clinical/value_objects/start_visit_type_enum.dart';

/// viewModel for [StartVisitPage]
class StartVisitViewModel extends Vm {
  StartVisitViewModel({
    required this.showError,
    required this.startVisit,
    required this.phoneNumber,
    required this.hasCompletedEnteringOtp,
    required this.isResendingOtp,
    required this.resendOtp,
    required this.startVisitType,
  }) : super(
          equals: <dynamic>[
            showError,
            phoneNumber,
            hasCompletedEnteringOtp,
            isResendingOtp,
            startVisitType
          ],
        );

  final void Function(BuildContext context, String otpCode) startVisit;
  final void Function(BuildContext context, int step) resendOtp;
  final bool hasCompletedEnteringOtp;
  final bool isResendingOtp;
  final String phoneNumber;
  final bool showError;
  final StartVisitType startVisitType;
}
