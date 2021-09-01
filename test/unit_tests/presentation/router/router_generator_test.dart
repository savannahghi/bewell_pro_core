import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/pages/patient_exam.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/summary/patient_exam_summary.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/pages/patient_search_page.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_identification/widgets/visit/start_visit_page/start_visit_page.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/bewell_patient_profile_page.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/pages/patient_registration.dart';
import 'package:bewell_pro_core/presentation/clinical/post_visit_survey/confirm_survey_page.dart';
import 'package:bewell_pro_core/presentation/clinical/post_visit_survey/post_visit_survey_page.dart';
import 'package:bewell_pro_core/presentation/core/help_center/pages/help_center_page.dart';
import 'package:bewell_pro_core/presentation/core/home/pages/home_page.dart';
import 'package:bewell_pro_core/presentation/core/widgets/default_error_route.dart';
import 'package:bewell_pro_core/presentation/onboarding/common/landing_page.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/pages/phone_login_page.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/pages/reset_pin_page.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/pages/set_pin_page.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/pages/set_user_names_page.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/pages/verify_reset_pin_request_page.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/widgets/recover_pin.dart';
import 'package:bewell_pro_core/presentation/onboarding/profile/change_pin.dart';
import 'package:bewell_pro_core/presentation/onboarding/profile/communication_settings.dart';
import 'package:bewell_pro_core/presentation/onboarding/profile/pages/edit_profile_page.dart';
import 'package:bewell_pro_core/presentation/onboarding/profile/pages/user_profile_page.dart';
import 'package:bewell_pro_core/presentation/onboarding/profile/profile_contact_details.dart';
import 'package:bewell_pro_core/presentation/onboarding/signup/phone_signup_page.dart';
import 'package:bewell_pro_core/presentation/router/router_generator.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';
import 'package:user_profile/term_and_conditions.dart';

import '../../../mocks/mocks.dart';

void main() {
  const Route<dynamic>? Function(RouteSettings settings) routeGenerator =
      RouteGenerator.generateRoute;

  final BuildContext context = MockBuildContext();

  test('Test router returns LandingPage', () {
    const RouteSettings settings = RouteSettings(name: landingPageRoute);

    final MaterialPageRoute<LandingPage> route =
        routeGenerator(settings)! as MaterialPageRoute<LandingPage>;

    expect(route, isA<MaterialPageRoute<LandingPage>>());
    expect(route.builder(context), isA<LandingPage>());
  });

  test('Test router returns RecoverPin', () {
    const RouteSettings settings = RouteSettings(name: recoverPinRoute);

    final MaterialPageRoute<RecoverPinPage> route =
        routeGenerator(settings)! as MaterialPageRoute<RecoverPinPage>;

    expect(route, isA<MaterialPageRoute<RecoverPinPage>>());
    expect(route.builder(context), isA<RecoverPinPage>());
  });

  test('Test router returns VerifyPinResetRequestPage', () {
    const RouteSettings settings =
        RouteSettings(name: verifyPinResetRequestRoute);

    final MaterialPageRoute<VerifyPinResetRequestPage> route =
        routeGenerator(settings)!
            as MaterialPageRoute<VerifyPinResetRequestPage>;

    expect(route, isA<MaterialPageRoute<VerifyPinResetRequestPage>>());
    expect(route.builder(context), isA<VerifyPinResetRequestPage>());
  });

  test('Test router returns resetPinRoute', () {
    const RouteSettings settings = RouteSettings(name: resetPinRoute);

    final MaterialPageRoute<ReSetPinPage> route =
        routeGenerator(settings)! as MaterialPageRoute<ReSetPinPage>;

    expect(route, isA<MaterialPageRoute<ReSetPinPage>>());
    expect(route.builder(context), isA<ReSetPinPage>());
  });

  test('Test router returns SetPinPage', () {
    const RouteSettings settings = RouteSettings(name: setPinRoute);

    final MaterialPageRoute<SetPinPage> route =
        routeGenerator(settings)! as MaterialPageRoute<SetPinPage>;

    expect(route, isA<MaterialPageRoute<SetPinPage>>());
    expect(route.builder(context), isA<SetPinPage>());
  });

  test('Test router returns PhoneSignUpPage', () {
    const RouteSettings settings = RouteSettings(name: phoneSignupRoute);

    final MaterialPageRoute<PhoneSignUpPage> route =
        routeGenerator(settings)! as MaterialPageRoute<PhoneSignUpPage>;

    expect(route, isA<MaterialPageRoute<PhoneSignUpPage>>());
    expect(route.builder(context), isA<PhoneSignUpPage>());
  });

  test('Test router returns PhoneLoginPage', () {
    const RouteSettings settings = RouteSettings(name: phoneLoginRoute);

    final MaterialPageRoute<PhoneLoginPage> route =
        routeGenerator(settings)! as MaterialPageRoute<PhoneLoginPage>;

    expect(route, isA<MaterialPageRoute<PhoneLoginPage>>());
    expect(route.builder(context), isA<PhoneLoginPage>());
  });

  test('Test router returns SetUserNames', () {
    const RouteSettings settings = RouteSettings(name: userNamesRoute);

    final MaterialPageRoute<SetUserNamesPage> route =
        routeGenerator(settings)! as MaterialPageRoute<SetUserNamesPage>;

    expect(route, isA<MaterialPageRoute<SetUserNamesPage>>());
    expect(route.builder(context), isA<SetUserNamesPage>());
  });

  test('Test router returns homePageRoute', () {
    const RouteSettings settings = RouteSettings(name: homePageRoute);

    final MaterialPageRoute<HomePage> route =
        routeGenerator(settings)! as MaterialPageRoute<HomePage>;

    expect(route, isA<MaterialPageRoute<HomePage>>());
    expect(route.builder(context), isA<HomePage>());
  });

  test('Test router returns ConfirmSurveyPage', () {
    const RouteSettings settings = RouteSettings(name: confirmSurveyRoute);

    final MaterialPageRoute<ConfirmSurveyPage> route =
        routeGenerator(settings)! as MaterialPageRoute<ConfirmSurveyPage>;

    expect(route, isA<MaterialPageRoute<ConfirmSurveyPage>>());
    expect(route.builder(context), isA<ConfirmSurveyPage>());
  });

  test('Test router returns HelpCenter', () {
    const RouteSettings settings = RouteSettings(name: helpCenterPageRoute);

    final MaterialPageRoute<HelpCenterPage> route =
        routeGenerator(settings)! as MaterialPageRoute<HelpCenterPage>;

    expect(route, isA<MaterialPageRoute<HelpCenterPage>>());
    expect(route.builder(context), isA<HelpCenterPage>());
  });

  test('Test router returns TermsAndConditionsPage', () {
    const RouteSettings settings =
        RouteSettings(name: termsAndConditionsRoute, arguments: 'some url');

    final MaterialPageRoute<TermsAndConditionsPage> route =
        routeGenerator(settings)! as MaterialPageRoute<TermsAndConditionsPage>;

    expect(route, isA<MaterialPageRoute<TermsAndConditionsPage>>());
    expect(route.builder(context), isA<TermsAndConditionsPage>());
  });

  test('Test router returns UserProfilePage', () {
    const RouteSettings settings = RouteSettings(name: userProfileRoute);

    final MaterialPageRoute<UserProfilePage> route =
        routeGenerator(settings)! as MaterialPageRoute<UserProfilePage>;

    expect(route, isA<MaterialPageRoute<UserProfilePage>>());
    expect(route.builder(context), isA<UserProfilePage>());
  });

  test('Test router returns CommunicationSettingsPage', () {
    const RouteSettings settings =
        RouteSettings(name: communicationSettingsRoute);

    final MaterialPageRoute<CommunicationSettingsPage> route =
        routeGenerator(settings)!
            as MaterialPageRoute<CommunicationSettingsPage>;

    expect(route, isA<MaterialPageRoute<CommunicationSettingsPage>>());
    expect(route.builder(context), isA<CommunicationSettingsPage>());
  });

  test('Test router returns EditProfilePage', () {
    const RouteSettings settings = RouteSettings(name: editUserProfileRoute);

    final MaterialPageRoute<EditProfilePage> route =
        routeGenerator(settings)! as MaterialPageRoute<EditProfilePage>;

    expect(route, isA<MaterialPageRoute<EditProfilePage>>());
    expect(route.builder(context), isA<EditProfilePage>());
  });

  test('Test router returns ProfileChangePin', () {
    const RouteSettings settings = RouteSettings(name: profileChangePinRoute);

    final MaterialPageRoute<ProfileChangePin> route =
        routeGenerator(settings)! as MaterialPageRoute<ProfileChangePin>;

    expect(route, isA<MaterialPageRoute<ProfileChangePin>>());
    expect(route.builder(context), isA<ProfileChangePin>());
  });

  test('Test router returns PatientIdentification', () {
    const RouteSettings settings =
        RouteSettings(name: patientIdentificationRoute);

    final MaterialPageRoute<PatientSearchPage> route =
        routeGenerator(settings)! as MaterialPageRoute<PatientSearchPage>;

    expect(route, isA<MaterialPageRoute<PatientSearchPage>>());
    expect(route.builder(context), isA<PatientSearchPage>());
  });

  test('Test router returns PatientRegistration', () {
    const RouteSettings settings = RouteSettings(name: addPatientRoute);

    final MaterialPageRoute<PatientRegistration> route =
        routeGenerator(settings)! as MaterialPageRoute<PatientRegistration>;

    expect(route, isA<MaterialPageRoute<PatientRegistration>>());
    expect(route.builder(context), isA<PatientRegistration>());
  });

  test('Test router returns ProfileContactDetails', () {
    const RouteSettings settings =
        RouteSettings(name: profileContactDetailsRoute);

    final MaterialPageRoute<ProfileContactDetails> route =
        routeGenerator(settings)! as MaterialPageRoute<ProfileContactDetails>;

    expect(route, isA<MaterialPageRoute<ProfileContactDetails>>());
    expect(route.builder(context), isA<ProfileContactDetails>());
  });

  test('Test router returns PatientIdentification', () {
    const RouteSettings settings = RouteSettings(name: patientsPageRoute);

    final MaterialPageRoute<PatientSearchPage> route =
        routeGenerator(settings)! as MaterialPageRoute<PatientSearchPage>;

    expect(route, isA<MaterialPageRoute<PatientSearchPage>>());
    expect(route.builder(context), isA<PatientSearchPage>());
  });

  test('Test router returns BewellPatientProfilePage', () {
    const RouteSettings settings = RouteSettings(name: patientProfilePageRoute);

    final MaterialPageRoute<BewellPatientProfilePage> route =
        routeGenerator(settings)!
            as MaterialPageRoute<BewellPatientProfilePage>;

    expect(route, isA<MaterialPageRoute<BewellPatientProfilePage>>());
    expect(route.builder(context), isA<BewellPatientProfilePage>());
  });

  test('Test router returns PatientExam', () {
    const RouteSettings settings = RouteSettings(name: patientExamPageRoute);

    final MaterialPageRoute<PatientExam> route =
        routeGenerator(settings)! as MaterialPageRoute<PatientExam>;

    expect(route, isA<MaterialPageRoute<PatientExam>>());
    expect(route.builder(context), isA<PatientExam>());
  });

  test('Test router returns ConfirmSurveyPage', () {
    const RouteSettings settings = RouteSettings(name: confirmSurveyPageRoute);

    final MaterialPageRoute<ConfirmSurveyPage> route =
        routeGenerator(settings)! as MaterialPageRoute<ConfirmSurveyPage>;

    expect(route, isA<MaterialPageRoute<ConfirmSurveyPage>>());
    expect(route.builder(context), isA<ConfirmSurveyPage>());
  });

  test('Test router returns BeWellPostVisitSurveyPage', () {
    const RouteSettings settings =
        RouteSettings(name: postVisitSurveyPageRoute);

    final MaterialPageRoute<BeWellPostVisitSurveyPage> route =
        routeGenerator(settings)!
            as MaterialPageRoute<BeWellPostVisitSurveyPage>;

    expect(route, isA<MaterialPageRoute<BeWellPostVisitSurveyPage>>());
    expect(route.builder(context), isA<BeWellPostVisitSurveyPage>());
  });

  test('Test router returns PatientExamSummary', () {
    const RouteSettings settings =
        RouteSettings(name: patientExamSummaryPageRoute);

    final MaterialPageRoute<PatientExamSummary> route =
        routeGenerator(settings)! as MaterialPageRoute<PatientExamSummary>;

    expect(route, isA<MaterialPageRoute<PatientExamSummary>>());
    expect(route.builder(context), isA<PatientExamSummary>());
  });

  test('Test router returns StartVisitPage', () {
    const RouteSettings settings = RouteSettings(
      name: startVisitPageRoute,
    );

    final MaterialPageRoute<StartVisitPage> route =
        routeGenerator(settings)! as MaterialPageRoute<StartVisitPage>;

    expect(route, isA<MaterialPageRoute<StartVisitPage>>());
    expect(route.builder(context), isA<StartVisitPage>());
  });
  test('Test router returns DefaultErrorRoute', () {
    const RouteSettings settings = RouteSettings(
      name: 'home',
    );

    final MaterialPageRoute<DefaultErrorRoute> route =
        routeGenerator(settings)! as MaterialPageRoute<DefaultErrorRoute>;

    expect(route, isA<MaterialPageRoute<DefaultErrorRoute>>());
  });
}
