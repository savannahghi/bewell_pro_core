import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/clinical/entities/OTP_episode_creation_input.dart';
import 'package:bewell_pro_core/domain/clinical/entities/break_glass_episode_creation_input.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/visit/start_visit_page/start_visit_emergency_action.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/visit/start_visit_page/start_visit_request_access_action.dart';

class MockStartVisitByRequestAccessAction extends MockAction<CoreState> {
  static OTPEpisodeCreationInput? otpEpisodeCreationInput;

  @override
  CoreState? reduce() {
    final StartVisitByRequestAccessAction startVisitByRequestAccessAction =
        action as StartVisitByRequestAccessAction;

    final OTPEpisodeCreationInput otpInput =
        startVisitByRequestAccessAction.otpEpisodeCreationInput;

    otpEpisodeCreationInput = otpInput;
  }
}

class MockStartVisitEmergencyAction extends MockAction<CoreState> {
  static BreakGlassEpisodeCreationInput? breakGlassEpisodeCreationInput;

  @override
  CoreState? reduce() {
    final StartVisitEmergencyAction startVisitEmergencyAction =
        action as StartVisitEmergencyAction;

    breakGlassEpisodeCreationInput =
        startVisitEmergencyAction.breakGlassEpisodeCreationInput;
  }
}

class MockSendOTPAction extends MockAction<CoreState> {
  @override
  CoreState? reduce() {
    return null;
  }
}

class MockResendOtpAction extends MockAction<CoreState> {
  @override
  CoreState? reduce() {
    return null;
  }
}
