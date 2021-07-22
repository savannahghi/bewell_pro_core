import 'package:flutter/material.dart';
import 'package:bewell_pro_core/application/core/graphql/queries.dart';
import 'package:bewell_pro_core/domain/clinical/entities/current_episode.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/start_continue_exam_banner.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:flutter_graphql_client/graph_event_bus.dart';

class StartOrContinueExamWrapper extends StatefulWidget {
  final String patientName;

  const StartOrContinueExamWrapper({required this.patientName});
  @override
  _HCStartExamButtonState createState() => _HCStartExamButtonState();
}

class _HCStartExamButtonState extends State<StartOrContinueExamWrapper> {
  final BehaviorSubject<bool> shouldContinueExam =
      BehaviorSubject<bool>.seeded(false);
  final BehaviorSubject<bool> checking = BehaviorSubject<bool>.seeded(true);

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance!.addPostFrameCallback((Duration timeStamp) async {
      await Future<dynamic>.delayed(Duration.zero).then((dynamic value) {
        searchExistingExams(context);
      });
    });
    super.didChangeDependencies();
  }

  /// Searches for existing exams
  Future<void> searchExistingExams(BuildContext context) async {
    this.checking.add(true);

    final IGraphQlClient _client = AppWrapperBase.of(context)!.graphQLClient;

    final EpisodeOfCarePayload _episode =
        CurrentPatientInEpisode().episodeOfCarePayload.value;

    final Map<String, dynamic> _variables = <String, dynamic>{
      'params': <String, dynamic>{
        'episode-of-care': 'EpisodeOfCare/${_episode.episodeOfCare!.id}',
        'status': 'in-progress',
        '_count': '1',
        '_sort': '-_last_updated'
      }
    };

    final http.Response result =
        await _client.query(searchEncounterQuery, _variables);

    final Map<String, dynamic> payload = _client.toMap(result);

    SaveTraceLog(
            client: AppWrapperBase.of(context)!.graphQLClient,
            query: searchEncounterQuery,
            data: _variables,
            response: payload,
            title: 'Search encounters')
        .saveLog();

    if (payload['data'] == null) {
      this.checking.add(false);
      this.shouldContinueExam.add(false);
      setState(() {});
      return;
    }

    if (payload['data']['searchFHIREncounter'] == null) {
      this.checking.add(false);
      this.shouldContinueExam.add(false);
      setState(() {});
      return;
    }

    if (payload['data']['searchFHIREncounter']['edges'] == null) {
      this.checking.add(false);
      this.shouldContinueExam.add(false);
      setState(() {});
      return;
    }

    if (payload['data']['searchFHIREncounter']['edges'][0]['node'] == null) {
      this.checking.add(false);
      this.shouldContinueExam.add(false);
      setState(() {});
      return;
    }

    final dynamic edge = payload['data']['searchFHIREncounter']['edges'][0];

    CurrentPatientInEpisode().encounterID.add(edge['node']['ID'].toString());
    this.checking.add(false);
    this.shouldContinueExam.add(true);
    // rebuild widget
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return StartOrContinueExamBanner(
      isChecking: this.checking.value,
      shouldContinueExam: this.shouldContinueExam.value,
      patientName: widget.patientName,
    );
  }
}
