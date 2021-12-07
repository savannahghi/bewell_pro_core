// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:shared_themes/spaces.dart';
import 'package:shared_ui_components/inputs.dart';

// Project imports:
import 'package:bewell_pro_core/domain/core/value_objects/type_defs.dart';
import 'package:bewell_pro_core/presentation/clinical/theme/form_styles.dart';

class NameField extends StatelessWidget {
  const NameField({
    Key? key,
    bool? enabled,
    FocusNode? focusNode,
    required this.fieldHintText,
    required this.formFieldKey,
    this.controller,
    this.onChanged,
    this.formHintText,
    this.onSubmitted,
    this.error,
  })  : _focusNode = focusNode,
        enabled = enabled ?? true,
        super(key: key);

  final Key formFieldKey;
  final TextEditingController? controller;
  final FocusNode? _focusNode;
  final String fieldHintText;
  final String? formHintText;
  final OnChangedString? onChanged;
  final OnChangedString? onSubmitted;
  final String? error;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.topLeft,
          child: !enabled
              ? TextFormHintText(hintText: fieldHintText)
              : RequiredTextFormHintText(
                  hintText: fieldHintText,
                ),
        ),
        smallVerticalSizedBox,
        SILFormTextField(
          controller: controller,
          autoValidate: true,
          enabled: enabled,
          fieldKey: formFieldKey,
          onFieldSubmit: onSubmitted,
          onChanged: onChanged,
          focusNode: _focusNode,
          hintText: formHintText,
          validator: (String? value) {
            if (error != null) {
              return error;
            }
            return null;
          },
        ),
      ],
    );
  }
}
