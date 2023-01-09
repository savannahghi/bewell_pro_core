// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:async_redux/async_redux.dart';
import 'package:sghi_core/domain_objects/entities/bio_data.dart';
import 'package:sghi_core/domain_objects/entities/user_profile.dart';
import 'package:sghi_core/domain_objects/value_objects/name.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:http/http.dart';
import 'package:sghi_core/misc_utilities/misc.dart';

// Project imports:
import 'package:bewell_pro_core/application/core/graphql/mutations.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/application/core/services/onboarding.dart';
import 'package:bewell_pro_core/application/redux/actions/user_state_actions/batch_update_user_state_action.dart';
import 'package:bewell_pro_core/application/redux/flags/flags.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/entities/onboarding_path_config.dart';

class UpdateUserNamesAction extends ReduxAction<CoreState> {
  UpdateUserNamesAction({
    required this.context,
    required this.updatedFirstName,
    required this.updatedLastName,
  });

  final BuildContext context;
  final String updatedFirstName;
  final String updatedLastName;

  @override
  void after() {
    dispatch(WaitAction<CoreState>.remove(updateNamesFlag));
  }

  @override
  void before() {
    dispatch(WaitAction<CoreState>.add(updateNamesFlag));
  }

  @override
  Future<CoreState?> reduce() async {
    final IGraphQlClient _client = AppWrapperBase.of(context)!.graphQLClient;

    final Map<String, dynamic> queryVariables = <String, dynamic>{
      'input': <String, String>{
        'firstName': updatedFirstName,
        'lastName': updatedLastName,
      }
    };

    final Response result =
        await _client.query(updateUserProfileMutation, queryVariables);

    final Map<String, dynamic> body = _client.toMap(result);

    final String? requestError = _client.parseError(body);

    if (requestError != null) {
      captureException(
        requestError,
        query: updateUserProfileMutation,
        variables: queryVariables,
        response: body,
        error: requestError,
      );

      // parse these errors properly
      showErrorSnackbar(context);
      return null;
    }

    // update user state
    dispatch(
      BatchUpdateUserStateAction(
        userProfile: UserProfile(
          userBioData: BioData(
            firstName: Name.withValue(updatedFirstName),
            lastName: Name.withValue(updatedLastName),
          ),
        ),
      ),
    );

    final OnboardingPathConfig path = onboardingPath(state: state);

    await Navigator.of(context).pushReplacementNamed(path.route);
    return null;
  }
}
