const String phoneLoginStateFlag = 'login_user_flag';
const String checkUserExistsFlag = 'check_user_exists_flag';
const String updateNamesFlag = 'update_names_flag';
const String requestPinResetFlag = 'request_pin_reset_flag';
const String verifyPinFlag = 'verify_pin_flag';
const String editProfileFlag = 'edit_profile_page_flag';
const String resetPinFlag = 'reset_pin_flag';
const String changePinFlag = 'change_pin_flag';
const String setPinFlag = 'set_pin_flag';
const String createUserFlag = 'create_user_flag';
const String fetchUserFeedFlag = 'fetch_user_feed_flag';
const String continueVisitFlag = 'continue_a_visit_flag';
const String searchingPatientByPhoneNumberIsWaiting =
    'searching_patient_by_phone_number_flag';
const String isWaitingStartVisit = 'is_waiting_start_visit_flag';
const String isWaitingSendOTP = 'is_waiting_send_OTP_flag';
const String isResendingOTPFlag = 'is_resending_OTP_flag';
const String hasCompletedEnteringOTPFlag = 'has_completed_entering_OTP_flag';
const String endingExamFlag = 'ending_exam_flag';
const String showErrorFlag = 'show_error_flag';
const String summaryExamFlag = 'summary_exam_flag';

String getFavouriteNavigationFlag(String title) {
  return 'favourite_navigation_$title';
}
