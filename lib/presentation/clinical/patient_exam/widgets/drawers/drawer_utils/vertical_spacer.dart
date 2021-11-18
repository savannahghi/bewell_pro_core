// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:shared_themes/colors.dart';

class VerticalSpacer extends StatefulWidget {
  @override
  _VerticalSpacerState createState() => _VerticalSpacerState();
}

class _VerticalSpacerState extends State<VerticalSpacer> {
  @override
  Widget build(BuildContext context) {
    return Container(width: 1, height: 60, color: grey);
  }
}
