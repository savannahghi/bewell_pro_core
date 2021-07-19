import 'package:flutter/material.dart';
import 'package:shared_themes/colors.dart';

class PatientTimelineDividerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: grey.withOpacity(0.3))),
      ),
    );
  }
}
