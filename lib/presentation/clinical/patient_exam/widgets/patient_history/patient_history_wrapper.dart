import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:bewell_pro_core/domain/clinical/entities/fhir.dart';

import 'package:bewell_pro_core/domain/clinical/entities/patient_connection.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';

import 'package:bewell_pro_core/presentation/clinical/patient_exam/models/exam_composition.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_examination/utils/patient_exam_utils.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_exam/widgets/patient_history/patient_history_form.dart';

import 'package:shared_themes/spaces.dart';

import 'package:shared_themes/colors.dart';
import 'package:shared_ui_components/platform_loader.dart';

class PatientHistoryWrapper extends StatefulWidget {
  @override
  _PatientHistoryWrapperState createState() => _PatientHistoryWrapperState();
}

class _PatientHistoryWrapperState extends State<PatientHistoryWrapper> {
  late StreamController<dynamic> _patientHistoryStreamController;
  late Stream<dynamic> _patientHistoryStream;
  final ExamCompositionObject examComposition = ExamCompositionObject();

  @override
  void initState() {
    super.initState();
    _patientHistoryStreamController = StreamController<dynamic>.broadcast();
    _patientHistoryStream = _patientHistoryStreamController.stream;

    WidgetsBinding.instance!.addPostFrameCallback((Duration timeStamp) async {
      await fetchCompositionData(
        streamController: this._patientHistoryStreamController,
        context: context,
        compositionTitle: CompositionTypeTitle.patientHistory,
      );

      final StreamView<dynamic> refreshController = StreamView<dynamic>(
          ExamChangeObject().onAddPatientHistoryListener.stream);

      refreshController.listen((dynamic value) async {
        if (value is bool && value == true) {
          await fetchCompositionData(
            streamController: this._patientHistoryStreamController,
            context: context,
            compositionTitle: CompositionTypeTitle.patientHistory,
          );
        }
      });
    });
  }

  @override
  void dispose() {
    _patientHistoryStreamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<dynamic>(
      stream: _patientHistoryStream,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasError) {
          return SizedBox(
            width: 400,
            child: Center(
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  const Icon(
                    Icons.search,
                    size: 80.0,
                    color: healthcloudPrimaryColor,
                  ),
                  mediumVerticalSizedBox,
                  Text(
                    couldNotFindSnapshotError,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle2,
                  )
                ],
              ),
            ),
          );
        }

        if (snapshot.hasData) {
          /// Show the loader before data is displayed
          if (snapshot.data is Map) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: SILPlatformLoader(),
            );
          } else if (snapshot.data is Composition) {
            final Composition composition = snapshot.data as Composition;

            if (composition.section != null) {
              examComposition.generalCompositionID.add(composition.id);

              final List<Section?>? section = composition.section;

              final String? encodedDiv = section?.first?.text?.div;

              final Map<String, dynamic> decodedPatientHistoryData =
                  json.decode(encodedDiv!) as Map<String, dynamic>;

              /// Enable view summary button
              ViewSummaryStore().viewSummaryButton.add(true);

              return Column(
                children: <Widget>[
                  PatientHistoryForm(
                    patientHistoryPayload:
                        PatientHistoryData.fromJson(decodedPatientHistoryData),
                  ),
                ],
              );
            }
          }
        }

        /// Just a dumb empty space
        return PatientHistoryForm();
      },
    );
  }
}
