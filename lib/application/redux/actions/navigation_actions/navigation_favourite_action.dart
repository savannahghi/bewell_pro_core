// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:async_redux/async_redux.dart';
import 'package:sghi_core/domain_objects/entities/navigation_item.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:http/http.dart' as http;
import 'package:sghi_core/misc_utilities/misc.dart';
import 'package:sghi_core/shared_themes/colors.dart';
import 'package:sghi_core/shared_themes/constants.dart';

// Project imports:
import 'package:bewell_pro_core/application/core/graphql/mutations.dart';
import 'package:bewell_pro_core/application/redux/actions/navigation_actions/update_navigation_action.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';

class NavigationFavouriteAction extends ReduxAction<CoreState> {
  final String title;
  final BuildContext context;
  final NavigationItem navigationItem;
  final String flag;

  NavigationFavouriteAction({
    required this.title,
    required this.context,
    required this.navigationItem,
    required this.flag,
  });

  @override
  void before() {
    dispatch(WaitAction<CoreState>.add(flag));
    super.before();
    final bool navigationItemIsFavourite = navigationItem.isFavourite!;

    /// Notify the user the action is being favourited or removed
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        content: Text(() {
          if (navigationItemIsFavourite) {
            return favouriteRemoveActionFeedback(title);
          } else {
            return favouriteAddActionFeedback(title);
          }
        }()),
        duration: const Duration(seconds: kLongSnackBarDuration),
        action: dismissSnackBar('close', white, context),
      ));
  }

  @override
  void after() {
    dispatch(WaitAction<CoreState>.remove(flag));
    super.after();
    final bool navigationItemIsFavourite = navigationItem.isFavourite!;
    final String message = navigationItemIsFavourite
        ? favouriteRemoveActionDone(title).toString()
        : favouriteAddActionDone(title).toString();

    /// Notify the user once completion
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Future<CoreState?> reduce() async {
    final IGraphQlClient _client = AppWrapperBase.of(context)!.graphQLClient;

    final bool navigationItemIsFavourite = navigationItem.isFavourite!;

    http.Response result;

    if (!navigationItemIsFavourite) {
      result = await _client.query(saveFavouriteNavigationActionMutation,
          updateFavouriteNavigationAction(title));
    } else {
      result = await _client.query(removeFavouriteNavigationActionMutation,
          updateFavouriteNavigationAction(title));
    }

    final Map<String, dynamic> body = _client.toMap(result);

    _client.close();

    if (_client.parseError(body) != null ||
        result.statusCode == 500 ||
        body['data'] == null) {
      showErrorSnackbar(context);
      return state;
    }

    store.dispatch(
        UpdateNavigationAction(context: context, favouriteUpdate: true));

    return state;
  }
}
