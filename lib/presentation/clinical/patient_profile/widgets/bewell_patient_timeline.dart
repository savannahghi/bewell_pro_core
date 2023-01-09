// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:sghi_core/misc_utilities/responsive_widget.dart';
import 'package:sghi_core/shared_themes/colors.dart';
import 'package:sghi_core/shared_themes/spaces.dart';
import 'package:sghi_core/ui_components/src/platform_loader.dart';

// Project imports:
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/generic_zero_state.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/bewell_patient_timeline_logic.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/load_more_timeline_records.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/patient_timeline_record.dart';

/// patient's past visits
class BeWellPatientTimeline extends StatefulWidget {
  @override
  _BeWellPatientTimelineState createState() => _BeWellPatientTimelineState();
}

class _BeWellPatientTimelineState extends State<BeWellPatientTimeline> {
  late int count;
  late String filterOption;
  TimelineInfoObject timelineInfoObject = TimelineInfoObject();

  late Stream<dynamic> _timelineStream;
  late StreamController<dynamic> _timelineStreamController;

  @override
  void initState() {
    super.initState();

    _timelineStreamController = StreamController<dynamic>.broadcast();
    _timelineStream = _timelineStreamController.stream;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    count = timelineInfoObject.visits.value.length;
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) async {
      await getTimeline();
    });
  }

  Future<bool> getTimeline() async {
    setState(() {
      count = count + 5;
    });

    return BewellPatientTimelineLogic.getTimeline(
        context, count, _timelineStreamController, timelineInfoObject);
  }

  @override
  Widget build(BuildContext context) {
    final bool isLargeScreenDevice = ResponsiveWidget.isLargeScreen(context);
    return StreamBuilder<dynamic>(
      stream: _timelineStream,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasError) {
          return Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            decoration:
                BoxDecoration(border: Border.all(color: grey.withOpacity(0.4))),
            child: Column(
              children: <Widget>[
                size15VerticalSizedBox,
                Text(
                  errorOccurred,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1,
                )
              ],
            ),
          );
        }

        if (snapshot.hasData) {
          //show the loader before data is displayed
          if (BewellPatientTimelineLogic.showLoading(snapshot)) {
            return Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              decoration: BoxDecoration(
                  border: Border.all(color: grey.withOpacity(0.4))),
              child: const SILPlatformLoader(),
            );
          }

          // patient has no past visits.
          //  show a message that patient has no records of past visits.
          if (timelineInfoObject.visits.value.isEmpty) {
            return Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 40),
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              decoration: BoxDecoration(
                  border: Border.all(color: grey.withOpacity(0.4))),
              child: const GenericZeroStateWidget(
                  title: noVisits, subtitle: noPreviousVisits),
            );
          }

          // show past visits
          return Padding(
            padding: EdgeInsets.all(isLargeScreenDevice ? 40.0 : 8.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(patientTimelineText,
                          style: isLargeScreenDevice
                              ? Theme.of(context).textTheme.headline6
                              : Theme.of(context).textTheme.headline6),
                    ],
                  ),
                  if (isLargeScreenDevice)
                    size40VerticalSizedBox
                  else
                    mediumVerticalSizedBox,
                  for (dynamic visit in timelineInfoObject.showAll.value
                      ? timelineInfoObject.visits.value
                      : timelineInfoObject.visits.value.take(5)) ...<Widget>[
                    PatientTimelineRecord(visit: visit),
                    veryLargeVerticalSizedBox,
                  ],
                  if (timelineInfoObject.apiHasMore.value &&
                      timelineInfoObject.showAll.value)
                    LoadMoreTimelineRecords(
                      callback: getTimeline,
                      count: timelineInfoObject.visits.value.length,
                    ),
                  veryLargeVerticalSizedBox,
                  mediumVerticalSizedBox
                ],
              ),
            ),
          );
        }

        /// returned when the data is null. This is because if the data is null,
        /// a null is added to the [_timelineStreamController] and when
        /// [snapshot.hasData] is checked, it will return false
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 40),
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          decoration:
              BoxDecoration(border: Border.all(color: grey.withOpacity(0.4))),
          child: const GenericZeroStateWidget(
              title: noVisits, subtitle: noPreviousVisits),
        );
      },
    );
  }
}
