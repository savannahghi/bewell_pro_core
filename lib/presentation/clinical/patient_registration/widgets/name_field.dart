import 'package:flutter/material.dart';
import 'package:bewell_pro_core/domain/core/failures/generic_exception.dart';
import 'package:bewell_pro_core/domain/core/value_objects/type_defs.dart';
import 'package:bewell_pro_core/presentation/clinical/theme/form_styles.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_ui_components/inputs.dart';

class NameField extends StatelessWidget {
  const NameField({
    Key? key,
    bool? enabled,
    FocusNode? focusNode,
    String? initial,
    required this.fieldHintText,
    required this.formFieldKey,
    required this.stream,
    required this.sink,
    this.formHintText,
    this.onSubmitted,
  })  : _focusNode = focusNode,
        initialData = initial,
        enabled = enabled ?? true,
        super(key: key);

  final Key formFieldKey;
  final FocusNode? _focusNode;
  final String fieldHintText;
  final String? formHintText;
  final OnChangedString? onSubmitted;
  final Stream<String> stream;
  final Sink<String> sink;
  final String? initialData;
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
        StreamBuilder<String>(
            initialData: initialData,
            stream: stream,
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              final TextEditingController controller =
                  TextEditingController(text: snapshot.data);
              controller.selection = TextSelection.fromPosition(
                  TextPosition(offset: controller.text.length));
              return SILFormTextField(
                autoValidate: true,
                enabled: enabled,
                fieldKey: formFieldKey,
                controller: controller,
                onFieldSubmit: onSubmitted,
                onChanged: (String value) => sink.add(value),
                focusNode: _focusNode,
                hintText: formHintText,
                validator: (String? value) {
                  if (snapshot.hasError) {
                    return (snapshot.error as GenericException?)?.message;
                  }
                  return null;
                },
              );
            }),
      ],
    );
  }
}
