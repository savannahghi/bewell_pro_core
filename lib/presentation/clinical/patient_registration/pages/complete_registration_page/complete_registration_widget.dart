import 'package:flutter/material.dart';
import 'package:bewell_pro_core/application/clinical/patient_registration/patient_payload_helper.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_payload.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/domain/core/value_objects/asset_strings.dart';
import 'package:bewell_pro_core/domain/core/value_objects/type_defs.dart';
import 'package:bewell_pro_core/presentation/clinical/common/helpers.dart';
import 'package:bewell_pro_core/presentation/clinical/patient_registration/pages/patient_registration_container.dart';
import 'package:bewell_pro_core/presentation/clinical/theme/form_styles.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';
import 'package:misc_utilities/responsive_widget.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_ui_components/buttons.dart';

class CompleteRegistrationWidget extends StatelessWidget {
  const CompleteRegistrationWidget(
      {Key? key, required this.onStartVisit, required this.updatePatientRecord})
      : super(key: key);

  final OnStartVisit onStartVisit;
  final void Function(PatientPayload) updatePatientRecord;

  Future<void> _startVisit(BuildContext context) async {
    final PatientPayloadHelper patient =
        PatientRegistrationContainer.of(context)!.currentPatient;

    if (patient.patientPayload != null) {
      updatePatientRecord(patient.patientPayload!);
    }

    startVisitDialog(context, onStartVisit);
  }

  @override
  Widget build(BuildContext context) {
    final double imageHeight =
        ResponsiveWidget.isSmallScreen(context) ? 100 : 250;
    return Center(
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: <Widget>[
          Container(
            padding: ResponsiveWidget.isSmallScreen(context)
                ? const EdgeInsets.fromLTRB(50, 50, 50, 20)
                : const EdgeInsets.only(top: 20),
            child: Image(
              image: const AssetImage(checkIconUrl),
              color: healthcloudAccentColor,
              height: imageHeight,
              width: imageHeight,
            ),
          ),
          Column(
            children: <Widget>[
              mediumVerticalSizedBox,
              Container(
                alignment: Alignment.center,
                child: Text(
                  patientRegSuccessMsg,
                  style: PatientStyles.registerPatientSectionTitle,
                  textAlign: TextAlign.center,
                ),
              ),
              mediumVerticalSizedBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SILSecondaryButton(
                    onPressed: () => Navigator.of(context)
                        .pushNamed(patientIdentificationRoute),
                    text: silButtonCancel,
                    buttonColor: transparent,
                    textColor: healthcloudAccentColor,
                  ),
                  largeHorizontalSizedBox,
                  SILPrimaryButton(
                    buttonKey:
                        AppWidgetKeys.completeRegistrationAndStartVisitKey,
                    onPressed: () => _startVisit(context),
                    buttonColor: healthcloudAccentColor,
                    text: startVisitTitle,
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
