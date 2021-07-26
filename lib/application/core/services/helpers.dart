import 'dart:async';
import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/core/graphql/mutations.dart';
import 'package:bewell_pro_core/application/core/graphql/queries.dart';
import 'package:bewell_pro_core/application/core/services/onboarding.dart';
import 'package:bewell_pro_core/application/redux/actions/misc_state_actions/send_event_action.dart';
import 'package:bewell_pro_core/application/redux/actions/navigation_actions/navigation_action.dart';
import 'package:bewell_pro_core/application/redux/actions/user_state_actions/batch_update_user_state_action.dart';
import 'package:bewell_pro_core/application/redux/actions/user_state_actions/logout_action.dart';
import 'package:bewell_pro_core/application/redux/actions/user_state_actions/refresh_token_action.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/application/redux/states/user_state.dart';
import 'package:bewell_pro_core/domain/clinical/entities/event_object.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_connection.dart';
import 'package:bewell_pro_core/domain/clinical/entities/problem_allergy_summary.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/domain/core/value_objects/asset_strings.dart';
import 'package:bewell_pro_core/domain/core/value_objects/enums.dart';
import 'package:bewell_pro_core/domain/core/value_objects/events.dart';
import 'package:bewell_pro_core/domain/core/value_objects/login_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/numbers_constants.dart';
import 'package:bewell_pro_core/presentation/clinical/common/widgets/bewell_submit_dialog.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/pages/patient_exam.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/pages/patient_search_page/patient_search_action.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/pages/patient_registration_container.dart';
import 'package:bewell_pro_core/presentation/clinical/post_visit_survey/post_visit_survey_page.dart';
import 'package:bewell_pro_core/presentation/onboarding/profile/profile_page_items.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/html_parser.dart';
import 'package:http/http.dart' as http;
import 'package:misc_utilities/enums.dart';
import 'package:rxdart/rxdart.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:dart_fcm/dart_fcm.dart';
import 'package:domain_objects/entities.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:flutter_graphql_client/graph_event_bus.dart';
import 'package:flutter_graphql_client/graph_utils.dart';
import 'package:misc_utilities/bottom_sheet_builder.dart';
import 'package:misc_utilities/event_bus.dart';
import 'package:misc_utilities/misc.dart';
import 'package:misc_utilities/responsive_widget.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/constants.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_ui_components/buttons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:user_feed/user_feed.dart';
import 'package:html/dom.dart' as dom;

/// [getAuthTokenStatus] is used to check if the Auth Token has expired or if it needs refreshing
///
/// The reason the http and graphQL client are not passed in is because by the
/// time this function is being called they will have already been initialized
Future<AuthTokenStatus> getAuthTokenStatus({
  required BuildContext context,
}) async {
  final CoreState? state = StoreProvider.state<CoreState>(context);
  final UserState userStateFromState = state!.userState!;

  /// Checks if user is signed in
  final bool isSignedIn = state.userState!.isSignedIn!;

  if (isSignedIn) {
    /// Token Expiry time
    final String tokenExpiryFromState = userStateFromState.tokenExpiryTime!;

    if (tokenExpiryFromState != UNKNOWN) {
      /// subtract the current time from the time the user signed in
      /// first check if token has expired
      final Duration difference =
          DateTime.parse(tokenExpiryFromState).difference(DateTime.now());

      final int differenceInMinutes = difference.inMinutes;
      final int differenceInHours = difference.inHours;

      /// If the difference is more than 10 do nothing everything is ok
      if (differenceInMinutes >= 10) {
        return AuthTokenStatus.okay;
      }

      /// Refresh the token because it is about to expire or it has expired.
      /// No PIN verification is required
      else if (differenceInMinutes > 0 && differenceInMinutes <= 9) {
        StoreProvider.dispatch<CoreState>(
            context, RefreshTokenAction(context: context));
        return AuthTokenStatus.okay;
      }

      /// Refresh the token and require PIN verification
      else if (differenceInHours > -12) {
        StoreProvider.dispatch<CoreState>(
            context, RefreshTokenAction(context: context));

        return AuthTokenStatus.requiresPin;
      }
      return AuthTokenStatus.requiresLogin;
    } else {
      return AuthTokenStatus.requiresLogin;
    }
  } else {
    return AuthTokenStatus.requiresLogin;
  }
}

/// Resets device token and gets a new one to ensure token is always valid
/// saves token to the backend
Future<void> saveDeviceToken(
    {required IGraphQlClient client, required SILFCM fcm}) async {
  await fcm.resetToken();

  final Map<String, dynamic> _variables = <String, dynamic>{
    'token': await SILFCM().getDeviceToken()
  };

  final http.Response result =
      await client.query(registerDeviceTokenMutation, _variables);

  SaveTraceLog(
    query: registerDeviceTokenMutation,
    data: _variables,
    response: client.toMap(result),
    client: client,
    title: 'Register FCM Device Token',
    description: 'Register Device Token',
  ).saveLog();
}

Future<void> addNHIF({
  required BuildContext context,
  required NHIFInformationObject nhifInformation,
}) async {
  final bool dataValid = nhifInformation.data['patientID'] != null &&
      nhifInformation.data['membershipNumber'] != null;

  if (dataValid) {
    final Map<String, dynamic>? result = await showDialog<Map<String, dynamic>>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return BewellSubmitDialog(
          data: addPatientNHIFVariables(nhifInformation.data),
          query: addPatientNHIFMutation,
        );
      },
    );

    if (result != null && result['addNHIF'] != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('NHIF saved'),
        duration: const Duration(seconds: kLongSnackBarDuration),
        action: dismissSnackBar('Ok, thanks', white, context),
      ));

      const int index = PatientRegistrationContainer.extraInformationIndex;
      PatientRegistrationContainer.of(context)?.navigate(index);
      return;
    } else if (result!['error'] != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(UserFeedBackTexts.getErrorMessage('saving NHIF details')),
        duration: const Duration(seconds: kLongSnackBarDuration),
        action: dismissSnackBar(okMsg, white, context),
      ));
      return;
    }
  } else {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text(skipNHIF),
      duration: Duration(seconds: kLongSnackBarDuration),
    ));
    const int index = PatientRegistrationContainer.extraInformationIndex;
    PatientRegistrationContainer.of(context)?.navigate(index);
  }
}

/// Access the user profile to get the [First Name] and [Last Name] of the current recording doctor,
String? getRecordingDoctor(BuildContext context) {
  final UserProfile userProfile =
      StoreProvider.state<CoreState>(context)!.userState!.userProfile!;

  final String firstName =
      titleCase(userProfile.userBioData!.firstName!.getValue());
  final String lastName =
      titleCase(userProfile.userBioData!.lastName!.getValue());
  return '$firstName $lastName';
}

/// A generic search function for searching for, and listing problems, allergies
/// medications, tests and diagnoses
///
/// It takes in a [String searchParam], the [conceptClass], the BuildContext [context],
/// and a stream controller [streamController] in which the data is added to
///
/// It then updates the stream controller with the returned data (if any) or
/// an error if there was an error
Future<void> genericSearchFunction({
  required String searchParam,
  required ConceptClass conceptClass,
  required IGraphQlClient client,
  required StreamController<dynamic> streamController,
}) async {
  // indicate processing ongoing on
  streamController.add(<String, dynamic>{'loading': true});

  final Map<String, dynamic> _variables =
      listConceptsQueryVariables(searchParam, conceptClass.name);

  // query for the results and check for errors
  final http.Response result =
      await client.query(listConceptsQuery, _variables);

  final Map<String, dynamic> payLoad = client.toMap(result);

  final String? error = client.parseError(payLoad);

  if (error != null) {
    await captureException(
      'Error while searching for $searchParam',
      query: listConceptsQuery,
      error: error,
      response: payLoad,
      variables: _variables,
    );
    return streamController.addError(<String, dynamic>{'error': error});
  }

  // add the returned data to the stream controller
  return payLoad['data'] != null
      ? streamController.add(payLoad['data'])
      : streamController.add(null);
}

/// [checkData] checks the validity of the data returned from the api
/// and proceeds if successful or shows an error message if there are any errors
///
/// variables passed in are custom
///
/// [data] - the data to be checked against
/// [context] - the context
/// [successMsg] - the message to be displayed on successful completion
/// [errorMsg] - the message to be displayed in case of any error
/// [listeners] - the listener to be updated
/// [listenerValue] - the value to update the listener with
void checkData({
  required dynamic data,
  required BuildContext context,
  required String successMsg,
  required String errorMsg,
  required BehaviorSubject<bool> listener,
  required bool listenerValue,
  required bool popContext,
  required Function? successCallback,
}) {
  if (data != null) {
    /// Update listeners
    listener.add(listenerValue);

    /// Close drawer
    if (popContext) {
      Navigator.pop(context);

      ///  Success feedback
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(
            content: Text(successMsg), duration: const Duration(seconds: 5)));
    } else if (successCallback != null) {
      successCallback();

      /// Success feedback
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(successMsg), duration: const Duration(seconds: 5)));
    }
    return;
  } else {
    /// Notify the user of the error
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
          content: Text(errorMsg), duration: const Duration(seconds: 10)));
  }
}

/// [getPatientInfo] retrieves the patient's information including
/// the `Patient ID`, `Patient Reference`, `Name`, `Encounter ID` and
///  `Encounter Reference`
///
/// returns a [PatientInfo] object
PatientInfo getPatientInfo() {
  final PatientConnection? patientConnection =
      CurrentPatientInEpisode().patientConnection.valueOrNull;
  final String encounterId =
      CurrentPatientInEpisode().encounterID.valueOrNull.toString();

  /// A Patient ID is in the format 6247a19b-c37a-434b-a0af-216da1dbc4c6
  /// A Patient Reference is in the format
  /// ====> Patient/6247a19b-c37a-434b-a0af-216da1dbc4c6
  return PatientInfo(
    patientId: patientConnection?.edges!.first!.node!.id,
    patientReference: 'Patient/${patientConnection?.edges!.first!.node!.id!}',
    patientName: patientConnection?.edges!.first!.node!.name!.first!.text,
    encounterId: encounterId,
    encounterReference: 'Encounter/$encounterId',
  );
}

String checkProfileProgress(BuildContext context) {
  final CoreState state = StoreProvider.state<CoreState>(context)!;
  // check if profile has data
  bool userBioDataFilled() {
    if (state.userState!.userProfile!.userBioData!.firstName!.isValid() &&
        state.userState!.userProfile!.userBioData!.lastName!.isValid()) {
      return true;
    }
    return false;
  }

  // check if profile has data
  bool userEmailFilled() {
    if (state.userState!.userProfile!.primaryEmailAddress != null) {
      if (state.userState!.userProfile!.primaryEmailAddress!.isValid()) {
        return true;
      }
      return false;
    }
    return false;
  }

  final bool isBioDataFilledChecker = userBioDataFilled();
  final bool isUserEmailFilledChecker = userEmailFilled();
  final bool isBioDataFilled = isBioDataFilledChecker;
  final bool isUserEmailFilled = isUserEmailFilledChecker;

  int totalCount = 0;
  final List<bool> completeProgressSteps = <bool>[
    isBioDataFilled,
    isUserEmailFilled
  ];

  final Map<int, bool> isStepCompleted = completeProgressSteps.asMap();

  for (final bool value in isStepCompleted.values) {
    if (value) {
      totalCount += 25;
    }
  }
  return '$totalCount';
}

SILPrimaryButton postVisitSurveyCompleteButton(
  Function callback,
  BuildContext context,
) {
  return SILPrimaryButton(
    buttonColor: healthcloudAccentColor,
    text: continueText,
    onPressed: () => callback(),
  );
}

extension StringExtension on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${this.substring(1).toLowerCase()}';
  }
}

class SurveyBottomSheet extends BottomSheetBuilder {
  SurveyBottomSheet(BuildContext context)
      : super(
            message: BeWellPostVisitSurveyPageState.feedback,
            callback: () async {
              await triggerNavigationEvent(
                context: context,
                route: patientIdentificationRoute,
              );
            });

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = ResponsiveWidget.isSmallScreen(context);
    final List<Widget> feedbackItems = <Widget>[
      const Padding(
        padding: EdgeInsets.all(10),
        child: Icon(Icons.check_circle_outline,
            color: healthcloudAccentColor, size: 60),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(thankYouForYourFeedback,
                style: Theme.of(context).textTheme.subtitle1),
            verySmallVerticalSizedBox,
            Text(message ?? thankYou,
                style: Theme.of(context).textTheme.subtitle2),
          ],
        ),
      ),
    ];
    final List<Widget> _bottomSheetItems = <Widget>[
      if (isSmallScreen)
        Column(children: feedbackItems)
      else
        Row(children: feedbackItems),
      if (isSmallScreen) ...<Widget>[
        mediumVerticalSizedBox,
        SizedBox(
            width: MediaQuery.of(context).size.width,
            child: postVisitSurveyCompleteButton(callback!, context))
      ] else
        postVisitSurveyCompleteButton(callback!, context)
    ];

    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(10),
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Align(
              child: Container(
                  height: isSmallScreen ? 3 : 5,
                  width: isSmallScreen ? 50 : 100,
                  decoration: BoxDecoration(
                      color: grey, borderRadius: BorderRadius.circular(20)))),
          mediumVerticalSizedBox,
          if (isSmallScreen)
            Column(children: _bottomSheetItems)
          else
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _bottomSheetItems,
            ),
        ],
      ),
    );
  }
}

/// Decides whether to show the debug mode banner based on the environment
/// that the app is running.
///
/// The banner is only shown when the app is running in test mode
bool showDebugModeBanner(List<AppContext> appContexts) =>
    appContexts.contains(AppContext.AppTest);

void showAlertSnackBar({
  @required BuildContext? context,
  String? message,
  String? title,
}) {
  ScaffoldMessenger.of(context!)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      snackbar(
        content: message ?? UserFeedBackTexts.getErrorMessage(),
        durationSeconds: 5,
      ),
    );
  return;
}

/// Saves a vital by calling the graphQL endpoint using the variables provided
/// in the form of a [Map<String, dynamic> data]
///
/// This function checks the returned value of the result and performs the
/// following:
///
/// - updates the [ExamChangeObject().onAddVitalListener] listener with the
/// value of [true] so that the UI can rebuild, and then closes the drawer
///
/// - if an update was unsuccessful, it updates the the
/// [ExamChangeObject().onAddVitalListener] listener with the value of [false]
/// so that the UI does not rebuild
///
/// PARAMS:
/// 1. [BuildContext context] - the build context which is necessary for making
/// the API call
/// 2. [Map<String, dynamic> data] - the mutation variables to be used to make
/// the API call
/// 3. [String successMsg] - the success message to show if a vital was saved
/// successfully
/// 4. [bool shouldPop = true] - whether to close the current drawer or not.
/// The value is set to [true] by default because this function will always
/// close the drawer
Future<void> saveVital(
    {required BuildContext context,
    required Map<String, dynamic> data,
    required String successMsg,
    bool shouldPop = true}) async {
  /// Save systolic blood pressure
  final Map<String, dynamic>? result = await showDialog<Map<String, dynamic>>(
    context: context,
    useRootNavigator: false,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return BewellSubmitDialog(data: data, query: addVitalsMutation);
    },
  );

  if (result != null) {
    if (result['createFHIRObservation'] != null) {
      ExamChangeObject().onAddVitalListener.add(true);

      ///   Close drawer
      if (shouldPop) Navigator.of(context).pop();

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(
          content: Text(successMsg),
          duration: const Duration(seconds: kShortSnackBarDuration),
        ));
    } else {
      ExamChangeObject().onAddVitalListener.add(false);
    }
  }
}

Future<void> logoutUser(BuildContext context,
    {String? customSignOutMsg}) async {
  Navigation.initial();

  /// Notify the user
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(
      content: Text(customSignOutMsg ?? logoutMessage),
      duration: const Duration(seconds: kLongSnackBarDuration),
      action: dismissSnackBar('close', white, context),
    ));

  StoreProvider.dispatch<CoreState>(context, LogoutAction());
}

/// Clears all behavior subjects that contain the current patient's data
/// this is normally called when a visit is ended to prevent corrupt data when
/// a visit for a new patient is started
///
/// OBJECTS TO RESET
/// - [TimelineInfoObject] - stores the information about the patient's visits
/// - [PatientSearchStore] - stores the status of the patient search
/// - [PrimaryBannerInfoObject] - stores the patient's problems and allergies
/// - [CurrentPatientInEpisode] - stores everything about the currently active
///  patient
/// - [SecondaryBannerInfoObject] - stores all the secondary banner information
/// about this patient, including their conditions, allergies and medications
void resetPatientData() {
  /// Main objects to be reset
  TimelineInfoObject().reset();
  PatientSearchStore().reset();
  PrimaryBannerInfoObject().reset();
  CurrentPatientInEpisode().reset();
  SecondaryBannerInfoObject().reset();

  /// extra objects to be reset (the ones that don't have side effects because
  /// they will always be up to date when the UI being built)
  ///
  AddVitalsObject().reset();
  AddTestStore().reset();
}

/// Sends an otp request.
/// Returns the otp fetched or null if there was an error with request
Future<String?> sendOtpRequest({
  required IGraphQlClient graphQlClient,
  required String phoneNumber,
}) async {
  if (phoneNumber.isNotEmpty && phoneNumber != UNKNOWN) {
    final String otp = await GraphQlUtils().sendOtp(
      client: graphQlClient,
      phoneNumber: phoneNumber,
      logTitle: 'Basic details (patient registration) : sendOTP',
    );

    if (otp != 'Error') {
      return otp;
    }

    return null;
  }
}

NextOfKinRelation getRelationFromString(String nextOfKinString) {
  return NextOfKinRelation.values
      .firstWhere((NextOfKinRelation e) => e.name == nextOfKinString);
}

Gender getGenderFromString(String genderString) {
  return Gender.values
      .where((Gender gender) =>
          gender.name.toLowerCase() == genderString.toLowerCase())
      .first;
}

Future<void> clinicalRetireFunctionHelper({
  required GlobalKey<FormState> formKey,
  required VoidCallback? onProblemRetireCallback,
  required VoidCallback? onAllergiesRetireCallback,
  required VoidCallback? onTestRetireCallback,
  required VoidCallback? onMedicationRetireCallback,
  required VoidCallback? onDiagnosisRetireCallback,
  required VoidCallback? onRetireReviewOfSystemCallback,
  required VoidCallback? onRetireGeneralExamCallback,
  required SectionType section,
}) async {
  if (formKey.currentState!.validate()) {
    if (section.name == SectionType.condition.name) {
      onProblemRetireCallback!();
    }

    if (section.name == SectionType.allergy.name) {
      onAllergiesRetireCallback!();
    }
    if (section.name == SectionType.test.name) {
      onTestRetireCallback!();
    }
    if (section.name == SectionType.medication.name) {
      onMedicationRetireCallback!();
    }
    if (section.name == SectionType.diagnosis.name) {
      onDiagnosisRetireCallback!();
    }
    if (section.name == SectionType.reviewOfSystem.name) {
      onRetireReviewOfSystemCallback!();
    }
    if (section.name == SectionType.generalExam.name) {
      onRetireGeneralExamCallback!();
    }
  }
}

/// Creates a listener to send an event once an event is fired
///
/// @params
/// - A [EventBus] instance so as to extract the listener
/// - [BuildContext] context to help with dispatching the send event action
void sendEventWrapperFunction(
  EventBus eventBus,
  BuildContext context,
) {
  eventBus.streamController.stream.listen(
    (dynamic event) {
      StoreProvider.dispatch<CoreState>(
        context,
        SendEventAction(
          client: AppWrapperBase.of(context)!.graphQLClient,
          eventName: event.eventName as String,
          eventPayload: event.eventPayload as Map<String, dynamic>,
        ),
      );
    },
  );
}

/// Triggers Navigation event by sending a log to firebase
///
/// @params
/// - String `route` (determines the route to push to after sending log)
/// - bool `shouldReplace` (is used as a flag for navigation events that replace previous routes)
/// - BuildContext `context`
Future<void> triggerNavigationEvent({
  required BuildContext context,
  required String route,
  String? event,
  bool shouldReplace = false,
  Object? args,
  bool shouldRemoveUntil = false,
}) async {
  /// Navigation Function
  if (shouldReplace) {
    await Navigator.of(context).pushReplacementNamed(route, arguments: args);
    triggerEvent(navigationEvent, context, route: route);
  } else if (shouldRemoveUntil) {
    await Navigator.of(context).pushNamedAndRemoveUntil(
      route,
      ModalRoute.withName(route),
      arguments: args,
    );
    triggerEvent(navigationEvent, context, route: route);
  } else {
    await Navigator.of(context).pushNamed(route, arguments: args);
    triggerEvent(navigationEvent, context, route: route);
  }
}

/// Processes a list of problems or allergies and outputs a data class
/// [GenerateProblemAllergySummaryData] that contains the summary
GenerateProblemAllergySummaryData generateProblemAllergySummary(
    List<String?>? data, String dataItem) {
  if (data == null || data.isEmpty) {
    return GenerateProblemAllergySummaryData(
      problemOrAllergyString: 'No known ${dataItem.toLowerCase()}',
      remainingItemsString: '',
    );
  }

  final int length = data.length;
  List<dynamic> problemsOrAllergies;
  String remainingItems = '';

  if (length > 2) {
    problemsOrAllergies = data.take(2).toList();
    remainingItems = '${length - 2} more...';
  } else {
    problemsOrAllergies = data;
  }

  return GenerateProblemAllergySummaryData(
    problemOrAllergyString: problemsOrAllergies.join(', '),
    remainingItemsString: remainingItems,
  );
}

/// [navigateToProfileItemPage] function is used to validate routes in user profile page,
/// If route is provided, it navigates to the specified page and if route is null it displays
/// A coming soon snack bar
Future<void> navigateToProfileItemPage({
  required BuildContext context,
  required ProfileItem profileItem,
}) async {
  if (profileItem.onTapRoute == pinVerificationRoute) {
    triggerNavigationEvent(
        context: context,
        route: profileItem.onTapRoute,
        args: PinVerificationType.pinChange);
  } else {
    await triggerNavigationEvent(
        context: context, route: profileItem.onTapRoute);
  }
}

Future<dynamic> showInfoBottomSheet({
  required BuildContext context,
  required Widget modalContent,
  required String imagePath,
}) async {
  return showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.transparent,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Container(
        key: AppWidgetKeys.bottomSheetInfoContainer,
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          constraints: const BoxConstraints(maxWidth: 420),
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          margin: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  child: Row(
                    children: <Widget>[
                      GestureDetector(
                        key: AppWidgetKeys.bottomSheetInfoContainerContentKey,
                        onTap: () => Navigator.pop(context),
                        child: Image(
                            image: AssetImage(imagePath),
                            height: 32.0,
                            width: 32.0),
                      ),
                      mediumHorizontalSizedBox,
                      Flexible(child: modalContent),
                    ],
                  ),
                ),
                smallHorizontalSizedBox,
                GestureDetector(
                  key: AppWidgetKeys.closeInfoBottomSheet,
                  onTap: () => Navigator.pop(context),
                  child: const Image(
                    image: AssetImage(closeIconUrl),
                    color: Colors.black54,
                    height: 16.0,
                    width: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

/// Gets initial route based on the authToken status
Future<String> getInitialRoute({required BuildContext context}) async {
  final CoreState state = StoreProvider.state<CoreState>(context)!;

  // This will always be false
  final bool? signedIn = state.userState!.isSignedIn;

  await StoreProvider.dispatch<CoreState>(
    context,
    BatchUpdateUserStateAction(
        inActivitySetInTime: DateTime.now().toIso8601String()),
  );

  if (signedIn == true) {
    /// Check inactivity time
    final AuthTokenStatus tokenStatus = await getAuthTokenStatus(
      context: context,
    );

    switch (tokenStatus) {
      case AuthTokenStatus.requiresLogin:
        return phoneLoginRoute;
      case AuthTokenStatus.requiresPin:
        return pinVerificationRoute;
      default: // Happy case => Get the onboarding path and
    }

    StoreProvider.dispatch<CoreState>(
      context,
      NavigationAction(drawerSelectedIndex: -1, bottomBarSelectedIndex: 0),
    );

    return onboardingPath(state: state).route;
  }

  return landingPageRoute;
}

String getAppContext(List<AppContext> contexts) {
  if (contexts.contains(AppContext.AppProd)) {
    return 'prod';
  }
  if (contexts.contains(AppContext.AppDemo)) {
    return 'demo';
  }
  return 'test';
}

void triggerEvent(String eventName, BuildContext context, {String? route}) {
  final UserState userState =
      StoreProvider.state<CoreState>(context)!.userState!;

  final EventObject eventObjectPayload = EventObject(
    firstName: userState.userProfile!.userBioData!.firstName?.getValue(),
    lastName: userState.userProfile!.userBioData!.lastName?.getValue(),
    uid: userState.auth!.uid,
    route: route,
    primaryPhoneNumber: userState.userProfile!.primaryPhoneNumber?.getValue(),
    flavour: Flavour.PRO.name,
    timestamp: DateTime.now(),
  );

  final String appContext =
      getAppContext(AppWrapperBase.of(context)!.appContexts);

  /// The environment specific event name
  final String contextEventName = '${eventName}_$appContext';

  final FirebaseAnalytics firebaseAnalytics = FirebaseAnalytics();

  firebaseAnalytics.logEvent(
      name: contextEventName, parameters: eventObjectPayload.toJson());
}

void openPatientExamDrawer({
  required BuildContext context,
  required ReviewSystems system,
}) {
  context
      .findAncestorWidgetOfExactType<PatientExam>()
      ?.selectedDrawer
      .add(system.reviewDefinition.drawerType);

  context
      .findAncestorWidgetOfExactType<PatientExam>()
      ?.scaffoldKey
      .currentState
      ?.openEndDrawer();
}

Future<void> searchPatientFunction(
  BuildContext context,
  String searchParam,
) async {
  final IGraphQlClient client = AppWrapperBase.of(context)!.graphQLClient;

  await StoreProvider.dispatch(context,
      PatientSearchByPhoneAction(client: client, searchParam: searchParam));
}

/// Used to capture User Exceptions and logged to BeWell Sentry
///
/// These include exceptions like: `'Error while fetching user feed'`
/// Check `exception_strings.dart` for more examples of these exceptions.
///
/// @params
/// - message: Reported as issue title
/// - query and variables: The query/mutation with variables that resulted into the exception
/// - response: Response received
/// - error: exception string
Future<void> captureException(
  String? message, {
  String? query,
  Map<String, dynamic>? variables,
  dynamic response,
  dynamic error,
}) async {
  final Map<String, dynamic> stackTrace = <String, dynamic>{
    'query': query,
    'variables': variables,
    'response': response,
    'error': error
  };

  /// Adds the stackTrace as a breadcrumb
  Sentry.addBreadcrumb(Breadcrumb(
      message: 'Stacktrace for: $message',
      data: stackTrace,
      timestamp: DateTime.now()));
  await Sentry.captureException(UserException(message));
}

/// Formats Kenyan phone numbers with the prefixes ('+254', '254', '07' and '7')
///  to international format `+2547xxx`
///
/// Should only format Kenyan phone numbers, and return the rest as is
String formatKEPhoneNumber(String searchParam) {
  final String param = trimWhitespace(searchParam);

  if (param.startsWith('+254')) {
    return param;
  } else if (param.startsWith('254')) {
    return '+$param';
  } else if (param.startsWith('07')) {
    final String formattedParam = param.substring(1);
    return '+254$formattedParam';
  } else if (param.startsWith('7')) {
    return '+254$param';
  } else {
    return param;
  }
}

double getResponsivePadding({required BuildContext context}) {
  final double padding;

  final List<NavigationItem> secondaryActions =
      StoreProvider.state<CoreState>(context)!
          .navigationState!
          .secondaryActions!;

  if (ResponsiveWidget.deviceType(context) != DeviceScreensType.Mobile &&
      secondaryActions.isEmpty) {
    padding = ResponsiveWidget.preferredPaddingOnStretchedScreens(
        context: context);
  } else if (ResponsiveWidget.deviceType(context) ==
      DeviceScreensType.Mobile) {
    padding = number15;
  } else {
    padding = number20;
  }

  return padding;
}

void onBodyLinkOrImageTapCallback(String? url, RenderContext context,
    Map<String, String> attributes, dom.Element? element) {
  launch(url!);
}