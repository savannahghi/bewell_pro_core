// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:intl/intl.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_ui_components/buttons.dart';

// Project imports:
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';

class DrawerSelectedItem extends StatelessWidget {
  const DrawerSelectedItem({
    required this.onCancelCallback,
    required this.selectedItem,
    required this.selectedItemTitleString,
  });

  final Function onCancelCallback;
  final String? selectedItem;
  final String selectedItemTitleString;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'Selected $selectedItemTitleString',
              style:
                  Theme.of(context).textTheme.headline6!.copyWith(color: grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: Text(
                      toBeginningOfSentenceCase(
                          selectedItem.toString().toLowerCase())!,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(fontWeight: FontWeight.w800)),
                ),
                Flexible(
                  child: SILSecondaryButton(
                    onPressed: onCancelCallback,
                    borderColor: redAccent,
                    text: silButtonCancel,
                    buttonColor: transparent,
                    textColor: redAccent,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
