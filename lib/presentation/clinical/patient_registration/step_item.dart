// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:sghi_core/shared_themes/colors.dart';

// Project imports:
import 'package:bewell_pro_core/presentation/clinical/patient_registration/pages/patient_registration_container.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/patient_registration_helper.dart';

class StepItem extends StatelessWidget {
  final PatientRegistrationStep patientStep;

  const StepItem({Key? key, required this.patientStep}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PatientRegistrationContainer patientRegContainer =
        PatientRegistrationContainer.of(context)!;

    final Stream<int> stepManager = patientRegContainer.stepManager;

    return StreamBuilder<int>(
      stream: stepManager,
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        const Color accentColor = healthcloudAccentColor;
        final TextTheme textTheme = Theme.of(context).textTheme;
        final bool isActive = patientStep.stepNumber == snapshot.data;

        return Padding(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                child: Text(
                  patientStep.title,
                  style: isActive
                      ? textTheme.headline6!.copyWith(
                          color: accentColor, fontWeight: FontWeight.w500)
                      : textTheme.headline6!
                          .copyWith(fontWeight: FontWeight.w500),
                ),
              ),
              CircleAvatar(
                backgroundColor: isActive ? accentColor : Colors.grey[300],
                radius: 31,
                child: CircleAvatar(
                  backgroundColor: isActive ? accentColor : white,
                  radius: 30,
                  child: Text(
                    '${patientStep.stepNumber}',
                    style: textTheme.headline4!.copyWith(
                      color: isActive ? Colors.white : Colors.black45,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
