import 'package:flutter/material.dart';

class BewellTableHeader extends StatelessWidget {
  final Widget child;
  const BewellTableHeader({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: const BoxDecoration(
          color: Color(0xfff4f4fa),
          borderRadius: BorderRadius.all(Radius.circular(3))),
      child: child,
    );
  }
}
