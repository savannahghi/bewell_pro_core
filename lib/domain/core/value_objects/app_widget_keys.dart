// Flutter imports:
import 'package:flutter/material.dart';

class AppWidgetKeys {
  // list of the keys that are going to be used to search in the app
  static const Key patientSearchDoneKey = Key('patient_search_done');

  // error alert box keys
  static const Key errorAlertBoxKey = Key('error_alert_box_key');
  static const Key errorAlertBoxTextKey = Key('error_alert_box_text_key');

  static const Key providerSearchDoneKey = Key('provider_search_done');
  static const Key registerPatient = Key('register_patient');
  static const Key backButton = Key('back_button');
  static const Key continueVisit = Key('continue_visit_button');
  static const Key patientSearchResultsCard =
      Key('patient_search_results_card');

  static const Key patientSearchResultsCardAction =
      Key('patient_search_results_card_action');

  // patient identification keys
  static const Key patientIdentificationScaffoldKey =
      Key('patient_identification_scaffold');
  static const Key patientSearchInputKey = Key('patient_search_input');
  static const Key patientIdentificationTitleKey = Key('page_title_key');

  // patient timeline Keys
  static const Key requestAccessVisitsKey = Key('RequestAccessVisitsKey');
  static const Key startContinueExamWrapperButtonKey =
      Key('StartContinueExamWrapperButtonKey');
  static const Key toggleExpandRecordKey = Key('toggleExpandRecordKey');
  static const Key patientTimelineRecordKey = Key('patientTimelineRecordKey');

  // patient exam buttons keys
  static const Key examItemButtonKeyKey = Key('ExamItemButtonKey');
  static const Key completeButtonKey = Key('CompleteButtonKey');
  static const Key nextTileButtonKey = Key('NextTileButtonKey');
  static const Key previousTileButtonKey = Key('PreviousTileButtonKey');

  // patient exam test Keys
  static const Key patientExamTestsRetireSmallScreenButtonKey =
      Key('patientExamTestsRetireSmallScreenButtonKey');
  static const Key patientExamTestsRetireLargeScreenButtonKey =
      Key('patientExamTestsRetireLargeScreenButtonKey');
  static const Key patientExamBackButton = Key('patientExamBackButton');

  static const Key patientTimelineImageContainer =
      Key('patientTimelineImageContainer');

  //patient history keys
  static const Key historyContainerDataNull =
      Key('container_data_null_silLoading');
  static const Key historyContainerDataLoading = Key('container_data_loading');

  //drawer common widgets
  static const Key searchTextField = Key('search_text_field');
  static const Key suffixCloseIconKey = Key('suffixCloseIconKey');

  // patient registration keys
  static const Key patientRegistrationKey =
      Key('patient_registration_stepper_header');
  static const Key firstNameKey = Key('first_name_input_key');
  static const Key middleNameKey = Key('middle_name_input_key');
  static const Key lastNameKey = Key('last_name_input_key');
  static const Key completeRegistrationAndStartVisitKey =
      Key('complete-registration-and-start-visit');

  // BasicDetails
  static const Key basicDetailsListViewKey = Key('basic_details_list_view_Key');
  static const Key basicDetailsPhotoContainerKey =
      Key('basic_details_photo_container_Key');
  static const Key basicDetailsPhotoButtonKey =
      Key('basic_details_photo_button_Key');
  static const Key basicDetailsNumberNotFoundKey =
      Key('basic_details_number_not_found_Key');
  static const Key basicDetailsNumberFoundKey =
      Key('basic_details_number_found_Key');
  static const Key basicDetailsGenderKey = Key('basic_details_gender_Key');
  static const Key basicDetailsDobGestureDetectorKey =
      Key('basic_details_dob_gesture_Key');
  static const Key basicDetailsDobTextFieldKey =
      Key('basic_details_dob_text_Key');
  static const Key basicDetailsIdentificationKey =
      Key('basic_details_identification_Key');
  static const Key basicDetailsIdentificationTextField =
      Key('basic_details_identification_text_field_Key');
  static const Key basicDetailsNextBtnKey = Key('basic_details_next_btn_key');

  static const Key idDocumentFrontKey = Key('IDDocumentFront_key');
  static const Key idDocumentBackKey = Key('IDDocumentBack_key');

  static const Key verifyPhoneRichTextKey = Key('verify-phone-text-key');
  static const Key noProfilePhotKey = Key('no-profile-photo-key');

  /// patient reg verify OTP input
  static const Key otpVerifyInput = Key('verify_otp_input');
  static const Key verifyPhoneDialogColumnKey =
      Key('verify_phone_dialog_column_key');
  static const Key countDownTimerKey = Key('countdown-timer-key');
  static const Key resendInTextKey = Key('resend_in_text_key');
  static const Key resendButtonsKey = Key('resend_buttons_key');
  static const Key resendingTextKey = Key('resending_text_key');
  // sil task item Widget key
  static const Key silTaskItemContainerKey = Key('silTaskItemContainerKey');

  static const Key appSearchInputKey = Key('app_search_input_key');

  // login_actions keys
  static const Key createAccountKey = Key('create_account_key');
  static const Key signInKey = Key('sign_in_key');
  static const Key onboardingScaffoldBackButton =
      Key('onboarding_scaffold_back_button');
  static const Key recoverRequestBackButton =
      Key('recover_request_back_button');

  //edit profile action keys
  static const Key lastName = Key('last_name');
  static const Key firstName = Key('first_name');
  static const Key editProfileDetailsButton =
      Key('edit_profile_details_button');
  static const Key cancelProfileDetailsButton =
      Key('cancel_profile_details_button');
  static const Key profileMasterDetailRowKey = Key('profile_master_detail_key');

  // pinVerification keys
  static const Key forgotPin = Key('forgotPinButton');
  static const Key logoutButton = Key('logoutButton');

  // landing page terms and conditions key
  static const Key termsAndConditionsKey = Key('terms_and_conditions_key');

  // Main Button Keys
  static const Key silPrimaryButtonKey = Key('sil_primary_button_key');
  static const Key verifyPinKey = Key('verify_pin_key');
  static const Key silSecondaryButtonKey = Key('sil_secondary_button_key');

  // set_pin_keys
  static const Key setPinKey = Key('set_and_verify_pin_key');
  static const Key createPinFormFieldKey = Key('create_Pin_form_field_Key');
  static const Key confirmPinFormFieldKey = Key('confirm_Pin_form_field_Key');

  // navigate to landing page on EnterSignUpPhoneNo button Key
  static const Key landingPageNavigationKey =
      Key('landing_page_navigation_key');

  // Phone login page Key
  static const Key forgotPinKey = Key('forgotPinKey');
  static const Key loginKey = Key('loginKey');
  static const Key phoneLoginPinInputKey = Key('phone_login_key');

  // EnterSignup keys
  static const Key signupCheckboxConsentToPhoneComms =
      Key('checkboxConsentToPhoneComms');

  //add next of kin
  static const Key addNextOfKinSendOtpButtonKey =
      Key('add_next_of_kin_send_otp_button_Key');
  static const Key addNextOfKinFirstNameKey =
      Key('add_next_of_kin_first_name_Key');
  static const Key addNextOfKinLastNameKey =
      Key('add_next_of_kin_last_name_Key');
  static const Key addNextOfKinGenderKey = Key('add_next_of_kin_gender_Key');
  static const Key addNextOfKinDobGestureDetectorKey =
      Key('add_next_of_kin_dob_gesture_Key');
  static const Key addNextOfKinDobTextFieldKey =
      Key('add_next_of_kin_dob_text_Key');

  static const Key addNextOfKinNumberKey = Key('add_next_of_kin_number_Key');

  static const Key addNextOfKinRelationshipKey =
      Key('add_next_of_kin_relationship_Key');
  static const Key addNextOfKinCancelButtonKey =
      Key('add_next_of_kin_cancel_button_Key');
  static const Key addNextOfKinRegisterButtonKey =
      Key('add_next_of_kin_register_button_Key');

  // next of _kin
  static const Key nextActionButtonKey = Key('nextActionButton_Key');
  static const Key previousActionButtonKey = Key('previousActionButton_Key');
  static const Key smallScreenCard = Key('isSmallScreenCard');
  static const Key largeScreenCard = Key('isLargeScreenCard');
  static const Key addNextOfKinSmallDeviceKey =
      Key('addNextOfKinSmallDevice_Key');
  static const Key addNextOfKinLargeDeviceKey =
      Key('addNextOfKinSmallDevice_Key');

  // session timeout SILSecondaryButton keys
  static const Key logoutBtnKey = Key('logout_btn_key');
  static const Key stayBtnKey = Key('stay_btn_key');

  // userProfile logout btn
  static const Key userProfileLogoutBtn = Key('user_profile_logout_button');
  static const Key cancelVerifyPinChange = Key('cancel_verify_pin_change');

  //patient banner keys
  static const Key cancelEndVisitKey = Key('cancelEndVisit_Key');
  static const Key confirmEndVisitKey = Key('confirmEndVisit_Key');
  static const Key closeDrawerButtonKey = Key('closeButton_Key');
  static const Key endVisitDialogue = Key('end_visit_dialogue');

  //global actions keys
  static const Key silSecondaryButton = Key('sil_secondary_button');

  //search page
  static const Key backKey = Key('back_key');
  static const Key rowKey = Key('search_row_key');
  static const Key searchGestureDetector = Key('search_gesture_detector');
  static const Key searchAbsorb = Key('search_absorb');
  static const Key searchCancel = Key('search_cancel');
  static const Key emptySuggestionListKey = Key('empty_suggestion_list_key');
  static const Key suggestionListKey = Key('suggestion_list_key');
  static const Key suggestionListViewKey = Key('suggestion_list_view_key');
  static const Key emptyQueryBuildResultKey =
      Key('empty_query_build_result_key');
  static const Key smallQueryBuildResultKey =
      Key('empty_query_build_result_key');
  static const Key emptyResultListKey = Key('empty_result_list_key');
  static const Key resultListKey = Key('result_list_key');
  static const Key resultOnTapKey = Key('result_on_tap_key');

  // image source page
  static const Key imageSourceIconKey = Key('image_source_icon_key');

  // location_picker page
  static const Key locationPickerGridViewItem =
      Key('location_picker_grid_view_item');

  // health_appBar_logo page
  static const Key circleAvatarGestureDetector =
      Key('circle_avatar_gesture_detector');
  static const Key profileNavigatorGestureDetector =
      Key('profile_navigator_gesture_detector');
  static const Key logoutGestureDetector = Key('logout_gesture_detector');
  static const Key locationDropdownSection = Key('location_dropdown_section');

  //home page large screen page
  static const Key tabBarHomePageKey = Key('tab_bar_home_page_key');

  //home page page
  static const Key homePageGestureDetectorKey =
      Key('home_page_gesture_detector_key');

  //document_camera_selector
  static const Key selectDocumentKey = Key('select_document_key');

  // OTP Box page
  static const Key resendOTPPromptKey = Key('resend_OTP_prompt_key');

  // resendOtpPage
  static const Key resendOtpButton = Key('resendOtpButton_key');
  static const Key resendWithWhatsApp = Key('resendWithWhatsApp_key');
  static const Key resendWithNormalText = Key('resendWithNormalText_key');

  // homepage_wrapper
  static const Key smallScreenContainer = Key('small_screen_container');
  static const Key largeScreenContainer = Key('large_screen_container');

  //usernames page
  static const Key silTextFieldFNameKey = Key('sil_form_field_first_name_key');
  static const Key silTextFieldLNameKey = Key('sil_form_field_last_name_key');

  //hc submit dialog page
  static const Key displayLoadingLargeCenterKey =
      Key('display_loading_large_center_key');
  static const Key displayLoadingSmallCenterKey =
      Key('display_loading_small_center_key');

  //health side bar
  static const Key healthSideBarGestureDetectorKey =
      Key('health_side_bar_gesture_detector_key');

  // practitioner services checkbox keys
  static const Key dentalServicesHeadKey = Key('dental_services_head_key');
  static const Key dentalServicesFaceKey = Key('dental_services_face_key');
  static const Key dentalServicesEyesKey = Key('dental_services_eyes_key');
  static const Key dentalServicesDentalKey = Key('dental_services_dental_key');
  static const Key dentalServicesOtherKey = Key('dental_services_other_key');
  static const Key otherServicesTextFormKey =
      Key('other_services_text_form_key');

  //no next of kin page keys
  static const Key noNextOfKinContainerKey =
      Key('no_next_of_kin_container_key');
  static const Key registerKinKey = Key('register_kin_key');
  static const Key selfNextOfKinContainerKey =
      Key('self_next_of_kin_container_key');

  //patient registration steps keys
  static const Key patientRegStepKey = Key('patient_reg_step_key');

  // ConfirmSurvey Keys
  static const Key skipSurveyButtonKey = Key('skip_survey_Key');
  static const Key takeSurveyButtonKey = Key('take_survey_Key');

  // postVisitSurveyKeys
  static const Key skipButtonKey = Key('skip_Button_Key');

  // updatePhoneNumber
  static const Key verifyOtpKey = Key('verifyOtp_Key');
  static const Key sendVerificationCodeKey = Key('sendVerificationCode_key');

  // PatientSearchCard
  static const Key continueVisitKey = Key('continue_visit_Key');
  static const Key startVisitKey = Key('start_visit_Key');

  static const Key searchFilterKey = Key('searchFilterKey');

  // patient_exam/widgets/drawers keys
  static const Key systoleValueKey = Key('systole_value_key');
  static const Key diastoleValueKey = Key('diastole_value_key');
  static const Key heightValueKey = Key('height_value_key');
  static const Key weightValueKey = Key('weight_value_key');
  static const Key oxygenSPO2ValueKey = Key('oxygen_SPO2_value_key');
  static const Key bmpValueKey = Key('bmp_value_key');
  static const Key pulseValueKey = Key('bmp_value_key');
  static const Key temperatureValueKey = Key('temperature_value_key');
  static const Key drawerHelpWidget = Key('drawer_help_widget');
  static const Key addBMICancelButtonKey = Key('add_bmi_reading_cancel_key');

  // nhif Keys
  static const Key nHIFPreviousKey = Key('nHIFPreviousKey');
  static const Key nHIFNextKey = Key('nHIFNextKey');
  static const Key patientExamDrawerSaveButtonKey =
      Key('patient_exam_drawer_save_button_key');
  static const Key memberNoInputKey = Key('member_no_input_key');

  // features/profile/contact folder keys
  static const Key upgradeToPrimaryGestureKey =
      Key('upgrade_to_primary_gesture_key');
  static const Key deleteContactGestureKey = Key('delete_contact_gesture_key');
  static const Key primaryContactInfoGestureKey =
      Key('primary_contact_info_gesture_key');
  static const Key primaryContactInfoCloseGestureKey =
      Key('primary_contact_info_close_gesture_key');
  static const Key upgradeToPrimaryBottomSheetKey =
      Key('upgrade_to_primary_bottom_sheet_key');

  // Drawer Keys
  static const Key allergyDescriptionInputKey =
      Key('allergy_description_input_key');
  static const Key addAllergyDrawerSearchInputKey =
      Key('drawer_search_input_key');
  static const Key addProblemDrawerSearchInputKey =
      Key('drawer_search_input_key');
  static const Key problemDescriptionInputKey =
      Key('problem_description_input_key');
  static const Key allergyConfirmationCheckbox =
      Key('allergy_confirmation_checkbox');
  static const Key problemConfirmationCheckbox =
      Key('problem_confirmation_checkbox');
  static const Key diagnosisInputKey = Key('diagnosis_input_key');
  static const Key diagnosisConfirmCheckbox = Key('diagnosis_confirm_checkbox');
  static const Key diagnosisDatePickerKey = Key('diagnosis_date_picker_key');
  static const Key addTestsSearchInputKey = Key('add_tests_search_input_key');
  static const Key testConfirmationCheckboxKey =
      Key('test_confirmation_checkbox_key');
  static const Key addTestsNotesKey = Key('add_tests_notes_key');
  static const Key addMedicationSearchInputKey =
      Key('add_medication_search_input_key');
  static const Key addMedicationCancelBtnKey =
      Key('add_medication_cancel_btn_key');
  static const Key rxKey = Key('rx_key');
  static const Key takeEveryKey = Key('take_every_key');
  static const Key periodKey = Key('period_key');
  static const Key noteKey = Key('note_key');
  static const Key retireAllergyLargeScreenButtonKey =
      Key('retire_allergy_large_screen_btn_key');

  // ProfileDropDown
  static const Key popupMenuButtonKey = Key('popup_menu_Key');
  static const Key profilePopMenuItemKeyKey = Key('profile_drop_down_menu_Key');
  static const Key logoutPopMenuItemKeyKey = Key('logout_drop_down_menu_Key');

  // ExamSummaryMedications
  static const Key smallScreenRetireButton = Key('small_screen_retire_button');
  static const Key largeScreenRetireButton = Key('large_screen_retire_button');

  // Retire Helper
  static const Key retireReasonFormField = Key('retire_reason_form');
  static const Key retireHelperButtonKey = Key('retire_helper_button_key');

  // PatientExamSummary
  static const Key signOffExamPreviousButton =
      Key('sign_off_exam_previous_button');
  static const Key signOffExamSaveButton = Key('sign_off_on_exam_save_button');
  static const Key signOffResendOtpButton =
      Key('sign_off_exam_resendOtp_button');

  //patient exam diagnosis Keys
  static const Key retirePatientExamDiagnosisKey =
      Key('retirePatientExamDiagnosisKey');

  // patient exam_medication Key
  static const Key retireMedicationsLargeScreen =
      Key('retireButtonPatientExamMedicationKey');
  static const Key retireMedicationSmallScreen =
      Key('retireMedicationSmallScreen');

  // patient_exam_allergies
  static const Key retireAllergySmallScreenButtonKey =
      Key('retireAllergySmallScreenButtonKey');

  static const Key trueAccountTypeRadioKey = Key('true_account_type_radio_key');
  static const Key falseAccountTypeRadioKey =
      Key('false_account_type_radio_key');
  static const Key bottomSheetInfoContainer =
      Key('bottom_sheet_info_container');

  static const Key bottomSheetInfoContainerCloseKey =
      Key('bottom_sheet_info_container_close');

  static const Key bottomSheetInfoContainerContentKey =
      Key('bottom_sheet_info_container_content');

  // save drawer data file
  static const Key retireCompositionButtonKey =
      Key('retire_composition_btn_key');

  // general exam keys
  static const Key feverCheckBoxKey = Key('fever_check_box_key');
  static const Key nauseaCheckBoxKey = Key('nausea_check_box_key');
  static const Key rashCheckBoxKey = Key('rash_check_box_key');
  static const Key fatigueCheckBoxKey = Key('fatigue_check_box_key');
  static const Key weightGainCheckBoxKey = Key('weight_gain_check_box_key');
  static const Key weightLossCheckBoxKey = Key('weight_loss_check_box_key');
  static const Key genExamNotesKey = Key('gen_exam_notes_key');
  static const Key genExamContainerSnapshotErrorKey =
      Key('gen_exam_container_snapshot_error_key');

  //patient history
  static const Key historyDescriptionTextKey =
      Key('history_description_text_key');
  static const Key familyHistoryDescriptionTextKey =
      Key('family_history_description_text_key');
  static const Key illnessHistoryDescriptionTextKey =
      Key('illness_history_description_text_key');
  static const Key medicalHistoryDescriptionTextKey =
      Key('medical_history_description_text_key');
  static const Key retireChiefComplaintSmallButtonKey =
      Key('retire_chief_complaint_small_button_key');
  static const Key retireChiefComplaintLargeButtonKey =
      Key('retire_chief_complaint_large_button_key');
  static const Key retireCancelButtonKey =
      Key('retire_chief_complaint_cancel_button_key');

  // verify otp content keys
  static const Key silPinCodeTextFieldKey = Key('sil_pin_code_text_field_key');

  // extra information keys
  static const Key previousBtnKey = Key('previous_btn_key');
  static const Key finishBtnKey = Key('finish_btn_key');
  static const Key maritalStatusKey = Key('marital_status_key');
  static const Key preferredLanguageKey = Key('preferred_lang_key');
  static const Key emailCommunicationsCheckboxKey =
      Key('email_communications_checkbox_key');
  static const Key emailCommunicationsFieldKey =
      Key('email_communications_field_key');

  // quick access item keys
  static const Key aliasKey = Key('alias_key');

//timeline
  static const Key timelineObservationItemsSizedBoxKey =
      Key('timeline_observation_items_sized_box_key');
  static const Key timelineNavigatorButtonKey =
      Key('timeline_navigator_button_key');
  static const Key retireSecondaryMedication = Key('retireSecondaryMedication');
  static const Key retireSecondaryAllergy = Key('retireSecondaryAllergy');
  static const Key retireSecondaryCondition = Key('retireSecondaryCondition');

  // left content area tab bar
  static const Key leftContentTabBarKey = Key('left_content_tab_bar_key');

  // quick access item widget keys
  static const Key openPatientExamDrawerKey = Key('openPatientExamDrawerKey');

  // happiness center keys
  static const Key launchPhoneDialerKey = Key('launch_phone_dialer_key');
  static const Key launchWhatsAppMessengerKey =
      Key('launch_whats_app_messenger_key');

  // generic timeout widget Keys
  static const Key genericTimeOutKey = Key('generic_timeout_key');
  static const Key genericErrorTextKey = Key('error_text_widget_key');

  // config keys
  static const Key scaffoldHomePageWrapperKey =
      Key('scaffold_home_page_wrapper_key');
  static const Key scaffoldPatientRegistrationKey =
      Key('scaffold_patient_registration_key');
  static const Key scaffoldTermsOfServiceKey =
      Key('scaffold_terms_of_service_key');
  static const Key scaffoldNotificationsKey = Key('scaffold_notifications_key');
  static const Key scaffoldPatientDetailKey =
      Key('scaffold_patient_detail_key');
  static const Key scaffoldPostVisitSurveyKey =
      Key('scaffold_post_visit_survey_key');
  static const Key scaffoldConfirmSurveyKey =
      Key('scaffold_confirm_survey_key');
  static const Key scaffoldPatientExamKey = Key('scaffold_patient_exam_key');
  static const Key scaffoldPatientExamSummaryKey =
      Key('scaffold_patient_exam_summary_key');

  static const Key customAppBarKey = Key('custom_app_bar_key');

  //requestAccessContent
  static const Key emergencyOverrideKey = Key('emergency_override');
  static const Key requestAccessKey = Key('request_Access');

  static const Key patientIdentificationSearchResult =
      Key('patient_identification_search');

  static const Key verifyButtonKey = Key('verify_phone_number_basic_details');

  static const Key helpCenterListViewKey = Key('help_center_list_view');
  static const Key helpCenterCallKey = Key('help_center_call');
  static const Key helpCenterWhatsAppKey = Key('help_center_whatsApp');
  static const Key helpCenterContainerKey = Key('help_center_container');

  /// Default Error Route Keys
  static const Key goBackButtonKey = Key('go_back_button_key');

  static const Key faqExpansionTileKey = Key('faq_expanded_item');

  //navigation drawer
  static const Key navDrawerCloseKey = Key('navigation_drawer_closeKey');
  static const Key navDrawerSearchKey = Key('navigation_drawer_search_key');
  static const Key navDrawerMenuKey = Key('navigation_drawer_menu_key');
  static const Key navDrawerBackKey = Key('navigation_drawer_back_key');

  static const Key closeDrawer = Key('close_drawer');
  static const Key closeInfoBottomSheet = Key('close_info_bottomSheet');

  static const Key gestureKey = Key('gesture_key');

  static const Key htmlWrapperImageKey = Key('html_wrapper_image_key');
}
