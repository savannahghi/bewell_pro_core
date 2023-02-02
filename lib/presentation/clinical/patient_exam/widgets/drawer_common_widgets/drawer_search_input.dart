// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:intl/intl.dart';
import 'package:sghi_core/ui_components/src/inputs.dart';

// Project imports:
import 'package:bewell_pro_core/application/core/services/input_validators.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';

/// [DrawerSearchInput] Is used to search items for the drawers [problems], [medications] [allergies]
class DrawerSearchInput extends StatelessWidget {
  /// [isItemSelected] checks if item has been selected and displays the suggestions list or the selected item
  final bool isItemSelected;

  /// [labelText] the search param label
  final String labelText;

  /// [controller] contains search param
  final TextEditingController controller;

  /// [streamController] returns the suggestions
  final StreamController<dynamic> streamController;

  /// [suffixIconCallback] allows user to clear the search input param
  final Function suffixIconCallback;

  const DrawerSearchInput(
      {required this.isItemSelected,
      required this.labelText,
      required this.controller,
      required this.streamController,
      required this.suffixIconCallback,
      Key? key})
      : super(key: key);

  /// To update the isSelected to false
  void uncheckSelectedSearchItem() {
    suffixIconCallback();
    controller.clear();
    streamController.add(null);
  }

  @override
  Widget build(BuildContext context) {
    return SILFormTextField(
        key: AppWidgetKeys.searchTextField,
        keyboardType: TextInputType.text,
        isSearchFieldSmall: true,
        labelText: toBeginningOfSentenceCase(labelText),
        hintText: 'Search for a $labelText here',
        validator: (String? value) => InputValidators.validateDrawerSearchInput(
            value: value!,
            labelText: labelText,
            isItemSelected: isItemSelected),
        onSaved: (String? value) {},
        suffixIcon: IconButton(
            key: AppWidgetKeys.suffixCloseIconKey,
            icon: const Icon(Icons.close),
            onPressed: () => uncheckSelectedSearchItem()),
        controller: controller);
  }
}
