import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';
import 'package:bewell_pro_core/application/redux/view_models/clinical/patient_profile/patient_profile_view_model.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_connection.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/domain/core/value_objects/events.dart';
import 'package:bewell_pro_core/domain/core/value_objects/type_defs.dart';
import 'package:bewell_pro_core/presentation/clinical/common/helpers.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/bewell_patient_timeline.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/bewell_primary_patient_banner.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/bewell_secondary_patient_banner.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_profile/widgets/start_or_continue_exam_wrapper.dart';
import 'package:bewell_pro_core/presentation/core/home/models/bottom_navigation_bar_items.dart';
import 'package:bewell_pro_core/presentation/core/widgets/app_scaffold.dart';
import 'package:misc_utilities/misc.dart';
import 'package:misc_utilities/responsive_widget.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/constants.dart';
import 'package:shared_themes/spaces.dart';
import 'package:unicons/unicons.dart';

class BewellPatientProfileWidget extends StatefulWidget {
  const BewellPatientProfileWidget({Key? key, required this.onStartVisit})
      : super(key: key);

  final OnStartVisit onStartVisit;

  @override
  _BewellPatientProfileWidgetState createState() =>
      _BewellPatientProfileWidgetState();
}

class _BewellPatientProfileWidgetState
    extends State<BewellPatientProfileWidget> {
  /// Whether the practitioner can request for more visits
  bool? canRequestMore;

  /// Whether to show the "Request Access To All Past Visits" in the patient's
  /// profile
  bool showFab = true;

  TimelineInfoObject timelineInfoObject = TimelineInfoObject();

  /// Stores the current number of visits
  int visitsCount = 0;

  final CurrentPatientInEpisode _current = CurrentPatientInEpisode();

  @override
  void didChangeDependencies() {
    final PatientConnection? _patientConn =
        _current.patientConnection.valueOrNull;

    final String? patientId = _patientConn?.edges?.first?.node?.id;

    if (patientId != null) {
      if (TimelineInfoObject().patientsWithGrantedAccess.contains(patientId)) {
        TimelineInfoObject().showAll.add(TimelineInfoObject().showAll.value);
      } else {
        TimelineInfoObject().patientsWithGrantedAccess.add(patientId);
        TimelineInfoObject().showAll.add(false);
      }
    }

    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    _current.fullAccess.listen((bool value) {
      timelineInfoObject.showAll.add(value);
    });

    /// Cascade through the timeline object and set the relevant listeners
    timelineInfoObject
      ..visits.listen((List<dynamic> value) {
        if (mounted) {
          setState(() {
            visitsCount = value.length;
          });
        }
      })
      ..showAll.listen((bool value) {
        if (mounted) {
          setState(() {
            showFab = !value;
          });
        }
      })
      ..apiHasMore.listen((bool value) {
        if (mounted) {
          setState(() {
            canRequestMore = value && !showFab;
          });
        }
      });

    SnackBarListenersChangeObject().onCloseSummaryListener.listen((bool value) {
      if (value is bool && value == true) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: black,
          content: Text(
            examCompletedString,
            style:
                Theme.of(context).textTheme.bodyText1!.copyWith(color: white),
          ),
          duration: const Duration(seconds: kShortSnackBarDuration),
          action: dismissSnackBar(okThanksString, white, context),
        ));
        SnackBarListenersChangeObject().onCloseSummaryListener.add(false);
      }
    });
  }

  Future<void> requestAccessToPastVisits() async {
    publishEvent(requestAccessToPastVisitsEvent, context);
    startVisitDialog(context, widget.onStartVisit);
  }

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = SILResponsiveWidget.isSmallScreen(context);

    return StoreConnector<AppState, PatientProfileViewModel>(
      converter: (Store<AppState> store) =>
          PatientProfileViewModel.fromStore(store),
      builder: (BuildContext context, PatientProfileViewModel vm) {
        final Patient? patientDetail = vm.patient;
        String patientName = noNameString;

        if (patientDetail != null) {
          final String? name = patientDetail.name?.first?.text;

          if (name != null && name.isNotEmpty) {
            patientName = name;
          }
        }

        final bool showFloatingActionButton = showFab && (visitsCount + 1) > 5;
        return AppScaffold(
          currentBottomNavIndex: BottomNavIndex.patients.index,
          body: ListView(
            shrinkWrap: true,
            children: <Widget>[
              BeWellPrimaryPatientBanner(),
              Padding(
                padding: isSmallScreen
                    ? const EdgeInsets.symmetric(vertical: 5)
                    : const EdgeInsets.only(top: 10.0, right: 20.0, left: 20.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      /// Add continue exam button here
                      StartOrContinueExamWrapper(
                          patientName: patientName.split(' ').first),
                      BeWellSecondaryPatientBanner(),
                      BeWellPatientTimeline(),
                    ],
                  ),
                ),
              ),
            ],
          ),
          floatingActionButton: showFloatingActionButton
              ? FloatingActionButton.extended(
                  key: AppWidgetKeys.requestAccessVisitsKey,
                  label: Row(
                    children: <Widget>[
                      Text(
                        requestAccessToPastVisitString,
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            color: white, fontWeight: FontWeight.bold),
                      ),
                      verySmallHorizontalSizedBox,
                      const Icon(UniconsLine.cloud_lock, color: white)
                    ],
                  ),
                  backgroundColor: healthcloudPrimaryColor,
                  elevation: 4,
                  onPressed: () => requestAccessToPastVisits(),
                )
              : null,
        );
      },
    );
  }
}
