// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:sghi_core/shared_themes/colors.dart';

class BewellTableHeaderValue extends StatelessWidget {
  final String value;
  final int flex;

  const BewellTableHeaderValue({required this.value, required this.flex});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Text(value,
          style: Theme.of(context)
              .textTheme
              .subtitle2!
              .copyWith(color: black54, fontWeight: FontWeight.w600)),
    );
  }
}
