import 'dart:async';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/core/graphql/mutations.dart';
import 'package:bewell_pro_core/application/core/services/onboarding.dart';
import 'package:bewell_pro_core/application/redux/actions/user_state_actions/batch_update_user_state_action.dart';
import 'package:bewell_pro_core/application/redux/flags/flags.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';
import 'package:bewell_pro_core/domain/core/entities/onboarding_path_config.dart';
import 'package:domain_objects/entities.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:misc_utilities/misc.dart';

class UpdateUserNamesAction extends ReduxAction<AppState> {
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
    dispatch(WaitAction<AppState>.remove(updateNamesFlag));
  }

  @override
  void before() {
    dispatch(WaitAction<AppState>.add(updateNamesFlag));
  }

  @override
  Future<AppState?> reduce() async {
    final IGraphQlClient _client = AppWrapperBase.of(context)!.graphQLClient;

    final Response result =
        await _client.query(updateUserProfileMutation, <String, dynamic>{
      'input': <String, String>{
        'firstName': updatedFirstName,
        'lastName': updatedLastName,
      }
    });

    final Map<String, dynamic> body = _client.toMap(result);

    if (_client.parseError(body) != null) {
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
  }
}
