// Dart imports:
import 'dart:async';
import 'dart:convert';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:sghi_core/domain_objects/value_objects/unknown.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:http/http.dart';

// Project imports:
import 'package:bewell_pro_core/application/core/graphql/queries.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/application/redux/actions/user_feed_actions/save_user_feed_action.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/exception_strings.dart';

/// A [ReduxAction] used to fetch user's feed.
/// Retrieves the current feed from state and passes the data to
///  [feedStreamController]
/// 1. => Incase the retrieved userFeed is UNKNOWN or the feed is to be
///       refreshed;
///       - A query is made to get new feed
///       - Happy Case: Feed data is encoded into a string and
///             [SaveUserFeedAction] is triggered to store feedState
///       - Pass the feed to the stream controller directly
/// 2. => Incase the retrieved userFeed is not UNKNOWN or doesn't
///       require refresh;
///       - Retrieved userFeed is decoded
///       - Feed is then passed directly to feed stream controller
class FetchUserFeedAction extends ReduxAction<CoreState> {
  FetchUserFeedAction({
    required this.feedStreamController,
    required this.client,
    this.refreshFeed = false,
  });

  final IGraphQlClient client;
  final StreamController<dynamic> feedStreamController;
  final bool refreshFeed;

  @override
  Future<CoreState?> reduce() async {
    feedStreamController.add(<String, dynamic>{
      'data': <String, dynamic>{'loading': true}
    });

    /// Retrieve the current user feed from state
    final String userFeedState = store.state.userFeedState!.userFeed!;

    /// Check if the feed is UNKNOWN or requires refresh
    if (userFeedState == UNKNOWN || refreshFeed == true) {
      final Map<String, dynamic> variables = getFeedQueryVariables();

      /// Make an API call and fetch the user feed
      final Response response =
          await client.query(getFeedContentQuery, variables);

      /// close the client once processing is done
      client.close();

      /// Handle timeout
      if (response.statusCode == 408) {
        feedStreamController.addError(<String, dynamic>{'error': 'timeout'});
        return null;
      }

      final Map<String, dynamic> body = client.toMap(response);

      final String? error = client.parseError(body);

      /// Check for errors in the data
      if (error != null) {
        await captureException(
          errorFetchingUserFeed,
          query: getFeedContentQuery,
          error: error,
          response: body,
          variables: variables,
        );
        feedStreamController.addError(<String, dynamic>{'error': error});
        return null;
      }

      /// Encode the feed to a string
      final String encodedUserFeedState = json.encode(body);

      /// Save the feed to state
      /// Dispatches [SaveUserFeedAction] to store the [encodedUserFeedState]
      dispatch(SaveUserFeedAction(feed: encodedUserFeedState));

      /// Pass the feed to the stream controller directly
      feedStreamController.add(body);

      /// Reset the user feed listener
      UserFeedStore().refreshFeed.add(false);

      return state;
    } else {
      /// The feed is available from state, decode it and add it to the
      /// streamController
      final Map<String, dynamic> decodedFeed =
          json.decode(userFeedState) as Map<String, dynamic>;

      /// Pass it to the stream controller directly
      feedStreamController.add(decodedFeed);
      return null;
    }
  }
}
