// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:shared_themes/colors.dart';

// Project imports:
import 'package:bewell_pro_core/domain/core/value_objects/numbers_constants.dart';

// todo: move to shared_ui_components
class BeWellSelectInput extends StatefulWidget {
  const BeWellSelectInput({
    required this.options,
    required this.onChanged,
    required this.value,
    this.dropDownInputKey,
  });

  final FormFieldSetter<String>? onChanged;
  final List<String> options;
  final String value;
  final Key? dropDownInputKey;

  @override
  _BeWellSelectInputState createState() => _BeWellSelectInputState();
}

class _BeWellSelectInputState extends State<BeWellSelectInput> {
  @override
  void initState() {
    super.initState();
    dropdownValue = widget.options.first;
    widget.onChanged!(widget.options.first);
  }

  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: number48,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          border: Border.all(color: grey),
          borderRadius: BorderRadius.circular(3)),
      child: Align(
        alignment: Alignment.centerRight,
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            key: widget.dropDownInputKey,
            value: dropdownValue,
            isExpanded: true,
            icon: const Icon(Icons.keyboard_arrow_down),
            items: widget.options.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            style: Theme.of(context).textTheme.bodyText1,
            onChanged: (String? val) {
              setState(() {
                dropdownValue = val;
                widget.onChanged!(val);
              });
            },
          ),
        ),
      ),
    );
  }
}
