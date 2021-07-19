import 'package:flutter/material.dart';
import 'package:shared_themes/colors.dart';

class PatientExamDoneTitleIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundColor: lightGreenButtonFillColor,
      radius: 20,
      child: Icon(Icons.check, color: white),
    );
  }
}
