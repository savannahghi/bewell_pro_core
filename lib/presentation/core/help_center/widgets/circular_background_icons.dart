// Flutter imports:
import 'package:flutter/material.dart';

class CircularBackGroundIcons extends StatelessWidget {
  final Color backgroundColor;
  final IconData loadIcon;
  final double iconBackgroundPadding;

  const CircularBackGroundIcons({
    required this.backgroundColor,
    required this.loadIcon,
    required this.iconBackgroundPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(iconBackgroundPadding),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(32)),
      ),
      child: Icon(loadIcon, color: Colors.white),
    );
  }
}
