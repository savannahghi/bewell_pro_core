import 'dart:async';
import 'dart:convert';
import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/core/graphql/mutations.dart';
import 'package:bewell_pro_core/application/redux/actions/misc_state_actions/save_event_action.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';
import 'package:bewell_pro_core/application/redux/states/event_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/domain_constants.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:flutter_graphql_client/graph_event_bus.dart';
import 'package:http/http.dart';

/// Posts an event to the backend once triggered
///
/// @params
/// - [IGraphQlClient] the client used to send the event to the backend
/// - [String] eventName; the name of the event
/// - [Map<String, dynamic>] eventPayload; the event payload
class SendEventAction extends ReduxAction<AppState> {
  final IGraphQlClient client;
  final String eventName;
  final Map<String, dynamic> eventPayload;
  final int retryPeriod;

  SendEventAction({
    required this.client,
    required this.eventName,
    required this.eventPayload,
    this.retryPeriod = waitPeriod,
  });

  @override
  Future<AppState?> reduce() async {
    final Map<String, dynamic> _variables = <String, dynamic>{
      'eventName': eventName,
      'payload': eventPayload
    };

    final String? uid = state.userState!.auth!.uid;

    // Send events only when the uid exists in the app state and when the user
    // is logged in
    if (uid != null && uid != UNKNOWN) {
      final Response response = await client.query(
        processEventMutation,
        processEventMutationVariables(
            eventName: eventName, uid: uid, payload: eventPayload),
      );

      client.close();

      if (response.statusCode == 408) return null;

      final Map<String, dynamic> logResponse = client.toMap(response);

      // check for errors here first
      final String? logError = client.parseError(logResponse);

      if (logError != null) return null;

      if (logResponse['data'] != null &&
          logResponse['data']['processEvent'] != true) {
        /// Encode the eventPayload to a string and save the event to state
        dispatch(SaveEventAction(
            eventName: eventName, eventPayload: json.encode(eventPayload)));

        Future<void>.delayed(
          Duration(seconds: retryPeriod),
          () async {
            final EventState? eventState = state.miscState!.eventState;

            final String eventName = eventState!.eventName!;
            final String eventPayload = eventState.eventPayload!;

            final Map<String, dynamic> _payload =
                json.decode(eventPayload) as Map<String, dynamic>;
            dispatch(
              SendEventAction(
                client: client,
                eventName: eventName,
                eventPayload: _payload,
              ),
            );
          },
        );
      } else {
        SaveTraceLog(
          client: client,
          query: processEventMutation,
          data: _variables,
          response: logResponse,
          title: 'Process Event :: $eventName',
        ).saveLog();

        return state;
      }
    }
  }
}
