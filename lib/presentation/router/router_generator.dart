import 'package:bewell_pro_core/application/core/graphql/mutations.dart';
import 'package:bewell_pro_core/application/redux/states/user_registration_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/enums.dart';
import 'package:bewell_pro_core/presentation/admin/widgets/coming_soon_page.dart';
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
import 'package:bewell_pro_core/presentation/onboarding/login/pages/pin_verification_page.dart';
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
import 'package:bewell_pro_core/presentation/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:user_profile/term_and_conditions.dart';

import 'routes.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings? settings) {
    final dynamic args = settings?.arguments;

    switch (settings?.name) {
      case landingPageRoute:
        return MaterialPageRoute<LandingPage>(builder: (_) => LandingPage());

      case recoverPinRoute:
        return MaterialPageRoute<RecoverPinPage>(
            builder: (_) => RecoverPinPage());

      case verifyPinResetRequestRoute:
        return MaterialPageRoute<VerifyPinResetRequestPage>(
            builder: (_) => const VerifyPinResetRequestPage());

      case resetPinRoute:
        return MaterialPageRoute<ReSetPinPage>(builder: (_) => ReSetPinPage());

      case setPinRoute:
        return MaterialPageRoute<SetPinPage>(builder: (_) => SetPinPage());

      case phoneSignupRoute:
        return MaterialPageRoute<PhoneSignUpPage>(
            builder: (_) => PhoneSignUpPage());

      case phoneLoginRoute:
        return MaterialPageRoute<PhoneLoginPage>(
            builder: (_) => PhoneLoginPage());

      case pinVerificationRoute:
        return MaterialPageRoute<PinVerificationPage>(
          builder: (_) => PinVerificationPage(
            pinVerificationType: args != null
                ? args as PinVerificationType
                : PinVerificationType.resumeWithPin,
          ),
        );

      case userNamesRoute:
        return MaterialPageRoute<SetUserNamesPage>(
            builder: (_) => SetUserNamesPage());

      case homePageRoute:
        return MaterialPageRoute<HomePage>(builder: (_) => HomePage());

      case confirmSurveyRoute:
        return MaterialPageRoute<ConfirmSurveyPage>(
            builder: (_) => ConfirmSurveyPage());

      case helpCenterPageRoute:
        return MaterialPageRoute<HelpCenterPage>(
            builder: (_) => const HelpCenterPage());

      case termsAndConditionsRoute:
        final String? termsUrl = args as String?;
        return MaterialPageRoute<TermsAndConditionsPage>(
          builder: (_) => TermsAndConditionsPage(termsUrl: termsUrl),
        );

      case userProfileRoute:
        return MaterialPageRoute<UserProfilePage>(
          builder: (_) => UserProfilePage(),
        );

      case communicationSettingsRoute:
        return MaterialPageRoute<CommunicationSettingsPage>(
          builder: (_) => CommunicationSettingsPage(),
        );

      case editUserProfileRoute:
        return MaterialPageRoute<EditProfilePage>(
          builder: (_) => EditProfilePage(),
        );

      case profileChangePinRoute:
        return MaterialPageRoute<ProfileChangePin>(
          builder: (_) => const ProfileChangePin(),
        );

      case patientIdentificationRoute:
        return MaterialPageRoute<PatientSearchPage>(
          builder: (_) => const PatientSearchPage(),
        );

      case addPatientRoute:
        final dynamic args = UserRegistrationState(
          userType: patientStr,
          userRegistrationMutation: registerPatientQuery,
          userResponse: patientRegistrationResponse,
          primaryRouteName: patientsPageRoute,
          secondaryRouteName: patientIdentificationRoute,
        );
        return MaterialPageRoute<PatientRegistration>(
            builder: (_) => PatientRegistration(
                userRegistrationState: args as UserRegistrationState));

      case profileContactDetailsRoute:
        return MaterialPageRoute<ProfileContactDetails>(
          builder: (_) => ProfileContactDetails(),
        );

      // clinical pages
      case patientsPageRoute:
        return MaterialPageRoute<PatientSearchPage>(
          builder: (_) => const PatientSearchPage(),
        );

      case startVisitPageRoute:
        return MaterialPageRoute<StartVisitPage>(
          builder: (_) => const StartVisitPage(),
        );

      // screens for performing examination and provide medication to the patient.
      case patientProfilePageRoute:
        return MaterialPageRoute<BewellPatientProfilePage>(
            builder: (_) => const BewellPatientProfilePage());

      case patientExamPageRoute:
        return MaterialPageRoute<PatientExam>(builder: (_) => PatientExam());

      case confirmSurveyPageRoute:
        return MaterialPageRoute<ConfirmSurveyPage>(
            builder: (_) => ConfirmSurveyPage());

      case postVisitSurveyPageRoute:
        return MaterialPageRoute<BeWellPostVisitSurveyPage>(
            builder: (_) => BeWellPostVisitSurveyPage());

      case patientExamSummaryPageRoute:
        return MaterialPageRoute<PatientExamSummary>(
            builder: (_) => PatientExamSummary());

      case comingSoon:
        final dynamic args = settings?.arguments;
        return MaterialPageRoute<ComingSoon>(
          builder: (_) => ComingSoon(title: args as String),
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute<DefaultErrorRoute>(
      builder: (_) => const DefaultErrorRoute(
          whereToUrl: phoneLoginRoute, whereToText: 'Sign In'),
    );
  }
}
