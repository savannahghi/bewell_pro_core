// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldLabel extends StatelessWidget {
  final String label;

  const TextFieldLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Text(
        label,
        style: const TextStyle(color: Colors.grey),
      ),
    );
  }
}
