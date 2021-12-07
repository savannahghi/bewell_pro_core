// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:domain_objects/value_objects.dart';
import 'package:shared_ui_components/inputs.dart';

// Project imports:
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/domain/core/value_objects/type_defs.dart';

class GenderPicker extends StatelessWidget {
  final Stream<Gender> stream;
  final FormFieldCallback onChanged;
  final Key dropDownInputKey;
  final String hintText;
  final bool enabled;

  const GenderPicker({
    required this.stream,
    required this.onChanged,
    required this.dropDownInputKey,
    required this.hintText,
    bool? enabled,
  }) : enabled = enabled ?? true;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Gender>(
      stream: stream,
      builder: (BuildContext context, AsyncSnapshot<Gender> snapshot) {
        final Gender? data = snapshot.data;
        return SILSelectOptionField(
            disabled: !enabled,
            options: _buildGenderStringsList(),
            value: data?.name.capitalize() ??
                describeEnum(Gender.unknown).capitalize(),
            dropDownInputKey: dropDownInputKey,
            hintText: hintText,
            onChanged: onChanged);
      },
    );
  }

  List<String> _buildGenderStringsList() {
    return Gender.values
        .map<String>((Gender gender) => describeEnum(gender).capitalize())
        .toList();
  }
}
