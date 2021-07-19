import 'package:flutter/material.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_connection.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/domain/core/value_objects/type_defs.dart';
import 'package:bewell_pro_core/presentation/clinical/common/helpers.dart';
import 'package:shared_themes/colors.dart';
import 'package:misc_utilities/responsive_widget.dart';
import 'package:shared_ui_components/buttons.dart';
import 'package:shared_ui_components/platform_loader.dart';

/// Start or Continue a visit for a patient
class StartContinueVisitWidget extends StatefulWidget {
  const StartContinueVisitWidget({
    this.patientEdge,
    required this.startVisit,
    required this.continueVisit,
    required this.isWaiting,
  });

  final PatientEdge? patientEdge;

  // continue a visit
  final void Function(BuildContext context) continueVisit;

  /// used to toggle the loading indicator
  final bool isWaiting;

  // start a visit
  final OnStartVisit startVisit;

  @override
  State createState() => _StartContinueVisitState();
}

class _StartContinueVisitState extends State<StartContinueVisitWidget> {
  @override
  Widget build(BuildContext context) {
    final bool hasOpenEpisodes = widget.patientEdge?.hasOpenEpisodes ?? false;
    final bool isSmallScreen = SILResponsiveWidget.isSmallScreen(context);

    return Stack(
      children: <Widget>[
        SizedBox(
          width: isSmallScreen ? double.infinity : null,
          child: SILPrimaryButton(
            customPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            buttonKey: hasOpenEpisodes
                ? AppWidgetKeys.continueVisitKey
                : AppWidgetKeys.startVisitKey,
            onPressed: hasOpenEpisodes
                ? () => widget.continueVisit(context)
                : () => startVisitDialog(context, widget.startVisit),
            buttonColor: healthcloudPrimaryColor.withOpacity(0.3),
            text: hasOpenEpisodes ? continueVisitText : startVisitText,
            textColor: healthcloudPrimaryColor,
            borderColor: healthcloudPrimaryColor.withOpacity(0.5),
          ),
        ),

        // show a loading indicator
        if (widget.isWaiting) const SILPlatformLoader(),
      ],
    );
  }
}
