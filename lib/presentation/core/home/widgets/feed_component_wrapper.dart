// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:async_redux/async_redux.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:sghi_core/misc_utilities/responsive_widget.dart';
import 'package:sghi_core/user_feed/src/domain/resources/inputs.dart';
import 'package:sghi_core/user_feed/src/domain/value_objects/enums.dart';
import 'package:sghi_core/user_feed/src/presentation/core/feed.dart';
import 'package:sghi_core/user_feed/src/presentation/preloaders/feed_preloaders.dart';

// Project imports:
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/application/redux/actions/user_feed_actions/fetch_user_feed_action.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/presentation/core/widgets/generic_timeout_widget.dart';

/// A wrapper for homepage that handles fetching user's feed, pull to refresh callback and
/// toggles a shimmer animation to provide user with visual feedback when feed is in a loading state
class FeedComponentWrapper extends StatefulWidget {
  final Map<String, Function> feedContentCallbacks;

  const FeedComponentWrapper({required this.feedContentCallbacks});

  @override
  _FeedComponentWrapperState createState() => _FeedComponentWrapperState();
}

class _FeedComponentWrapperState extends State<FeedComponentWrapper> {
  late Stream<dynamic> _feedStream;
  late StreamController<Object> _feedStreamController;

  @override
  void initState() {
    super.initState();
    _feedStreamController = StreamController<Object>.broadcast();
    _feedStream = _feedStreamController.stream;

    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
      final IGraphQlClient _client = AppWrapperBase.of(context)!.graphQLClient;

      StoreProvider.dispatch<CoreState>(
          context,
          FetchUserFeedAction(
              feedStreamController: _feedStreamController, client: _client));

      final StreamView<dynamic> refreshController =
          StreamView<dynamic>(UserFeedStore().refreshFeed.stream);

      refreshController.listen((dynamic value) async {
        if (value is bool && value == true) {
          StoreProvider.dispatch<CoreState>(
            context,
            FetchUserFeedAction(
              feedStreamController: _feedStreamController,
              client: _client,
              refreshFeed: true,
            ),
          );
        }
      });
    });
  }

  @override
  void dispose() {
    _feedStreamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<dynamic>(
      stream: _feedStream,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        /// show feed shimmer before the data is displayed
        if (snapshot.data is Map<String, dynamic> &&
            snapshot.data['data'] != null &&
            snapshot.data['data']['loading'] != null &&
            snapshot.data['data']['loading'] == true) {
          return const FeedLoadingShimmer(
            feedItemShimmerPadding: 0,
            flavor: Flavour.PRO,
            globalActionShimmerHorizontalPadding: 0,
            nudgeShimmerPadding: 0,
          );
        }

        // error checking
        if (snapshot.hasError) {
          final Map<String, dynamic>? error =
              snapshot.error as Map<String, dynamic>?;

          final GenericTimeoutWidget timeoutWidget = GenericTimeoutWidget(
            action: 'fetching your feed',
            recoverRoute: '',
            recoverCallback: () async {
              UserFeedStore().refreshFeed.add(true);
            },
          );

          /// check if the error is a timeout error and return an appropriate widget
          if (error!['error'] == 'timeout') {
            return Center(child: timeoutWidget);
          }

          // other type of error but not a timeout
          return timeoutWidget;
        }
        if (snapshot.hasData) {
          final String profileProgress = checkProfileProgress(context);
          bool isProgressComplete;
          if (profileProgress == '100') {
            isProgressComplete = true;
          } else {
            isProgressComplete = false;
          }

          final FeedResponsePayload payload = FeedResponsePayload.fromJson(
              snapshot.data as Map<String, dynamic>);

          return FeedComponent(
            userFeed: payload,
            flavour: Flavour.PRO,
            profileProgress: profileProgress,
            setupComplete: isProgressComplete,
            isSmallScreen: ResponsiveWidget.isSmallScreen(context),
            feedContentCallbacks: widget.feedContentCallbacks,
          );
        }

        return const FeedLoadingShimmer(
          feedItemShimmerPadding: 0,
          flavor: Flavour.PRO,
          globalActionShimmerHorizontalPadding: 0,
          nudgeShimmerPadding: 0,
        );
      },
    );
  }
}
