import 'package:bewell_pro_core/presentation/onboarding/profile/profile_utils.dart';
import 'package:intl/intl.dart';

// descriptions
const String homeIconDescription = 'Home Navigation action';
const String requestsIconDescription = 'Requests Navigation action';
const String partnerIconDescription = 'Partner Navigation action';
const String consumerIconDescription = 'Consumer Navigation action';

/// the number of visits that are required in order to ask for
/// a post visit survey.
const String kPostSurveyVisitAskCount = '10';

// homepage exit app strings
const String stayLoggedInText = 'Stay logged in';
const String confirmExitPrompt = 'Are you sure you want to exit?';
const String stayBtnText = 'Stay';
const String exitBtnText = 'Exit';

final String bewellCopyrightString =
    'Copyright ©️ ${returnCurrentYear()} Be.Well';
final String afyaMojaCopyrightString =
    'Copyright ©️ ${returnCurrentYear()} Healthcloud';

// Communication Setting Strings
const String emailSubtitle =
    'Receive emails, including verification PINs and communication from Be.Well by Slade360';
const String emailTitle = 'Email';
const String messagesSubTitle =
    'Receive text messages including, verification PINs and communication from Be.Well by Slade360';
const String messagesTitle = 'Text messages';
const String pageHeader = 'Updates from Be.Well by Slade 360';
const String pushSubTitle =
    'Receive push notifications including, verification PINs and communication from Be.Well by Slade360';
const String pushTitle = 'Push Notifications';
const String whatsAppSubTitle =
    'Receive text messages including, verification PINs and communication from Be.Well by Slade360';
const String whatsAppTitle = 'WhatsApp messages';

// Onboarding Strings
const String landingPageTitle = 'Deliver Healthcare';
const String landingPageSubtitle =
    'Connect and offer care to our community of patients. We help you deliver better care';
const String createPin = 'Create PIN';
const String secureAccount = 'Secure your account with a PIN';
const String confirmPin = 'Enter the same PIN from previous step';
const String pinSuccess =
    'Your PIN was set successfully. Login with the new PIN';
const String loginTitle = 'Glad to see you again';
const String recoverTitle = 'Reset your PIN';
const String recoverMsg = 'Enter your phone number to reset your PIN';
const String verifyRequestTitle = 'Verify request';
const String checkConnectionText =
    'Slow internet connection. Please check your connection and try again';
const String userPhoneExistsText = 'User with that phone number exists.';
const String userEmailExistsText = 'User with that email address exists.';
const String usernameExistsText = 'That username is already in use.';
const String noUserFoundText = 'We could not find a user with those details.';
const String wrongCredentialsText = 'Wrong login details provided';
const String noPINFoundText = 'No PIN found for this user.';

const String yourFirstName = 'Your first name';
const String yourLastName = 'Your last name';

// SearchPageStrings
String helpCenter = 'Help Center';
const String userProfile = 'My Profile';
const String clearText = 'Clear';
const String queryLength = 'Search term needs to be longer than 2 letters';
const String emptyQuery = 'Write something in order to search';
const String noQuery =
    'Sorry, we could not find what you were looking for. Please try again';
const String resultsText = 'Results for';
const String recentSearchesText = 'Recent Searches';
const String patientFind = 'Find Patient';
const String patientAdd = 'Add Patient';
const String messages = 'My Messages';
const String whatWouldYouLikeToDo = 'What would you like to do today?';

// PhoneNumberFormConstants
const String phoneNumberInputLabelText = 'Phone number';
const String requiredPhoneNumber = 'Phone number is required';
const String verifyPhone = 'Verify Phone';

// EmailFormConstants
const String validEmail = 'A valid email is required';
const String sendingOtp = 'Verify email : send OTP';
const String verifying = 'Verifying...';
const String verifyEmail = 'Verify Email';

const String commConsent = 'commConsent';

//create account strings
const String phoneHint = 'Enter phone number';
const String phoneExists = 'A user with that phone number exists. ';
const String accountSignIn = 'Please sign in';
const String alreadyHaveAnAccount = 'Already have an account?  ';
const String loginText = 'Login';

// LandingPageConstants
const String createAccount = 'Create Account';
const String landingSignIn = 'Sign In';

// ZeroStateConstants
const String zeroStateTitle = 'Coming Soon';
const String zeroStateSubtitle = 'This feature will be available soon';

//  PhoneLoginPageConstants
const String phoneLoginTitle = 'Welcome back';
const String phoneLoginMessage = 'Let\'s sign you in to your account';

// PinVerificationStrings
const String enterPin = 'Enter your 4 digit PIN to continue';
const String forgotPin = 'Forgot PIN?';
const String resetPin = 'reset your PIN';

// ReSetPinPageStrings
const String enterNewPinTitle = 'Set a new PIN';
const String enterNewPinMessage = 'Set a new PIN for your account';
const String snackBarSuccessfulMessage =
    'Your pin was updated successfully, please login';

// SetPinStrings {
const String snackBarMatchingPinMessage = 'Please enter matching PINs';

// SetPinPromptStrings {
const String setPinReminderMessage =
    'We have noticed that you haven\'t set a PIN for your account. Please do so to secure your account';

// SetUserNamesStrings {
const String tellUsWhoYouAreString = 'Tell us who you are';
const String tellUsWhoYouAreMessage = 'Kindly fill in your names below';
const String firstNameText = 'First name';
const String firstNameRequired = ' First name is required';
const String lastNameRequired = ' Last name is required';

const String wrongCredentials =
    'Sorry, the credentials you entered are incorrect. Please try again or ';
const String noAccount =
    'No account with that phone number. Use the number you registered with or ';
const String phoneLoginCreateAccountText = 'create an account';
const String phoneLoginText = 'Sign In';
const String verifyPinText = 'Verify PIN';
const String verifyPinPrompt = 'Please enter your current PIN';

const String changePINText = 'Change PIN';

// NextOfKinStrings
const String nextOfKinStr = 'Next of Kin';
const String addNextOfKin = 'Add as Next Of Kin';
const String displayResultsText = 'Showing results for';
const String addNextOfKinHintText = 'Add next of kin';
const String basicInfoProvision =
    'Kindly provide next of kin\'s basic information';
const String phoneNumberProvision = 'Enter next of kin phone number to search';
const String noPatientsFoundText = 'No patients found';

// ProfileStrings
const String accountSection = 'Account settings';
const String legalSection = 'legal information';
const String notificationSettings = 'Notification settings';
const String homeAndWorkSettings = 'Home and work address';
const String termsOfServiceSettings = 'Terms of service';
const String contactInfo = 'Contact info';
const String enterPhone = 'Enter your phone number';
const String verifyCode = 'Send verification code';
const String codeSent = 'A 6 digit verification code was sent to ';
const String editProf = 'Basic details';
const String invalidOtp = 'Invalid verification code';
const String verificationCancelText = 'Cancel';
const String changePinTitle = 'Change PIN';
const String changePinMessage =
    'Enter your new PIN below to secure your account';
const String changePinSuccessMessage =
    'Your PIN was successfully changed. Sign in with your new PIN to continue';
const String changePinErrorMessage =
    'Failed to change your PIN. Please try again later';

const String logoutText = 'Logout';

//profile items strings
const String comingSoonText = 'Coming soon';
const String communicationSettingsText = 'Communication settings';
const String tryNewFeaturesText = 'Try new features';
const String termsOfServiceText = 'Terms of service';

//  ConfirmSurveyStrings
const String feedbackText = 'Feedback';
const String takeSurveyInfoText =
    'We would like to get feedback from you on your journey through the application. Tap the Take Survey button below to fill the survey, or tap the Skip button to skip';

// ResendOtp
const String whatsAppText = 'Resend via WhatsApp';
const String normalText = 'Resend via text';
const String resendCodeText = 'Resend Code';

// PatientTabStrings
const String patientTestTabTitle = 'Test';
const String patientMedicationTabTitle = 'Medication';

// NoNextOfKinFoundStrings
const String foundNoMatches = 'Sorry... we could not find any matches for';
const String registerNextOfKin = 'Register Next of Kin';
const String cannotRegisterYourself =
    'You cannot register yourself as a next of kin';
const String searchDiffNumber =
    'Kindly search for a different number that is not yours';
const String nextOfKinNotAddedText = 'Next of kin not added';

// PatientRegistrationStepsStrings
const String patientRegistrationStep = 'Patient Registration';
const String basicDetailsStepTitle = 'Basic details';
const String nextOfKinStepTitle = 'Next of kin';
const String nhifStepTitle = 'NHIF';
const String nhifStepDescription = 'NHIF details';
const String extraInfoStepTitle = 'Extra Information';
const String fieldCannotBeEmptyText = 'Field cannot be empty';

// VerifyPhoneDialogStrings
const String enterVerificationCode = 'Enter verification code';

const String enterValidCodeText = 'Enter a valid code to continue';

//  VitalDrawerStrings
const String addBloodPressureTitle = 'Add Blood Pressure Reading';
const String addBloodSuccessMsg = 'Blood pressure added';
const String addBMITitle = 'Add Height and Weight Reading';
const String addBMISuccessMsg = 'Height and Weight added';
const String addOxygenTitle = 'Add SP02 Reading';
const String addOxygenSuccessMsg = 'Oxygen saturation reading added';
const String addRespiratoryTitle = 'Add Respiratory Rate Reading';
const String addRespiratorySuccessMsg = 'Respiratory rate added';
const String addTemperatureTitle = 'Add Temperature Reading';
const String addTemperatureSuccessMsg = 'Temperature reading added';
const String resultsNotFoundFirstMsg =
    'Sorry we did not find what you searched for';
const String resultsNotFoundSecondMsg =
    'Try refine your search and check for spelling errors';

// PatientExamSummaryStrings
const String signOffButtonText = 'Sign Off and Complete';
const String signOffText = 'Sign Off on Exam';
const String signOffVerificationText =
    'Kindly enter the verification code sent to you to on';

// PatientProblemTableString
const String zeroStateProblemTitle = 'Add Condition';
const String zeroStateProblemSubTitle =
    'What problems does the patient have? e.g. broken jaw, cut on the finger. Kindly confirm the problem before adding';

// DrawerStrings
const String reviewCreatedSuccessMsg = 'Review created successfully';
const String addAllergyDrawerTitle = 'Add Allergy';
const String addPulseReadingTitle = 'Add Pulse Reading';
const String addProblemDrawerTitle = 'Add Ongoing Health Condition';
const String isAllergyConfirmedString = 'Is the allergy confirmed?';
const String allergyDescription = 'Allergy description *';
const String allergyDescriptionHint = 'Please elaborate more about the allergy';
const String diagnosisDrawerTitle = 'Add Diagnosis';
const String diagnosisAddedSuccessMsg = 'Diagnosis added';
const String addTestsTitle = 'Request Test';
const String addTestsSuccessMsg = 'Test added';
const String addMedicationTitle = 'Request Medication';
const String addDiagnosisDatePickerLabel = 'Diagnosis date';
const String addDiagnosisDatePickerHint = 'Select Diagnosis date';
const String captureManuallyText = 'Capture manually';
const String substanceText = 'substance';
const String allergyText = 'allergy';

const String systoleTitle = 'Systole';
const String systoleNullPrompt = 'Systolic pressure is required';
const String systoleZeroPrompt = 'Systolic pressure cannot be less than 0';
const String systoleHighPrompt = 'Systolic pressure is too high';

const String diastoleTitle = 'Diastole';
const String diastoleNullPrompt = 'Diastolic pressure is required';
const String diastoleZeroPrompt = 'Diastolic pressure cannot be less than 0';
const String diastoleHighPrompt = 'Diastolic pressure is too high';

const String smallScreenBPTitle = 'BP';
const String largeScreenBPTitle = 'Blood pressure';
const String bpUnits = 'mmHg';
const String notRecordedText = 'NOT\nRECORDED';
const String heightText = 'Height';
const String heightNullPrompt = 'Height is required';
const String heightZeroPrompt = 'Height cannot be 0';

/// invalid height
const String heightInvalidPrompt = 'invalid height';
const String heightUnits = 'cm';
const String weightTitle = 'Weight';
const String weightNullPrompt = 'Weight is required';
const String weightZeroPrompt = 'Weight cannot be 0';

/// invalid weight
const String weightInvalidPrompt = 'invalid weight';
const String weightUnits = 'kg';
const String spo2Title = 'SP02';
const String spo2RequiredPrompt = 'SPO2 is required';
const String spo2HighPrompt = 'SPO2 cannot be more than 100';
const String spo2ZeroPrompt = 'SPO2 cannot be 0';
const String pulseUnit = 'BPM';
const String pulseRateTitle = 'Pulse rate';
const String pulseRequiredPrompt = 'Pulse rate is required';
const String pulseZeroPrompt = 'Pulse rate cannot be 0';
const String pulseHighPrompt = 'Pulse rate is too high';
const String bmpRequiredPrompt = 'BPM is required';
const String bmpZeroPrompt = 'BPM cannot be 0';
const String bmpHighPrompt = 'BPM is too high';
const String bmpNumericPrompt = 'BPM is too high';
const String respiratoryRateTitle = 'Respiratory rate';
const String tempZeroPrompt = 'Temperature cannot be 0';
const String tempHighPrompt = 'Temperature is too high';
const String tempRequiredPrompt = 'Temperature is required';
const String medicationTitle = 'Medications';
const String prescriptionTitle = 'Prescription';
const String errorOccurred = 'Sorry, an error occurred';
const String amountRequirePrompt = 'Amount is required';
const String amountZeroPrompt = 'Amount cannot be 0';
const String amountNumericPrompt = 'Amount must be numeric';
const String freqTitle = 'Take every';
const String periodTitle = 'For(period)';

// AddNextOfKinStrings
const String addNextOfKinText = 'Add next of kin';
const String provideNextOfKinBasicInfo =
    'Kindly provide next of kin\'s basic information';
const String nextOfKinFirstNameText = 'Next of kin first name';
const String nextOfKinLastNameText = 'Next of kin last name';

const String enterNextOfKinFirstName = 'Enter the kin\'s first name';
const String enterNextOfKinLastName = 'Enter the kin\'s last name';
const String enterNextOfKinPhoneNumber = 'Enter their phone number';
const String enterNextOfKinDob = 'Enter next of kin\'s date of birth';
const String hintSelectNextOfKinGender = 'Select gender';
const String genderNextOfKinReq = 'Next of kin gender is required';
const String hintRelationship = 'Relationship type';
const String hintSelectRelationship = 'Select relationship type';
const String relationshipReq = 'Relationship type is required';
const String silButtonCancel = 'Cancel';
const String silButtonRegister = 'Register Next of Kin';

// BasicDetailsStrings
const String patientRole = 'Patients';
const String patientStr = 'Patient';
String detailsText(String userType) => '$userType Details';
String provideBasicInfo(String userType) =>
    'Kindly provide ${userType.toLowerCase()}\'s basic information';
String capturePhoto(String userType) =>
    'Capture ${userType.toLowerCase()}\'s photo (optional)';
const String takePhotoText = 'Take photo';
const String retakePhotoText = 'Retake photo';
const String firstNameHint = 'First Name';
String enterFirstName(String userType) =>
    'Enter the ${userType.toLowerCase()}\'s first name';
const String firstNameReq = 'First name is required';
const String lastNameHint = 'Last Name';
String enterLastName(String userType) =>
    'Enter the ${userType.toLowerCase()}\'s last name';
const String lastNameReq = 'Last name is required';
const String hintPhoneNumber = 'Phone number';
const String verifiedPhoneNumber = 'VERIFIED';
const String verifyPhoneNumber = 'Kindly verify phone number';
const String asteriskSymbol = '*';

const String patientRegistrationResponse = 'registerPatient';

String enterDob(String userType) =>
    'Enter the ${userType.toLowerCase()}\'s date of birth';
const String hintDob = 'Date of Birth';
const String dobReq = 'Please select date of birth';
const String hintGender = 'Gender';
const String hintSelectGender = 'Select gender';
const String genderReq = 'Gender is required';
const String selectGender = 'Please Select a Gender';
const String hintIdentification = 'Identification document';
const String hintSelectIdentification = 'Select identification document';
const String selectIdentification = 'Please Select an Identification Document';
const String retakeIdentification = 'Tap to retake photo';
const String retakeIdentificationFront = 'of the front side';
const String retakeIdentificationBack = 'of the back side';
const String captureIdentificationFront = 'Tap to capture front side';
const String captureIdentificationBack = 'Tap to capture back side';

// PatientHistoryStrings
const String couldNotFindSnapshotError =
    'We could not find what you are looking';

// ChiefComplaintStrings
const String chiefComplaint = 'Chief complaint';
const String addChiefComplaint = 'Add Chief complaint';
const String pleaseAddChiefComplaint = 'Please add a chief complaint';
const String statusText = 'Status: ';
const String retireText = 'Retire';
const String activeText = 'Active';

// HistoryFormInputString
const String editText = 'Edit';
const String descriptionText = 'Description';
const String enterText = 'Please enter some text';

// PatientExamDiagnosisStrings'
const String quickAccess = ' Quick Access';
const String addPatientDiagnosis = 'Add patient diagnosis';
const String whatDoesThePatientHave =
    'What diagnosis does the patient have? e.g. Diabetes, Hypertension';
const String diagnosisRetired = 'Diagnosis retired successfully';
const String tapToOrderTests = 'Tap to order tests and medications';
const String tapToViewLess = 'Tap to view less';

// ExtraInfoStrings
const String extraInfoTitle = 'Extra Information';
const String maritalStatusTitle = 'Marital status';
const String maritalStatusHint = 'Select marital status';
const String emailCommunicationsPrompt =
    'Kindly choose if you want to opt in for email and phone communications below';

//  TimelineStrings
const String noVisits = 'No Visits';
const String noPreviousVisits =
    'There are no previous visits associated with this patient';
const String patientTimelineText = 'Patient Timeline';
const String viewAllText = 'View All';
const String reactionText = 'Reaction:  ';
const String orderedOn = 'Ordered on:  ';
const String dosageInstruction = 'Dosage Instruction:  ';
const String recorded = 'Recorded:  ';
const String recordDate = 'Record date:  ';
const String category = 'Category: ';
String timelineMessage = 'More visits loaded successfully';

//  VerifyOTPContentStrings
const String startingVisit = 'Starting visit...';
const String requestAccess = 'Request access to the patient data';

// RouteErrorStrings
const String goBack = 'GO BACK';
const String errorFindingResults =
    'We can\'t seem to find what you are looking for';

// exam composition model strings
const String patientHistoryTitle = 'patient-history';
const String generalExaminationTitle = 'general-examination';
const String reviewOfSystemsTitle = 'review-of-systems';

// patient exam pages strings
const String completeBtnTextSmallScreen = 'View Summary';
const String addConditionText = 'Add Condition';
const String ongoingConditionsText = 'Ongoing Conditions';
const String completeBtnTextLargeScreen = 'View Summary and Complete';
const String backText = 'Back';
const String unableToAddCondition =
    'Unable to add the condition, try again later.';

const String addText = 'Add';

// patient exam allergy drawer strings
const String dateTitle = 'Date';
const String doctorTitle = 'Doctor';
const String pExamAllergyZeroStateTitle = 'Add patient allergies';
const String pExamAllergyZeroStateSubtitle =
    'What does the patient react to? e.g. drug allergy (steroid), food allergy (nuts). Kindly confirm the allergy before adding';

// clinical exam form strings
const String noAbnormalitiesCheckbox = 'No abnormalities noted';
const String notesTitle = 'Notes';
const String extraNotesTitle = 'Extra Notes';
const String notesHint = 'Your notes here...';
const String reviewSavedSuccessMsg = 'Review saved successfully';
const String msTitle = 'MS (Muscle, Bones, Joints)';
const String respiratoryTitle = 'Respiratory';

// get composition type widget title
const String respiratory = 'respiratory';
const String peripheral = 'peripheral';
const String gastrointestinal = 'gastrointestinal';
const String hematologic = 'hematologic';
const String urinary = 'urinary';
const String neurologic = 'neurologic';
const String cardiac = 'cardiac';
const String heent = 'heent';
const String heentTwo = 'heenttwo';
const String gi = 'gi';
const String gu = 'gu';
const String ms = 'ms';
const String skin = 'skin';
const String psychiatric = 'psychiatric';
const String generalExamTitle = 'General exam';
const String generalExamCompositionTitle = 'generalExam';
const String generalExamRemoveSuccessMsg = 'General examination removed';
const String closeBtnText = 'Close';
const String doctorsNotes = 'Doctor\'s notes';
const String noNotes = 'No Notes added';
const String hasFeverText = 'Has fever';
const String hasNauseaText = 'Has nausea';
const String hasRashText = 'Has rash';
const String hasFatigueText = 'Experiencing Fatigue';
const String weightStatus = 'Weight status';
const String weightGain = 'Weight gain';
const String weightLoss = 'Weight Loss';
const String savingGenExamText = 'saving the patient\'s general exam';
const String reviewOfSystemsCard = 'Review of Systems';
const String quickAccessTitle = 'Quick Access';
const String addReviewOfSystemsTitle = 'Add Review of Systems';
const String addReviewOfSystemsSubtitle =
    'Perform a review of systems exam on the patient';
const String addReview = 'Add a review';
const String patientHistorySuccessMsg = 'Patient history created successfully';
const String patientHistoryFormTitle = 'History of presenting illness';
const String patientMedicalHistoryTitle = 'Medical & Surgical history';
const String patientFamilyTitle = 'Family & Social history';
const String saveHistoryBtnTxt = 'Save History';
const String updateHistoryBtnTxt = 'Update History';
const String addProblemSuccessMsg = 'Adding the problem';
const String confirmedText = 'Confirmed ?';
const String elaborateProblemHint = 'Elaborate on the problem';
const String sendingOTP = 'Sending OTP...';
const String signOffAndComplete = 'Sign Off and Complete';
const String signOffCancel = 'Sign off cancelled';
const String noMedicationsAdded = 'No medication added yet';
const String addMedication = 'Add medication';
const String addTests = 'Add Test';
const String prescribeMedicationsPrompt =
    'Prescribe necessary medication accordingly with patient diagnosis';
const String testTitle = 'Tests';
const String noTestsAdded = 'No tests added yet';
const String addPatientTestTitle = 'Add patient test';
const String addPatientTestSubtitle =
    'What test does the patient have? e.g. a broken jaw, a cut on the finger. Kindly confirm the test before adding';
const String searchInputAddMoreCharPrompt = 'Add more characters';
const String selectBtnText = 'Select';
const String addItemsToPatientExamPrompt =
    'Please add some items to this patient\'s exam';
const String nextBtnText = 'Next';
const String previousBtnText = 'Previous';
const String confirmBtnText = 'Confirm';
const String testsText = 'test';
const String doneBtnText = 'Done';
const String patientIdentificationTitle = 'Patient Identification';
const String searchWithPhoneHint = 'Search using phone number...';
const String enterPhoneToSearchPrompt =
    'Please enter the patient\'s phone number to be searched';
const String enterValidPhonePrompt = 'Please enter a valid phone number';
const String searchingPrompt = 'Searching...';
const String errorSearching = 'An error occurred while searching for ';
const String noName = 'No name';
const String noMatch = 'No match was found for ';
const String patientNoGuide =
    'Please make sure the patient number is correct. If the patient is not registered, kindly register the patient below or ask the patient to register themselves on';
const String searchAgain = 'Search Again';
const String regPatient = 'Register Patient';
const String genderText = 'Gender :  ';
const String dateOfBirth = 'DOB : ';
const String startVisit = 'START VISIT';
const String continueVisit = 'CONTINUE VISIT';
const String searchTitle = 'Search';
const String searchDescription =
    'Search for a patient using the phone number which they used to register with';
const String selectPatient = 'Select patient';
const String pickPatientFromResult =
    'Pick the patient that matches your search and tap on start visit button';
const String startVisitTitle = 'Start visit';
const String startWithOTP =
    'Proceed to request access and start a visit for the patient via a one time pin';
const String findPatientGuide = 'How to find a patient';
const String startVisitPrompt =
    'Follow the steps below to find a patient and start a visit';
const String okMsg = 'Ok, thanks';
const String skipNHIF = 'Skipping NHIF';
const String nextOfKinAddedSuccessMsg = 'Next of kin added';
const String addingNextOfKin = 'adding next of kin';
const String verifiedText = 'VERIFIED';
const String verifyPhoneBtnText = 'Verify Phone Number';
const String male = 'Male';
const String female = 'Female';
const String unknown = 'Unknown';
const String other = 'Other';

// basic details strings
const String allowPermPhotos =
    'Kindly allow permissions in order to take photos';
const String verifyPhoneChangedPrompt =
    'Phone number just changed. Please verify it again';
const String basicDetailsSaved = 'Basic details saved';
const String savingBasicDetails = 'saving basic details';
const String enableCameraPerm =
    'In order for you take the patient\'s photo, you need to enable camera permissions for the app. Tap the button below to open the settings app';
const String sendingTheOtp = 'sending the OTP';
const String selectSource = 'Select source';
const String cameraText = 'Camera';
const String galleryText = 'Gallery';

// complete registration
String regSuccessMsg(String userType) =>
    '${toBeginningOfSentenceCase(userType)} registered successfully';

const String extraInfoSaved = 'Extra information saved';
const String extraInfoText = 'extra information';
const String skippingExtraInfo = 'Skipping extra information';
const String extraInfoInvalidEmailText = 'Kindly provide a valid email address';
const String finishBtnTxt = 'Finish';
String provideExtraInfoPrompt(String userType) =>
    'Kindly provide the ${userType.toLowerCase()}\'s extra information';
const String emailCommunicationText = 'Email communications';
const String emailAddressText = 'Email address';
String enterEmailPrompt(String userType) =>
    'Enter the $userType\'s email address';
const String emailIsRequired = 'Email address is required';
const String validEmailPrompt = 'Please enter a valid email';

const String phoneNumberField = 'Phone number:  ';
const String skipNextBtnText = 'Skip/Next';

// nhif
String provideNHIFInfoPrompt(String userType) =>
    'Kindly provide the ${userType.toLowerCase()}\'s NHIF information';
const String nHIFNumber = 'NHIF Number';
const String nHIFNumberPrompt = 'Enter the patient\'s NHIF number';
const String nhifRequiredPrompt = 'The NHIF number cannot be empty';
const String nhifValidPrompt = 'Enter a valid NHIF number';
const String nhifIsShortPrompt = 'The NHIF number you entered is too short.';

// permission banner
const String openSettings = 'Open Settings';

// Verify phone dialog
const String resendingOTPText = 'Resending OTP...';
const String verifyPhoneNumberText = 'Verifying phone number...';

const String knownConditionsText = 'Known Conditions:';
const String knownAllergiesTitle = 'Known Allergies:';
const String endVisitText = 'End Visit';
const String endVisitCancel = 'End Visit cancelled';
const String endingVisit = 'ending the visit';

const String errorFetchingPatients =
    'There was an error fetching the problems and allergies';
const String dateOfBirthInitials = 'DOB: ';

// retire helper
const String retirePrompt = 'You are about to retire ';
const String reasonTitle = 'Reason';
const String reasonPrompt = 'A reason is required';
const String retireAndSignPrompt = 'Retire and Sign';

// retireComposition
const String closeText = 'close ';

const String condition = 'condition';

//add_medication_drawer
const String noteRequired = 'Kindly provide medication notes';

//patient_exam_drawers
const String problem = 'Condition';
const String findPatientConditionLogTitle = 'Fetch patient conditions';
const String date = 'Date: ';
const String doctor = 'Doctor';
const String testItem = 'test';
const String problemsText = 'problems';
const String medications = 'medications';
const String diagnosisText = 'diagnosis';
const String verificationStatusText = 'Verification Status: ';
const String clinicalStatusText = 'Clinical Status: ';

//summary medication
const String orderedByText = 'Ordered by: ';
const String orderedOnText = 'Ordered on: ';
const String unconfirmedText = 'Unconfirmed';
const String priorityText = 'Priority: ';

//survey
const String skipText = 'Skip';
const String takeSurveyText = 'Take Survey';

//timeline
const String loadMoreText = 'Load More';

//end_visit_dialogue
const String endVisitTitle = 'You are about to end ';
const String endVisitSubTitle = '\'s visit. Please confirm';
const String confirmEndVisit = 'confirm_end_visit';
const String failedEndVisit = 'failed_end_visit';
const String cancelledEndVisit = 'cancelled_end_visit';

//post_visit_survey
const String lowRatingMessage =
    'Our team might reach out to you to learn more about how we can improve the product';
const String mediumRatingMessage = 'It is great to hear that you are a fan of ';
const String highRatingMessage =
    'Our goal is to create the best possible product and your suggestions play a major role';
const String successfulSurveyCompletionText = 'Survey completed successfully';
const String submittingDataText = 'submitting data';
const String surveyDescription =
    'Kindly complete the survey below to help us serve you better.';
const String recommendationText = 'How likely are you to recommend';
const String colleagueText = 'to a colleague?';
const String ratingText = 'Please add a rating';
const String missingItemText = 'What was missing or disappointing?';
const String missingTitle = 'What was missing?';
const String happinessMessage = 'What could we do to make you happier?';
const String happinessHintText = 'How can we make you happier?';
const String completeText = 'COMPLETE';

//request_access_content
const String patientAllergyDetail = 'Patient allergy details';

const String emergencyOverrideTitle = 'Emergency Override';
const String requestAccessTitle = 'Request Access';
//helper strings
const String thankYou = 'Thank you';
const String thankYouForYourFeedback = 'Thank you for your feedback';

const String loadingText = 'Loading...';

const String requestAccessToPastVisitString =
    'Request access to all past visits';
const String noNameString = 'No Name';
const String okThanksString = 'Ok thanks';
const String examCompletedString = 'Exam completed and signed successfully';

const String phoneNumberExistsText =
    'a patient registered with that phone number already exists';

const String faqTitle = 'Be.Well support center';
const String faqSubtitle =
    'Our customer service team is on standby for service and support';

const String faqTextTitle = 'FAQs';
const String faqTextSubtitle =
    'We are here to help, browse through our frequently asked questions';
const String helpCenterCallText = 'Give us a call';
const String helpCenterWhatsAppText = 'Chat via WhatsApp';
const String helpCenterLogTitle = 'Get FAQs';

const String conditionsString = 'Conditions';
const String allergiesString = 'Allergies';
const String medicationsString = 'Medications';

const String successMessage = 'Information saved successfully';
const String saveText = 'Save';
const String allergies = 'allergies';

const String allowPhoneComm = 'Please allow use of your phone number';
const String createAcc = 'Create account';
const String createAccDesc = 'Use your phone number to create an account';
const String userExists = 'User with that phone number exists. Please sign in';
const String verifyPhoneText = 'Verify phone number';

const String changeNumberText = 'Change number';

//landing page strings
const String landingTerms = 'Read our ';
const String landingTAndC = 'terms & conditions';

const String loginHintPin = 'Your PIN';
const String loginTextPin = 'Enter your PIN';
const String loginPin = 'PIN is required';
const String loginPinDigits = 'Only numbers are allowed, 0-9';
const String loginPinLength = 'Enter a four digit PIN';
const String loginNewUser = 'I am a new user. ';
const String loginSignUp = 'Create an Account';
const String loginBack = 'Back';
const String loginCreatePin = 'Create a PIN ';
const String loginEnterPin = 'Enter PIN';
const String loginEnterPinAgain = 'Enter PIN again to confirm';
const String continueText = 'Continue';

const String verificationTextPin = 'Enter your PIN to continue';

const String confirmPinPrompt = 'A 4 digit PIN is required';
const String confirmPinMatch = 'PINs do not match';

const String signupPhoneNo = 'Please enter a phone number';

const String updateProfile =
    'Edit your profile by entering your first and last names';
const String updateFirstName = 'First Name*';
const String updateFirstNameReq = 'First Name is required';
const String updateLastName = 'Last Name*';
const String updateLastNameReq = 'Last Name is required';
const String saveAndContinueButtonText = 'Save & Continue';
const String updateSuccessful = 'Your profile has been updated successfully';

const String setConfirmPinPrompt = 'Please enter your PIN correctly';

const String startVisitText = 'Start Visit';
const String continueVisitText = 'Continue Visit';

//Navigation Drawer
const String navDrawerFavoritesText = 'Favorite';
const String navDrawerHintSearchText = 'Search';
const String navDrawerComingSoonText = 'Coming Soon';
const String navDrawerAgentText = 'Agent';
const String navDrawerPatientText = 'Patient';
const String navDrawerPatientRegistrationText = 'Patient Registration';
const String navDrawerPatientIdentificationText = 'Patient Identification';
const String navDrawerGetHelpText = 'Get Help';
const String navDrawerNoFavouriteText = 'No items in favourite';
const String navDrawerHowToFavouriteText =
    'Swipe to the right on the action you want to favorite and tap on the favorite icon';
const String favoritesText = 'Favorites';
const String allItemsText = 'All Items';

String favouriteAddActionFeedback(String navigationActionTitle) {
  return 'Adding $navigationActionTitle to favourites';
}

String favouriteAddActionDone(String navigationActionTitle) {
  return 'Added $navigationActionTitle to favourites';
}

String favouriteRemoveActionFeedback(String navigationActionTitle) {
  return 'Removing $navigationActionTitle from favourites';
}

String favouriteRemoveActionDone(String navigationActionTitle) {
  return 'Removed $navigationActionTitle from favourites';
}

const String drawerTestRootText = 'You have closed the drawer';

const String navGetHelpText = 'Get Help';
const String navHomeText = 'Home';
const String navRequestsText = 'Requests';
const String navPartnerText = 'Partner';
const String navConsumerText = 'Consumer';
const String navPatientText = 'Patients';

String contactSupport(String phoneNo) {
  return 'Sorry, an unknown error occurred. Try again or contact us $phoneNo';
}

String verifyRequestMsg(String phoneNo) {
  return 'We have sent a 6 digit PIN to $phoneNo';
}

const Map<String, String> verifyPhoneMap = <String, String>{
  'commAlert':
      'We use your phone number to verify your account and to communicate with you',
  'emailAlert':
      'We use your email address to verify your account and communicate with you',
  'commConsent': 'I agree to the use of my phone number for communications',
  'emailConsent': 'I agree to the use of my email address for communications',
  'text_1': 'Provide and verify your phone number',
  'text_2': 'You will receive a 6 digit code',
  'text_3': 'Verify your email address'
};

String enterVerificationCodeSent(String codeReceiver) {
  return 'Please enter the verification code sent to the $codeReceiver on:';
}

String mobileOptInText(String otpReceiver) {
  return 'By Verifying the $otpReceiver phone number you Opt them in for mobile communications';
}

String verificationCodeSent({bool isEmergency = false}) =>
    'Please enter the verification code sent to ${isEmergency ? "you" : "the patient"} on:';

String remainingSecondsText(int seconds) => 'Resend in $seconds seconds';

String logoutTimerText(int remaining) =>
    'You will be logged out in $remaining seconds';

String verifyDesc(String phoneNo) {
  final String phoneNumber = phoneNo.substring(1);
  return 'We have sent a 6 digit code to $phoneNumber. Enter the code below to proceed';
}

//Complete registration page
const String completeRegistrationText = 'Complete Registration';

// this is the version of the currently running app.
// it has to be defined as a const otherwise the compiler will return the default
const String APPVERSION =
    String.fromEnvironment('APPVERSION', defaultValue: 'dev-build');
const String appVersionString = 'Current Version:';
