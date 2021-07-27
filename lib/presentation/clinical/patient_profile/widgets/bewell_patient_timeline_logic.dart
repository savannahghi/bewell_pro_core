import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:bewell_pro_core/application/core/graphql/queries.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/domain/clinical/entities/current_episode.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:bewell_pro_core/domain/core/value_objects/exception_strings.dart';
import 'package:http/http.dart' as http;

/// Wrap all the logic used in class [BeWellPatientTimeline]
///
/// Improves code readability
class BewellPatientTimelineLogic {
// fetch from the network the patient's past visit information
  static Future<bool> getTimeline(
      BuildContext context,
      int count,
      StreamController<dynamic> _timelineStreamController,
      TimelineInfoObject timelineInfoObject) async {
    final IGraphQlClient _client = AppWrapperBase.of(context)!.graphQLClient;

    final EpisodeOfCarePayload? _episode =
        CurrentPatientInEpisode().episodeOfCarePayload.valueOrNull;
    final String? episodeID = _episode?.episodeOfCare?.id;

    if (episodeID != null) {
      final Map<String, dynamic> _variables =
          countTimelineQueryVariables(episodeID, count + 1);

      // toggle loading indicator
      _timelineStreamController.add(<String, dynamic>{'loading': true});

      final http.Response result =
          await _client.query(countTimelineQuery, _variables);

      final Map<String, dynamic> payLoad = _client.toMap(result);
      final String? error = _client.parseError(payLoad);

      // check first for errors
      if (error != null) {
        await captureException(
          errorFetchingPatientTimelineWithCount,
          query: countTimelineQuery,
          error: error,
          response: payLoad,
          variables: _variables,
        );
        _timelineStreamController.addError(<String, dynamic>{'error': error});
        return false;
      }

      if (payLoad['data'] != null) {
        _timelineStreamController.add(payLoad['data']);
        timelineInfoObject.visits
            .add(payLoad['data']['patientTimelineWithCount'] as List<dynamic>);

        /// will return [true] if the number of visits from the backend is more than 5
        final bool apiHasMore = timelineInfoObject.visits.value.length > count;

        timelineInfoObject.apiHasMore.add(apiHasMore);
        return true;
      } else {
        _timelineStreamController.add(null);
        timelineInfoObject.visits.add(<dynamic>[]);
        return false;
      }
    } else {
      return false;
    }
  }

  // check if to show a loading icon when data is being fetched.
  //
  static bool showLoading(AsyncSnapshot<dynamic> snapshot) {
    final dynamic data = snapshot.data;

    if (data['loading'] != null && data['loading'] == true) return true;
    return false;
  }
}
