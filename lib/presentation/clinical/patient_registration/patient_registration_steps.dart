import 'package:flutter/material.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/pages/patient_registration_container.dart';

import 'package:bewell_pro_core/presentation/clinical/patient_registration/patient_registration_helper.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/step_item.dart';

import 'package:shared_themes/spaces.dart';

import 'package:shared_themes/colors.dart';

class PatientRegistrationSteps extends StatefulWidget {
  const PatientRegistrationSteps({Key? key}) : super(key: key);

  @override
  _PatientRegistrationStepsState createState() =>
      _PatientRegistrationStepsState();
}

class _PatientRegistrationStepsState extends State<PatientRegistrationSteps> {
  @override
  Widget build(BuildContext context) {
    final PatientRegistrationContainer patientRegContainer =
        PatientRegistrationContainer.of(context)!;

    final Stream<int> stepManager = patientRegContainer.stepManager;
    final List<PatientRegistrationStep> patientSteps =
        patientRegContainer.patientSteps;

    final List<StepItem> steps = patientSteps
        .map(
          (PatientRegistrationStep step) => StepItem(
            patientStep: step,
          ),
        )
        .toList();

    return ListView(
      key: AppWidgetKeys.patientRegStepKey,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(patientRegistrationStep,
                    style: Theme.of(context).textTheme.headline6),
                smallVerticalSizedBox,
                StreamBuilder<int>(
                  stream: stepManager,
                  builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                    final int totalSteps = patientSteps.length;
                    if (snapshot.hasData) {
                      final int currentStep = snapshot.data!;

                      return Text('Step $currentStep of $totalSteps',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontWeight: FontWeight.w400));
                    }

                    return const SizedBox();
                  },
                ),
              ],
            ),
            mediumVerticalSizedBox,
            const Divider(color: grey, height: 1),
            mediumVerticalSizedBox,
            ...steps
          ],
        ),
      ],
    );
  }
}
