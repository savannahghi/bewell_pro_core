// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:sghi_core/shared_themes/colors.dart';

class BewellTableTitleAction extends StatelessWidget {
  final String title;
  final Widget actionWidget;

  const BewellTableTitleAction(
      {required this.title, required this.actionWidget});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      color: white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .subtitle2!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          actionWidget,
        ],
      ),
    );
  }
}
