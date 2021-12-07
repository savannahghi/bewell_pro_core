// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:intl/intl.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

// Project imports:
import 'package:bewell_pro_core/domain/clinical/entities/patient.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/patient_gender_enum.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/asset_strings.dart';
import 'package:bewell_pro_core/domain/core/value_objects/domain_constants.dart';

class PatientSearchCardInfo extends StatelessWidget {
  const PatientSearchCardInfo({required this.patient});

  final Patient? patient;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(16),
          child: const CircleAvatar(
            radius: 30,
            backgroundColor: patientIDLightCyan,
            backgroundImage: AssetImage(userLightIconUrl),
          ),
        ),
        smallHorizontalSizedBox,
        Flexible(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                toBeginningOfSentenceCase(
                    patient?.name?.first?.text ?? 'no name')!,
                style: TextThemes.veryBoldSize18Text(titleBlack),
                overflow: TextOverflow.clip,
              ),
              const SizedBox(height: 2),
              //patient details
              //Gender
              Row(
                children: <Widget>[
                  //patient search card title
                  Text(genderText,
                      style: TextThemes.normalSize13Text(subtitleGrey)),
                  //patient search card data
                  Text(
                    patient?.gender != null
                        ? describeEnum(patient!.gender!)
                        : describeEnum(PatientGenderEnum.unknown),
                    style: TextThemes.normalSize13Text(subtitleGrey),
                  )
                ],
              ),
              //DOB
              Row(
                children: <Widget>[
                  Text(dateOfBirth,
                      style: TextThemes.normalSize13Text(subtitleGrey)),
                  Text(
                    patient?.birthDate ?? defaultDate,
                    style: TextThemes.normalSize13Text(subtitleGrey),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
