import 'dart:async';
import 'dart:convert';
import 'package:bewell_pro_core/application/redux/actions/misc_state_actions/batch_update_misc_state_action.dart';
import 'package:bewell_pro_core/application/redux/actions/onboarding_actions/change_user_pin_action.dart';
import 'package:bewell_pro_core/application/redux/actions/onboarding_actions/update_state_contacts_action.dart';
import 'package:bewell_pro_core/application/redux/actions/onboarding_actions/update_user_pin_action.dart';
import 'package:bewell_pro_core/application/redux/actions/user_state_actions/phone_signup_action.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/application/redux/states/misc_state.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/entities/onboarding_path_config.dart';
import 'package:bewell_pro_core/domain/core/entities/processed_response.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/entities.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:misc_utilities/misc.dart';
import 'package:shared_themes/constants.dart';
import 'package:user_profile/contact_utils.dart';

/// [toggleWaitStateFlagIndicator] a generic function that call `WaitAction` to `add`
/// or `remove` a flag. When `show` is [true], the flag will be removed.
void toggleWaitStateFlagIndicator(
    {required BuildContext context, required String flag, bool show = true}) {
  show
      ? StoreProvider.dispatch<CoreState>(
          context,
          WaitAction<CoreState>.add(flag, ref: '${flag}_ref'),
        )
      : StoreProvider.dispatch<CoreState>(
          context,
          WaitAction<CoreState>.remove(flag, ref: '${flag}_ref'),
        );
}

/// Does a check on user profile on whether logged in user has bio data and partnerType and
/// redirects accordingly
OnboardingPathConfig onboardingPath({required CoreState state}) {
  final BioData? userBio = state.userState!.userProfile!.userBioData;

  //  check the validity bio names. This check is here in the event the name as set on 'UNKNOWN'
  // which is not a valid name
  if (userBio!.firstName == null ||
      userBio.lastName == null ||
      userBio.firstName!.getValue() == UNKNOWN ||
      userBio.lastName!.getValue() == UNKNOWN) {
    return OnboardingPathConfig(userNamesRoute);
  }

  return OnboardingPathConfig(homePageRoute);
}

void toggleUserExists({required BuildContext context, required bool value}) {
  StoreProvider.dispatch<CoreState>(
      context, BatchUpdateMiscStateAction(accountExists: value));
}

/// Extracts the code from the body of the response
int unMarshallErrorResponse(Map<String, dynamic>? body) {
  if (body != null && body.containsKey('code')) {
    final String code = body['code']?.toString() ?? '';
    return int.tryParse(code) ?? 11;
  } else {
    return 11;
  }
}

/// Processes all non-authenticated HTTP api calls made in the app
ProcessedResponse processResponse(
    http.Response response, BuildContext context) {
  if (<int>[200, 201, 202].contains(response.statusCode)) {
    return ProcessedResponse(ok: true, response: response, message: '');
  }

  final Map<String, dynamic> body =
      json.decode(response.body) as Map<String, dynamic>;

  final int code = unMarshallErrorResponse(body);

  if (response.statusCode == 400) {
    if (code == 4) {
      toggleUserExists(value: true, context: context);
    }
    if (code == 7 || code == 10) {
      StoreProvider.dispatch<CoreState>(
          context, BatchUpdateMiscStateAction(unKnownPhoneNo: true));

      ScaffoldMessenger.of(context).showSnackBar(snackbar(content: noAccount));
    }
    if (code == 8) {
      StoreProvider.dispatch<CoreState>(
          context, BatchUpdateMiscStateAction(invalidCredentials: true));
    }
    return ProcessedResponse(
        ok: false, response: response, message: getUserFriendlyMsg(code));
  }

  if (response.statusCode == 500) {
    return ProcessedResponse(
        ok: false, response: response, message: getUserFriendlyMsg(code));
  }
  if (response.statusCode == 408) {
    return ProcessedResponse(
        ok: false, response: response, message: getUserFriendlyMsg(0));
  }

  return ProcessedResponse(
    ok: false,
    response: response,
    message: UserFeedBackTexts.getErrorMessage(),
  );
}

/// returns a user friendly message based on the [code].
///
/// PARAMS
///
/// [code] - an int representing the code from the response body
///
/// This is used
String getUserFriendlyMsg(int code) {
  switch (code) {
    case 0:
      return checkConnectionText;

    case 4:
      return userPhoneExistsText;

    case 5:
      return userEmailExistsText;

    case 6:
      return usernameExistsText;

    case 7:
    case 10:
      return noUserFoundText;

    case 8:
      return wrongCredentialsText;

    case 9:
      return noPINFoundText;

    case 2:
    case 3:
    case 11:
    default:
      return contactSupport(kBewellSupportPhoneNumber);
  }
}

/// Validates that the PINs provided match & are valid [createPin] and [confirmPin]
Future<void> validateEnteredPin({
  required BuildContext context,
  required String flag,
  required SetPinStatus setPinStatus,
  ReduxAction<CoreState>? logoutAction,
}) async {
  final MiscState? miscState =
      StoreProvider.state<CoreState>(context)!.miscState;

  if (miscState!.createPin!.length == 4 && miscState.confirmPin!.length == 4) {
    if (miscState.createPin == miscState.confirmPin) {
      /// Update pinCode
      StoreProvider.dispatch<CoreState>(
        context,
        BatchUpdateMiscStateAction(pinCode: miscState.confirmPin),
      );

      switch (setPinStatus) {
        case SetPinStatus.IsSettingPin:
          await StoreProvider.dispatch<CoreState>(
              context, PhoneSignUpAction(context: context));
          return;

        case SetPinStatus.IsResettingPin:
          await StoreProvider.dispatch<CoreState>(
              context, UpdateUserPinAction(context: context));
          return;

        case SetPinStatus.IsChangingPin:
          await StoreProvider.dispatch<CoreState>(
            context,
            ChangeUserPinAction(
              pin: miscState.createPin!,
              context: context,
              logoutAction: logoutAction,
            ),
          );
          return;
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(snackbar(content: snackBarMatchingPinMessage));
    }
  }
}

/// Used in [Profile] to update state when contact details are updated
void updateStateContacts({
  required BuildContext context,
  required StateContactType type,
  required String? value,
}) {
  StoreProvider.dispatch<CoreState>(
      context, UpdateStateContactsAction(type: type, value: value ?? ''));
}
