import 'package:flutter/material.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:misc_utilities/responsive_widget.dart';

import 'package:shared_themes/colors.dart';

class QuickAccessItemWidget extends StatelessWidget {
  const QuickAccessItemWidget({
    required this.reviewName,
    required this.drawerType,
    required this.openPatientExamDrawer,
  });

  final String reviewName;
  final DrawerType drawerType;
  final VoidCallback openPatientExamDrawer;

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = ResponsiveWidget.isSmallScreen(context);

    return GestureDetector(
      key: AppWidgetKeys.openPatientExamDrawerKey,
      onTap: () =>
          this.openPatientExamDrawer(), // openPatientExamDrawer(context),
      child: Container(
        margin: const EdgeInsets.only(top: 16, right: 16),
        padding: isSmallScreen
            ? const EdgeInsets.symmetric(horizontal: 12, vertical: 6)
            : const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
            border: Border.all(color: healthcloudAccentColor.withOpacity(0.5)),
            color: healthcloudAccentColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8)),
        child: Text(
          reviewName,
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: healthcloudAccentColor),
        ),
      ),
    );
  }
}
