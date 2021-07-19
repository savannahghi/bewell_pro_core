import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:bewell_pro_core/domain/core/value_objects/asset_strings.dart';

import 'package:misc_utilities/responsive_widget.dart';

class BewellLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool isLargeScreen = SILResponsiveWidget.isLargeScreen(context);
    final double dimension = isLargeScreen ? 120 : 50;
    return SizedBox(
      width: dimension,
      height: dimension,
      child: SvgPicture.asset(bewellLogo),
    );
  }
}
