// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:bewell_pro_core/domain/core/value_objects/asset_strings.dart';

class LandingPageImage extends StatelessWidget {
  final double maxDimension = 400;
  final double minDimension = 200;
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.4,
      height: width * 0.4,
      constraints: BoxConstraints(
        maxWidth: maxDimension,
        maxHeight: maxDimension,
        minWidth: minDimension,
        minHeight: minDimension,
      ),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(landingPageImage),
        ),
      ),
    );
  }
}
