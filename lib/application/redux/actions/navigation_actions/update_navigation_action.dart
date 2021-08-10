import 'dart:async';

import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/core/graphql/queries.dart';
import 'package:bewell_pro_core/application/redux/actions/user_state_actions/logout_action.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/login_constants.dart';
import 'package:domain_objects/entities.dart';
import 'package:domain_objects/failures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart' as http;
import 'package:misc_utilities/misc.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/constants.dart';

import 'navigation_action.dart';

class UpdateNavigationAction extends ReduxAction<CoreState> {
  final BuildContext context;
  final bool favouriteUpdate;

  UpdateNavigationAction({
    required this.context,
    required this.favouriteUpdate,
  });

  @override
  void before() {
    super.before();
  }

  @override
  void after() {
    super.after();
  }

  @override
  Future<CoreState?> reduce() async {
    final IGraphQlClient _client = AppWrapperBase.of(context)!.graphQLClient;

    final http.Response result =
        await _client.query(getUserActionsQuery, <String, dynamic>{});

    final Map<String, dynamic> body = _client.toMap(result);

    if (_client.parseError(body) != null ||
        result.statusCode == 500 ||
        body['data'] == null) {
      if (body['errors'][0]['message'] != null) {
        final String code = body['errors'][0]['message']
            .toString()
            .replaceAll(RegExp('[^0-9]'), '');
        if (code == '7') {
          dispatch(LogoutAction());
          throw SILException(cause: 'user_logout', message: logoutMessage);
        }
      }
      final String errorMessage = UserFeedBackTexts.getErrorMessage();

      throw SILException(
          cause: 'update_navigation_error', message: errorMessage);
    }

    final Map<String, dynamic> navigationAsJson = <String, dynamic>{
      'primary': body['data']['fetchUserNavigationActions']['primary'],
      'secondary': body['data']['fetchUserNavigationActions']['secondary']
    };

    final Navigation responseAsObject = Navigation.fromJson(navigationAsJson);

    if (favouriteUpdate) {
      store.dispatch(NavigationAction(
          secondaryActions: responseAsObject.secondaryActions));
    } else {
      final List<NavigationItem> secondaryActions =
          StoreProvider.state<CoreState>(context)!
              .navigationState!
              .secondaryActions!;

      final List<NavigationItem> primaryActions =
          StoreProvider.state<CoreState>(context)!
              .navigationState!
              .primaryActions!;

      int bottomIndex = StoreProvider.state<CoreState>(context)!
          .navigationState!
          .bottomBarSelectedIndex;

      int drawerIndex = StoreProvider.state<CoreState>(context)!
          .navigationState!
          .drawerSelectedIndex;

      final int navigationItemExistsPrimary;
      final int navigationItemExistsSecondary;

      if (bottomIndex > -1) {
        navigationItemExistsPrimary = responseAsObject.primaryActions!
            .indexWhere((NavigationItem element) =>
                element.title == primaryActions[bottomIndex].title);
        navigationItemExistsSecondary = responseAsObject.secondaryActions!
            .indexWhere((NavigationItem element) =>
                element.title == primaryActions[bottomIndex].title);
      } else {
        navigationItemExistsPrimary = responseAsObject.primaryActions!
            .indexWhere((NavigationItem element) =>
                element.title == secondaryActions[drawerIndex].title);
        navigationItemExistsSecondary = responseAsObject.secondaryActions!
            .indexWhere((NavigationItem element) =>
                element.title == secondaryActions[drawerIndex].title);
      }

      //handle navigation of refreshed items
      if (navigationItemExistsPrimary < 0 &&
          navigationItemExistsSecondary < 0) {
        bottomIndex = 0;
        drawerIndex = -1;
      } else if (navigationItemExistsPrimary >= 0) {
        bottomIndex = navigationItemExistsPrimary;
        drawerIndex = -1;
      } else if (navigationItemExistsSecondary >= 0) {
        bottomIndex = -1;
        drawerIndex = navigationItemExistsSecondary;
      }
      store.dispatch(NavigationAction(
        drawerSelectedIndex: drawerIndex,
        bottomBarSelectedIndex: bottomIndex,
        primaryActions: responseAsObject.primaryActions,
        secondaryActions: responseAsObject.secondaryActions,
      ));
    }
  }

  @override
  Object wrapError(dynamic error) async {
    if (error.runtimeType == SILException) {
      if (error.message.toString() == logoutMessage) {
        /// Notify the user he is about to be logged out
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text(logoutMessage),
          duration: const Duration(seconds: kLongSnackBarDuration),
          action: dismissSnackBar('close', white, context),
        ));
        return error;
      } else {
        showErrorSnackbar(context);
      }
    }
    return error;
  }
}
