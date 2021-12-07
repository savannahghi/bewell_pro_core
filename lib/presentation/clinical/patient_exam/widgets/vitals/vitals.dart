// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:misc_utilities/misc.dart';
import 'package:shared_ui_components/platform_loader.dart';

// Project imports:
import 'package:bewell_pro_core/application/core/graphql/queries.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_connection.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_vital.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/vitals/bewell_vital_card.dart';
import 'package:bewell_pro_core/presentation/core/widgets/generic_timeout_widget.dart';

/// Renders stats on already recorded patient vitals
/// Or empty vital cards ([BeWellVitalCard]) that offer mechanism to enter patient vitals
class Vitals extends StatefulWidget {
  @override
  _VitalsState createState() => _VitalsState();
}

class _VitalsState extends State<Vitals> {
  AddVitalsObject addVitalsObject = AddVitalsObject();
  late StreamView<dynamic> refreshController;

  late Stream<dynamic> _vitalsStream;
  late StreamController<dynamic> _vitalsStreamController;

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance!.addPostFrameCallback((Duration timeStamp) async {
      await fetchPatientVitals(_vitalsStreamController, context);
    });
    refreshController.listen((dynamic value) async {
      if (value is bool && value == true) {
        await fetchPatientVitals(_vitalsStreamController, context);
      }
    });

    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();

    // Clear all the vitals before populating them again.
    // This helps to check for the ones not available in case they were deleted
    addVitalsObject.reset();

    _vitalsStreamController = StreamController<dynamic>.broadcast();
    _vitalsStream = _vitalsStreamController.stream;

    refreshController =
        StreamView<dynamic>(ExamChangeObject().onAddVitalListener.stream);
  }

  /// Fetches the latest patient vitals
  Future<void> fetchPatientVitals(
    StreamController<dynamic> _vitalsStreamController,
    BuildContext context,
  ) async {
    final PatientInfo patientInfo = getPatientInfo();

    this.addVitalsObject
      ..patientRef.add(patientInfo.patientReference)
      ..encounterRef.add(patientInfo.encounterReference);

    /// findVitalsQuery variables
    final Map<String, dynamic> _variables = <String, dynamic>{
      'params': <String, dynamic>{
        'patient': patientInfo.patientReference,
        'encounter': patientInfo.encounterReference,
      }
    };

    await genericFetchFunction(
      streamController: _vitalsStreamController,
      context: context,
      queryString: findVitalsQuery,
      variables: _variables,
      logTitle: 'Vitals',
      logDescription: 'Fetch patient\'s vitals',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
      child: StreamBuilder<dynamic>(
        stream: _vitalsStream,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            final Map<String, dynamic>? error =
                snapshot.error as Map<String, dynamic>?;

            final Widget timeoutWidget = Center(
              child: GenericTimeoutWidget(
                action: 'fetching the patient\'s vitals',
                recoverRoute: '',
                recoverCallback: () async {
                  await fetchPatientVitals(_vitalsStreamController, context);
                },
              ),
            );

            /// check if the error is a timeout error and return an appropriate widget
            if (error!['error'] == 'timeout') {
              return Center(child: timeoutWidget);
            }

            // other type of error but not a timeout
            return timeoutWidget;
          }

          if (snapshot.hasData) {
            //show the loader before data is displayed
            if (snapshot.data['loading'] != null &&
                snapshot.data['loading'] == true) {
              return Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: const SILPlatformLoader());
            }

            final Map<String, dynamic> payload =
                snapshot.data as Map<String, dynamic>;

            final dynamic edges = payload['searchFHIRObservation']['edges'];

            final List<dynamic> patientVitals =
                edges == null ? <dynamic>[] : edges as List<dynamic>;

            if (patientVitals.isNotEmpty) {
              /// Enable view summary button
              ViewSummaryStore().viewSummaryButton.add(true);

              final List<Map<String, dynamic>> vitals = patientVitals
                  .map((dynamic e) => e['node'])
                  .toList()
                  .cast<Map<String, dynamic>>();

              /// Loop through all the vitals as we update their respective objects
              vitals.map(
                (Map<String, dynamic> vital) {
                  final PatientVital patientVital =
                      PatientVital.fromJson(vital);
                  final String? vitalText = patientVital.vitalText;
                  return VitalType.values.map((VitalType vitalType) {
                    if (vitalText == vitalType.clinicalFullName) {
                      vitalType.updateBehaviorSubject.add(patientVital);
                    }
                  }).toList();
                },
              ).toList();

              return Wrap(
                children: <Widget>[
                  ...VitalType.values
                      .where((VitalType value) =>
                          value.fullName !=
                          VitalType.diastolicBloodPressure.fullName)
                      .toList()
                      .map(
                        (VitalType vital) => BeWellVitalCard(
                          imgPath: vital.iconUrl,
                          patientVital: vital.updateBehaviorSubject.value,
                          vitalText: vital.fullName,
                          unit: vital.unit,
                        ),
                      ),
                ],
              );
            } else {
              return Wrap(
                children: <Widget>[
                  ...VitalType.values
                      .where((VitalType value) =>
                          value.fullName !=
                          VitalType.diastolicBloodPressure.fullName)
                      .toList()
                      .map(
                        (VitalType vital) => BeWellVitalCard(
                          imgPath: vital.iconUrl,
                          patientVital: PatientVital.initial(),
                          vitalText: vital.fullName,
                          unit: vital.unit,
                        ),
                      ),
                ],
              );
            }
          }
          return const SizedBox();
        },
      ),
    );
  }
}
