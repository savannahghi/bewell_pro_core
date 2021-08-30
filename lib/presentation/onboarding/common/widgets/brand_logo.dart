import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:flutter/material.dart';
import 'package:misc_utilities/responsive_widget.dart';

class BrandLogo extends StatelessWidget {
  final String appLogo = AppBrand().appLogo.value;

  @override
  Widget build(BuildContext context) {
    final bool isLargeScreen = ResponsiveWidget.isLargeScreen(context);
    final double dimension = isLargeScreen ? 120 : 50;
    return SizedBox(
      width: dimension,
      height: dimension,
      child: Image.asset(
        appLogo,
      ),
    );
  }
}
