import 'package:flutter/material.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';

import 'package:shared_themes/colors.dart';
import 'package:shared_ui_components/buttons.dart';

class CompleteButton extends StatefulWidget {
  const CompleteButton({Key? key, required this.buttonText}) : super(key: key);

  final String buttonText;

  @override
  _CompleteButtonState createState() => _CompleteButtonState();
}

class _CompleteButtonState extends State<CompleteButton> {
  bool isActive = false;
  @override
  void initState() {
    ViewSummaryStore().viewSummaryButton.listen((dynamic value) {
      if (value is bool && mounted) {
        setState(() {
          isActive = value;
        });
      }
    });

    super.initState();
  }

  void addItemsToPatientExamFunction(BuildContext context) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
          const SnackBar(content: Text(addItemsToPatientExamPrompt)));
  }

  @override
  Widget build(BuildContext context) {
    return SILPrimaryButton(
      buttonKey: AppWidgetKeys.completeButtonKey,
      buttonColor: healthcloudPrimaryColor,
      onPressed: isActive
          ? () => triggerNavigationEvent(
              context: context, route: patientExamSummaryPageRoute)
          : () => addItemsToPatientExamFunction(context),
      text: widget.buttonText,
    );
  }
}
