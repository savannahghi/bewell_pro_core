import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/actions/user_state_actions/update_supplier_profile_action.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:domain_objects/entities.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/application/core/services/onboarding.dart';
import 'package:bewell_pro_core/application/redux/actions/misc_state_actions/batch_update_misc_state_action.dart';
import 'package:bewell_pro_core/application/redux/actions/navigation_actions/navigation_action.dart';
import 'package:bewell_pro_core/application/redux/actions/user_state_actions/batch_update_user_state_action.dart';
import 'package:bewell_pro_core/application/redux/flags/flags.dart';
import 'package:bewell_pro_core/application/redux/states/misc_state.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/entities/onboarding_path_config.dart';
import 'package:bewell_pro_core/domain/core/entities/processed_response.dart';
import 'package:bewell_pro_core/domain/core/value_objects/exception_strings.dart';
import 'package:bewell_pro_core/domain/core/value_objects/events.dart';
import 'package:bewell_pro_core/domain/core/value_objects/login_constants.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:dart_fcm/dart_fcm.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';
import 'package:http/http.dart' as http;
import 'package:misc_utilities/misc.dart';
import 'package:user_feed/user_feed.dart';

/// [PhoneLoginAction] called when the user try to login using their primary phone
class PhoneLoginAction extends ReduxAction<CoreState> {
  PhoneLoginAction({required this.context});

  final BuildContext context;

  @override
  Future<void> after() async {
    super.after();
    dispatch(WaitAction<CoreState>.remove(phoneLoginStateFlag));
  }

  @override
  void before() {
    super.before();
    dispatch(WaitAction<CoreState>.add(phoneLoginStateFlag));
  }

  @override
  Future<CoreState?> reduce() async {
    final IGraphQlClient client = AppWrapperBase.of(context)!.graphQLClient;

    final MiscState? miscState = state.miscState;

    final Map<String, String> credentials = <String, String>{
      'phoneNumber': miscState!.phoneNumber!,
      'pin': miscState.pinCode!,
      'flavour': Flavour.PRO.name,
    };

    final String phoneLoginEndpoint =
        AppWrapperBase.of(context)!.customContext?.loginByPhoneEndpoint ??
            EndpointContext.loginByPhoneEndpoint(
                AppWrapperBase.of(this.context)!.appContexts);

    final ProcessedResponse processedResponse = processResponse(
      await SimpleCall.callRestAPI(
        endpoint: phoneLoginEndpoint,
        method: AppRequestTypes.POST.name,
        variables: credentials,
        graphClient: client,
        raw: true,
      ) as http.Response,
      context,
    );

    if (processedResponse.ok) {
      final Map<String, dynamic> responseMap =
          json.decode(processedResponse.response.body) as Map<String, dynamic>;

      final UserResponse responseAsObject = UserResponse.fromJson(responseMap);

      dispatch(
        BatchUpdateUserStateAction(
          userProfile: responseAsObject.profile,
          communicationSettings: responseAsObject.communicationSettings,
          auth: responseAsObject.auth,
          isSignedIn: true,
          inActivitySetInTime: DateTime.now().toIso8601String(),
          signedInTime: DateTime.now().toIso8601String(),
          tokenExpiryTime: DateTime.now()
              .add(const Duration(seconds: kTokenExpiryDuration))
              .toIso8601String(),
        ),
      );

      dispatch(
        NavigationAction(
            drawerSelectedIndex:
                responseAsObject.navigation?.drawerSelectedIndex,
            primaryActions: responseAsObject.navigation?.primaryActions,
            secondaryActions: responseAsObject.navigation?.secondaryActions),
      );

      dispatch(UpdateSupplierProfileAction(
        partnerType: responseAsObject.supplierProfile?.partnerType,
        partnerSetupComplete:
            responseAsObject.supplierProfile?.partnerSetupComplete,
      ));

      await saveDeviceToken(client: client, fcm: SILFCM());

      // Clear the misc state
      dispatch(
        BatchUpdateMiscStateAction(
          phoneNumber: UNKNOWN,
          pinCode: UNKNOWN,
          invalidCredentials: false,
          unKnownPhoneNo: false,
        ),
      );

      if (responseAsObject.auth!.isChangePin!) {
        // navigate to change PIN
        await triggerNavigationEvent(
            context: context, route: profileChangePinRoute);
      } else {
        triggerEvent(loginEvent, context);

        final OnboardingPathConfig path = onboardingPath(state: state);
        dispatch(
          NavigateAction<CoreState>.pushNamedAndRemoveAll(path.route,
              arguments: path.arguments),
        );
      }

      return state;
    } else {
      await captureException(
        errorPhoneLogin,
        error: processedResponse.message,
        response: processedResponse.response.body,
      );
      throw UserException(processedResponse.message);
    }
  }

  @override
  Object? wrapError(dynamic error) {
    if (error.runtimeType == UserException) {
      ScaffoldMessenger.of(context)
          .showSnackBar(snackbar(content: (error as UserException).msg));

      return null;
    }

    return error;
  }
}
